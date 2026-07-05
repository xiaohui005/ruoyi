package cn.iocoder.yudao.module.stock.controller.admin.market.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 当前市场节点响应")
@Data
public class MarketSignalCurrentRespVO {

    private LocalDate tradeDate;
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
    private LocalDateTime snapshotTime;
}
