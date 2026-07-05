package cn.iocoder.yudao.module.stock.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StockCollectLevelEnum {

    NORMAL("NORMAL", 15),
    KEY("KEY", 5),
    CORE("CORE", 1);

    private final String code;
    private final Integer defaultIntervalMinutes;
}
