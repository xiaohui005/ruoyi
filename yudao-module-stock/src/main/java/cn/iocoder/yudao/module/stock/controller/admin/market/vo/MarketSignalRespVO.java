package cn.iocoder.yudao.module.stock.controller.admin.market.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Schema(description = "管理后台 - 市场节点响应")
@Data
public class MarketSignalRespVO {

    private Long id;
    private LocalDate tradeDate;
    private String signalCode;
    private String signalName;
    private Boolean tradable;
    private String riskLevel;
    private String reasonText;
    private LocalDateTime createTime;
}
