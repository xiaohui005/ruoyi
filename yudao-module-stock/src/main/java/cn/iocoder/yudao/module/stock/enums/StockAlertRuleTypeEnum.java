package cn.iocoder.yudao.module.stock.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StockAlertRuleTypeEnum {

    MARKET_SIGNAL("MARKET_SIGNAL"),
    VOLUME_PRICE("VOLUME_PRICE"),
    T_BUY("T_BUY"),
    T_SELL("T_SELL"),
    PRICE_REACH("PRICE_REACH"),
    KLINE_PATTERN("KLINE_PATTERN");

    private final String code;
}
