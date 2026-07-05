package cn.iocoder.yudao.module.stock.service.data;

import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSnapshotDO;

import java.util.List;

public interface StockDataService {

    StockMarketSnapshotDO getLatestMarketSnapshot(boolean refreshIfNeeded);

    StockMarketSnapshotDO refreshMarketSnapshot();

    List<StockKlineDailyDO> getRecentDailyKLine(String symbol, Integer limit, boolean refreshIfNeeded);

    StockKlineDailyDO getLatestDailyKLine(String symbol, boolean refreshIfNeeded);

    List<StockKlineDailyDO> refreshDailyKLine(String symbol, Integer limit);

    String getStockName(String symbol);
}
