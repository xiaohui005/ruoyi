package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class StockAlertChannelTestReqVO {

    @NotBlank(message = "渠道编码不能为空")
    private String channelCode;

    private String content;
}
