package cn.iocoder.yudao.module.stock.controller.admin.market.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Schema(description = "管理后台 - 市场节点分页请求")
@Data
@EqualsAndHashCode(callSuper = true)
public class MarketSignalPageReqVO extends PageParam {

    @Schema(description = "节点编码")
    private String signalCode;
}
