package cn.iocoder.yudao.module.stock.dal.mysql.market;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSnapshotDO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;

@Mapper
public interface StockMarketSnapshotMapper extends BaseMapperX<StockMarketSnapshotDO> {

    default StockMarketSnapshotDO selectLatest() {
        return selectOne(new LambdaQueryWrapperX<StockMarketSnapshotDO>()
                .orderByDesc(StockMarketSnapshotDO::getSnapshotTime)
                .last("LIMIT 1"));
    }

    default StockMarketSnapshotDO selectLatestByTradeDate(LocalDate tradeDate) {
        return selectOne(new LambdaQueryWrapperX<StockMarketSnapshotDO>()
                .eq(StockMarketSnapshotDO::getTradeDate, tradeDate)
                .orderByDesc(StockMarketSnapshotDO::getSnapshotTime)
                .last("LIMIT 1"));
    }
}
