package cn.iocoder.yudao.module.stock.controller.admin.recommend.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Schema(description = "管理后台 - 推荐股票分页请求")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockRecommendPageReqVO extends PageParam {

    @Schema(description = "股票代码")
    private String symbol;

    @Schema(description = "建议动作")
    private String adviceAction;

    @Schema(description = "风险等级")
    private String riskLevel;
}
