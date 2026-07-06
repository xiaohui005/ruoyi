package cn.iocoder.yudao.module.stock.service.config;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAnalysisConfigUpdateReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.config.StockAnalysisConfigDO;
import cn.iocoder.yudao.module.stock.dal.mysql.config.StockAnalysisConfigMapper;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Service
public class StockAnalysisConfigServiceImpl implements StockAnalysisConfigService {

    private static final Logger log = LoggerFactory.getLogger(StockAnalysisConfigServiceImpl.class);

    private static final List<StockAnalysisConfigDO> DEFAULT_CONFIGS = Arrays.asList(
            build("market.index-rise-threshold", "Market Index Rise Threshold", "1.20", "Required index rise for market confirmation"),
            build("market.turnover-ratio-threshold", "Market Turnover Ratio Threshold", "1.10", "Required turnover expansion for market confirmation"),
            build("market.theme-limit-up-threshold", "Theme Limit Up Threshold", "3", "Minimum limit-up count for hot themes"),
            build("market.limit-down-max", "Market Limit Down Max", "10", "Maximum limit-down count allowed during recovery"),
            build("market.limit-up-min", "Market Limit Up Min", "20", "Minimum limit-up count required during recovery"),
            build("analyzer.volume-rise-threshold", "Volume Rise Threshold", "1.20", "Volume ratio threshold for rising volume"),
            build("analyzer.volume-shrink-threshold", "Volume Shrink Threshold", "0.90", "Volume ratio threshold for shrinking volume"),
            build("strategy.position-ratio", "Default T Position Ratio", "0.30", "Default recommended position ratio"),
            build("strategy.invalid-break-threshold", "T Invalid Break Threshold", "0.02", "Invalidation threshold below support"),
            build("strategy.advice-expected-days", "Advice Expected Days", "5", "Default observation days for advice tracking")
    );

    @Resource
    private StockAnalysisConfigMapper stockAnalysisConfigMapper;

    @PostConstruct
    public void initDefaults() {
        DEFAULT_CONFIGS.forEach(config -> {
            if (stockAnalysisConfigMapper.selectByKey(config.getConfigKey()) == null) {
                stockAnalysisConfigMapper.insert(config);
            }
        });
    }

    @Override
    public List<StockAnalysisConfigDO> getConfigList() {
        return stockAnalysisConfigMapper.selectListOrderByKey();
    }

    @Override
    public void updateConfigList(StockAnalysisConfigUpdateReqVO reqVO) {
        reqVO.getItems().forEach(item -> {
            StockAnalysisConfigDO config = stockAnalysisConfigMapper.selectByKey(item.getConfigKey());
            if (config == null) {
                config = new StockAnalysisConfigDO();
                config.setConfigKey(item.getConfigKey());
                config.setConfigName(item.getConfigKey());
                config.setConfigValue(item.getConfigValue());
                stockAnalysisConfigMapper.insert(config);
                return;
            }
            config.setConfigValue(item.getConfigValue());
            stockAnalysisConfigMapper.updateById(config);
        });
    }

    @Override
    public BigDecimal getDecimalConfig(String configKey, BigDecimal defaultValue) {
        StockAnalysisConfigDO config = stockAnalysisConfigMapper.selectByKey(configKey);
        if (config == null || StrUtil.isBlank(config.getConfigValue())) {
            return defaultValue;
        }
        try {
            return new BigDecimal(config.getConfigValue().trim());
        } catch (NumberFormatException ex) {
            log.warn("[getDecimalConfig][config {} value {} is invalid, fallback to default {}]",
                    configKey, config.getConfigValue(), defaultValue);
            return defaultValue;
        }
    }

    private static StockAnalysisConfigDO build(String key, String name, String value, String remark) {
        StockAnalysisConfigDO config = new StockAnalysisConfigDO();
        config.setConfigKey(key);
        config.setConfigName(name);
        config.setConfigValue(value);
        config.setRemark(remark);
        return config;
    }
}
