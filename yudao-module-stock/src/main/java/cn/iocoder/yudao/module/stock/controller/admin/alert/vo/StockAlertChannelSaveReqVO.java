package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class StockAlertChannelSaveReqVO {

    private Long id;

    @NotBlank(message = "渠道编码不能为空")
    private String channelCode;

    @NotBlank(message = "渠道名称不能为空")
    private String channelName;

    @NotNull(message = "启用状态不能为空")
    private Boolean enabled;

    private String configJson;
}
