package cn.iocoder.yudao.module.stock.dal.mysql.alert;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertRulePageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRuleDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockAlertRuleMapper extends BaseMapperX<StockAlertRuleDO> {

    default PageResult<StockAlertRuleDO> selectPage(StockAlertRulePageReqVO reqVO, Long userId) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockAlertRuleDO>()
                .eq(StockAlertRuleDO::getUserId, userId)
                .eqIfPresent(StockAlertRuleDO::getWatchlistId, reqVO.getWatchlistId())
                .eqIfPresent(StockAlertRuleDO::getEnabled, reqVO.getEnabled())
                .orderByDesc(StockAlertRuleDO::getUpdateTime));
    }

    default List<StockAlertRuleDO> selectEnabledByUserAndWatchlist(Long userId, Long watchlistId) {
        return selectList(new LambdaQueryWrapperX<StockAlertRuleDO>()
                .eq(StockAlertRuleDO::getUserId, userId)
                .eqIfPresent(StockAlertRuleDO::getWatchlistId, watchlistId)
                .eq(StockAlertRuleDO::getEnabled, true));
    }
}
