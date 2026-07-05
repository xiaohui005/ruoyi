package cn.iocoder.yudao.module.stock.service.news.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class StockNewsItemDTO {

    private String symbol;
    private String title;
    private String content;
    private String sourceName;
    private String publishTime;
    private String newsUrl;
    private String sentimentCode;
    private BigDecimal relatedChangePct;
}
