package cn.iocoder.yudao.module.stock.dal.mysql.analysis;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.analyzer.vo.StockAnalysisRecordPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockAnalysisRecordDO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Mapper
public interface StockAnalysisRecordMapper extends BaseMapperX<StockAnalysisRecordDO> {

    default PageResult<StockAnalysisRecordDO> selectPage(StockAnalysisRecordPageReqVO reqVO, Long userId) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockAnalysisRecordDO>()
                .eqIfPresent(StockAnalysisRecordDO::getUserId, userId)
                .eqIfPresent(StockAnalysisRecordDO::getSymbol, reqVO.getSymbol())
                .orderByDesc(StockAnalysisRecordDO::getCreateTime));
    }

    default StockAnalysisRecordDO selectLatestBySymbolAndUser(String symbol, Long userId) {
        return selectOne(new LambdaQueryWrapperX<StockAnalysisRecordDO>()
                .eq(StockAnalysisRecordDO::getSymbol, symbol)
                .eqIfPresent(StockAnalysisRecordDO::getUserId, userId)
                .orderByDesc(StockAnalysisRecordDO::getCreateTime)
                .last("LIMIT 1"));
    }

    default List<Long> selectExpiredIds(LocalDateTime expireBefore) {
        return selectList(new LambdaQueryWrapperX<StockAnalysisRecordDO>()
                .lt(StockAnalysisRecordDO::getCreateTime, expireBefore))
                .stream()
                .map(StockAnalysisRecordDO::getId)
                .collect(Collectors.toList());
    }
}
