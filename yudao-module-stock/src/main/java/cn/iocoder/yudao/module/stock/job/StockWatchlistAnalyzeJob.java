package cn.iocoder.yudao.module.stock.job;

import cn.iocoder.yudao.framework.quartz.core.handler.JobHandler;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.alert.StockAlertService;
import cn.iocoder.yudao.module.stock.service.analyzer.StockAnalyzerService;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.calendar.StockTradeCalendarService;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.watchlist.StockWatchlistService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

@Component
@Slf4j
public class StockWatchlistAnalyzeJob implements JobHandler {

    @Resource
    private StockWatchlistService stockWatchlistService;
    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockAnalyzerService stockAnalyzerService;
    @Resource
    private StockAlertService stockAlertService;
    @Resource
    private StockTradeCalendarService stockTradeCalendarService;

    @Override
    public String execute(String param) {
        LocalDateTime now = LocalDateTime.now();
        if (!stockTradeCalendarService.canCollectNow(now)) {
            log.info("[execute][skip watchlist collect because market is closed at {}]", now);
            return "skip=market-closed";
        }
        List<StockWatchlistDO> watchlists = stockWatchlistService.getEnabledWatchlists();
        int successCount = 0;
        int skipCount = 0;
        for (StockWatchlistDO watchlist : watchlists) {
            if (!shouldCollect(watchlist, now)) {
                skipCount++;
                continue;
            }
            try {
                stockDataService.refreshDailyKLine(watchlist.getSymbol(), 120);
                stockWatchlistService.updateLastCollectTime(watchlist.getId(), now);
                StockAnalyzeResultDTO result = stockAnalyzerService.analyze(watchlist);
                stockWatchlistService.updateAfterAnalysis(watchlist.getId(), result.getAdviceAction(), result.getAnalyzeTime());
                stockAlertService.evaluateAndSend(watchlist, result);
                successCount++;
            } catch (Exception ex) {
                log.warn("[execute][分析自选股 {} 失败]", watchlist.getSymbol(), ex);
            }
        }
        return "success=" + successCount + ",skip=" + skipCount;
    }

    private boolean shouldCollect(StockWatchlistDO watchlist, LocalDateTime now) {
        Integer intervalMinutes = watchlist.getCollectIntervalMinutes();
        if (intervalMinutes == null || intervalMinutes <= 0 || watchlist.getLatestCollectTime() == null) {
            return true;
        }
        return !watchlist.getLatestCollectTime().plusMinutes(intervalMinutes).isAfter(now);
    }
}
