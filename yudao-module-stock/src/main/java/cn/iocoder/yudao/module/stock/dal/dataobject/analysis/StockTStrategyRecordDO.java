package cn.iocoder.yudao.module.stock.dal.dataobject.analysis;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@TableName("stock_t_strategy_record")
@KeySequence("stock_t_strategy_record_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockTStrategyRecordDO extends BaseDO {

    private Long id;
    private Long analysisRecordId;
    private String symbol;
    private Boolean suitable;
    private BigDecimal supportPrice;
    private BigDecimal resistancePrice;
    private BigDecimal buyLowPrice;
    private BigDecimal buyHighPrice;
    private BigDecimal sellLowPrice;
    private BigDecimal sellHighPrice;
    private BigDecimal positionRatio;
    private String invalidCondition;
    private String reasonText;
}
