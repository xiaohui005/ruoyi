package cn.iocoder.yudao.module.stock.service.journal;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.journal.StockTradeJournalDO;

public interface StockTradeJournalService {

    Long saveJournal(StockTradeJournalSaveReqVO reqVO, Long userId);

    PageResult<StockTradeJournalDO> getJournalPage(StockTradeJournalPageReqVO reqVO, Long userId);

    void deleteJournal(Long id, Long userId);
}
