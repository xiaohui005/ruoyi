package cn.iocoder.yudao.module.stock.service.watchlist;

import cn.iocoder.yudao.framework.common.exception.ErrorCode;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistPageReqVO;
import cn.iocoder.yudao.module.stock.controller.admin.watchlist.vo.StockWatchlistSaveReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.dal.mysql.watchlist.StockWatchlistMapper;
import cn.iocoder.yudao.module.stock.enums.ErrorCodeConstants;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.List;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;

@Service
public class StockWatchlistServiceImpl implements StockWatchlistService {

    private static final ErrorCode WATCHLIST_EXISTS = new ErrorCode(1_009_001_009, "自选股已存在");

    @Resource
    private StockWatchlistMapper stockWatchlistMapper;

    @Override
    public Long createWatchlist(StockWatchlistSaveReqVO reqVO, Long userId) {
        String symbol = StockSymbolUtils.normalize(reqVO.getSymbol());
        validateDuplicateSymbol(userId, symbol, null);
        StockWatchlistDO entity = BeanUtils.toBean(reqVO, StockWatchlistDO.class);
        entity.setUserId(userId);
        entity.setSymbol(symbol);
        if (entity.getName() == null) {
            entity.setName(StockSymbolUtils.display(symbol));
        }
        stockWatchlistMapper.insert(entity);
        return entity.getId();
    }

    @Override
    public void updateWatchlist(StockWatchlistSaveReqVO reqVO, Long userId) {
        StockWatchlistDO existing = getWatchlist(reqVO.getId(), userId);
        String symbol = StockSymbolUtils.normalize(reqVO.getSymbol());
        validateDuplicateSymbol(userId, symbol, existing.getId());
        BeanUtils.copyProperties(reqVO, existing);
        existing.setSymbol(symbol);
        stockWatchlistMapper.updateById(existing);
    }

    @Override
    public void deleteWatchlist(Long id, Long userId) {
        StockWatchlistDO existing = getWatchlist(id, userId);
        stockWatchlistMapper.deleteById(existing.getId());
    }

    @Override
    public StockWatchlistDO getWatchlist(Long id, Long userId) {
        StockWatchlistDO entity = stockWatchlistMapper.selectById(id);
        if (entity == null || !entity.getUserId().equals(userId)) {
            throw exception(ErrorCodeConstants.WATCHLIST_NOT_FOUND);
        }
        return entity;
    }

    @Override
    public PageResult<StockWatchlistDO> getWatchlistPage(StockWatchlistPageReqVO reqVO, Long userId) {
        return stockWatchlistMapper.selectPage(reqVO, userId);
    }

    @Override
    public List<StockWatchlistDO> getEnabledWatchlists() {
        return stockWatchlistMapper.selectEnabledList();
    }

    @Override
    public List<StockWatchlistDO> getEnabledWatchlists(Long userId) {
        return stockWatchlistMapper.selectEnabledListByUserId(userId);
    }

    @Override
    public void updateAfterAnalysis(Long id, String latestAdvice, LocalDateTime analyzeTime) {
        StockWatchlistDO entity = stockWatchlistMapper.selectById(id);
        if (entity == null) {
            return;
        }
        entity.setLatestAdvice(latestAdvice);
        entity.setLatestAnalyzeTime(analyzeTime);
        stockWatchlistMapper.updateById(entity);
    }

    @Override
    public void updateLastCollectTime(Long id, LocalDateTime collectTime) {
        StockWatchlistDO entity = stockWatchlistMapper.selectById(id);
        if (entity == null) {
            return;
        }
        entity.setLatestCollectTime(collectTime);
        stockWatchlistMapper.updateById(entity);
    }

    @Override
    public void updateLastAlertTime(Long id, LocalDateTime alertTime) {
        StockWatchlistDO entity = stockWatchlistMapper.selectById(id);
        if (entity == null) {
            return;
        }
        entity.setLatestAlertTime(alertTime);
        stockWatchlistMapper.updateById(entity);
    }

    private void validateDuplicateSymbol(Long userId, String symbol, Long excludeId) {
        StockWatchlistDO existing = stockWatchlistMapper.selectByUserAndSymbol(userId, symbol);
        if (existing != null && (excludeId == null || !existing.getId().equals(excludeId))) {
            throw exception(WATCHLIST_EXISTS);
        }
    }
}
