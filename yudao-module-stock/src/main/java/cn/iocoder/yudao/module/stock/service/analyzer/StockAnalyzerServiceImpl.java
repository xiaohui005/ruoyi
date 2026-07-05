package cn.iocoder.yudao.module.stock.service.analyzer;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalysisRecordPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockTStrategyRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.analysis.StockAnalysisRecordMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.analysis.StockTStrategyRecordMapper;
import cn.iocoder.yudao.module.stock.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;
import cn.iocoder.yudao.module.stock.service.config.StockAnalysisConfigService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.market.StockMarketSignalService;
import cn.iocoder.yudao.module.stock.service.market.dto.MarketSignalResultDTO;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception0;

@Service
public class StockAnalyzerServiceImpl implements StockAnalyzerService {

    private static final int ANALYZE_KLINE_LIMIT = 120;
    private static final int MIN_ANALYZE_KLINE_SIZE = 20;
    private static final long ANALYSIS_RETENTION_DAYS = 1L;

    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockMarketSignalService stockMarketSignalService;
    @Resource
    private StockAnalysisConfigService stockAnalysisConfigService;
    @Resource
    private StockAnalysisRecordMapper stockAnalysisRecordMapper;
    @Resource
    private StockTStrategyRecordMapper stockTStrategyRecordMapper;

    @Override
    public StockAnalyzeResultDTO analyze(String symbol, Long userId) {
        cleanupExpiredAnalysisRecords();
        return doAnalyze(StockSymbolUtils.normalize(symbol), userId, null);
    }

    @Override
    public StockAnalyzeResultDTO analyze(StockWatchlistDO watchlist) {
        cleanupExpiredAnalysisRecords();
        return doAnalyze(watchlist.getSymbol(), watchlist.getUserId(), watchlist);
    }

