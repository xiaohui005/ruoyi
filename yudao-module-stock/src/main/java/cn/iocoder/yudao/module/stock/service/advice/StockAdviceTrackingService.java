package cn.iocoder.yudao.module.stock.service.advice;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingSummaryRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockTStrategyRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;

public interface StockAdviceTrackingService {

    void createOrRefreshFromAnalysis(StockAnalyzeResultDTO result, StockAnalysisRecordDO analysisRecord,
                                     StockTStrategyRecordDO strategyRecord, StockWatchlistDO watchlist, Long userId);

    void evaluateActiveTracks();

    PageResult<StockAdviceTrackingDO> getTrackingPage(StockAdviceTrackingPageReqVO reqVO, Long userId);

    StockAdviceTrackingSummaryRespVO getTrackingSummary(Long userId);
}
