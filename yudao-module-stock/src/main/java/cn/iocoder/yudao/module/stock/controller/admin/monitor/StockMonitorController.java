package cn.iocoder.yudao.module.stock.controller.admin.monitor;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.monitor.vo.StockMonitorRespVO;
import cn.iocoder.yudao.module.stock.service.monitor.StockMonitorService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 行情监控")
@RestController
@RequestMapping("/stock/monitor")
@Validated
public class StockMonitorController {

    @Resource
    private StockMonitorService stockMonitorService;

    @GetMapping("/get")
    @Operation(summary = "获取行情监控数据")
    @PreAuthorize("@ss.hasPermission('stock:monitor:query')")
    public CommonResult<StockMonitorRespVO> getMonitor(@RequestParam("symbol") String symbol,
                                                       @RequestParam(value = "limit", required = false) Integer limit) {
        return success(stockMonitorService.getMonitor(symbol, SecurityFrameworkUtils.getLoginUserId(), limit));
    }
}
