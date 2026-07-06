package cn.iocoder.yudao.module.stock.controller.admin.advice.vo;

import io.swagger.v3.oas.annotations.media.Schema;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Schema(description = "Admin - Stock advice tracking response")
public class StockAdviceTrackingRespVO {

    private Long id;
    private Long watchlistId;
    private Long analysisRecordId;
    private String symbol;
    private String stockName;
    private String adviceType;
    private String status;
    private LocalDateTime adviceTime;
    private BigDecimal latestPriceAtAdvice;
    private BigDecimal supportPrice;
    private BigDecimal resistancePrice;
    private BigDecimal buyLowPrice;
    private BigDecimal buyHighPrice;
    private BigDecimal sellLowPrice;
    private BigDecimal sellHighPrice;
    private BigDecimal positionRatio;
    private String invalidCondition;
    private String riskLevel;
    private Integer expectedDays;
    private LocalDateTime buyTriggerTime;
    private LocalDateTime sellTriggerTime;
    private LocalDateTime invalidateTime;
    private LocalDateTime expireTime;
    private String closeReason;
    private BigDecimal estimatedProfitRate;
    private BigDecimal actualProfitRate;
    private String resultSummary;
    private LocalDateTime createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getWatchlistId() {
        return watchlistId;
    }

    public void setWatchlistId(Long watchlistId) {
        this.watchlistId = watchlistId;
    }

    public Long getAnalysisRecordId() {
        return analysisRecordId;
    }

    public void setAnalysisRecordId(Long analysisRecordId) {
        this.analysisRecordId = analysisRecordId;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public String getAdviceType() {
        return adviceType;
    }

    public void setAdviceType(String adviceType) {
        this.adviceType = adviceType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getAdviceTime() {
        return adviceTime;
    }

    public void setAdviceTime(LocalDateTime adviceTime) {
        this.adviceTime = adviceTime;
    }

    public BigDecimal getLatestPriceAtAdvice() {
        return latestPriceAtAdvice;
    }

    public void setLatestPriceAtAdvice(BigDecimal latestPriceAtAdvice) {
        this.latestPriceAtAdvice = latestPriceAtAdvice;
    }

    public BigDecimal getSupportPrice() {
        return supportPrice;
    }

    public void setSupportPrice(BigDecimal supportPrice) {
        this.supportPrice = supportPrice;
    }

    public BigDecimal getResistancePrice() {
        return resistancePrice;
    }

    public void setResistancePrice(BigDecimal resistancePrice) {
        this.resistancePrice = resistancePrice;
    }

    public BigDecimal getBuyLowPrice() {
        return buyLowPrice;
    }

    public void setBuyLowPrice(BigDecimal buyLowPrice) {
        this.buyLowPrice = buyLowPrice;
    }

    public BigDecimal getBuyHighPrice() {
        return buyHighPrice;
    }

    public void setBuyHighPrice(BigDecimal buyHighPrice) {
        this.buyHighPrice = buyHighPrice;
    }

    public BigDecimal getSellLowPrice() {
        return sellLowPrice;
    }

    public void setSellLowPrice(BigDecimal sellLowPrice) {
        this.sellLowPrice = sellLowPrice;
    }

    public BigDecimal getSellHighPrice() {
        return sellHighPrice;
    }

    public void setSellHighPrice(BigDecimal sellHighPrice) {
        this.sellHighPrice = sellHighPrice;
    }

    public BigDecimal getPositionRatio() {
        return positionRatio;
    }

    public void setPositionRatio(BigDecimal positionRatio) {
        this.positionRatio = positionRatio;
    }

    public String getInvalidCondition() {
        return invalidCondition;
    }

    public void setInvalidCondition(String invalidCondition) {
        this.invalidCondition = invalidCondition;
    }

    public String getRiskLevel() {
        return riskLevel;
    }

    public void setRiskLevel(String riskLevel) {
        this.riskLevel = riskLevel;
    }

    public Integer getExpectedDays() {
        return expectedDays;
    }

    public void setExpectedDays(Integer expectedDays) {
        this.expectedDays = expectedDays;
    }

    public LocalDateTime getBuyTriggerTime() {
        return buyTriggerTime;
    }

    public void setBuyTriggerTime(LocalDateTime buyTriggerTime) {
        this.buyTriggerTime = buyTriggerTime;
    }

    public LocalDateTime getSellTriggerTime() {
        return sellTriggerTime;
    }

    public void setSellTriggerTime(LocalDateTime sellTriggerTime) {
        this.sellTriggerTime = sellTriggerTime;
    }

    public LocalDateTime getInvalidateTime() {
        return invalidateTime;
    }

    public void setInvalidateTime(LocalDateTime invalidateTime) {
        this.invalidateTime = invalidateTime;
    }

    public LocalDateTime getExpireTime() {
        return expireTime;
    }

    public void setExpireTime(LocalDateTime expireTime) {
        this.expireTime = expireTime;
    }

    public String getCloseReason() {
        return closeReason;
    }

    public void setCloseReason(String closeReason) {
        this.closeReason = closeReason;
    }

    public BigDecimal getEstimatedProfitRate() {
        return estimatedProfitRate;
    }

    public void setEstimatedProfitRate(BigDecimal estimatedProfitRate) {
        this.estimatedProfitRate = estimatedProfitRate;
    }

    public BigDecimal getActualProfitRate() {
        return actualProfitRate;
    }

    public void setActualProfitRate(BigDecimal actualProfitRate) {
        this.actualProfitRate = actualProfitRate;
    }

    public String getResultSummary() {
        return resultSummary;
    }

    public void setResultSummary(String resultSummary) {
        this.resultSummary = resultSummary;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
}
