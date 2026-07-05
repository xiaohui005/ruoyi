package cn.iocoder.yudao.module.stock.dal.dataobject.config;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@TableName("stock_analysis_config")
@KeySequence("stock_analysis_config_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAnalysisConfigDO extends BaseDO {

    private Long id;
    private String configKey;
    private String configName;
    private String configValue;
    private String remark;
}
