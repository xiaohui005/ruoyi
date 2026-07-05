package cn.iocoder.yudao.module.stock.controller.admin.market;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalCurrentRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSignalRecordDO;
import cn.iocoder.yudao.module.stock.service.market.StockMarketSignalService;
import cn.iocoder.yudao.module.stock.service.market.dto.MarketSignalResultDTO;
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

@Tag(name = "管理后台 - 股票市场节点")
@RestController
@RequestMapping("/stock/market-signal")
@Validated
public class StockMarketSignalController {

    @Resource
    private StockMarketSignalService stockMarketSignalService;

    @GetMapping("/current")
    @Operation(summary = "获取当前市场节点")
    @PreAuthorize("@ss.hasPermission('stock:market-signal:query')")
    public CommonResult<MarketSignalCurrentRespVO> getCurrentSignal() {
        MarketSignalResultDTO result = stockMarketSignalService.getCurrentSignal(false);
        return success(BeanUtils.toBean(result, MarketSignalCurrentRespVO.class));
    }

    @PostMapping("/refresh")
    @Operation(summary = "刷新市场节点")
    @PreAuthorize("@ss.hasPermission('stock:market-signal:query')")
    public CommonResult<MarketSignalCurrentRespVO> refreshCurrentSignal() {
        MarketSignalResultDTO result = stockMarketSignalService.refreshCurrentSignal();
        return success(BeanUtils.toBean(result, MarketSignalCurrentRespVO.class));
    }

    @GetMapping("/page")
    @Operation(summary = "分页获取市场节点")
    @PreAuthorize("@ss.hasPermission('stock:market-signal:query')")
    public CommonResult<PageResult<MarketSignalRespVO>> getSignalPage(MarketSignalPageReqVO reqVO) {
        PageResult<StockMarketSignalRecordDO> pageResult = stockMarketSignalService.getSignalPage(reqVO);
        return success(BeanUtils.toBean(pageResult, MarketSignalRespVO.class));
    }
}
