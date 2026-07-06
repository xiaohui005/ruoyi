package cn.iocoder.yudao.module.stock.service.alert;

import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertChannelMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertRecordMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.alert.StockAlertRuleMapper;
import cn.iocoder.yudao.module.stock.service.alert.dto.StockAlertSendResultDTO;
import cn.iocoder.yudao.module.stock.service.alert.sender.StockAlertSender;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;
import cn.iocoder.yudao.module.stock.service.watchlist.StockWatchlistService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Collections;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

class StockAlertServiceImplTest {

    private final StockAlertSender sender = mock(StockAlertSender.class);
    private final StockAlertChannelMapper stockAlertChannelMapper = mock(StockAlertChannelMapper.class);
    private final StockAlertRuleMapper stockAlertRuleMapper = mock(StockAlertRuleMapper.class);
    private final StockAlertRecordMapper stockAlertRecordMapper = mock(StockAlertRecordMapper.class);
    private final StockWatchlistService stockWatchlistService = mock(StockWatchlistService.class);

    private StockAlertServiceImpl service;

    @BeforeEach
    void setUp() {
        when(sender.channelCode()).thenReturn("INTERNAL_NOTIFY");
        when(sender.send(any(StockAlertChannelDO.class), anyString(), anyString()))
                .thenReturn(new StockAlertSendResultDTO(true, "ok"));
        service = new StockAlertServiceImpl(Collections.singletonList(sender));
        ReflectionTestUtils.setField(service, "stockAlertChannelMapper", stockAlertChannelMapper);
        ReflectionTestUtils.setField(service, "stockAlertRuleMapper", stockAlertRuleMapper);
        ReflectionTestUtils.setField(service, "stockAlertRecordMapper", stockAlertRecordMapper);
        ReflectionTestUtils.setField(service, "stockWatchlistService", stockWatchlistService);
    }

    @Test
    void evaluateAndSendShouldTriggerFiveOneThreePatternAlert() {
        StockWatchlistDO watchlist = new StockWatchlistDO();
        watchlist.setId(10L);
        watchlist.setUserId(1L);
        watchlist.setSymbol("600519.SH");
        watchlist.setEnableSignalAlert(true);
        watchlist.setEnablePriceAlert(false);
        watchlist.setEnableTStrategy(false);

        StockAlertChannelDO channel = new StockAlertChannelDO();
        channel.setId(20L);
        channel.setUserId(1L);
        channel.setChannelCode("INTERNAL_NOTIFY");
        channel.setChannelName("站内信");
        channel.setEnabled(true);
        channel.setConfigJson("{}");
        when(stockAlertChannelMapper.selectListByUserId(1L)).thenReturn(Collections.singletonList(channel));
        when(stockAlertRuleMapper.selectEnabledByUserAndWatchlist(eq(1L), eq(10L))).thenReturn(Collections.emptyList());

        StockAnalyzeResultDTO result = new StockAnalyzeResultDTO();
        result.setSymbol("600519.SH");
        result.setStockName("贵州茅台");
        result.setLatestPrice(new BigDecimal("1800.00"));
        result.setKlinePatterns(Collections.singletonList(new StockKlinePatternDTO(
                "FIVE_ONE_THREE",
                "513连板启动",
                "BULLISH",
                "利多",
                "命中513启动形态",
                "可提醒"
        )));

        service.evaluateAndSend(watchlist, result);

        verify(sender).send(any(StockAlertChannelDO.class), anyString(), anyString());
        verify(stockAlertRecordMapper).insert(any(StockAlertRecordDO.class));
        verify(stockWatchlistService).updateLastAlertTime(eq(10L), any(LocalDateTime.class));
    }

    @Test
    void evaluateAndSendShouldSkipWhenFiveOneThreeIsMissing() {
        StockWatchlistDO watchlist = new StockWatchlistDO();
        watchlist.setId(11L);
        watchlist.setUserId(1L);
        watchlist.setSymbol("600519.SH");
        watchlist.setEnableSignalAlert(true);
        watchlist.setEnablePriceAlert(false);
        watchlist.setEnableTStrategy(false);

        StockAlertChannelDO channel = new StockAlertChannelDO();
        channel.setId(21L);
        channel.setUserId(1L);
        channel.setChannelCode("INTERNAL_NOTIFY");
        channel.setChannelName("站内信");
        channel.setEnabled(true);
        channel.setConfigJson("{}");
        when(stockAlertChannelMapper.selectListByUserId(1L)).thenReturn(Collections.singletonList(channel));
        when(stockAlertRuleMapper.selectEnabledByUserAndWatchlist(eq(1L), eq(11L))).thenReturn(Collections.emptyList());

        StockAnalyzeResultDTO result = new StockAnalyzeResultDTO();
        result.setSymbol("600519.SH");
        result.setStockName("贵州茅台");
        result.setLatestPrice(new BigDecimal("1800.00"));
        result.setKlinePatterns(Collections.<StockKlinePatternDTO>emptyList());

        service.evaluateAndSend(watchlist, result);

        verify(sender, never()).send(any(StockAlertChannelDO.class), anyString(), anyString());
        verify(stockAlertRecordMapper, never()).insert(any(StockAlertRecordDO.class));
        verify(stockWatchlistService, never()).updateLastAlertTime(any(Long.class), any(LocalDateTime.class));
    }
}
