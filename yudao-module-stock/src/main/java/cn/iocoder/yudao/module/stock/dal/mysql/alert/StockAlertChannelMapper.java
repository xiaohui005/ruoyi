package cn.iocoder.yudao.module.stock.dal.mysql.alert;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockAlertChannelMapper extends BaseMapperX<StockAlertChannelDO> {

    default List<StockAlertChannelDO> selectListByUserId(Long userId) {
        return selectList(new LambdaQueryWrapperX<StockAlertChannelDO>()
                .eq(StockAlertChannelDO::getUserId, userId)
                .orderByAsc(StockAlertChannelDO::getId));
    }
}
