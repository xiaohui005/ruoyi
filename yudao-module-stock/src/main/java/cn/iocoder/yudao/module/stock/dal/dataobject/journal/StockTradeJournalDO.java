package cn.iocoder.yudao.module.stock.dal.dataobject.journal;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@TableName("stock_trade_journal")
@KeySequence("stock_trade_journal_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockTradeJournalDO extends BaseDO {

    private Long id;
    private Long userId;
    private String symbol;
    private String stockName;
    private BigDecimal buyPrice;
    private BigDecimal sellPrice;
    private BigDecimal positionRatio;
    private BigDecimal profitRate;
    private String systemAdvice;
    private String remark;
    private LocalDateTime tradeTime;
}
