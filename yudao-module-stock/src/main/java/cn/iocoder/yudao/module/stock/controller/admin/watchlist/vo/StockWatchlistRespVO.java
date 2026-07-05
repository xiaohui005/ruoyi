package cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class StockWatchlistRespVO {

    private Long id;
    private String symbol;
    private String name;
    private String collectLevel;
    private Integer collectIntervalMinutes;
    private Boolean enableMonitor;
    private Boolean enableIntraday;
    private Boolean enableTStrategy;
    private Boolean enablePriceAlert;
    private Boolean enableSignalAlert;
    private LocalDateTime latestCollectTime;
    private LocalDateTime latestAnalyzeTime;
    private LocalDateTime latestAlertTime;
    private String latestAdvice;
    private BigDecimal currentPrice;
    private BigDecimal changePercent;
    private String remark;
}
