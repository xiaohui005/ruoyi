package cn.iocoder.yudao.module.stock.service.alert;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertChannelSaveReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertChannelTestReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertRecordPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertRulePageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertRuleSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRuleDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertChannelMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertRecordMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertRuleMapper;
import cn.iocoder.yudao.module.stock.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.stock.service.alert.dto.StockAlertSendResultDTO;
import cn.iocoder.yudao.module.stock.service.alert.sender.StockAlertSender;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;
import cn.iocoder.yudao.module.stock.service.watchlist.StockWatchlistService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;

@Service
public class StockAlertServiceImpl implements StockAlertService {

    @Resource
    private StockAlertChannelMapper stockAlertChannelMapper;
    @Resource
    private StockAlertRuleMapper stockAlertRuleMapper;
    @Resource
    private StockAlertRecordMapper stockAlertRecordMapper;
    @Resource
    private StockWatchlistService stockWatchlistService;

    private final Map<String, StockAlertSender> senderMap;

    public StockAlertServiceImpl(List<StockAlertSender> senders) {
        this.senderMap = senders.stream().collect(Collectors.toMap(StockAlertSender::channelCode, Function.identity()));
    }

    @Override
    public List<StockAlertChannelDO> getChannelList(Long userId) {
        return stockAlertChannelMapper.selectListByUserId(userId);
    }

    @Override
    public Long saveChannel(StockAlertChannelSaveReqVO reqVO, Long userId) {
        if (reqVO.getId() == null) {
            StockAlertChannelDO entity = BeanUtils.toBean(reqVO, StockAlertChannelDO.class);
            entity.setUserId(userId);
            stockAlertChannelMapper.insert(entity);
            return entity.getId();
        }
        StockAlertChannelDO existing = validateChannel(reqVO.getId(), userId);
        BeanUtils.copyProperties(reqVO, existing);
        stockAlertChannelMapper.updateById(existing);
        return existing.getId();
    }

    @Override
    public void testSend(StockAlertChannelTestReqVO reqVO, Long userId) {
        StockAlertChannelDO channel = getChannelList(userId).stream()
                .filter(item -> item.getChannelCode().equals(reqVO.getChannelCode()))
                .findFirst()
                .orElseThrow(() -> exception(ErrorCodeConstants.ALERT_CHANNEL_NOT_FOUND));
        sendByChannel(channel, "股票系统测试提醒", StrUtil.blankToDefault(reqVO.getContent(), "测试提醒"));
    }

    @Override
    public PageResult<StockAlertRuleDO> getRulePage(StockAlertRulePageReqVO reqVO, Long userId) {
        return stockAlertRuleMapper.selectPage(reqVO, userId);
    }

    @Override
    public Long createRule(StockAlertRuleSaveReqVO reqVO, Long userId) {
        StockAlertRuleDO entity = BeanUtils.toBean(reqVO, StockAlertRuleDO.class);
        entity.setUserId(userId);
        stockAlertRuleMapper.insert(entity);
        return entity.getId();
    }

    @Override
    public void updateRule(StockAlertRuleSaveReqVO reqVO, Long userId) {
        StockAlertRuleDO existing = validateRule(reqVO.getId(), userId);
        BeanUtils.copyProperties(reqVO, existing);
        stockAlertRuleMapper.updateById(existing);
    }

    @Override
    public void deleteRule(Long id, Long userId) {
        StockAlertRuleDO existing = validateRule(id, userId);
        stockAlertRuleMapper.deleteById(existing.getId());
    }

    @Override
    public PageResult<StockAlertRecordDO> getRecordPage(StockAlertRecordPageReqVO reqVO, Long userId) {
        return stockAlertRecordMapper.selectPage(reqVO, userId);
    }

