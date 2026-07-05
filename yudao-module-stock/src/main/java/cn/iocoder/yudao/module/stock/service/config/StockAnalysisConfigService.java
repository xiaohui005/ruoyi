package cn.iocoder.yudao.module.stock.service.config;

import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAnalysisConfigUpdateReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.config.StockAnalysisConfigDO;

import java.math.BigDecimal;
import java.util.List;

public interface StockAnalysisConfigService {

    List<StockAnalysisConfigDO> getConfigList();

    void updateConfigList(StockAnalysisConfigUpdateReqVO reqVO);

    BigDecimal getDecimalConfig(String configKey, BigDecimal defaultValue);
}