    @Override
    public PageResult<StockAnalysisRecordDO> getAnalysisRecordPage(StockAnalysisRecordPageReqVO reqVO, Long userId) {
        cleanupExpiredAnalysisRecords();
        return stockAnalysisRecordMapper.selectPage(reqVO, userId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void cleanupExpiredAnalysisRecords() {
        LocalDateTime expireBefore = LocalDateTime.now().minusDays(ANALYSIS_RETENTION_DAYS);
        List<Long> expiredIds = stockAnalysisRecordMapper.selectExpiredIds(expireBefore);
        if (expiredIds.isEmpty()) {
            return;
        }
        stockTStrategyRecordMapper.deleteByAnalysisRecordIds(expiredIds);
        stockAnalysisRecordMapper.deleteBatch(StockAnalysisRecordDO::getId, expiredIds);
    }

    private StockAnalyzeResultDTO doAnalyze(String symbol, Long userId, StockWatchlistDO watchlist) {
        List<StockKlineDailyDO> klines = loadAnalyzeKLines(symbol);
        MarketSignalResultDTO marketSignal = stockMarketSignalService.getCurrentSignal(false);
        StockKlineDailyDO latest = klines.get(klines.size() - 1);

        BigDecimal volumeRiseThreshold = stockAnalysisConfigService.getDecimalConfig("analyzer.volume-rise-threshold", BigDecimal.valueOf(1.20));
        BigDecimal volumeShrinkThreshold = stockAnalysisConfigService.getDecimalConfig("analyzer.volume-shrink-threshold", BigDecimal.valueOf(0.90));
        BigDecimal defaultPositionRatio = stockAnalysisConfigService.getDecimalConfig("strategy.position-ratio", BigDecimal.valueOf(0.30));
        BigDecimal invalidBreakThreshold = stockAnalysisConfigService.getDecimalConfig("strategy.invalid-break-threshold", BigDecimal.valueOf(0.02));

        BigDecimal avgVolume = averageVolume(klines, 5);
        BigDecimal volumeRatio = avgVolume.compareTo(BigDecimal.ZERO) > 0
                ? nullSafe(latest.getVolume()).divide(avgVolume, 4, RoundingMode.HALF_UP)
                : BigDecimal.ONE;
        String positionType = resolvePosition(klines, latest);
        String volumePriceType = resolveVolumePriceType(latest, volumeRatio, volumeRiseThreshold, volumeShrinkThreshold);
        String volumeAdvice = resolveVolumeAdvice(volumePriceType, positionType);
        String riskLevel = resolveRiskLevel(volumePriceType, positionType);

        TStrategyCalc tCalc = calculateTStrategy(klines, invalidBreakThreshold, defaultPositionRatio, watchlist);
        StockAnalyzeResultDTO dto = new StockAnalyzeResultDTO();
        dto.setSymbol(symbol);
        dto.setStockName(stockDataService.getStockName(symbol));
        dto.setLatestPrice(latest.getClosePrice());
        dto.setMarketSignalCode(marketSignal != null ? marketSignal.getSignalCode() : null);
        dto.setMarketSignalName(marketSignal != null ? marketSignal.getSignalName() : null);
        dto.setTradable(marketSignal != null && Boolean.TRUE.equals(marketSignal.getTradable()));
        dto.setRiskLevel(mergeRiskLevel(marketSignal, riskLevel));
        dto.setVolumePriceType(volumePriceType);
        dto.setPricePosition(positionType);
        dto.setVolumePriceAdvice(volumeAdvice);
        dto.setAdviceAction(resolveAdviceAction(dto.getTradable(), volumeAdvice, tCalc));
        dto.setReasonText(buildReasonText(marketSignal, volumeRatio, positionType, tCalc));
        dto.setTStrategySuitable(tCalc.suitable);
        dto.setSupportPrice(tCalc.supportPrice);
        dto.setResistancePrice(tCalc.resistancePrice);
        dto.setBuyLowPrice(tCalc.buyLowPrice);
        dto.setBuyHighPrice(tCalc.buyHighPrice);
        dto.setSellLowPrice(tCalc.sellLowPrice);
        dto.setSellHighPrice(tCalc.sellHighPrice);
        dto.setPositionRatio(tCalc.positionRatio);
        dto.setInvalidCondition(tCalc.invalidCondition);
        dto.setAnalyzeTime(LocalDateTime.now());
        dto.setKlinePatterns(StockKlinePatternDetector.detect(klines));
        dto.getReasoningSteps().add("先看市场节点：" + (marketSignal == null ? "暂无快照" : marketSignal.getSignalName()));
        dto.getReasoningSteps().add("再看量价关系：" + volumePriceType + "，位置=" + positionType
                + "，量比=" + volumeRatio.stripTrailingZeros().toPlainString());
        dto.getReasoningSteps().add("最后看做T结构：" + (Boolean.TRUE.equals(tCalc.suitable) ? "满足做T条件" : "暂不满足做T条件"));

        dto.getReasoningSteps().add(buildPatternStep(dto.getKlinePatterns()));
        persistAnalysisResult(dto, userId, watchlist, latest, volumeAdvice, positionType, volumePriceType, tCalc);
        return dto;
    }

    private String buildPatternStep(List<StockKlinePatternDTO> patterns) {
        if (patterns == null || patterns.isEmpty()) {
            return "\u518d\u770bK\u7ebf\u5f62\u6001\uff1a\u6682\u672a\u547d\u4e2d\u91cd\u70b9\u63d0\u9192\u5f62\u6001";
        }
        return "\u518d\u770bK\u7ebf\u5f62\u6001\uff1a\u547d\u4e2d "
                + patterns.stream().map(StockKlinePatternDTO::getPatternName).collect(Collectors.joining(" / "));
    }

    private List<StockKlineDailyDO> loadAnalyzeKLines(String symbol) {
        List<StockKlineDailyDO> klines = stockDataService.getRecentDailyKLine(symbol, ANALYZE_KLINE_LIMIT, true);
        if (klines != null && klines.size() >= MIN_ANALYZE_KLINE_SIZE) {
            klines.sort(Comparator.comparing(StockKlineDailyDO::getTradeDate));
            return klines;
        }

        klines = stockDataService.refreshDailyKLine(symbol, ANALYZE_KLINE_LIMIT);
        if (klines != null && klines.size() >= MIN_ANALYZE_KLINE_SIZE) {
            klines.sort(Comparator.comparing(StockKlineDailyDO::getTradeDate));
            return klines;
        }

        throw exception0(ErrorCodeConstants.KLINE_DATA_NOT_FOUND.getCode(),
                "股票 {} 暂未获取到足够K线数据，请检查行情数据源配置或稍后重试", StockSymbolUtils.display(symbol));
    }

    private void persistAnalysisResult(StockAnalyzeResultDTO dto, Long userId, StockWatchlistDO watchlist,
                                       StockKlineDailyDO latest, String volumeAdvice, String positionType,
                                       String volumePriceType, TStrategyCalc tCalc) {
        StockAnalysisRecordDO analysisRecord = new StockAnalysisRecordDO();
        analysisRecord.setUserId(userId);
        analysisRecord.setWatchlistId(watchlist != null ? watchlist.getId() : null);
        analysisRecord.setSymbol(dto.getSymbol());
        analysisRecord.setStockName(dto.getStockName());
        analysisRecord.setMarketSignalCode(dto.getMarketSignalCode());
        analysisRecord.setMarketSignalName(dto.getMarketSignalName());
        analysisRecord.setVolumePriceType(volumePriceType);
        analysisRecord.setPricePosition(positionType);
        analysisRecord.setVolumePriceAdvice(volumeAdvice);
        analysisRecord.setTStrategySuitable(Boolean.TRUE.equals(tCalc.suitable));
        analysisRecord.setAdviceAction(dto.getAdviceAction());
        analysisRecord.setReasonText(dto.getReasonText());
        analysisRecord.setRiskLevel(dto.getRiskLevel());
        analysisRecord.setSourceName(latest.getSourceName());
        stockAnalysisRecordMapper.insert(analysisRecord);
        dto.setAnalysisRecordId(analysisRecord.getId());

        StockTStrategyRecordDO tRecord = new StockTStrategyRecordDO();
        tRecord.setAnalysisRecordId(analysisRecord.getId());
        tRecord.setSymbol(dto.getSymbol());
        tRecord.setSuitable(Boolean.TRUE.equals(tCalc.suitable));
        tRecord.setSupportPrice(tCalc.supportPrice);
        tRecord.setResistancePrice(tCalc.resistancePrice);
        tRecord.setBuyLowPrice(tCalc.buyLowPrice);
        tRecord.setBuyHighPrice(tCalc.buyHighPrice);
        tRecord.setSellLowPrice(tCalc.sellLowPrice);
        tRecord.setSellHighPrice(tCalc.sellHighPrice);
        tRecord.setPositionRatio(tCalc.positionRatio);
        tRecord.setInvalidCondition(tCalc.invalidCondition);
        tRecord.setReasonText(tCalc.reason);
        stockTStrategyRecordMapper.insert(tRecord);
    }

    private String resolvePosition(List<StockKlineDailyDO> klines, StockKlineDailyDO latest) {
        BigDecimal highest = klines.stream().map(StockKlineDailyDO::getHighPrice).filter(value -> value != null)
                .max(BigDecimal::compareTo).orElse(latest.getHighPrice());
        BigDecimal lowest = klines.stream().map(StockKlineDailyDO::getLowPrice).filter(value -> value != null)
                .min(BigDecimal::compareTo).orElse(latest.getLowPrice());
        if (highest == null || lowest == null || highest.compareTo(lowest) <= 0 || latest.getClosePrice() == null) {
            return "MID";
        }
        BigDecimal ratio = latest.getClosePrice().subtract(lowest)
                .divide(highest.subtract(lowest), 4, RoundingMode.HALF_UP);
        if (ratio.compareTo(BigDecimal.valueOf(0.33)) <= 0) {
            return "LOW";
        }
        if (ratio.compareTo(BigDecimal.valueOf(0.66)) >= 0) {
            return "HIGH";
        }
        return "MID";
    }

    private String resolveVolumePriceType(StockKlineDailyDO latest, BigDecimal volumeRatio,
                                          BigDecimal riseThreshold, BigDecimal shrinkThreshold) {
        BigDecimal closePrice = nullSafe(latest.getClosePrice());
        BigDecimal preClose = latest.getPreClosePrice() == null ? closePrice : latest.getPreClosePrice();
        if (closePrice.compareTo(preClose) > 0 && volumeRatio.compareTo(riseThreshold) >= 0) {
            return "VOLUME_UP_PRICE_UP";
        }
        if (closePrice.compareTo(preClose) > 0 && volumeRatio.compareTo(shrinkThreshold) <= 0) {
            return "PRICE_UP_VOLUME_DOWN";
        }
        if (closePrice.compareTo(preClose) < 0 && volumeRatio.compareTo(riseThreshold) >= 0) {
            return "PRICE_DOWN_VOLUME_UP";
        }
        return "BALANCE";
    }

    private String resolveVolumeAdvice(String volumePriceType, String positionType) {
        switch (volumePriceType) {
            case "VOLUME_UP_PRICE_UP":
                if ("LOW".equals(positionType)) {
                    return "低位放量上涨，可视为启动信号";
                }
                if ("HIGH".equals(positionType)) {
                    return "高位放量上涨，注意分歧和回撤";
                }
                return "中位放量上涨，趋势延续可跟踪";
            case "PRICE_UP_VOLUME_DOWN":
                return "价涨量缩，谨慎追高，优先等待回踩";
            case "PRICE_DOWN_VOLUME_UP":
                return "价跌量增，抛压释放，优先防守";
            default:
                return "量价结构中性，等待更明确信号";
        }
    }

    private String resolveRiskLevel(String volumePriceType, String positionType) {
        if ("PRICE_DOWN_VOLUME_UP".equals(volumePriceType) || "HIGH".equals(positionType)) {
            return "HIGH";
        }
        if ("VOLUME_UP_PRICE_UP".equals(volumePriceType) && "LOW".equals(positionType)) {
            return "LOW";
        }
        return "MEDIUM";
    }

    private String resolveAdviceAction(Boolean tradable, String volumeAdvice, TStrategyCalc tCalc) {
        if (!Boolean.TRUE.equals(tradable)) {
            return "WAIT";
        }
        if (Boolean.TRUE.equals(tCalc.suitable)) {
            return "T_STRATEGY";
        }
        if (volumeAdvice.contains("启动")) {
            return "BUY";
        }
        if (volumeAdvice.contains("防守") || volumeAdvice.contains("回撤")) {
            return "REDUCE";
        }
        return "OBSERVE";
    }

    private String mergeRiskLevel(MarketSignalResultDTO marketSignal, String ruleRisk) {
        if (marketSignal == null) {
            return ruleRisk;
        }
        if ("HIGH".equals(marketSignal.getRiskLevel()) || "HIGH".equals(ruleRisk)) {
            return "HIGH";
        }
        if ("LOW".equals(marketSignal.getRiskLevel()) && "LOW".equals(ruleRisk)) {
            return "LOW";
        }
        return "MEDIUM";
    }

    private String buildReasonText(MarketSignalResultDTO marketSignal, BigDecimal volumeRatio, String positionType, TStrategyCalc tCalc) {
        return String.format("市场节点=%s；量比=%s；股价位置=%s；做T=%s；失效条件=%s",
                marketSignal == null ? "无" : marketSignal.getSignalName(),
                volumeRatio.stripTrailingZeros().toPlainString(),
                positionType,
                Boolean.TRUE.equals(tCalc.suitable) ? "可执行" : "暂不执行",
                tCalc.invalidCondition);
    }

    private BigDecimal averageVolume(List<StockKlineDailyDO> klines, int size) {
        int start = Math.max(0, klines.size() - size - 1);
        int end = Math.max(0, klines.size() - 1);
        BigDecimal total = BigDecimal.ZERO;
        int count = 0;
        for (int i = start; i < end; i++) {
            if (klines.get(i).getVolume() == null) {
                continue;
            }
            total = total.add(klines.get(i).getVolume());
            count++;
        }
        return count == 0 ? BigDecimal.ONE : total.divide(BigDecimal.valueOf(count), 4, RoundingMode.HALF_UP);
    }

    private TStrategyCalc calculateTStrategy(List<StockKlineDailyDO> klines, BigDecimal invalidBreakThreshold,
                                             BigDecimal defaultPositionRatio, StockWatchlistDO watchlist) {
        TStrategyCalc calc = new TStrategyCalc();
        List<Integer> bottoms = new ArrayList<>();
        for (int i = 1; i < klines.size() - 1; i++) {
            BigDecimal prev = klines.get(i - 1).getLowPrice();
            BigDecimal curr = klines.get(i).getLowPrice();
            BigDecimal next = klines.get(i + 1).getLowPrice();
            if (curr != null && prev != null && next != null
                    && curr.compareTo(prev) <= 0 && curr.compareTo(next) <= 0) {
                bottoms.add(i);
            }
        }
        StockKlineDailyDO latest = klines.get(klines.size() - 1);
        calc.positionRatio = resolvePositionRatio(defaultPositionRatio, watchlist);
        calc.resistancePrice = klines.subList(Math.max(0, klines.size() - 20), klines.size()).stream()
                .map(StockKlineDailyDO::getHighPrice).filter(value -> value != null)
                .max(BigDecimal::compareTo).orElse(latest.getHighPrice());
        calc.supportPrice = klines.subList(Math.max(0, klines.size() - 20), klines.size()).stream()
                .map(StockKlineDailyDO::getLowPrice).filter(value -> value != null)
                .min(BigDecimal::compareTo).orElse(latest.getLowPrice());
        if (calc.supportPrice == null) {
            calc.supportPrice = latest.getClosePrice();
        }
        if (calc.resistancePrice == null) {
            calc.resistancePrice = latest.getClosePrice();
        }
        calc.buyLowPrice = calc.supportPrice.multiply(BigDecimal.valueOf(0.995)).setScale(4, RoundingMode.HALF_UP);
        calc.buyHighPrice = calc.supportPrice.multiply(BigDecimal.valueOf(1.03)).setScale(4, RoundingMode.HALF_UP);
        calc.sellLowPrice = calc.resistancePrice.multiply(BigDecimal.valueOf(0.98)).setScale(4, RoundingMode.HALF_UP);
        calc.sellHighPrice = calc.resistancePrice.multiply(BigDecimal.valueOf(1.005)).setScale(4, RoundingMode.HALF_UP);
        calc.invalidCondition = "跌破 " + calc.supportPrice.multiply(BigDecimal.ONE.subtract(invalidBreakThreshold))
                .setScale(4, RoundingMode.HALF_UP);
        calc.reason = "基于最近 20 根K线计算支撑和压力";
        if (bottoms.size() < 3) {
            calc.suitable = false;
            return calc;
        }
        List<Integer> lastThree = bottoms.subList(bottoms.size() - 3, bottoms.size());
        BigDecimal low1 = klines.get(lastThree.get(0)).getLowPrice();
        BigDecimal low2 = klines.get(lastThree.get(1)).getLowPrice();
        BigDecimal low3 = klines.get(lastThree.get(2)).getLowPrice();
        boolean risingBottom = low2.compareTo(low1.multiply(BigDecimal.valueOf(0.98))) >= 0
                && low3.compareTo(low2.multiply(BigDecimal.valueOf(0.98))) >= 0;
        boolean nearSupport = latest.getClosePrice() != null && latest.getClosePrice().compareTo(calc.buyHighPrice) <= 0;
        calc.suitable = risingBottom && nearSupport;
        calc.reason = calc.suitable ? "三重底抬高且股价接近支撑区" : "结构未形成三重底抬高，或当前不在支撑区";
        return calc;
    }

    private BigDecimal resolvePositionRatio(BigDecimal defaultPositionRatio, StockWatchlistDO watchlist) {
        if (watchlist == null || watchlist.getCollectLevel() == null) {
            return defaultPositionRatio;
        }
        switch (watchlist.getCollectLevel()) {
            case "CORE":
                return BigDecimal.valueOf(0.50);
            case "KEY":
                return BigDecimal.valueOf(0.35);
            default:
                return defaultPositionRatio;
        }
    }

    private BigDecimal nullSafe(BigDecimal value) {
        return value == null ? BigDecimal.ZERO : value;
    }

    private static class TStrategyCalc {
        private Boolean suitable = false;
        private BigDecimal supportPrice;
        private BigDecimal resistancePrice;
        private BigDecimal buyLowPrice;
        private BigDecimal buyHighPrice;
        private BigDecimal sellLowPrice;
        private BigDecimal sellHighPrice;
        private BigDecimal positionRatio;
        private String invalidCondition;
        private String reason;
    }
}
