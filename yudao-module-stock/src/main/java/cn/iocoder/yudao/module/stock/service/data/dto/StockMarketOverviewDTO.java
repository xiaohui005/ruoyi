package cn.iocoder.yudao.module.stock.service.data.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class StockMarketOverviewDTO {

    private LocalDate tradeDate;
    private LocalDateTime snapshotTime;
    private String indexCode;
    private String indexName;
    private BigDecimal indexClose;
    private BigDecimal indexChangePct;
    private BigDecimal turnoverAmount;
    private BigDecimal turnoverRatio;
    private Integer limitUpCount;
    private Integer limitDownCount;
    private Integer risingCount;
    private Integer fallingCount;
    private String hotTheme;
    private Integer themeLimitUpCount;
    private String sourceName;
    private String rawPayload;
}
