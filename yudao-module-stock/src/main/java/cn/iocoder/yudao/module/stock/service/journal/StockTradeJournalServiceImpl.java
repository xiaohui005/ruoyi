package cn.iocoder.yudao.module.stock.service.journal;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.journal.vo.StockTradeJournalSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.journal.StockTradeJournalDO;
import cn.iocoder.yudao.module.stock.dal.mysql.journal.StockTradeJournalMapper;
import cn.iocoder.yudao.module.stock.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;

@Service
public class StockTradeJournalServiceImpl implements StockTradeJournalService {

    @Resource
    private StockTradeJournalMapper stockTradeJournalMapper;

    @Override
    public Long saveJournal(StockTradeJournalSaveReqVO reqVO, Long userId) {
        if (reqVO.getId() == null) {
            StockTradeJournalDO entity = BeanUtils.toBean(reqVO, StockTradeJournalDO.class);
            entity.setUserId(userId);
            entity.setSymbol(StockSymbolUtils.normalize(reqVO.getSymbol()));
            stockTradeJournalMapper.insert(entity);
            return entity.getId();
        }
        StockTradeJournalDO existing = validateOwnership(reqVO.getId(), userId);
        BeanUtils.copyProperties(reqVO, existing);
        existing.setSymbol(StockSymbolUtils.normalize(reqVO.getSymbol()));
        stockTradeJournalMapper.updateById(existing);
        return existing.getId();
    }

    @Override
    public PageResult<StockTradeJournalDO> getJournalPage(StockTradeJournalPageReqVO reqVO, Long userId) {
        return stockTradeJournalMapper.selectPage(reqVO, userId);
    }

    @Override
    public void deleteJournal(Long id, Long userId) {
        StockTradeJournalDO existing = validateOwnership(id, userId);
        stockTradeJournalMapper.deleteById(existing.getId());
    }

    private StockTradeJournalDO validateOwnership(Long id, Long userId) {
        StockTradeJournalDO existing = stockTradeJournalMapper.selectById(id);
        if (existing == null || !existing.getUserId().equals(userId)) {
            throw exception(ErrorCodeConstants.TRADE_JOURNAL_NOT_FOUND);
        }
        return existing;
    }
}
