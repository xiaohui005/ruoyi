package cn.iocoder.yudao.module.stock.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StockAlertChannelEnum {

    INTERNAL_NOTIFY("INTERNAL_NOTIFY", "站内提醒"),
    WXPUSHER("WXPUSHER", "WxPusher"),
    EMAIL("EMAIL", "邮件");

    private final String code;
    private final String name;
}
