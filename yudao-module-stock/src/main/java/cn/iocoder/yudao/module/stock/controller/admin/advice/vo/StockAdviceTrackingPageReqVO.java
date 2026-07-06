package cn.iocoder.yudao.module.stock.controller.admin.advice.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "Admin - Stock advice tracking page request")
public class StockAdviceTrackingPageReqVO extends PageParam {

    @Schema(description = "Stock symbol", example = "600519.SH")
    private String symbol;

    @Schema(description = "Advice type", example = "BUY")
    private String adviceType;

    @Schema(description = "Tracking status", example = "PENDING")
    private String status;

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
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
}
