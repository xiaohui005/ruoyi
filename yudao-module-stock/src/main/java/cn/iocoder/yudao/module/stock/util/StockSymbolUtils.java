package cn.iocoder.yudao.module.stock.util;

import cn.hutool.core.util.StrUtil;

public class StockSymbolUtils {

    private StockSymbolUtils() {
    }

    public static String normalize(String symbol) {
        if (StrUtil.isBlank(symbol)) {
            return symbol;
        }
        String value = StrUtil.trim(symbol).toUpperCase();
        if (value.contains(".")) {
            return value;
        }
        if (value.startsWith("6")) {
            return value + ".SH";
        }
        if (value.startsWith("0") || value.startsWith("3")) {
            return value + ".SZ";
        }
        if (value.startsWith("8") || value.startsWith("4")) {
            return value + ".BJ";
        }
        return value;
    }

    public static String display(String symbol) {
        if (StrUtil.isBlank(symbol)) {
            return symbol;
        }
        return StrUtil.subBefore(symbol, ".", false);
    }
}
