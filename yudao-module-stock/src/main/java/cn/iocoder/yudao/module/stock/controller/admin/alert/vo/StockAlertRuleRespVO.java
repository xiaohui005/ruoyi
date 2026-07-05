package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class StockAlertRuleRespVO {

    private Long id;
    private Long watchlistId;
    private String ruleName;
    private String ruleType;
    private Boolean enabled;
    private Integer cooldownMinutes;
    private String ruleJson;
    private LocalDateTime updateTime;
}
