package cn.iocoder.yudao.module.stock.dal.mysql.basic;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.basic.StockBasicInfoDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockBasicInfoMapper extends BaseMapperX<StockBasicInfoDO> {

    default StockBasicInfoDO selectBySymbol(String symbol) {
        return selectOne(new LambdaQueryWrapperX<StockBasicInfoDO>()
                .eq(StockBasicInfoDO::getSymbol, symbol));
    }
}
