package cn.iocoder.yudao.module.stock.service.config;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.module.stock.controller.admin.alert.vo.StockAnalysisConfigUpdateReqVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.config.StockAnalysisConfigDO;
import cn.iocoder.yudao.module.stock.dal.mysql.config.StockAnalysisConfigMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class StockAnalysisConfigServiceImpl implements StockAnalysisConfigService {

    private static final List<StockAnalysisConfigDO> DEFAULT_CONFIGS = Arrays.asList(
            build("market.index-rise-threshold", "市场指数涨幅阈值", "1.20", "增量共振所需的指数涨幅"),
            build("market.turnover-ratio-threshold", "市场成交额放量阈值", "1.10", "增量共振所需的成交额放量水平"),
            build("market.theme-limit-up-threshold", "题材涨停数阈值", "3", "题材发酵所需的最小涨停数量"),
            build("market.limit-down-max", "跌停上限", "10", "情绪修复时允许的最大跌停数量"),
            build("market.limit-up-min", "涨停下限", "20", "情绪修复时要求的最小涨停数量"),
            build("analyzer.volume-rise-threshold", "放量阈值", "1.20", "量增价升判断所需的量比"),
            build("analyzer.volume-shrink-threshold", "缩量阈值", "0.90", "价涨量缩判断所需的量比"),
            build("strategy.position-ratio", "默认做T仓位", "0.30", "默认推荐仓位"),
            build("strategy.invalid-break-threshold", "做T失效跌破阈值", "0.02", "跌破支撑位后的失效阈值")
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
            log.warn("[getDecimalConfig][配置 {} 的值 {} 不是合法数字，回退默认值 {}]",
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
