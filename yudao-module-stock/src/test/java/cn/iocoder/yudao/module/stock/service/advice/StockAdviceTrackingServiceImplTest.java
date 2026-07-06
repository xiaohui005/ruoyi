package cn.iocoder.yudao.module.stock.service.advice;

import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockTStrategyRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.advice.StockAdviceTrackingLogMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.advice.StockAdviceTrackingMapper;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.config.StockAnalysisConfigService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.springframework.test.util.ReflectionTestUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyBoolean;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class StockAdviceTrackingServiceImplTest {

    private final StockAdviceTrackingMapper trackingMapper = mock(StockAdviceTrackingMapper.class);
    private final StockAdviceTrackingLogMapper trackingLogMapper = mock(StockAdviceTrackingLogMapper.class);
    private final StockDataService stockDataService = mock(StockDataService.class);
    private final StockAnalysisConfigService stockAnalysisConfigService = mock(StockAnalysisConfigService.class);

    private StockAdviceTrackingServiceImpl service;

    @BeforeEach
    void setUp() {
        service = new StockAdviceTrackingServiceImpl();
        ReflectionTestUtils.setField(service, "stockAdviceTrackingMapper", trackingMapper);
        ReflectionTestUtils.setField(service, "stockAdviceTrackingLogMapper", trackingLogMapper);
        ReflectionTestUtils.setField(service, "stockDataService", stockDataService);
        ReflectionTestUtils.setField(service, "stockAnalysisConfigService", stockAnalysisConfigService);
        when(stockAnalysisConfigService.getDecimalConfig(eq("strategy.invalid-break-threshold"), any()))
                .thenReturn(new BigDecimal("0.02"));
        when(stockAnalysisConfigService.getDecimalConfig(eq("strategy.advice-expected-days"), any()))
                .thenReturn(new BigDecimal("5"));
    }

    @Test
    void createOrRefreshFromAnalysis_shouldCreateBuyTriggeredRecordForBuyAdviceInBuyRange() {
        when(trackingMapper.selectLatestActiveByUserSymbolAndType(eq(100L), eq("600519.SH"), eq("BUY"))).thenReturn(null);

        StockAnalyzeResultDTO result = new StockAnalyzeResultDTO();
        result.setSymbol("600519.SH");
        result.setStockName("贵州茅台");
        result.setAdviceAction("BUY");
        result.setLatestPrice(new BigDecimal("10.05"));
        result.setRiskLevel("LOW");
        result.setAnalyzeTime(LocalDateTime.of(2026, 7, 6, 10, 0));

        StockAnalysisRecordDO analysisRecord = new StockAnalysisRecordDO();
        analysisRecord.setId(11L);
        analysisRecord.setCreateTime(LocalDateTime.of(2026, 7, 6, 10, 0));

        StockTStrategyRecordDO strategyRecord = buildStrategyRecord();
        StockWatchlistDO watchlist = new StockWatchlistDO();
        watchlist.setId(22L);

        service.createOrRefreshFromAnalysis(result, analysisRecord, strategyRecord, watchlist, 100L);

        ArgumentCaptor<StockAdviceTrackingDO> captor = ArgumentCaptor.forClass(StockAdviceTrackingDO.class);
        verify(trackingMapper).insert(captor.capture());
        StockAdviceTrackingDO created = captor.getValue();
        assertEquals("BUY", created.getAdviceType());
        assertEquals("BUY_TRIGGERED", created.getStatus());
        assertEquals(new BigDecimal("10.05"), created.getLatestPriceAtAdvice());
        assertNotNull(created.getBuyTriggerTime());
        verify(trackingLogMapper).insert(any());
    }

    @Test
    void evaluateActiveTracks_shouldCompleteTStrategyAfterSellRangeReached() {
        StockAdviceTrackingDO tracking = buildTracking("T_STRATEGY", "BUY_TRIGGERED");
        tracking.setAdviceTime(LocalDateTime.now().minusDays(1));
        when(trackingMapper.selectActiveForEvaluate()).thenReturn(Collections.singletonList(tracking));

        StockKlineDailyDO latest = new StockKlineDailyDO();
        latest.setSymbol("600519.SH");
        latest.setTradeDate(LocalDate.now());
        latest.setClosePrice(new BigDecimal("10.90"));
        when(stockDataService.getLatestDailyKLine(eq("600519.SH"), anyBoolean())).thenReturn(latest);

        service.evaluateActiveTracks();

        ArgumentCaptor<StockAdviceTrackingDO> captor = ArgumentCaptor.forClass(StockAdviceTrackingDO.class);
        verify(trackingMapper).updateById(captor.capture());
        StockAdviceTrackingDO updated = captor.getValue();
        assertEquals("COMPLETED", updated.getStatus());
        assertNotNull(updated.getSellTriggerTime());
        assertNotNull(updated.getEstimatedProfitRate());
        verify(trackingLogMapper).insert(any());
    }

    @Test
    void evaluateActiveTracks_shouldInvalidateWhenPriceBreaksSupportThreshold() {
        StockAdviceTrackingDO tracking = buildTracking("BUY", "PENDING");
        when(trackingMapper.selectActiveForEvaluate()).thenReturn(Collections.singletonList(tracking));

        StockKlineDailyDO latest = new StockKlineDailyDO();
        latest.setSymbol("600519.SH");
        latest.setTradeDate(LocalDate.now());
        latest.setClosePrice(new BigDecimal("9.79"));
        when(stockDataService.getLatestDailyKLine(eq("600519.SH"), anyBoolean())).thenReturn(latest);

        service.evaluateActiveTracks();

        ArgumentCaptor<StockAdviceTrackingDO> captor = ArgumentCaptor.forClass(StockAdviceTrackingDO.class);
        verify(trackingMapper).updateById(captor.capture());
        assertEquals("INVALIDATED", captor.getValue().getStatus());
    }

    @Test
    void evaluateActiveTracks_shouldExpireWhenObservationWindowPassed() {
        StockAdviceTrackingDO tracking = buildTracking("BUY", "PENDING");
        tracking.setAdviceTime(LocalDateTime.now().minusDays(8));
        tracking.setExpectedDays(5);
        when(trackingMapper.selectActiveForEvaluate()).thenReturn(Collections.singletonList(tracking));

        service.evaluateActiveTracks();

        ArgumentCaptor<StockAdviceTrackingDO> captor = ArgumentCaptor.forClass(StockAdviceTrackingDO.class);
        verify(trackingMapper).updateById(captor.capture());
        assertEquals("EXPIRED", captor.getValue().getStatus());
    }

    private static StockTStrategyRecordDO buildStrategyRecord() {
        StockTStrategyRecordDO record = new StockTStrategyRecordDO();
        record.setSupportPrice(new BigDecimal("10.00"));
        record.setResistancePrice(new BigDecimal("11.00"));
        record.setBuyLowPrice(new BigDecimal("9.95"));
        record.setBuyHighPrice(new BigDecimal("10.30"));
        record.setSellLowPrice(new BigDecimal("10.80"));
        record.setSellHighPrice(new BigDecimal("11.05"));
        record.setPositionRatio(new BigDecimal("0.30"));
        record.setInvalidCondition("跌破 9.80");
        return record;
    }

    private static StockAdviceTrackingDO buildTracking(String adviceType, String status) {
        StockAdviceTrackingDO tracking = new StockAdviceTrackingDO();
        tracking.setId(1L);
        tracking.setUserId(100L);
        tracking.setSymbol("600519.SH");
        tracking.setStockName("贵州茅台");
        tracking.setAdviceType(adviceType);
        tracking.setStatus(status);
        tracking.setAdviceTime(LocalDateTime.now().minusDays(1));
        tracking.setSupportPrice(new BigDecimal("10.00"));
        tracking.setBuyLowPrice(new BigDecimal("9.95"));
        tracking.setBuyHighPrice(new BigDecimal("10.30"));
        tracking.setSellLowPrice(new BigDecimal("10.80"));
        tracking.setSellHighPrice(new BigDecimal("11.05"));
        tracking.setPositionRatio(new BigDecimal("0.30"));
        tracking.setExpectedDays(5);
        tracking.setEstimatedProfitRate(new BigDecimal("7.80"));
        return tracking;
    }
}
