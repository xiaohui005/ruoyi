package cn.iocoder.yudao.module.stock.service.calendar;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSnapshotDO;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockMarketSnapshotMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
@Slf4j
public class StockTradeCalendarServiceImpl implements StockTradeCalendarService {

    static final String SH_INDEX_QUOTE_URL = "https://qt.gtimg.cn/q=sh000001";
    static final int QUOTE_TIMESTAMP_INDEX = 30;
    static final DateTimeFormatter QUOTE_DATE_FORMAT = DateTimeFormatter.BASIC_ISO_DATE;
    static final LocalTime MORNING_START = LocalTime.of(9, 30);
    static final LocalTime MORNING_END = LocalTime.of(11, 30);
    static final LocalTime AFTERNOON_START = LocalTime.of(13, 0);
    static final LocalTime AFTERNOON_END = LocalTime.of(15, 0);

    @Resource
    private RestTemplate restTemplate;
    @Resource
    private StockMarketSnapshotMapper stockMarketSnapshotMapper;

    private final Map<LocalDate, Boolean> tradeDayCache = new ConcurrentHashMap<>();

    @Override
    public boolean isTradeDay(LocalDate date) {
        if (date == null) {
            return false;
        }
        if (isWeekend(date)) {
            return false;
        }
        LocalDate today = LocalDate.now();
        if (date.isBefore(today)) {
            return hasCollectedSnapshot(date);
        }
        if (date.isAfter(today)) {
            return false;
        }
        tradeDayCache.keySet().removeIf(cachedDate -> !cachedDate.equals(today));
        return tradeDayCache.computeIfAbsent(date, this::resolveCurrentTradeDay);
    }

    @Override
    public boolean canCollectNow(LocalDateTime dateTime) {
        if (dateTime == null) {
            return false;
        }
        return isTradeDay(dateTime.toLocalDate()) && isInTradingSession(dateTime.toLocalTime());
    }

    boolean isInTradingSession(LocalTime time) {
        if (time == null) {
            return false;
        }
        boolean inMorning = !time.isBefore(MORNING_START) && !time.isAfter(MORNING_END);
        boolean inAfternoon = !time.isBefore(AFTERNOON_START) && !time.isAfter(AFTERNOON_END);
        return inMorning || inAfternoon;
    }

    LocalDate parseLatestTradeDate(String quoteResponse) {
        if (StrUtil.isBlank(quoteResponse)) {
            return null;
        }
        int firstQuote = quoteResponse.indexOf('"');
        int lastQuote = quoteResponse.lastIndexOf('"');
        if (firstQuote < 0 || lastQuote <= firstQuote) {
            return null;
        }
        String payload = quoteResponse.substring(firstQuote + 1, lastQuote);
        String[] parts = payload.split("~", -1);
        if (parts.length <= QUOTE_TIMESTAMP_INDEX) {
            return null;
        }
        String timestamp = StrUtil.trim(parts[QUOTE_TIMESTAMP_INDEX]);
        if (timestamp.length() < 8) {
            return null;
        }
        return LocalDate.parse(timestamp.substring(0, 8), QUOTE_DATE_FORMAT);
    }

    private boolean resolveCurrentTradeDay(LocalDate date) {
        if (hasCollectedSnapshot(date)) {
            return true;
        }
        try {
            String response = restTemplate.getForObject(SH_INDEX_QUOTE_URL, String.class);
            LocalDate latestTradeDate = parseLatestTradeDate(response);
            if (latestTradeDate == null) {
                log.warn("[resolveCurrentTradeDay][cannot parse latest trade date from quote response]");
                return true;
            }
            return date.equals(latestTradeDate);
        } catch (Exception ex) {
            log.warn("[resolveCurrentTradeDay][failed to query latest trade date]", ex);
            return true;
        }
    }

    private boolean hasCollectedSnapshot(LocalDate date) {
        StockMarketSnapshotDO snapshot = stockMarketSnapshotMapper.selectLatestByTradeDate(date);
        return snapshot != null;
    }

    private boolean isWeekend(LocalDate date) {
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        return dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY;
    }
}
