package cn.iocoder.yudao.module.stock.service.market;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.stock.controller.admin.market.vo.MarketSignalPageReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSignalRecordDO;
import cn.iocoder.yudao.module.stock.service.market.dto.MarketSignalResultDTO;

public interface StockMarketSignalService {

    MarketSignalResultDTO getCurrentSignal(boolean refreshIfNeeded);

    MarketSignalResultDTO refreshCurrentSignal();

    PageResult<StockMarketSignalRecordDO> getSignalPage(MarketSignalPageReqVO reqVO);
}
