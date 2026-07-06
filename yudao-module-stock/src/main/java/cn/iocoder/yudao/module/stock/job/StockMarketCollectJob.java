package cn.iocoder.yudao.module.stock.job;

import cn.iocoder.yudao.framework.quartz.core.handler.JobHandler;
import cn.iocoder.yudao.framework.tenant.core.job.TenantJob;
import cn.iocoder.yudao.module.stock.service.calendar.StockTradeCalendarService;
import cn.iocoder.yudao.module.stock.service.market.StockMarketSignalService;
import cn.iocoder.yudao.module.stock.service.market.dto.MarketSignalResultDTO;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;

@Component
public class StockMarketCollectJob implements JobHandler {

    @Resource
    private StockMarketSignalService stockMarketSignalService;
    @Resource
    private StockTradeCalendarService stockTradeCalendarService;

    @Override
    @TenantJob
    public String execute(String param) {
        if (!stockTradeCalendarService.canCollectNow(LocalDateTime.now())) {
            return "skip-market-closed";
        }
        MarketSignalResultDTO result = stockMarketSignalService.refreshCurrentSignal();
        return result == null ? "no-market-snapshot" : result.getSignalCode();
    }
}
