package cn.iocoder.yudao.module.stock.service.analyzer.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
public class StockAnalyzeResultDTO {

    private Long analysisRecordId;
    private String symbol;
    private String stockName;
    private BigDecimal latestPrice;
    private String marketSignalCode;
    private String marketSignalName;
    private Boolean tradable;
    private String riskLevel;
    private String volumePriceType;
    private String pricePosition;
    private String volumePriceAdvice;
    private String adviceAction;
    private String reasonText;
    private Boolean tStrategySuitable;
    private BigDecimal supportPrice;
    private BigDecimal resistancePrice;
    private BigDecimal buyLowPrice;
    private BigDecimal buyHighPrice;
    private BigDecimal sellLowPrice;
    private BigDecimal sellHighPrice;
    private BigDecimal positionRatio;
    private String invalidCondition;
    private LocalDateTime analyzeTime;
    private List<StockKlinePatternDTO> klinePatterns = new ArrayList<>();
    private List<String> reasoningSteps = new ArrayList<>();
}
