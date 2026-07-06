package cn.iocoder.yudao.module.stock.job;

import cn.iocoder.yudao.module.infra.controller.admin.job.vo.job.JobSaveReqVO;
import cn.iocoder.yudao.module.infra.dal.mysql.job.JobMapper;
import cn.iocoder.yudao.module.infra.service.job.JobService;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Optional;

@Component
@Slf4j
public class StockJobBootstrapRunner implements ApplicationRunner {

    private static final String MARKET_COLLECT_HANDLER = "stockMarketCollectJob";
    private static final String WATCHLIST_ANALYZE_HANDLER = "stockWatchlistAnalyzeJob";

    @Resource
    private JobMapper jobMapper;
    @Resource
    private JobService jobService;
    @Resource
    private StockProperties stockProperties;
    @Resource
    private Optional<Scheduler> scheduler;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        if (!scheduler.isPresent()) {
            log.info("[run][skip stock job bootstrap because Quartz scheduler is disabled]");
            return;
        }

        boolean marketCreated = ensureJob("Stock Market Collect Job", MARKET_COLLECT_HANDLER,
                stockProperties.getCollect().getMarketCron());
        boolean watchlistCreated = ensureJob("Stock Watchlist Analyze Job", WATCHLIST_ANALYZE_HANDLER,
                stockProperties.getCollect().getWatchlistCron());
        if (marketCreated || watchlistCreated) {
            return;
        }

        if (!scheduler.get().checkExists(new JobKey(MARKET_COLLECT_HANDLER))
                || !scheduler.get().checkExists(new JobKey(WATCHLIST_ANALYZE_HANDLER))) {
            log.info("[run][sync stock jobs because Quartz entries are missing]");
            jobService.syncJob();
        }
    }

    private boolean ensureJob(String name, String handlerName, String cronExpression) throws SchedulerException {
        if (jobMapper.selectByHandlerName(handlerName) != null) {
            return false;
        }
        JobSaveReqVO reqVO = new JobSaveReqVO();
        reqVO.setName(name);
        reqVO.setHandlerName(handlerName);
        reqVO.setHandlerParam("");
        reqVO.setCronExpression(cronExpression);
        reqVO.setRetryCount(0);
        reqVO.setRetryInterval(0);
        reqVO.setMonitorTimeout(0);
        Long jobId = jobService.createJob(reqVO);
        log.info("[ensureJob][created stock job id({}) handler({}) cron({})]", jobId, handlerName, cronExpression);
        return true;
    }

}
