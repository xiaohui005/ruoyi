package cn.iocoder.yudao.module.stock.controller.admin.journal.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class StockTradeJournalSaveReqVO {

    private Long id;
    @NotBlank(message = "股票代码不能为空")
    private String symbol;
    @NotBlank(message = "股票名称不能为空")
    private String stockName;
    private BigDecimal buyPrice;
    private BigDecimal sellPrice;
    private BigDecimal positionRatio;
    private BigDecimal profitRate;
    private String systemAdvice;
    private String remark;
    @NotNull(message = "交易时间不能为空")
    private LocalDateTime tradeTime;
}
