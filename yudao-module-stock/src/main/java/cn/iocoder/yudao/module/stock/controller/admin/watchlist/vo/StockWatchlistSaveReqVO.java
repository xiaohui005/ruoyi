package cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Schema(description = "管理后台 - 自选股创建或修改请求")
@Data
public class StockWatchlistSaveReqVO {

    private Long id;

    @NotBlank(message = "股票代码不能为空")
    private String symbol;

    private String name;

    @NotBlank(message = "采集级别不能为空")
    private String collectLevel;

    @NotNull(message = "采集周期不能为空")
    private Integer collectIntervalMinutes;

    @NotNull(message = "是否启用监控不能为空")
    private Boolean enableMonitor;

    @NotNull(message = "是否启用分时监控不能为空")
    private Boolean enableIntraday;

    @NotNull(message = "是否启用做T监控不能为空")
    private Boolean enableTStrategy;

    @NotNull(message = "是否启用价格提醒不能为空")
    private Boolean enablePriceAlert;

    @NotNull(message = "是否启用信号提醒不能为空")
    private Boolean enableSignalAlert;

    private String remark;
}
