package cn.iocoder.yudao.module.stock.controller.admin.advice;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingSummaryRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingDO;
import cn.iocoder.yudao.module.stock.service.advice.StockAdviceTrackingService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "Admin - Stock Advice Tracking")
@RestController
@RequestMapping("/stock/advice-tracking")
@Validated
public class StockAdviceTrackingController {

    @Resource
    private StockAdviceTrackingService stockAdviceTrackingService;

    @GetMapping("/page")
    @Operation(summary = "Get stock advice tracking page")
    @PreAuthorize("@ss.hasPermission('stock:history:query')")
    public CommonResult<PageResult<StockAdviceTrackingRespVO>> getTrackingPage(StockAdviceTrackingPageReqVO reqVO) {
        PageResult<StockAdviceTrackingDO> pageResult = stockAdviceTrackingService.getTrackingPage(
                reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(pageResult, StockAdviceTrackingRespVO.class));
    }

    @GetMapping("/summary")
    @Operation(summary = "Get stock advice tracking summary")
    @PreAuthorize("@ss.hasPermission('stock:history:query')")
    public CommonResult<StockAdviceTrackingSummaryRespVO> getTrackingSummary() {
        return success(stockAdviceTrackingService.getTrackingSummary(SecurityFrameworkUtils.getLoginUserId()));
    }
}
