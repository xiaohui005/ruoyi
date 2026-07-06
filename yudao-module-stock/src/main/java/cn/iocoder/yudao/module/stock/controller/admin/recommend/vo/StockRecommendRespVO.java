package cn.iocoder.yudao.module.stock.controller.admin.recommend.vo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class StockRecommendRespVO {

    private Long analysisRecordId;
    private Long watchlistId;
    private String symbol;
    private String stockName;
    private String watchlistName;
    private String adviceAction;
    private String riskLevel;
    private String marketSignalName;
    private String volumePriceAdvice;
    private String reasonText;
    private BigDecimal currentPrice;
    private BigDecimal changePercent;
    private BigDecimal supportPrice;
    private BigDecimal resistancePrice;
    private BigDecimal buyLowPrice;
    private BigDecimal buyHighPrice;
    private BigDecimal sellLowPrice;
    private BigDecimal sellHighPrice;
    private String invalidCondition;
    private LocalDateTime analyzeTime;
}
