package cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class StockWatchlistRuntimeStateRespVO {

    private Long watchlistId;
    private String symbol;
    private String name;
    private LocalDateTime latestCollectTime;
    private LocalDateTime latestAnalyzeTime;
    private LocalDateTime latestAlertTime;
    private String latestAdvice;
    private Boolean enableMonitor;
}
