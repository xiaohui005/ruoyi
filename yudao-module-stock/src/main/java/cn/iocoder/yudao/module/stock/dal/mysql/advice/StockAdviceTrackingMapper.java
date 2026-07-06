package cn.iocoder.yudao.module.stock.dal.mysql.advice;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.advice.vo.StockAdviceTrackingPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.advice.StockAdviceTrackingDO;
import cn.iocoder.yudao.module.stock.enums.StockAdviceTrackingStatusEnum;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;

@Mapper
public interface StockAdviceTrackingMapper extends BaseMapperX<StockAdviceTrackingDO> {

    default PageResult<StockAdviceTrackingDO> selectPage(StockAdviceTrackingPageReqVO reqVO, Long userId) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockAdviceTrackingDO>()
                .eq(StockAdviceTrackingDO::getUserId, userId)
                .eqIfPresent(StockAdviceTrackingDO::getSymbol, reqVO.getSymbol())
                .eqIfPresent(StockAdviceTrackingDO::getAdviceType, reqVO.getAdviceType())
                .eqIfPresent(StockAdviceTrackingDO::getStatus, reqVO.getStatus())
                .orderByDesc(StockAdviceTrackingDO::getAdviceTime)
                .orderByDesc(StockAdviceTrackingDO::getId));
    }

    default StockAdviceTrackingDO selectLatestActiveByUserSymbolAndType(Long userId, String symbol, String adviceType) {
        return selectOne(new LambdaQueryWrapperX<StockAdviceTrackingDO>()
                .eq(StockAdviceTrackingDO::getUserId, userId)
                .eq(StockAdviceTrackingDO::getSymbol, symbol)
                .eq(StockAdviceTrackingDO::getAdviceType, adviceType)
                .in(StockAdviceTrackingDO::getStatus, StockAdviceTrackingStatusEnum.activeStatuses())
                .orderByDesc(StockAdviceTrackingDO::getAdviceTime)
                .last("LIMIT 1"));
    }

    default List<StockAdviceTrackingDO> selectActiveForEvaluate() {
        return selectList(new LambdaQueryWrapperX<StockAdviceTrackingDO>()
                .in(StockAdviceTrackingDO::getStatus, StockAdviceTrackingStatusEnum.activeStatuses())
                .orderByAsc(StockAdviceTrackingDO::getAdviceTime));
    }

    default List<StockAdviceTrackingDO> selectListByUserId(Long userId) {
        return selectList(new LambdaQueryWrapperX<StockAdviceTrackingDO>()
                .eq(StockAdviceTrackingDO::getUserId, userId)
                .orderByDesc(StockAdviceTrackingDO::getAdviceTime));
    }

    default List<StockAdviceTrackingDO> selectListByAnalysisRecordIds(Collection<Long> analysisRecordIds) {
        return selectList(new LambdaQueryWrapperX<StockAdviceTrackingDO>()
                .inIfPresent(StockAdviceTrackingDO::getAnalysisRecordId, analysisRecordIds));
    }
}
