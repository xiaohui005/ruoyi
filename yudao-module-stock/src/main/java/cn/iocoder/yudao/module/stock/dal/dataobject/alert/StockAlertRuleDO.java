package cn.iocoder.yudao.module.stock.dal.dataobject.alert;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@TableName("stock_alert_rule")
@KeySequence("stock_alert_rule_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAlertRuleDO extends BaseDO {

    private Long id;
    private Long userId;
    private Long watchlistId;
    private String ruleName;
    private String ruleType;
    private Boolean enabled;
    private Integer cooldownMinutes;
    private String ruleJson;
}
