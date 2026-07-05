package cn.iocoder.yudao.module.stock.dal.mysql.market;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSignalRecordDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockMarketSignalRecordMapper extends BaseMapperX<StockMarketSignalRecordDO> {

    default PageResult<StockMarketSignalRecordDO> selectPage(MarketSignalPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockMarketSignalRecordDO>()
                .eqIfPresent(StockMarketSignalRecordDO::getSignalCode, reqVO.getSignalCode())
                .orderByDesc(StockMarketSignalRecordDO::getCreateTime));
    }

    default StockMarketSignalRecordDO selectLatest() {
        return selectOne(new LambdaQueryWrapperX<StockMarketSignalRecordDO>()
                .orderByDesc(StockMarketSignalRecordDO::getCreateTime)
                .last("LIMIT 1"));
    }
}
