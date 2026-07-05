package cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Schema(description = "管理后台 - 股票分析记录分页请求")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAnalysisRecordPageReqVO extends PageParam {

    @Schema(description = "股票代码")
    private String symbol;
}
