package cn.iocoder.yudao.module.stock.controller.admin.advice.vo;

import io.swagger.v3.oas.annotations.media.Schema;

import java.math.BigDecimal;

@Schema(description = "Admin - Stock advice tracking summary response")
public class StockAdviceTrackingSummaryRespVO {

    private Long totalCount;
    private Long activeCount;
    private Long completedCount;
    private Long invalidatedCount;
    private Long expiredCount;
    private BigDecimal successRate;
    private BigDecimal invalidRate;

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public Long getActiveCount() {
        return activeCount;
    }

    public void setActiveCount(Long activeCount) {
        this.activeCount = activeCount;
    }

    public Long getCompletedCount() {
        return completedCount;
    }

    public void setCompletedCount(Long completedCount) {
        this.completedCount = completedCount;
    }

    public Long getInvalidatedCount() {
        return invalidatedCount;
    }

    public void setInvalidatedCount(Long invalidatedCount) {
        this.invalidatedCount = invalidatedCount;
    }

    public Long getExpiredCount() {
        return expiredCount;
    }

    public void setExpiredCount(Long expiredCount) {
        this.expiredCount = expiredCount;
    }

    public BigDecimal getSuccessRate() {
        return successRate;
    }

    public void setSuccessRate(BigDecimal successRate) {
        this.successRate = successRate;
    }

    public BigDecimal getInvalidRate() {
        return invalidRate;
    }

    public void setInvalidRate(BigDecimal invalidRate) {
        this.invalidRate = invalidRate;
    }
}
