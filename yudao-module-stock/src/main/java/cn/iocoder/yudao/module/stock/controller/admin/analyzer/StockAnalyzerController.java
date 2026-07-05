package cn.iocoder.yudao.module.stock.controller.admin.analyzer;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.collection.CollectionUtils;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.framework.security.core.util.SecurityFrameworkUtils;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalyzeReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalyzeRespVO;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalysisRecordPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import cn.iocoder.yudao.module.stock.service.analyzer.StockAnalyzerService;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - 股票分析")
@RestController
@RequestMapping("/stock/analyzer")
@Validated
public class StockAnalyzerController {

    @Resource
    private StockAnalyzerService stockAnalyzerService;

    @GetMapping("/get")
    @Operation(summary = "获取股票分析结果")
    @PreAuthorize("@ss.hasPermission('stock:analyzer:query')")
    public CommonResult<StockAnalyzeRespVO> getAnalyzeResult(@Valid StockAnalyzeReqVO reqVO) {
        StockAnalyzeResultDTO result = stockAnalyzerService.analyze(reqVO.getSymbol(), SecurityFrameworkUtils.getLoginUserId());
        return success(BeanUtils.toBean(result, StockAnalyzeRespVO.class));
    }

    @GetMapping("/record-page")
    @Operation(summary = "分页获取分析记录")
    @PreAuthorize("@ss.hasPermission('stock:analyzer:query')")
    public CommonResult<PageResult<StockAnalyzeRespVO>> getAnalysisRecordPage(StockAnalysisRecordPageReqVO reqVO) {
        PageResult<StockAnalysisRecordDO> pageResult = stockAnalyzerService.getAnalysisRecordPage(reqVO, SecurityFrameworkUtils.getLoginUserId());
        return success(new PageResult<>(
                CollectionUtils.convertList(pageResult.getList(),
                        record -> BeanUtils.toBean(record, StockAnalyzeRespVO.class,
                                vo -> vo.setAnalyzeTime(record.getCreateTime()))),
                pageResult.getTotal()));
    }
}
