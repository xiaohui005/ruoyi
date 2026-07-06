package cn.iocoder.yudao.module.stock.enums;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public final class StockAdviceTrackingStatusEnum {

    public static final String PENDING = "PENDING";
    public static final String BUY_TRIGGERED = "BUY_TRIGGERED";
    public static final String COMPLETED = "COMPLETED";
    public static final String INVALIDATED = "INVALIDATED";
    public static final String EXPIRED = "EXPIRED";
    public static final String MANUAL_CLOSED = "MANUAL_CLOSED";

    private static final Set<String> ACTIVE_STATUSES = new HashSet<>(Arrays.asList(
            PENDING, BUY_TRIGGERED
    ));

    private static final Set<String> FINISHED_STATUSES = new HashSet<>(Arrays.asList(
            COMPLETED, INVALIDATED, EXPIRED, MANUAL_CLOSED
    ));

    private StockAdviceTrackingStatusEnum() {
    }

    public static boolean isActive(String status) {
        return ACTIVE_STATUSES.contains(status);
    }

    public static boolean isFinished(String status) {
        return FINISHED_STATUSES.contains(status);
    }

    public static Set<String> activeStatuses() {
        return ACTIVE_STATUSES;
    }

}
