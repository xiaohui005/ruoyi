package cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Schema(description = "管理后台 - 股票分析请求")
@Data
public class StockAnalyzeReqVO {

    @Schema(description = "股票代码", requiredMode = Schema.RequiredMode.REQUIRED, example = "600519")
    @NotBlank(message = "股票代码不能为空")
    private String symbol;
}
