package cn.iocoder.yudao.module.stock.enums;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public final class StockAdviceTypeEnum {

    public static final String BUY = "BUY";
    public static final String T_STRATEGY = "T_STRATEGY";

    private static final Set<String> TRACKABLE_TYPES = new HashSet<>(Arrays.asList(BUY, T_STRATEGY));

    private StockAdviceTypeEnum() {
    }

    public static boolean isTrackable(String adviceType) {
        return TRACKABLE_TYPES.contains(adviceType);
    }

}
