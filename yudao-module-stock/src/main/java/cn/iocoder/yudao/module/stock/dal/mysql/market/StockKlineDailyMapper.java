package cn.iocoder.yudao.module.stock.dal.mysql.market;

import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface StockKlineDailyMapper extends BaseMapperX<StockKlineDailyDO> {

    default List<StockKlineDailyDO> selectRecentList(String symbol, Integer limit) {
        return selectList(new LambdaQueryWrapperX<StockKlineDailyDO>()
                .eq(StockKlineDailyDO::getSymbol, symbol)
                .orderByDesc(StockKlineDailyDO::getTradeDate)
                .last("LIMIT " + limit));
    }

    default List<StockKlineDailyDO> selectRange(String symbol, LocalDate startDate, LocalDate endDate) {
        return selectList(new LambdaQueryWrapperX<StockKlineDailyDO>()
                .eq(StockKlineDailyDO::getSymbol, symbol)
                .betweenIfPresent(StockKlineDailyDO::getTradeDate, startDate, endDate)
                .orderByAsc(StockKlineDailyDO::getTradeDate));
    }

    default StockKlineDailyDO selectLatest(String symbol) {
        return selectOne(new LambdaQueryWrapperX<StockKlineDailyDO>()
                .eq(StockKlineDailyDO::getSymbol, symbol)
                .orderByDesc(StockKlineDailyDO::getTradeDate)
                .last("LIMIT 1"));
    }

    default StockKlineDailyDO selectBySymbolAndTradeDate(String symbol, LocalDate tradeDate) {
        return selectOne(new LambdaQueryWrapperX<StockKlineDailyDO>()
                .eq(StockKlineDailyDO::getSymbol, symbol)
                .eq(StockKlineDailyDO::getTradeDate, tradeDate));
    }
}
