package cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Schema(description = "管理后台 - 自选股分页请求")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockWatchlistPageReqVO extends PageParam {

    @Schema(description = "关键字")
    private String keyword;

    @Schema(description = "是否启用监控")
    private Boolean enableMonitor;
}
