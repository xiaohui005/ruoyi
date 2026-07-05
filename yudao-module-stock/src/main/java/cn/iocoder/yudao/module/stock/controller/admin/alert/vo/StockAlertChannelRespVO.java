package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

@Data
public class StockAlertChannelRespVO {

    private Long id;
    private String channelCode;
    private String channelName;
    private Boolean enabled;
    private String configJson;
}
