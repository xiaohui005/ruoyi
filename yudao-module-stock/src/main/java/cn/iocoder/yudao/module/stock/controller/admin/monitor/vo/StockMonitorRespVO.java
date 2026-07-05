package cn.iocoder.yudao.module.stock.controller.admin.monitor.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class StockMonitorRespVO {

    private String symbol;
    private String stockName;
    private BigDecimal latestPrice;
    private String marketSignalName;
    private String volumePriceType;
    private String adviceAction;
    private Boolean tStrategySuitable;
    private BigDecimal supportPrice;
    private BigDecimal resistancePrice;
    private List<KLineItem> klineList;
    private List<MarkLine> markLines;
    private List<MarkPoint> markPoints;
    private List<NewsItem> newsList;
    private LocalDateTime analyzeTime;

    @Data
    public static class KLineItem {
        private LocalDate tradeDate;
        private BigDecimal openPrice;
        private BigDecimal closePrice;
        private BigDecimal lowPrice;
        private BigDecimal highPrice;
        private BigDecimal volume;
    }

    @Data
    public static class MarkLine {
        private String name;
        private BigDecimal value;
    }

    @Data
    public static class MarkPoint {
        private String name;
        private LocalDate tradeDate;
        private BigDecimal value;
    }

    @Data
    public static class NewsItem {
        private String title;
        private String content;
        private String sourceName;
        private String publishTime;
        private String newsUrl;
        private String sentimentCode;
        private BigDecimal relatedChangePct;
    }
}
