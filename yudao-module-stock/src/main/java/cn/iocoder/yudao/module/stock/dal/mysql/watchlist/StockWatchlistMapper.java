package cn.iocoder.yudao.module.stock.dal.mysql.watchlist;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.util.StringUtils;

import java.util.List;

@Mapper
public interface StockWatchlistMapper extends BaseMapperX<StockWatchlistDO> {

    default PageResult<StockWatchlistDO> selectPage(StockWatchlistPageReqVO reqVO, Long userId) {
        LambdaQueryWrapperX<StockWatchlistDO> queryWrapper = new LambdaQueryWrapperX<StockWatchlistDO>()
                .eq(StockWatchlistDO::getUserId, userId);
        if (StringUtils.hasText(reqVO.getKeyword())) {
            queryWrapper.and(wrapper -> wrapper.like(StockWatchlistDO::getSymbol, reqVO.getKeyword())
                    .or()
                    .like(StockWatchlistDO::getName, reqVO.getKeyword()));
        }
        queryWrapper.eqIfPresent(StockWatchlistDO::getEnableMonitor, reqVO.getEnableMonitor())
                .orderByDesc(StockWatchlistDO::getUpdateTime);
        return selectPage(reqVO, queryWrapper);
    }

    default StockWatchlistDO selectByUserAndSymbol(Long userId, String symbol) {
        return selectOne(new LambdaQueryWrapperX<StockWatchlistDO>()
                .eq(StockWatchlistDO::getUserId, userId)
                .eq(StockWatchlistDO::getSymbol, symbol));
    }

    default List<StockWatchlistDO> selectEnabledList() {
        return selectList(new LambdaQueryWrapperX<StockWatchlistDO>()
                .eq(StockWatchlistDO::getEnableMonitor, true));
    }

    default List<StockWatchlistDO> selectEnabledListByUserId(Long userId) {
        return selectList(new LambdaQueryWrapperX<StockWatchlistDO>()
                .eq(StockWatchlistDO::getUserId, userId)
                .eq(StockWatchlistDO::getEnableMonitor, true)
                .orderByDesc(StockWatchlistDO::getUpdateTime));
    }
}