    @Override
    public void evaluateAndSend(StockWatchlistDO watchlist, StockAnalyzeResultDTO result) {
        List<StockAlertChannelDO> channels = getChannelList(watchlist.getUserId()).stream()
                .filter(channel -> Boolean.TRUE.equals(channel.getEnabled()))
                .collect(Collectors.toList());
        if (channels.isEmpty()) {
            return;
        }
        boolean sent = false;
        if (Boolean.TRUE.equals(watchlist.getEnableSignalAlert())
                && Boolean.TRUE.equals(result.getTradable())
                && !"WAIT".equals(result.getAdviceAction())
                && canSendDefault(watchlist)) {
            String content = buildSignalContent(result);
            channels.forEach(channel -> sendAndRecord(channel, watchlist, null, "MARKET_SIGNAL",
                    result.getSymbol(), result.getMarketSignalName(), content));
            sent = true;
        }
        if (Boolean.TRUE.equals(watchlist.getEnablePriceAlert())
                && Boolean.TRUE.equals(watchlist.getEnableTStrategy())
                && Boolean.TRUE.equals(result.getTStrategySuitable())
                && canSendDefault(watchlist)) {
            String content = buildPriceContent(result);
            channels.forEach(channel -> sendAndRecord(channel, watchlist, null, "T_STRATEGY",
                    result.getSymbol(), "做T区间", content));
            sent = true;
        }
        if (Boolean.TRUE.equals(watchlist.getEnableSignalAlert())
                && result.getKlinePatterns() != null
                && !result.getKlinePatterns().isEmpty()
                && canSendDefault(watchlist)) {
            String title = buildPatternTitle(result.getKlinePatterns());
            String content = buildPatternContent(result);
            channels.forEach(channel -> sendAndRecord(channel, watchlist, null, "KLINE_PATTERN",
                    result.getSymbol(), title, content));
            sent = true;
        }
        List<StockAlertRuleDO> rules = stockAlertRuleMapper.selectEnabledByUserAndWatchlist(watchlist.getUserId(), watchlist.getId());
        for (StockAlertRuleDO rule : rules) {
            if (!matchRule(rule, result)) {
                continue;
            }
            String title = StrUtil.blankToDefault(rule.getRuleName(), rule.getRuleType());
            String content = buildRuleContent(rule, result);
            for (StockAlertChannelDO channel : channels) {
                if (!canSendByCooldown(rule, channel, result.getSymbol())) {
                    continue;
                }
                sendAndRecord(channel, watchlist, rule, rule.getRuleType(), result.getSymbol(), title, content);
                sent = true;
            }
        }
        if (sent) {
            stockWatchlistService.updateLastAlertTime(watchlist.getId(), LocalDateTime.now());
        }
    }

    private boolean canSendDefault(StockWatchlistDO watchlist) {
        return watchlist.getLatestAlertTime() == null
                || watchlist.getLatestAlertTime().isBefore(LocalDateTime.now().minusMinutes(30));
    }

    private boolean canSendByCooldown(StockAlertRuleDO rule, StockAlertChannelDO channel, String symbol) {
        StockAlertRecordDO latest = stockAlertRecordMapper.selectLatestSuccess(rule.getId(), symbol, channel.getChannelCode());
        return latest == null || latest.getCreateTime() == null
                || latest.getCreateTime().isBefore(LocalDateTime.now().minusMinutes(rule.getCooldownMinutes()));
    }

    private boolean matchRule(StockAlertRuleDO rule, StockAnalyzeResultDTO result) {
        if ("MARKET_SIGNAL".equals(rule.getRuleType())) {
            Map<String, Object> ruleJson = JsonUtils.parseMap(rule.getRuleJson());
            if (ruleJson == null || ruleJson.get("signalCode") == null) {
                return Boolean.TRUE.equals(result.getTradable());
            }
            return StrUtil.equals(String.valueOf(ruleJson.get("signalCode")), result.getMarketSignalCode());
        }
        if ("VOLUME_PRICE".equals(rule.getRuleType())) {
            return StrUtil.contains(StrUtil.blankToDefault(rule.getRuleJson(), ""), result.getVolumePriceType());
        }
        if ("T_BUY".equals(rule.getRuleType())) {
            return Boolean.TRUE.equals(result.getTStrategySuitable());
        }
        if ("T_SELL".equals(rule.getRuleType())) {
            return Boolean.TRUE.equals(result.getTStrategySuitable()) && result.getSellLowPrice() != null;
        }
        if ("PRICE_REACH".equals(rule.getRuleType())) {
            return matchPriceReach(rule.getRuleJson(), result);
        }
        if ("KLINE_PATTERN".equals(rule.getRuleType())) {
            return matchKlinePattern(rule.getRuleJson(), result);
        }
        return false;
    }

    private boolean matchKlinePattern(String ruleJson, StockAnalyzeResultDTO result) {
        if (result.getKlinePatterns() == null || result.getKlinePatterns().isEmpty()) {
            return false;
        }
        if (StrUtil.isBlank(ruleJson)) {
            return true;
        }
        Map<String, Object> config = JsonUtils.parseMap(ruleJson);
        if (config == null) {
            return true;
        }
        List<String> codes = new ArrayList<>();
        Object patternCode = config.get("patternCode");
        if (patternCode != null) {
            codes.add(String.valueOf(patternCode));
        }
        Object patternCodes = config.get("patternCodes");
        if (patternCodes instanceof List) {
            ((List<?>) patternCodes).forEach(item -> codes.add(String.valueOf(item)));
        }
        if (codes.isEmpty()) {
            return true;
        }
        return result.getKlinePatterns().stream()
                .map(StockKlinePatternDTO::getPatternCode)
                .anyMatch(codes::contains);
    }

    private boolean matchPriceReach(String ruleJson, StockAnalyzeResultDTO result) {
        if (result.getLatestPrice() == null || StrUtil.isBlank(ruleJson)) {
            return false;
        }
        Map<String, Object> config = JsonUtils.parseMap(ruleJson);
        if (config == null || config.get("price") == null) {
            return false;
        }
        BigDecimal targetPrice;
        try {
            targetPrice = new BigDecimal(String.valueOf(config.get("price")).trim());
        } catch (NumberFormatException ex) {
            return false;
        }
        String direction = StrUtil.blankToDefault(String.valueOf(config.get("direction")), "up").toLowerCase();
        if ("down".equals(direction) || "below".equals(direction) || "lte".equals(direction)) {
            return result.getLatestPrice().compareTo(targetPrice) <= 0;
        }
        return result.getLatestPrice().compareTo(targetPrice) >= 0;
    }

