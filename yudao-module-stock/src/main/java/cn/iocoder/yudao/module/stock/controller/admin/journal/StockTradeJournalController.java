package cn.iocoder.yudao.module.stock.controller.admin.journal;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.journal.StockTradeJournalDO;
import cn.iocoder.yudao.module.stock.service.journal.StockTradeJournalService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 交易复盘")
@RestController
@RequestMapping("/stock/journal")
@Validated
public class StockTradeJournalController {

    @Resource
    private StockTradeJournalService stockTradeJournalService;

    @PostMapping("/save")
    @Operation(summary = "保存交易复盘")
    @PreAuthorize("@ss.hasPermission('stock:trade-journal:create')")
    public CommonResult<Long> saveJournal(@Valid @RequestBody StockTradeJournalSaveReqVO reqVO) {
        return success(stockTradeJournalService.saveJournal(reqVO, SecurityFrameworkUtils.getLoginUserId()));
    }

    @GetMapping("/page")
    @Operation(summary = "分页获取交易复盘")
    @PreAuthorize("@ss.hasPermission('stock:history:query')")
    public CommonResult<PageResult<StockTradeJournalRespVO>> getJournalPage(StockTradeJournalPageReqVO reqVO) {
        PageResult<StockTradeJournalDO> pageResult = stockTradeJournalService.getJournalPage(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(pageResult, StockTradeJournalRespVO.class));
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除交易复盘")
    @Parameter(name = "id", required = true)
    @PreAuthorize("@ss.hasPermission('stock:trade-journal:delete')")
    public CommonResult<Boolean> deleteJournal(@RequestParam("id") Long id) {
        stockTradeJournalService.deleteJournal(id, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }
}
