package cn.iocoder.yudao.module.stock.dal.mysql.advice;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingLogDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockAdviceTrackingLogMapper extends BaseMapperX<StockAdviceTrackingLogDO> {
}
