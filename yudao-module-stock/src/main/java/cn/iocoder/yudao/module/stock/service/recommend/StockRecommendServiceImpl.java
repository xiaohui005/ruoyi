package cn.iocoder.yudao.module.stock.service.recommend;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.analysis.StockAnalysisRecordMapper;
import cn.iocoder.yudao.module.stock.service.analyzer.StockAnalyzerService;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.calendar.StockTradeCalendarService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.watchlist.StockWatchlistService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@Slf4j
public class StockRecommendServiceImpl implements StockRecommendService {

    @Resource
    private StockWatchlistService stockWatchlistService;
    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockAnalyzerService stockAnalyzerService;
    @Resource
    private StockAnalysisRecordMapper stockAnalysisRecordMapper;
    @Resource
    private StockTradeCalendarService stockTradeCalendarService;

    @Override
    public PageResult<StockRecommendRespVO> getRecommendPage(StockRecommendPageReqVO reqVO, Long userId) {
        stockAnalyzerService.cleanupExpiredAnalysisRecords();
        List<StockWatchlistDO> watchlists = stockWatchlistService.getEnabledWatchlists(userId);
        if (watchlists.isEmpty()) {
            return PageResult.empty();
        }
        List<StockRecommendRespVO> recommendations = watchlists.stream()
                .map(watchlist -> buildRecommendResp(watchlist, userId))
                .filter(Objects::nonNull)
                .filter(item -> matchFilter(item, reqVO))
                .sorted(Comparator.comparing(StockRecommendRespVO::getAnalyzeTime,
                        Comparator.nullsLast(LocalDateTime::compareTo)).reversed())
                .collect(Collectors.toList());
        long total = recommendations.size();
        int fromIndex = Math.max((reqVO.getPageNo() - 1) * reqVO.getPageSize(), 0);
        if (fromIndex >= recommendations.size()) {
            return new PageResult<>(new ArrayList<>(), total);
        }
        int toIndex = Math.min(fromIndex + reqVO.getPageSize(), recommendations.size());
        return new PageResult<>(recommendations.subList(fromIndex, toIndex), total);
    }

    @Override
    public Integer refreshRecommendations(Long userId) {
        LocalDateTime now = LocalDateTime.now();
        if (!stockTradeCalendarService.canCollectNow(now)) {
            log.info("[refreshRecommendations][skip refresh because market is closed at {}]", now);
            return 0;
        }
        List<StockWatchlistDO> watchlists = stockWatchlistService.getEnabledWatchlists(userId);
        int successCount = 0;
        for (StockWatchlistDO watchlist : watchlists) {
            try {
                stockDataService.refreshDailyKLine(watchlist.getSymbol(), 120);
                stockWatchlistService.updateLastCollectTime(watchlist.getId(), now);
                StockAnalyzeResultDTO result = stockAnalyzerService.analyze(watchlist);
                stockWatchlistService.updateAfterAnalysis(watchlist.getId(), result.getAdviceAction(), result.getAnalyzeTime());
                successCount++;
            } catch (Exception ex) {
                log.warn("[refreshRecommendations][刷新推荐 {} 失败]", watchlist.getSymbol(), ex);
            }
        }
        return successCount;
    }

    private StockRecommendRespVO buildRecommendResp(StockWatchlistDO watchlist, Long userId) {
        StockAnalysisRecordDO latest = stockAnalysisRecordMapper.selectLatestBySymbolAndUser(watchlist.getSymbol(), userId);
        if (latest == null || !isRecommendedAction(latest.getAdviceAction())) {
            return null;
        }
        StockRecommendRespVO respVO = new StockRecommendRespVO();
        respVO.setAnalysisRecordId(latest.getId());
        respVO.setWatchlistId(watchlist.getId());
        respVO.setSymbol(latest.getSymbol());
        respVO.setStockName(latest.getStockName());
        respVO.setWatchlistName(watchlist.getName());
        respVO.setAdviceAction(latest.getAdviceAction());
        respVO.setRiskLevel(latest.getRiskLevel());
        respVO.setMarketSignalName(latest.getMarketSignalName());
        respVO.setVolumePriceAdvice(latest.getVolumePriceAdvice());
        respVO.setReasonText(latest.getReasonText());
        respVO.setAnalyzeTime(latest.getCreateTime());
        return respVO;
    }

    private boolean matchFilter(StockRecommendRespVO item, StockRecommendPageReqVO reqVO) {
        if (StrUtil.isNotBlank(reqVO.getSymbol()) && !StrUtil.containsIgnoreCase(item.getSymbol(), reqVO.getSymbol())) {
            return false;
        }
        if (StrUtil.isNotBlank(reqVO.getAdviceAction()) && !StrUtil.equals(item.getAdviceAction(), reqVO.getAdviceAction())) {
            return false;
        }
        if (StrUtil.isNotBlank(reqVO.getRiskLevel()) && !StrUtil.equals(item.getRiskLevel(), reqVO.getRiskLevel())) {
            return false;
        }
        return true;
    }

    private boolean isRecommendedAction(String adviceAction) {
        return "BUY".equals(adviceAction) || "T_STRATEGY".equals(adviceAction) || "OBSERVE".equals(adviceAction);
    }
}
