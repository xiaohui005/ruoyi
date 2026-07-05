package cn.iocoder.yudao.module.stock.controller.admin.watchlist;

import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;

import java.math.BigDecimal;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class StockWatchlistControllerTest {

    @Test
    void buildWatchlistRespVOShouldUseProviderChangePercent() {
        StockWatchlistController controller = new StockWatchlistController();
        StockDataService stockDataService = mock(StockDataService.class);
        ReflectionTestUtils.setField(controller, "stockDataService", stockDataService);

        StockWatchlistDO watchlist = new StockWatchlistDO();
        watchlist.setSymbol("603993");
        watchlist.setName("洛阳钼业");

        StockKlineDailyDO latestKline = new StockKlineDailyDO();
        latestKline.setClosePrice(new BigDecimal("7.85"));
        latestKline.setChangePct(new BigDecimal("2.48"));
        when(stockDataService.getLatestDailyKLine("603993", true)).thenReturn(latestKline);

        StockWatchlistRespVO respVO = controller.buildWatchlistRespVO(watchlist);

        assertThat(respVO.getCurrentPrice()).isEqualByComparingTo("7.85");
        assertThat(respVO.getChangePercent()).isEqualByComparingTo("2.48");
    }

    @Test
    void buildWatchlistRespVOShouldCalculateChangePercentFromCloseAndPreClose() {
        StockWatchlistController controller = new StockWatchlistController();
        StockDataService stockDataService = mock(StockDataService.class);
        ReflectionTestUtils.setField(controller, "stockDataService", stockDataService);

        StockWatchlistDO watchlist = new StockWatchlistDO();
        watchlist.setSymbol("000630");
        watchlist.setName("铜陵有色");

        StockKlineDailyDO latestKline = new StockKlineDailyDO();
        latestKline.setClosePrice(new BigDecimal("5.50"));
        latestKline.setPreClosePrice(new BigDecimal("5.00"));
        when(stockDataService.getLatestDailyKLine("000630", true)).thenReturn(latestKline);

        StockWatchlistRespVO respVO = controller.buildWatchlistRespVO(watchlist);

        assertThat(respVO.getCurrentPrice()).isEqualByComparingTo("5.50");
        assertThat(respVO.getChangePercent()).isEqualByComparingTo("10.00");
    }
}
