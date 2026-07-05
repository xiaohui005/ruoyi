package cn.iocoder.yudao.module.stock.service.analyzer;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalysisRecordPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;

public interface StockAnalyzerService {

    StockAnalyzeResultDTO analyze(String symbol, Long userId);

    StockAnalyzeResultDTO analyze(StockWatchlistDO watchlist);

    PageResult<StockAnalysisRecordDO> getAnalysisRecordPage(StockAnalysisRecordPageReqVO reqVO, Long userId);

    void cleanupExpiredAnalysisRecords();
}
