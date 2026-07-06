package cn.iocoder.yudao.module.stock.service.watchlist;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;

import java.time.LocalDateTime;
import java.util.List;

public interface StockWatchlistService {

    Long createWatchlist(StockWatchlistSaveReqVO reqVO, Long userId);

    void updateWatchlist(StockWatchlistSaveReqVO reqVO, Long userId);

    void deleteWatchlist(Long id, Long userId);

    StockWatchlistDO getWatchlist(Long id, Long userId);

    PageResult<StockWatchlistDO> getWatchlistPage(StockWatchlistPageReqVO reqVO, Long userId);

    List<StockWatchlistDO> getEnabledWatchlists();

    List<StockWatchlistDO> getEnabledWatchlists(Long userId);

    StockWatchlistDO manualCollect(Long id, Long userId);

    Integer manualCollectAll(Long userId);

    void updateAfterAnalysis(Long id, String latestAdvice, LocalDateTime analyzeTime);

    void updateLastCollectTime(Long id, LocalDateTime collectTime);

    void updateLastAlertTime(Long id, LocalDateTime alertTime);
}
