package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class StockAlertRuleSaveReqVO {

    private Long id;
    private Long watchlistId;

    @NotBlank(message = "规则名称不能为空")
    private String ruleName;

    @NotBlank(message = "规则类型不能为空")
    private String ruleType;

    @NotNull(message = "启用状态不能为空")
    private Boolean enabled;

    @NotNull(message = "冷却时间不能为空")
    private Integer cooldownMinutes;

    private String ruleJson;
}
