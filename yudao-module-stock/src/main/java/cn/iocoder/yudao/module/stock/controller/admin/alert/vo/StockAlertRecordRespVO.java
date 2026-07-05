package cn.iocoder.yudao.module.stock.controller.admin.alert.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class StockAlertRecordRespVO {

    private Long id;
    private Long watchlistId;
    private Long ruleId;
    private String channelCode;
    private String symbol;
    private String alertType;
    private String triggerValue;
    private String content;
    private String sendStatus;
    private LocalDateTime sendTime;
    private String responseText;
    private LocalDateTime createTime;
}
