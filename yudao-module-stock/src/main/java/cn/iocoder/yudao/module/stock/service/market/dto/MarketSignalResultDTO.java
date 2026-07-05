package cn.iocoder.yudao.module.stock.service.market.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class MarketSignalResultDTO {

    private Long recordId;
    private LocalDate tradeDate;
    private LocalDateTime snapshotTime;
    private String signalCode;
    private String signalName;
    private Boolean tradable;
    private String riskLevel;
    private String reasonText;
    private String hotTheme;
    private Integer limitUpCount;
    private Integer limitDownCount;
    private Integer risingCount;
    private Integer fallingCount;
    private BigDecimal indexClose;
    private BigDecimal indexChangePct;
    private BigDecimal turnoverAmount;
    private BigDecimal turnoverRatio;
}
