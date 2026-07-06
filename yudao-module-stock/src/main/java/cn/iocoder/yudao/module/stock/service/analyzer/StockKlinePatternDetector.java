package cn.iocoder.yudao.module.stock.service.analyzer;

import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public final class StockKlinePatternDetector {

    private static final String BULLISH = "BULLISH";
    private static final String BEARISH = "BEARISH";
    private static final String FIVE_ONE_THREE = "FIVE_ONE_THREE";

    private static final int FIVE_ONE_THREE_WINDOW = 9;
    private static final double FIVE_ONE_THREE_SMALL_BODY_RATIO = 0.025D;
    private static final double FIVE_ONE_THREE_VOLUME_SPIKE_RATIO = 1.8D;
    private static final double FIVE_ONE_THREE_LIMIT_UP_TOUCH_RATIO = 1.095D;
    private static final double FIVE_ONE_THREE_LIMIT_UP_BREAK_RATIO = 0.995D;
    private static final double FIVE_ONE_THREE_CONTROL_HIGH_RATIO = 0.98D;
    private static final double FIVE_ONE_THREE_CONTROL_LOW_RATIO = 0.97D;
    private static final double FIVE_ONE_THREE_CONTROL_BODY_RATIO = 0.03D;

    private StockKlinePatternDetector() {
    }

    public static List<StockKlinePatternDTO> detect(List<StockKlineDailyDO> klines) {
        List<StockKlinePatternDTO> patterns = new ArrayList<>();
        if (klines == null || klines.size() < 3) {
            return patterns;
        }
        if (matchXianRenZhiLu(klines)) {
            patterns.add(build("XIAN_REN_ZHI_LU", "\u4ed9\u4eba\u6307\u8def", BULLISH, "\u5229\u591a",
                    "\u4e0a\u5347\u521d\u671f\u51fa\u73b0\u957f\u4e0a\u5f71\u8bd5\u76d8\uff0c\u8bf4\u660e\u4e3b\u529b\u5728\u6d4b\u8bd5\u4e0a\u65b9\u629b\u538b\u3002",
                    "\u6b21\u65e5\u653e\u91cf\u7ad9\u4e0a\u4e0a\u5f71\u7ebf\u534a\u5206\u4f4d\u53ef\u8ddf\u8e2a\uff0c\u82e5\u8f6c\u5f31\u6536\u9634\u5148\u89c2\u671b\u3002"));
        }
        if (matchXiShangMeiShao(klines)) {
            patterns.add(build("XI_SHANG_MEI_SHAO", "\u559c\u4e0a\u7709\u68a2", BULLISH, "\u5229\u591a",
                    "\u6da8\u505c\u540e 2 \u5230 4 \u65e5\u7a84\u5e45\u6574\u7406\u4e14\u91cf\u80fd\u9012\u589e\uff0c\u5c5e\u4e8e\u5f3a\u52bf\u84c4\u52bf\u3002",
                    "\u91cf\u80fd\u7ee7\u7eed\u653e\u5927\u53ef\u5173\u6ce8\uff0c\u82e5\u91cf\u7f29\u660e\u663e\u9700\u9632\u8bf1\u591a\u3002"));
        }
        if (matchFiveOneThree(klines)) {
            patterns.add(build(FIVE_ONE_THREE, "513\u8fde\u677f\u542f\u52a8", BULLISH, "\u5229\u591a",
                    "\u524d 5 \u65e5\u8fde\u7eed\u5c0f\u9633\u63d0\u5347\uff0c\u7b2c 6 \u65e5\u91cf\u80fd\u7a81\u653e\u5e76\u521d\u89e6\u6da8\u505c\u540e\u56de\u843d\uff0c\u4e4b\u540e 3 \u65e5\u63a7\u5236\u7a33\u5b9a\uff0c\u5c5e\u4e8e\u8fde\u677f\u542f\u52a8\u4fe1\u53f7\u3002",
                    "\u5148\u7b49\u63a7\u5236\u533a\u57df\u7a33\u5b9a\u518d\u8ffd\u8e2a\uff0c\u4e0d\u5728\u7b2c 6 \u65e5\u91cf\u80fd\u5931\u63a7\u540e\u8ffd\u9ad8\u3002"));
        }
        if (matchShuangChuiDaZhuang(klines)) {
            patterns.add(build("SHUANG_CHUI_DA_ZHUANG", "\u53cc\u9524\u6253\u6869", BULLISH, "\u5229\u591a",
                    "\u4e0b\u8dcc\u672b\u7aef\u53cc\u9524\u5b50\u7ebf\u4f9d\u6b21\u62ac\u9ad8\uff0c\u8bf4\u660e\u4e0b\u65b9\u627f\u63a5\u5728\u589e\u5f3a\u3002",
                    "\u653e\u91cf\u7a81\u7834\u53cc\u9524\u5171\u540c\u9ad8\u70b9\u53ef\u8003\u8651\u4ecb\u5165\uff0c\u6b62\u635f\u53c2\u8003\u53cc\u9524\u6700\u4f4e\u70b9\u3002"));
        }
        if (matchXiangShangCaiSanXia(klines)) {
            patterns.add(build("XIANG_SHANG_CAI_SAN_XIA", "\u5411\u4e0a\u8e29\u4e09\u4e0b", BULLISH, "\u5229\u591a",
                    "\u5927\u9633\u540e\u7f29\u91cf\u6574\u7406\uff0c\u518d\u653e\u91cf\u7a81\u7834\uff0c\u5c5e\u4e8e\u4e0a\u6da8\u4e2d\u7ee7\u3002",
                    "\u7a81\u7834\u9633\u7ebf\u51fa\u73b0\u65f6\u53ef\u8ddf\u8e2a\uff0c\u4e2d\u95f4\u82e5\u653e\u91cf\u5931\u63a7\u5219\u4fdd\u6301\u8c28\u614e\u3002"));
        }
        if (matchChangDuanYinYangTui(klines)) {
            patterns.add(build("CHANG_DUAN_YIN_YANG_TUI", "\u957f\u77ed\u9634\u9633\u817f", BEARISH, "\u5229\u7a7a",
                    "\u9ad8\u4f4d\u957f\u4e0a\u5f71\u9634\u7ebf\u51b2\u9ad8\u56de\u843d\uff0c\u8bf4\u660e\u4e0a\u65b9\u629b\u538b\u5f88\u91cd\u3002",
                    "\u82e5\u6b21\u65e5\u7ee7\u7eed\u8d70\u5f31\u5b9c\u51cf\u4ed3\uff0c\u907f\u514d\u56de\u64a4\u6269\u5927\u3002"));
        }
        if (matchSiShenSanBuQu(klines)) {
            patterns.add(build("SI_SHEN_SAN_BU_QU", "\u6b7b\u795e\u4e09\u90e8\u66f2", BEARISH, "\u5229\u7a7a",
                    "\u5927\u9633\u540e\u63a5\u5341\u5b57\u6216\u5c0f\u9634\uff0c\u518d\u7528\u5927\u9634\u56de\u5410\u6da8\u5e45\uff0c\u591a\u5934\u52a8\u80fd\u8870\u7aed\u3002",
                    "\u7b2c\u4e09\u6839\u5927\u9634\u786e\u8ba4\u540e\u4f18\u5148\u6b62\u76c8\u79bb\u573a\uff0c\u4e0d\u518d\u8ffd\u9ad8\u3002"));
        }
        return patterns;
    }

    private static StockKlinePatternDTO build(String code, String name, String signalType, String signalLabel,
                                              String description, String tradeAdvice) {
        return new StockKlinePatternDTO(code, name, signalType, signalLabel, description, tradeAdvice);
    }

    private static boolean matchXianRenZhiLu(List<StockKlineDailyDO> klines) {
        StockKlineDailyDO latest = last(klines, 1);
        if (latest == null || latest.getHighPrice() == null || latest.getLowPrice() == null
                || latest.getOpenPrice() == null || latest.getClosePrice() == null) {
            return false;
        }
        double body = body(latest);
        double upper = upperShadow(latest);
        double lower = lowerShadow(latest);
        double avgBody = averageBody(klines, 5);
        double latestHigh = value(latest.getHighPrice());
        double recentHigh = maxHigh(klines, 20, 2);
        return upper >= Math.max(body * 2, avgBody * 1.5)
                && lower <= Math.max(body, latestHigh * 0.01)
                && body <= avgBody * 1.2
                && latestHigh >= recentHigh * 0.97;
    }

    private static boolean matchXiShangMeiShao(List<StockKlineDailyDO> klines) {
        if (klines.size() < 4) {
            return false;
        }
        for (int consolidationDays = 2; consolidationDays <= 4; consolidationDays++) {
            int total = consolidationDays + 1;
            if (klines.size() < total) {
                continue;
            }
            int start = klines.size() - total;
            StockKlineDailyDO limitUp = klines.get(start);
            if (changePct(limitUp) < 9.5 || !isBullish(limitUp)) {
                continue;
            }
            boolean allInside = true;
            boolean volumeGrowing = true;
            double prevVolume = value(limitUp.getVolume());
            double limitHigh = value(limitUp.getHighPrice());
            double limitLow = value(limitUp.getLowPrice());
            for (int i = start + 1; i < klines.size(); i++) {
                StockKlineDailyDO item = klines.get(i);
                double high = value(item.getHighPrice());
                double low = value(item.getLowPrice());
                if (high > limitHigh * 1.01 || low < limitLow * 0.99 || Math.abs(changePct(item)) > 4.0) {
                    allInside = false;
                    break;
                }
                double currentVolume = value(item.getVolume());
                if (currentVolume + 1e-6 < prevVolume * 0.95) {
                    volumeGrowing = false;
                }
                prevVolume = currentVolume;
            }
            if (allInside && volumeGrowing) {
                return true;
            }
        }
        return false;
    }

    private static boolean matchFiveOneThree(List<StockKlineDailyDO> klines) {
        if (klines.size() < FIVE_ONE_THREE_WINDOW) {
            return false;
        }
        int start = klines.size() - FIVE_ONE_THREE_WINDOW;
        for (int i = start; i < start + 5; i++) {
            StockKlineDailyDO item = klines.get(i);
            if (item == null || item.getOpenPrice() == null || item.getClosePrice() == null
                    || item.getHighPrice() == null || item.getLowPrice() == null || item.getVolume() == null
                    || !isSmallBullish(item)) {
                return false;
            }
            if (i > start && value(item.getClosePrice()) < value(klines.get(i - 1).getClosePrice())) {
                return false;
            }
        }
        StockKlineDailyDO breakout = klines.get(start + 5);
        if (breakout == null || breakout.getOpenPrice() == null || breakout.getClosePrice() == null
                || breakout.getHighPrice() == null || breakout.getLowPrice() == null || breakout.getVolume() == null) {
            return false;
        }
        double priorVolumeAvg = 0D;
        for (int i = start; i < start + 5; i++) {
            priorVolumeAvg += value(klines.get(i).getVolume());
        }
        priorVolumeAvg = priorVolumeAvg / 5D;
        if (!isBullish(breakout) || !isLimitUpTouchThenBreak(breakout, klines.get(start + 4))) {
            return false;
        }
        if (value(breakout.getVolume()) < priorVolumeAvg * FIVE_ONE_THREE_VOLUME_SPIKE_RATIO) {
            return false;
        }
        double breakoutHigh = value(breakout.getHighPrice());
        double breakoutLow = value(breakout.getLowPrice());
        double breakoutVolume = value(breakout.getVolume());
        for (int i = start + 6; i < start + 9; i++) {
            StockKlineDailyDO item = klines.get(i);
            if (item == null || item.getHighPrice() == null || item.getLowPrice() == null
                    || item.getOpenPrice() == null || item.getClosePrice() == null) {
                return false;
            }
            if (value(item.getOpenPrice()) < value(breakout.getOpenPrice())) {
                return false;
            }
            if (body(item) > value(item.getClosePrice()) * FIVE_ONE_THREE_CONTROL_BODY_RATIO) {
                return false;
            }
            double lowPrice = value(item.getLowPrice());
            if (lowPrice <= 0D) {
                return false;
            }
            double amplitude = (value(item.getHighPrice()) - lowPrice) / lowPrice;
            if (amplitude > 0.05D) {
                return false;
            }
            if (value(item.getHighPrice()) > breakoutHigh * FIVE_ONE_THREE_CONTROL_HIGH_RATIO) {
                return false;
            }
            if (value(item.getLowPrice()) < breakoutLow * FIVE_ONE_THREE_CONTROL_LOW_RATIO) {
                return false;
            }
            if (value(item.getVolume()) > breakoutVolume) {
                return false;
            }
        }
        return true;
    }

    private static boolean matchShuangChuiDaZhuang(List<StockKlineDailyDO> klines) {
        if (klines.size() < 5) {
            return false;
        }
        StockKlineDailyDO first = last(klines, 2);
        StockKlineDailyDO second = last(klines, 1);
        StockKlineDailyDO before = last(klines, 5);
        StockKlineDailyDO prior = last(klines, 3);
        if (!isHammer(first) || !isHammer(second) || before == null || prior == null) {
            return false;
        }
        return value(second.getLowPrice()) > value(first.getLowPrice())
                && value(second.getClosePrice()) > value(first.getClosePrice())
                && value(prior.getClosePrice()) < value(before.getClosePrice());
    }

    private static boolean matchXiangShangCaiSanXia(List<StockKlineDailyDO> klines) {
        if (klines.size() < 4) {
            return false;
        }
        for (int middleCount = 2; middleCount <= 4; middleCount++) {
            int total = middleCount + 2;
            if (klines.size() < total) {
                continue;
            }
            int start = klines.size() - total;
            StockKlineDailyDO first = klines.get(start);
            StockKlineDailyDO last = klines.get(klines.size() - 1);
            if (!isLargeBullish(first) || !isLargeBullish(last)) {
                continue;
            }
            double rangeHigh = value(first.getHighPrice());
            double rangeLow = value(first.getLowPrice());
            double middleVolume = 0D;
            boolean valid = true;
            for (int i = start + 1; i < klines.size() - 1; i++) {
                StockKlineDailyDO item = klines.get(i);
                if (body(item) > body(first) * 0.6) {
                    valid = false;
                    break;
                }
                if (value(item.getHighPrice()) > rangeHigh * 1.01 || value(item.getLowPrice()) < rangeLow * 0.99) {
                    valid = false;
                    break;
                }
                middleVolume += value(item.getVolume());
            }
            if (!valid) {
                continue;
            }
            double middleAvgVolume = middleVolume / middleCount;
            if (value(last.getClosePrice()) <= rangeHigh
                    || value(last.getVolume()) <= middleAvgVolume
                    || middleAvgVolume > value(first.getVolume())) {
                continue;
            }
            return true;
        }
        return false;
    }

    private static boolean matchChangDuanYinYangTui(List<StockKlineDailyDO> klines) {
        StockKlineDailyDO latest = last(klines, 1);
        if (latest == null) {
            return false;
        }
        double body = body(latest);
        double upper = upperShadow(latest);
        double avgBody = averageBody(klines, 5);
        double recentHigh = maxHigh(klines, 20, 2);
        return !isBullish(latest)
                && upper >= Math.max(body * 2, avgBody * 1.5)
                && value(latest.getHighPrice()) >= recentHigh * 0.98;
    }

    private static boolean matchSiShenSanBuQu(List<StockKlineDailyDO> klines) {
        if (klines.size() < 3) {
            return false;
        }
        StockKlineDailyDO first = last(klines, 3);
        StockKlineDailyDO second = last(klines, 2);
        StockKlineDailyDO third = last(klines, 1);
        if (first == null || second == null || third == null) {
            return false;
        }
        double recentHigh = maxHigh(klines, 20, 4);
        double firstMid = (value(first.getOpenPrice()) + value(first.getClosePrice())) / 2D;
        return isLargeBullish(first)
                && isSmallBody(second)
                && !isBullish(third)
                && body(third) >= averageBody(klines, 5)
                && value(third.getClosePrice()) <= firstMid
                && value(first.getHighPrice()) >= recentHigh * 0.98;
    }

    private static StockKlineDailyDO last(List<StockKlineDailyDO> klines, int offset) {
        int index = klines.size() - offset;
        return index >= 0 && index < klines.size() ? klines.get(index) : null;
    }

    private static boolean isHammer(StockKlineDailyDO item) {
        double body = body(item);
        double lower = lowerShadow(item);
        double upper = upperShadow(item);
        return lower >= body * 2 && upper <= Math.max(body, value(item.getClosePrice()) * 0.01);
    }

    private static boolean isLargeBullish(StockKlineDailyDO item) {
        return isBullish(item) && body(item) >= value(item.getClosePrice()) * 0.02;
    }

    private static boolean isSmallBullish(StockKlineDailyDO item) {
        return isBullish(item) && body(item) <= value(item.getClosePrice()) * FIVE_ONE_THREE_SMALL_BODY_RATIO;
    }

    private static boolean isLimitUpTouchThenBreak(StockKlineDailyDO item, StockKlineDailyDO prev) {
        if (item == null || prev == null) {
            return false;
        }
        double prevClose = value(prev.getClosePrice());
        if (prevClose <= 0D) {
            return false;
        }
        double limitUpPrice = prevClose * FIVE_ONE_THREE_LIMIT_UP_TOUCH_RATIO;
        return value(item.getHighPrice()) >= limitUpPrice
                && value(item.getClosePrice()) < value(item.getHighPrice()) * FIVE_ONE_THREE_LIMIT_UP_BREAK_RATIO;
    }

    private static boolean isSmallBody(StockKlineDailyDO item) {
        return body(item) <= value(item.getClosePrice()) * 0.015;
    }

    private static boolean isBullish(StockKlineDailyDO item) {
        return value(item.getClosePrice()) >= value(item.getOpenPrice());
    }

    private static double body(StockKlineDailyDO item) {
        return Math.abs(value(item.getClosePrice()) - value(item.getOpenPrice()));
    }

    private static double upperShadow(StockKlineDailyDO item) {
        return value(item.getHighPrice()) - Math.max(value(item.getOpenPrice()), value(item.getClosePrice()));
    }

    private static double lowerShadow(StockKlineDailyDO item) {
        return Math.min(value(item.getOpenPrice()), value(item.getClosePrice())) - value(item.getLowPrice());
    }

    private static double averageBody(List<StockKlineDailyDO> klines, int count) {
        int start = Math.max(0, klines.size() - count);
        double total = 0D;
        int size = 0;
        for (int i = start; i < klines.size(); i++) {
            total += body(klines.get(i));
            size++;
        }
        return size == 0 ? 0D : total / size;
    }

    private static double maxHigh(List<StockKlineDailyDO> klines, int count, int excludeTailCount) {
        int end = Math.max(0, klines.size() - excludeTailCount);
        int start = Math.max(0, end - count);
        double max = 0D;
        for (int i = start; i < end; i++) {
            max = Math.max(max, value(klines.get(i).getHighPrice()));
        }
        return max;
    }

    private static double changePct(StockKlineDailyDO item) {
        if (item == null) {
            return 0D;
        }
        if (item.getChangePct() != null) {
            return value(item.getChangePct());
        }
        double preClose = value(item.getPreClosePrice());
        double close = value(item.getClosePrice());
        if (preClose <= 0D) {
            return 0D;
        }
        return (close - preClose) * 100D / preClose;
    }

    private static double value(BigDecimal value) {
        return value == null ? 0D : value.doubleValue();
    }
}
