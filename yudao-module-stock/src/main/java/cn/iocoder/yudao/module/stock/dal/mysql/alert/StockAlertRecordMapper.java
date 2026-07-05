package cn.iocoder.yudao.module.stock.dal.mysql.alert;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAlertRecordPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRecordDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockAlertRecordMapper extends BaseMapperX<StockAlertRecordDO> {

    default PageResult<StockAlertRecordDO> selectPage(StockAlertRecordPageReqVO reqVO, Long userId) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockAlertRecordDO>()
                .eq(StockAlertRecordDO::getUserId, userId)
                .eqIfPresent(StockAlertRecordDO::getChannelCode, reqVO.getChannelCode())
                .eqIfPresent(StockAlertRecordDO::getSymbol, reqVO.getSymbol())
                .orderByDesc(StockAlertRecordDO::getCreateTime));
    }

    default StockAlertRecordDO selectLatestSuccess(Long ruleId, String symbol, String channelCode) {
        return selectOne(new LambdaQueryWrapperX<StockAlertRecordDO>()
                .eq(StockAlertRecordDO::getRuleId, ruleId)
                .eqIfPresent(StockAlertRecordDO::getSymbol, symbol)
                .eq(StockAlertRecordDO::getChannelCode, channelCode)
                .eq(StockAlertRecordDO::getSendStatus, "SUCCESS")
                .orderByDesc(StockAlertRecordDO::getCreateTime)
                .last("LIMIT 1"));
    }
}
