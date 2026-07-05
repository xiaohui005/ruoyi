package cn.iocoder.yudao.module.stock.controller.admin.journal.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class StockTradeJournalRespVO {

    private Long id;
    private String symbol;
    private String stockName;
    private BigDecimal buyPrice;
    private BigDecimal sellPrice;
    private BigDecimal positionRatio;
    private BigDecimal profitRate;
    private String systemAdvice;
    private String remark;
    private LocalDateTime tradeTime;
}
