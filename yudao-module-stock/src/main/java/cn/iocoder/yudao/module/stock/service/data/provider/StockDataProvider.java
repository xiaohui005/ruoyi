package cn.iocoder.yudao.module.stock.service.data.provider;

import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import cn.iocoder.yudao.module.stock.service.data.dto.StockMarketOverviewDTO;

import java.util.List;

public interface StockDataProvider {

    String providerCode();

    StockMarketOverviewDTO fetchMarketOverview();

    List<StockDailyKLineDTO> fetchDailyKLine(String symbol, Integer limit);

    String fetchStockName(String symbol);
}
