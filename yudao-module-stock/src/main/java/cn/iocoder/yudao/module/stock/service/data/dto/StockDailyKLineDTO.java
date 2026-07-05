package cn.iocoder.yudao.module.stock.service.data.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class StockDailyKLineDTO {

    private String symbol;
    private LocalDate tradeDate;
    private BigDecimal openPrice;
    private BigDecimal highPrice;
    private BigDecimal lowPrice;
    private BigDecimal closePrice;
    private BigDecimal preClosePrice;
    private BigDecimal changePct;
    private BigDecimal volume;
    private BigDecimal turnoverAmount;
    private String sourceName;
}
