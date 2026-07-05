package cn.iocoder.yudao.module.stock.dal.mysql.journal;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.journal.StockTradeJournalDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StockTradeJournalMapper extends BaseMapperX<StockTradeJournalDO> {

    default PageResult<StockTradeJournalDO> selectPage(StockTradeJournalPageReqVO reqVO, Long userId) {
        return selectPage(reqVO, new LambdaQueryWrapperX<StockTradeJournalDO>()
                .eq(StockTradeJournalDO::getUserId, userId)
                .eqIfPresent(StockTradeJournalDO::getSymbol, reqVO.getSymbol())
                .orderByDesc(StockTradeJournalDO::getTradeTime));
    }
}