    private String buildSignalContent(StockAnalyzeResultDTO result) {
        return String.format("%s 当前市场节点=%s，量价=%s，建议=%s，原因=%s",
                result.getStockName(), result.getMarketSignalName(), result.getVolumePriceType(),
                result.getAdviceAction(), result.getReasonText());
    }

    private String buildPriceContent(StockAnalyzeResultDTO result) {
        return String.format("%s 进入做T观察区，最新价=%s，支撑=%s，买入区间=%s-%s，卖出区间=%s-%s，失效条件=%s",
                result.getStockName(), result.getLatestPrice(), result.getSupportPrice(), result.getBuyLowPrice(),
                result.getBuyHighPrice(), result.getSellLowPrice(), result.getSellHighPrice(), result.getInvalidCondition());
    }

    private String buildPatternTitle(List<StockKlinePatternDTO> patterns) {
        return patterns.stream()
                .map(pattern -> pattern.getPatternName() + "("
                        + StrUtil.blankToDefault(pattern.getSignalLabel(), pattern.getSignalType()) + ")")
                .collect(Collectors.joining(" / "));
    }

    private String buildPatternContent(StockAnalyzeResultDTO result) {
        String details = result.getKlinePatterns().stream()
                .map(this::buildPatternDetail)
                .collect(Collectors.joining(" | "));
        return String.format("%s \u89e6\u53d1K\u7ebf\u5f62\u6001\u63d0\u9192\uff1a%s\uff1b\u6700\u65b0\u4ef7=%s\uff1b\u7cfb\u7edf\u5efa\u8bae=%s\uff1b\u5f62\u6001\u8bf4\u660e=%s",
                result.getStockName(), buildPatternTitle(result.getKlinePatterns()), result.getLatestPrice(),
                result.getAdviceAction(), details);
    }

    private String buildRuleContent(StockAlertRuleDO rule, StockAnalyzeResultDTO result) {
        if ("KLINE_PATTERN".equals(rule.getRuleType())) {
            return buildPatternContent(result);
        }
        return String.format("规则=%s，股票=%s，节点=%s，最新价=%s，量价=%s，建议=%s，原因=%s",
                rule.getRuleName(), result.getStockName(), result.getMarketSignalName(), result.getLatestPrice(),
                result.getVolumePriceType(), result.getAdviceAction(), result.getReasonText());
    }

    private String buildPatternDetail(StockKlinePatternDTO pattern) {
        return String.format("%s[%s] \u8bf4\u660e=%s \u5efa\u8bae=%s",
                pattern.getPatternName(),
                StrUtil.blankToDefault(pattern.getSignalLabel(), pattern.getSignalType()),
                StrUtil.blankToDefault(pattern.getDescription(), "-"),
                StrUtil.blankToDefault(pattern.getTradeAdvice(), "-"));
    }

    private void sendAndRecord(StockAlertChannelDO channel, StockWatchlistDO watchlist, StockAlertRuleDO rule,
                               String alertType, String symbol, String title, String content) {
        StockAlertSendResultDTO sendResult = sendByChannel(channel, title, content);
        StockAlertRecordDO record = new StockAlertRecordDO();
        record.setUserId(channel.getUserId());
        record.setWatchlistId(watchlist != null ? watchlist.getId() : null);
        record.setRuleId(rule != null ? rule.getId() : null);
        record.setChannelCode(channel.getChannelCode());
        record.setSymbol(symbol);
        record.setAlertType(alertType);
        record.setTriggerValue(title);
        record.setContent(content);
        record.setSendStatus(sendResult.isSuccess() ? "SUCCESS" : "FAIL");
        record.setSendTime(LocalDateTime.now());
        record.setResponseText(sendResult.getResponseText());
        stockAlertRecordMapper.insert(record);
    }

    private StockAlertSendResultDTO sendByChannel(StockAlertChannelDO channel, String title, String content) {
        StockAlertSender sender = senderMap.get(channel.getChannelCode());
        if (sender == null) {
            return new StockAlertSendResultDTO(false, "sender not found");
        }
        try {
            return sender.send(channel, title, content);
        } catch (Exception ex) {
            return new StockAlertSendResultDTO(false, ex.getMessage());
        }
    }

    private StockAlertChannelDO validateChannel(Long id, Long userId) {
        StockAlertChannelDO existing = stockAlertChannelMapper.selectById(id);
        if (existing == null || !existing.getUserId().equals(userId)) {
            throw exception(ErrorCodeConstants.ALERT_CHANNEL_NOT_FOUND);
        }
        return existing;
    }

    private StockAlertRuleDO validateRule(Long id, Long userId) {
        StockAlertRuleDO existing = stockAlertRuleMapper.selectById(id);
        if (existing == null || !existing.getUserId().equals(userId)) {
            throw exception(ErrorCodeConstants.ALERT_RULE_NOT_FOUND);
        }
        return existing;
    }
}
