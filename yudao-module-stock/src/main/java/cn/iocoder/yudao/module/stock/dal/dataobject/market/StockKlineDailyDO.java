package cn.iocoder.yudao.module.stock.dal.dataobject.market;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;

@TableName("stock_kline_daily")
@KeySequence("stock_kline_daily_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockKlineDailyDO extends BaseDO {

    private Long id;
    private String symbol;
    private LocalDate tradeDate;
    private BigDecimal openPrice;
    private BigDecimal highPrice;
    private BigDecimal lowPrice;
    private BigDecimal closePrice;
    private BigDecimal preClosePrice;
    private BigDecimal changePct;
    private BigDecimal volume;
    private BigDecimal turnoverAmount;
    private String sourceName;
}
