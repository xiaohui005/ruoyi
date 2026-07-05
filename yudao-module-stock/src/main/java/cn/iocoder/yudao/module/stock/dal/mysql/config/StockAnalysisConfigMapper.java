package cn.iocoder.yudao.module.stock.dal.mysql.config;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.config.StockAnalysisConfigDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockAnalysisConfigMapper extends BaseMapperX<StockAnalysisConfigDO> {

    default List<StockAnalysisConfigDO> selectListOrderByKey() {
        return selectList(new LambdaQueryWrapperX<StockAnalysisConfigDO>()
                .orderByAsc(StockAnalysisConfigDO::getConfigKey));
    }

    default StockAnalysisConfigDO selectByKey(String configKey) {
        return selectOne(new LambdaQueryWrapperX<StockAnalysisConfigDO>()
                .eq(StockAnalysisConfigDO::getConfigKey, configKey));
    }
}
