package cn.iocoder.yudao.module.stock.dal.mysql.analysis;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.analysis.StockTStrategyRecordDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;

@Mapper
public interface StockTStrategyRecordMapper extends BaseMapperX<StockTStrategyRecordDO> {

    default StockTStrategyRecordDO selectLatestBySymbol(String symbol) {
        return selectOne(new LambdaQueryWrapperX<StockTStrategyRecordDO>()
                .eq(StockTStrategyRecordDO::getSymbol, symbol)
                .orderByDesc(StockTStrategyRecordDO::getCreateTime)
                .last("LIMIT 1"));
    }

    default int deleteByAnalysisRecordIds(Collection<Long> analysisRecordIds) {
        return deleteBatch(StockTStrategyRecordDO::getAnalysisRecordId, analysisRecordIds);
    }
}
