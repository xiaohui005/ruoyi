package cn.iocoder.yudao.module.stock.service.alert;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.*;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRecordDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertRuleDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.watchlist.StockWatchlistDO;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;

import java.util.List;

public interface StockAlertService {

    List<StockAlertChannelDO> getChannelList(Long userId);

    Long saveChannel(StockAlertChannelSaveReqVO reqVO, Long userId);

    void testSend(StockAlertChannelTestReqVO reqVO, Long userId);

    PageResult<StockAlertRuleDO> getRulePage(StockAlertRulePageReqVO reqVO, Long userId);

    Long createRule(StockAlertRuleSaveReqVO reqVO, Long userId);

    void updateRule(StockAlertRuleSaveReqVO reqVO, Long userId);

    void deleteRule(Long id, Long userId);

    PageResult<StockAlertRecordDO> getRecordPage(StockAlertRecordPageReqVO reqVO, Long userId);

    void evaluateAndSend(StockWatchlistDO watchlist, StockAnalyzeResultDTO result);
}
