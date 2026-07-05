package cn.iocoder.yudao.module.stock.controller.admin.recommend;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.recommend.vo.StockRecommendRespVO;
import cn.iocoder.yudao.module.stock.service.recommend.StockRecommendService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 推荐股票")
@RestController
@RequestMapping("/stock/recommend")
@Validated
public class StockRecommendController {

    @Resource
    private StockRecommendService stockRecommendService;

    @GetMapping("/page")
    @Operation(summary = "分页获取推荐股票")
    @PreAuthorize("@ss.hasPermission('stock:recommend:query')")
    public CommonResult<PageResult<StockRecommendRespVO>> getRecommendPage(StockRecommendPageReqVO reqVO) {
        return success(stockRecommendService.getRecommendPage(reqVO, SecurityFrameworkUtils.getLoginUserId()));
    }

    @PostMapping("/refresh")
    @Operation(summary = "刷新推荐股票")
    @PreAuthorize("@ss.hasPermission('stock:recommend:query')")
    public CommonResult<Integer> refreshRecommendations() {
        return success(stockRecommendService.refreshRecommendations(SecurityFrameworkUtils.getLoginUserId()));
    }
}
