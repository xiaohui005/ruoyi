package cn.iocoder.yudao.module.stock.service.data;

import cn.iocoder.yudao.module.stock.dal.dataobject.basic.StockBasicInfoDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.mysql.basic.StockBasicInfoMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockKlineDailyMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockMarketSnapshotMapper;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.calendar.StockTradeCalendarService;
import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import cn.iocoder.yudao.module.stock.service.data.provider.StockDataProvider;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class StockDataServiceImplTest {

    private final StockDataProvider provider = mock(StockDataProvider.class);
    private final StockMarketSnapshotMapper stockMarketSnapshotMapper = mock(StockMarketSnapshotMapper.class);
    private final StockKlineDailyMapper stockKlineDailyMapper = mock(StockKlineDailyMapper.class);
    private final StockBasicInfoMapper stockBasicInfoMapper = mock(StockBasicInfoMapper.class);
    private final StockTradeCalendarService stockTradeCalendarService = mock(StockTradeCalendarService.class);

    private StockDataServiceImpl service;

    @BeforeEach
    void setUp() {
        when(provider.providerCode()).thenReturn("mock");
        service = new StockDataServiceImpl(Collections.singletonList(provider));
        ReflectionTestUtils.setField(service, "stockMarketSnapshotMapper", stockMarketSnapshotMapper);
        ReflectionTestUtils.setField(service, "stockKlineDailyMapper", stockKlineDailyMapper);
        ReflectionTestUtils.setField(service, "stockBasicInfoMapper", stockBasicInfoMapper);
        ReflectionTestUtils.setField(service, "stockTradeCalendarService", stockTradeCalendarService);

        StockProperties stockProperties = new StockProperties();
        stockProperties.getData().getProvider().setPrimary("mock");
        stockProperties.getData().getProvider().setSecondary(null);
        stockProperties.getData().getProvider().setBackfill(null);
        ReflectionTestUtils.setField(service, "stockProperties", stockProperties);
    }

    @Test
    void refreshDailyKLine_shouldBackfillHistoryEvenWhenMarketClosed() {
        StockDailyKLineDTO dto = new StockDailyKLineDTO();
        dto.setSymbol("002555.SZ");
        dto.setTradeDate(LocalDate.of(2026, 7, 3));
        dto.setOpenPrice(new BigDecimal("12.10"));
        dto.setHighPrice(new BigDecimal("12.50"));
        dto.setLowPrice(new BigDecimal("11.98"));
        dto.setClosePrice(new BigDecimal("12.36"));
        dto.setPreClosePrice(new BigDecimal("12.00"));
        dto.setChangePct(new BigDecimal("3.0000"));
        dto.setVolume(new BigDecimal("123456"));
        dto.setTurnoverAmount(new BigDecimal("1523456"));
        dto.setSourceName("mock:stockName");
        when(provider.fetchDailyKLine("002555.SZ", 120)).thenReturn(Collections.singletonList(dto));

        StockKlineDailyDO persisted = new StockKlineDailyDO();
        persisted.setSymbol("002555.SZ");
        persisted.setTradeDate(dto.getTradeDate());
        persisted.setClosePrice(dto.getClosePrice());
        when(stockKlineDailyMapper.selectBySymbolAndTradeDate("002555.SZ", dto.getTradeDate())).thenReturn(null);
        when(stockBasicInfoMapper.selectBySymbol("002555.SZ")).thenReturn(null);
        when(stockKlineDailyMapper.selectRecentList("002555.SZ", 120)).thenReturn(Collections.singletonList(persisted));

        List<StockKlineDailyDO> result = service.refreshDailyKLine("002555", 120);

        assertEquals(1, result.size());
        assertEquals("002555.SZ", result.get(0).getSymbol());
        verify(provider).fetchDailyKLine("002555.SZ", 120);
        verify(stockBasicInfoMapper).insert(any(StockBasicInfoDO.class));
        verify(stockKlineDailyMapper).insert(any(StockKlineDailyDO.class));
    }
}
