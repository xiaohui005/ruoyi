package cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo;

import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockKlinePatternDTO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Schema(description = "管理后台 - 股票分析结果")
@Data
public class StockAnalyzeRespVO {

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
    private List<StockKlinePatternDTO> klinePatterns;
    private List<String> reasoningSteps;
}
