package cn.iocoder.yudao.module.stock.controller.admin.watchlist;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistRuntimeStateRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.watchlist.StockWatchlistService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.stream.Collectors;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 自选股监控")
@RestController
@RequestMapping("/stock/watchlist")
@Validated
public class StockWatchlistController {

    @Resource
    private StockWatchlistService stockWatchlistService;
    @Resource
    private StockDataService stockDataService;

    @PostMapping("/create")
    @Operation(summary = "创建自选股")
    @PreAuthorize("@ss.hasPermission('stock:watchlist:create')")
    public CommonResult<Long> createWatchlist(@Valid @RequestBody StockWatchlistSaveReqVO reqVO) {
        return success(stockWatchlistService.createWatchlist(reqVO, SecurityFrameworkUtils.getLoginUserId()));
    }

    @PutMapping("/update")
    @Operation(summary = "更新自选股")
    @PreAuthorize("@ss.hasPermission('stock:watchlist:update')")
    public CommonResult<Boolean> updateWatchlist(@Valid @RequestBody StockWatchlistSaveReqVO reqVO) {
        stockWatchlistService.updateWatchlist(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除自选股")
    @Parameter(name = "id", required = true)
    @PreAuthorize("@ss.hasPermission('stock:watchlist:delete')")
    public CommonResult<Boolean> deleteWatchlist(@RequestParam("id") Long id) {
        stockWatchlistService.deleteWatchlist(id, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }

    @GetMapping("/page")
    @Operation(summary = "分页获取自选股")
    @PreAuthorize("@ss.hasPermission('stock:watchlist:query')")
    public CommonResult<PageResult<StockWatchlistRespVO>> getWatchlistPage(StockWatchlistPageReqVO reqVO) {
        PageResult<StockWatchlistDO> pageResult =
                stockWatchlistService.getWatchlistPage(reqVO, SecurityFrameworkUtils.getLoginUserId());
        List<StockWatchlistRespVO> respList = pageResult.getList().stream()
                .map(this::buildWatchlistRespVO)
                .collect(Collectors.toList());
        return success(new PageResult<>(respList, pageResult.getTotal()));
    }

    @GetMapping("/runtime-state")
    @Operation(summary = "获取自选股运行状态")
    @PreAuthorize("@ss.hasPermission('stock:watchlist:query')")
    public CommonResult<StockWatchlistRuntimeStateRespVO> getRuntimeState(@RequestParam("id") Long id) {
        StockWatchlistDO watchlist = stockWatchlistService.getWatchlist(id, SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(watchlist, StockWatchlistRuntimeStateRespVO.class));
    }

    StockWatchlistRespVO buildWatchlistRespVO(StockWatchlistDO watchlist) {
        StockWatchlistRespVO respVO = BeanUtils.toBean(watchlist, StockWatchlistRespVO.class);
        StockKlineDailyDO latestKline = stockDataService.getLatestDailyKLine(watchlist.getSymbol(), true);
        if (latestKline == null) {
            return respVO;
        }
        respVO.setCurrentPrice(latestKline.getClosePrice());
        respVO.setChangePercent(resolveChangePercent(latestKline));
        return respVO;
    }

    BigDecimal resolveChangePercent(StockKlineDailyDO latestKline) {
        if (latestKline == null) {
            return null;
        }
        if (latestKline.getChangePct() != null) {
            return latestKline.getChangePct();
        }
        if (latestKline.getClosePrice() == null || latestKline.getPreClosePrice() == null) {
            return null;
        }
        if (BigDecimal.ZERO.compareTo(latestKline.getPreClosePrice()) == 0) {
            return null;
        }
        return latestKline.getClosePrice()
                .subtract(latestKline.getPreClosePrice())
                .multiply(BigDecimal.valueOf(100))
                .divide(latestKline.getPreClosePrice(), 2, RoundingMode.HALF_UP);
    }
}
