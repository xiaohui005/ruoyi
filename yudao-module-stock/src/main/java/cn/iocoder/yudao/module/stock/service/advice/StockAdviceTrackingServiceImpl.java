package cn.iocoder.yudao.module.stock.service.advice;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingSummaryRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingLogDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockTStrategyRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.advice.StockAdviceTrackingLogMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.advice.StockAdviceTrackingMapper;
import cn.iocoder.yudao.module.stock.enums.StockAdviceTrackingStatusEnum;
import cn.iocoder.yudao.module.stock.enums.StockAdviceTypeEnum;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.config.StockAnalysisConfigService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class StockAdviceTrackingServiceImpl implements StockAdviceTrackingService {

    private static final BigDecimal HUNDRED = BigDecimal.valueOf(100);
    private static final int DEFAULT_EXPECTED_DAYS = 5;

    private static final String SUMMARY_CREATED = "\u5efa\u8bae\u5df2\u751f\u6210\uff0c\u7b49\u5f85\u540e\u7eed\u9a8c\u8bc1";
    private static final String SUMMARY_EXPIRED = "\u672c\u8f6e\u5efa\u8bae\u8d85\u65f6\u672a\u5b8c\u6210";
    private static final String SUMMARY_INVALID = "\u672c\u8f6e\u5efa\u8bae\u5df2\u5931\u6548";
    private static final String SUMMARY_BUY_TRIGGERED = "\u5df2\u8fdb\u5165\u4e70\u5165\u533a\u95f4\uff0c\u7ee7\u7eed\u89c2\u5bdf\u5356\u51fa\u533a\u95f4";
    private static final String SUMMARY_T_BUY_TRIGGERED = "\u5df2\u8fdb\u5165\u4e70\u5165\u533a\u95f4\uff0c\u7b49\u5f85\u5356\u51fa\u533a\u95f4\u9a8c\u8bc1";
    private static final String SUMMARY_T_COMPLETED = "\u5148\u5230\u4e70\u70b9\u540e\u5230\u5356\u70b9\uff0c\u672c\u8f6e\u505aT\u5efa\u8bae\u8fbe\u6807";
    private static final String SUMMARY_BUY_COMPLETED = "\u672c\u8f6e\u4e70\u5165\u5efa\u8bae\u5df2\u8fbe\u5230\u9884\u671f\u5356\u51fa\u533a\u95f4";

    private static final String CLOSE_EXPIRED = "\u8d85\u8fc7\u89c2\u5bdf\u5468\u671f\u672a\u5b8c\u6210";
    private static final String CLOSE_INVALID = "\u8dcc\u7834\u5931\u6548\u9608\u503c";
    private static final String CLOSE_T_COMPLETED = "\u5df2\u5b8c\u6210\u4e00\u8f6e\u505aT\u95ed\u73af";
    private static final String CLOSE_BUY_COMPLETED = "\u5df2\u8fbe\u5230\u5356\u51fa\u533a\u95f4";

    @Resource
    private StockAdviceTrackingMapper stockAdviceTrackingMapper;
    @Resource
    private StockAdviceTrackingLogMapper stockAdviceTrackingLogMapper;
    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockAnalysisConfigService stockAnalysisConfigService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createOrRefreshFromAnalysis(StockAnalyzeResultDTO result, StockAnalysisRecordDO analysisRecord,
                                            StockTStrategyRecordDO strategyRecord, StockWatchlistDO watchlist, Long userId) {
        if (result == null || analysisRecord == null || strategyRecord == null || userId == null
                || !StockAdviceTypeEnum.isTrackable(result.getAdviceAction())) {
            return;
        }
        String symbol = StockSymbolUtils.normalize(result.getSymbol());
        String adviceType = result.getAdviceAction();
        LocalDateTime adviceTime = result.getAnalyzeTime() != null ? result.getAnalyzeTime() : LocalDateTime.now();
        StockAdviceTrackingDO existing = stockAdviceTrackingMapper.selectLatestActiveByUserSymbolAndType(
                userId, symbol, adviceType);
        if (existing != null && isSameTradeDay(existing.getAdviceTime(), adviceTime)) {
            String fromStatus = existing.getStatus();
            fillSnapshot(existing, result, analysisRecord, strategyRecord, watchlist, userId, adviceTime);
            applyCurrentState(existing, result.getLatestPrice(), getInvalidBreakThreshold(), adviceTime);
            stockAdviceTrackingMapper.updateById(existing);
            if (!StrUtil.equals(fromStatus, existing.getStatus())) {
                insertLog(existing.getId(), existing.getSymbol(), fromStatus, existing.getStatus(),
                        "ANALYZE_REFRESH", result.getLatestPrice(), adviceTime, existing.getResultSummary());
            }
            return;
        }

        StockAdviceTrackingDO entity = new StockAdviceTrackingDO();
        fillSnapshot(entity, result, analysisRecord, strategyRecord, watchlist, userId, adviceTime);
        applyCurrentState(entity, result.getLatestPrice(), getInvalidBreakThreshold(), adviceTime);
        stockAdviceTrackingMapper.insert(entity);
        insertLog(entity.getId(), entity.getSymbol(), null, entity.getStatus(), "CREATED",
                entity.getLatestPriceAtAdvice(), adviceTime, entity.getResultSummary());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void evaluateActiveTracks() {
        List<StockAdviceTrackingDO> list = stockAdviceTrackingMapper.selectActiveForEvaluate();
        if (list.isEmpty()) {
            return;
        }
        BigDecimal invalidBreakThreshold = getInvalidBreakThreshold();
        LocalDateTime now = LocalDateTime.now();
        for (StockAdviceTrackingDO tracking : list) {
            String fromStatus = tracking.getStatus();
            if (isExpired(tracking, now)) {
                tracking.setStatus(StockAdviceTrackingStatusEnum.EXPIRED);
                tracking.setExpireTime(now);
                tracking.setCloseReason(CLOSE_EXPIRED);
                tracking.setResultSummary(SUMMARY_EXPIRED);
            } else {
                StockKlineDailyDO latest = stockDataService.getLatestDailyKLine(tracking.getSymbol(), true);
                if (latest == null || latest.getClosePrice() == null) {
                    continue;
                }
                applyCurrentState(tracking, latest.getClosePrice(), invalidBreakThreshold, now);
            }
            if (!StrUtil.equals(fromStatus, tracking.getStatus())) {
                stockAdviceTrackingMapper.updateById(tracking);
                insertLog(tracking.getId(), tracking.getSymbol(), fromStatus, tracking.getStatus(),
                        "AUTO_EVALUATE", currentTriggerPrice(tracking), now, tracking.getResultSummary());
            }
        }
    }

    @Override
    public PageResult<StockAdviceTrackingDO> getTrackingPage(StockAdviceTrackingPageReqVO reqVO, Long userId) {
        evaluateExpiredOnly();
        return stockAdviceTrackingMapper.selectPage(reqVO, userId);
    }

    @Override
    public StockAdviceTrackingSummaryRespVO getTrackingSummary(Long userId) {
        evaluateExpiredOnly();
        List<StockAdviceTrackingDO> list = stockAdviceTrackingMapper.selectListByUserId(userId);
        long total = list.size();
        long active = list.stream().filter(item -> StockAdviceTrackingStatusEnum.isActive(item.getStatus())).count();
        long completed = list.stream().filter(item -> StockAdviceTrackingStatusEnum.COMPLETED.equals(item.getStatus())).count();
        long invalidated = list.stream().filter(item -> StockAdviceTrackingStatusEnum.INVALIDATED.equals(item.getStatus())).count();
        long expired = list.stream().filter(item -> StockAdviceTrackingStatusEnum.EXPIRED.equals(item.getStatus())).count();
        long manualClosed = list.stream().filter(item -> StockAdviceTrackingStatusEnum.MANUAL_CLOSED.equals(item.getStatus())).count();
        long effective = total - manualClosed;

        StockAdviceTrackingSummaryRespVO summary = new StockAdviceTrackingSummaryRespVO();
        summary.setTotalCount(total);
        summary.setActiveCount(active);
        summary.setCompletedCount(completed);
        summary.setInvalidatedCount(invalidated);
        summary.setExpiredCount(expired);
        summary.setSuccessRate(calculateRate(completed, effective));
        summary.setInvalidRate(calculateRate(invalidated, effective));
        return summary;
    }

    private void evaluateExpiredOnly() {
        List<StockAdviceTrackingDO> list = stockAdviceTrackingMapper.selectActiveForEvaluate();
        if (list.isEmpty()) {
            return;
        }
        LocalDateTime now = LocalDateTime.now();
        for (StockAdviceTrackingDO tracking : list) {
            if (!isExpired(tracking, now)) {
                continue;
            }
            String fromStatus = tracking.getStatus();
            tracking.setStatus(StockAdviceTrackingStatusEnum.EXPIRED);
            tracking.setExpireTime(now);
            tracking.setCloseReason(CLOSE_EXPIRED);
            tracking.setResultSummary(SUMMARY_EXPIRED);
            stockAdviceTrackingMapper.updateById(tracking);
            insertLog(tracking.getId(), tracking.getSymbol(), fromStatus, tracking.getStatus(),
                    "AUTO_EXPIRE", null, now, tracking.getResultSummary());
        }
    }

    private void fillSnapshot(StockAdviceTrackingDO entity, StockAnalyzeResultDTO result,
                              StockAnalysisRecordDO analysisRecord, StockTStrategyRecordDO strategyRecord,
                              StockWatchlistDO watchlist, Long userId, LocalDateTime adviceTime) {
        entity.setUserId(userId);
        entity.setWatchlistId(watchlist != null ? watchlist.getId() : null);
        entity.setAnalysisRecordId(analysisRecord.getId());
        entity.setSymbol(StockSymbolUtils.normalize(result.getSymbol()));
        entity.setStockName(result.getStockName());
        entity.setAdviceType(result.getAdviceAction());
        entity.setAdviceTime(adviceTime);
        entity.setLatestPriceAtAdvice(result.getLatestPrice());
        entity.setSupportPrice(strategyRecord.getSupportPrice());
        entity.setResistancePrice(strategyRecord.getResistancePrice());
        entity.setBuyLowPrice(strategyRecord.getBuyLowPrice());
        entity.setBuyHighPrice(strategyRecord.getBuyHighPrice());
        entity.setSellLowPrice(strategyRecord.getSellLowPrice());
        entity.setSellHighPrice(strategyRecord.getSellHighPrice());
        entity.setPositionRatio(strategyRecord.getPositionRatio());
        entity.setInvalidCondition(strategyRecord.getInvalidCondition());
        entity.setRiskLevel(result.getRiskLevel());
        entity.setExpectedDays(resolveExpectedDays());
        entity.setEstimatedProfitRate(calculateEstimatedProfitRate(strategyRecord));
        entity.setResultSummary(SUMMARY_CREATED);
        entity.setCloseReason(null);
        entity.setInvalidateTime(null);
        entity.setExpireTime(null);
        entity.setSellTriggerTime(null);
        if (entity.getId() == null) {
            entity.setStatus(StockAdviceTrackingStatusEnum.PENDING);
            entity.setBuyTriggerTime(null);
        }
    }

    private void applyCurrentState(StockAdviceTrackingDO entity, BigDecimal latestPrice,
                                   BigDecimal invalidBreakThreshold, LocalDateTime now) {
        if (latestPrice == null || StockAdviceTrackingStatusEnum.isFinished(entity.getStatus())) {
            return;
        }
        if (isInvalidated(entity, latestPrice, invalidBreakThreshold)) {
            entity.setStatus(StockAdviceTrackingStatusEnum.INVALIDATED);
            entity.setInvalidateTime(now);
            entity.setCloseReason(CLOSE_INVALID);
            entity.setResultSummary(SUMMARY_INVALID);
            return;
        }
        if (isBuyTriggered(entity, latestPrice) && entity.getBuyTriggerTime() == null) {
            entity.setBuyTriggerTime(now);
        }
        if (StockAdviceTypeEnum.T_STRATEGY.equals(entity.getAdviceType())) {
            if (isBuyTriggered(entity, latestPrice)
                    && StockAdviceTrackingStatusEnum.PENDING.equals(entity.getStatus())) {
                entity.setStatus(StockAdviceTrackingStatusEnum.BUY_TRIGGERED);
                entity.setResultSummary(SUMMARY_T_BUY_TRIGGERED);
                return;
            }
            if (StockAdviceTrackingStatusEnum.BUY_TRIGGERED.equals(entity.getStatus()) && isSellTriggered(entity, latestPrice)) {
                entity.setStatus(StockAdviceTrackingStatusEnum.COMPLETED);
                entity.setSellTriggerTime(now);
                entity.setCloseReason(CLOSE_T_COMPLETED);
                entity.setResultSummary(SUMMARY_T_COMPLETED);
                return;
            }
        } else {
            if (isSellTriggered(entity, latestPrice)) {
                entity.setStatus(StockAdviceTrackingStatusEnum.COMPLETED);
                entity.setSellTriggerTime(now);
                entity.setCloseReason(CLOSE_BUY_COMPLETED);
                entity.setResultSummary(SUMMARY_BUY_COMPLETED);
                return;
            }
            if (isBuyTriggered(entity, latestPrice)) {
                entity.setStatus(StockAdviceTrackingStatusEnum.BUY_TRIGGERED);
                entity.setResultSummary(SUMMARY_BUY_TRIGGERED);
            }
        }
        if (StrUtil.isBlank(entity.getStatus())) {
            entity.setStatus(StockAdviceTrackingStatusEnum.PENDING);
        }
    }

    private BigDecimal getInvalidBreakThreshold() {
        return stockAnalysisConfigService.getDecimalConfig(
                "strategy.invalid-break-threshold", BigDecimal.valueOf(0.02));
    }

    private boolean isInvalidated(StockAdviceTrackingDO entity, BigDecimal latestPrice, BigDecimal invalidBreakThreshold) {
        if (entity.getSupportPrice() == null || latestPrice == null || invalidBreakThreshold == null) {
            return false;
        }
        BigDecimal thresholdPrice = entity.getSupportPrice().multiply(BigDecimal.ONE.subtract(invalidBreakThreshold))
                .setScale(4, RoundingMode.HALF_UP);
        return latestPrice.compareTo(thresholdPrice) <= 0;
    }

    private boolean isBuyTriggered(StockAdviceTrackingDO entity, BigDecimal latestPrice) {
        return inRange(latestPrice, entity.getBuyLowPrice(), entity.getBuyHighPrice());
    }

    private boolean isSellTriggered(StockAdviceTrackingDO entity, BigDecimal latestPrice) {
        return inRange(latestPrice, entity.getSellLowPrice(), entity.getSellHighPrice());
    }

    private boolean inRange(BigDecimal value, BigDecimal low, BigDecimal high) {
        return value != null && low != null && high != null
                && value.compareTo(low) >= 0 && value.compareTo(high) <= 0;
    }

    private boolean isExpired(StockAdviceTrackingDO tracking, LocalDateTime now) {
        Integer expectedDays = tracking.getExpectedDays();
        if (tracking.getAdviceTime() == null || expectedDays == null || expectedDays <= 0) {
            return false;
        }
        return tracking.getAdviceTime().plusDays(expectedDays).isBefore(now);
    }

    private Integer resolveExpectedDays() {
        BigDecimal value = stockAnalysisConfigService.getDecimalConfig(
                "strategy.advice-expected-days", BigDecimal.valueOf(DEFAULT_EXPECTED_DAYS));
        return value == null ? DEFAULT_EXPECTED_DAYS : value.intValue();
    }

    private BigDecimal calculateEstimatedProfitRate(StockTStrategyRecordDO strategyRecord) {
        if (strategyRecord.getBuyLowPrice() == null || strategyRecord.getBuyHighPrice() == null
                || strategyRecord.getSellLowPrice() == null || strategyRecord.getSellHighPrice() == null) {
            return null;
        }
        BigDecimal buyMid = strategyRecord.getBuyLowPrice().add(strategyRecord.getBuyHighPrice())
                .divide(BigDecimal.valueOf(2), 4, RoundingMode.HALF_UP);
        BigDecimal sellMid = strategyRecord.getSellLowPrice().add(strategyRecord.getSellHighPrice())
                .divide(BigDecimal.valueOf(2), 4, RoundingMode.HALF_UP);
        if (buyMid.compareTo(BigDecimal.ZERO) <= 0) {
            return null;
        }
        return sellMid.subtract(buyMid)
                .divide(buyMid, 4, RoundingMode.HALF_UP)
                .multiply(HUNDRED)
                .setScale(2, RoundingMode.HALF_UP);
    }

    private BigDecimal calculateRate(long numerator, long denominator) {
        if (denominator <= 0) {
            return BigDecimal.ZERO.setScale(2, RoundingMode.HALF_UP);
        }
        return BigDecimal.valueOf(numerator)
                .multiply(HUNDRED)
                .divide(BigDecimal.valueOf(denominator), 2, RoundingMode.HALF_UP);
    }

    private boolean isSameTradeDay(LocalDateTime left, LocalDateTime right) {
        return left != null && right != null && left.toLocalDate().equals(right.toLocalDate());
    }

    private BigDecimal currentTriggerPrice(StockAdviceTrackingDO tracking) {
        if (tracking.getStatus() == null) {
            return null;
        }
        if (StockAdviceTrackingStatusEnum.COMPLETED.equals(tracking.getStatus())) {
            return tracking.getSellLowPrice();
        }
        if (StockAdviceTrackingStatusEnum.INVALIDATED.equals(tracking.getStatus())) {
            return tracking.getSupportPrice();
        }
        if (StockAdviceTrackingStatusEnum.BUY_TRIGGERED.equals(tracking.getStatus())) {
            return tracking.getBuyLowPrice();
        }
        return null;
    }

    private void insertLog(Long trackingId, String symbol, String fromStatus, String toStatus, String triggerType,
                           BigDecimal triggerPrice, LocalDateTime triggerTime, String message) {
        StockAdviceTrackingLogDO log = new StockAdviceTrackingLogDO();
        log.setTrackingId(trackingId);
        log.setSymbol(symbol);
        log.setFromStatus(fromStatus);
        log.setToStatus(toStatus);
        log.setTriggerType(triggerType);
        log.setTriggerPrice(triggerPrice);
        log.setTriggerTime(triggerTime);
        log.setMessage(message);
        stockAdviceTrackingLogMapper.insert(log);
    }
}
