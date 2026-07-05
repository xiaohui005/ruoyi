package cn.iocoder.yudao.module.stock.service.calendar;

import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.LocalTime;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class StockTradeCalendarServiceImplTest {

    private final StockTradeCalendarServiceImpl service = new StockTradeCalendarServiceImpl();

    @Test
    void isInTradingSessionShouldMatchChinaAStockTradingHours() {
        assertFalse(service.isInTradingSession(LocalTime.of(9, 29)));
        assertTrue(service.isInTradingSession(LocalTime.of(9, 30)));
        assertTrue(service.isInTradingSession(LocalTime.of(11, 30)));
        assertFalse(service.isInTradingSession(LocalTime.of(11, 31)));
        assertFalse(service.isInTradingSession(LocalTime.of(12, 30)));
        assertTrue(service.isInTradingSession(LocalTime.of(13, 0)));
        assertTrue(service.isInTradingSession(LocalTime.of(15, 0)));
        assertFalse(service.isInTradingSession(LocalTime.of(15, 1)));
    }

    @Test
    void parseLatestTradeDateShouldReadTencentQuoteTimestamp() {
        String quote = "v_sh000001=\"1~上证指数~000001~4043.64~4028.90~4031.34~602009738~0~0~0.00~0~0.00~0~0.00~0~0.00"
                + "~0~0.00~0~0.00~0~0.00~0~0.00~0~0.00~0~0.00~0~~20260703161418~14.74~0.37\";";

        LocalDate tradeDate = service.parseLatestTradeDate(quote);

        assertEquals(LocalDate.of(2026, 7, 3), tradeDate);
    }
}
