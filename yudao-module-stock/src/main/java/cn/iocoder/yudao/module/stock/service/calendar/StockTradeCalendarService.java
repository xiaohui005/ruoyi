package cn.iocoder.yudao.module.stock.service.calendar;

import java.time.LocalDate;
import java.time.LocalDateTime;

public interface StockTradeCalendarService {

    boolean isTradeDay(LocalDate date);

    boolean canCollectNow(LocalDateTime dateTime);
}
