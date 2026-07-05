package cn.iocoder.yudao.module.stock.controller.admin.alert;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.*;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRuleDO;
import cn.iocoder.yudao.module.stock.service.alert.StockAlertService;
import cn.iocoder.yudao.module.stock.service.config.StockAnalysisConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 提醒配置")
@RestController
@RequestMapping("/stock/alert")
@Validated
public class StockAlertController {

    @Resource
    private StockAlertService stockAlertService;
    @Resource
    private StockAnalysisConfigService stockAnalysisConfigService;

    @GetMapping("/channel-list")
    @Operation(summary = "获取提醒渠道列表")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:query')")
    public CommonResult<List<StockAlertChannelRespVO>> getChannelList() {
        List<StockAlertChannelDO> list = stockAlertService.getChannelList(SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(list, StockAlertChannelRespVO.class));
    }

    @PostMapping("/channel/save")
    @Operation(summary = "保存提醒渠道")
    @PreAuthorize("@ss.hasPermission('stock:alert-channel:update')")
    public CommonResult<Long> saveChannel(@Valid @RequestBody StockAlertChannelSaveReqVO reqVO) {
        return success(stockAlertService.saveChannel(reqVO, SecurityFrameworkUtils.getLoginUserId()));
    }

    @PostMapping("/channel/test-send")
    @Operation(summary = "测试发送提醒")
    @PreAuthorize("@ss.hasPermission('stock:alert-channel:test')")
    public CommonResult<Boolean> testSend(@Valid @RequestBody StockAlertChannelTestReqVO reqVO) {
        stockAlertService.testSend(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }

    @GetMapping("/rule-page")
    @Operation(summary = "分页获取提醒规则")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:query')")
    public CommonResult<PageResult<StockAlertRuleRespVO>> getRulePage(StockAlertRulePageReqVO reqVO) {
        PageResult<StockAlertRuleDO> pageResult = stockAlertService.getRulePage(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(pageResult, StockAlertRuleRespVO.class));
    }

    @PostMapping("/rule/create")
    @Operation(summary = "创建提醒规则")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:create')")
    public CommonResult<Long> createRule(@Valid @RequestBody StockAlertRuleSaveReqVO reqVO) {
        return success(stockAlertService.createRule(reqVO, SecurityFrameworkUtils.getLoginUserId()));
    }

    @PutMapping("/rule/update")
    @Operation(summary = "更新提醒规则")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:update')")
    public CommonResult<Boolean> updateRule(@Valid @RequestBody StockAlertRuleSaveReqVO reqVO) {
        stockAlertService.updateRule(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }

    @DeleteMapping("/rule/delete")
    @Operation(summary = "删除提醒规则")
    @Parameter(name = "id", required = true)
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:delete')")
    public CommonResult<Boolean> deleteRule(@RequestParam("id") Long id) {
        stockAlertService.deleteRule(id, SecurityFrameworkUtils.getLoginUserId());
        return success(true);
    }

    @GetMapping("/record-page")
    @Operation(summary = "分页获取提醒记录")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:query')")
    public CommonResult<PageResult<StockAlertRecordRespVO>> getRecordPage(StockAlertRecordPageReqVO reqVO) {
        PageResult<StockAlertRecordDO> pageResult = stockAlertService.getRecordPage(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(pageResult, StockAlertRecordRespVO.class));
    }

    @GetMapping("/config-list")
    @Operation(summary = "获取分析配置")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:query')")
    public CommonResult<List<StockAnalysisConfigRespVO>> getConfigList() {
        return success(BeanUtils.toBean(stockAnalysisConfigService.getConfigList(), StockAnalysisConfigRespVO.class));
    }

    @PutMapping("/config/update")
    @Operation(summary = "更新分析配置")
    @PreAuthorize("@ss.hasPermission('stock:alert-rule:update')")
    public CommonResult<Boolean> updateConfig(@Valid @RequestBody StockAnalysisConfigUpdateReqVO reqVO) {
        stockAnalysisConfigService.updateConfigList(reqVO);
        return success(true);
    }
}
