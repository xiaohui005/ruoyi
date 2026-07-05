package cn.iocoder.yudao.module.stock.dal.dataobject.market;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@TableName("stock_market_snapshot")
@KeySequence("stock_market_snapshot_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockMarketSnapshotDO extends BaseDO {

    private Long id;
    private LocalDate tradeDate;
    private LocalDateTime snapshotTime;
    private String indexCode;
    private String indexName;
    private BigDecimal indexClose;
    private BigDecimal indexChangePct;
    private BigDecimal turnoverAmount;
    private BigDecimal turnoverRatio;
    private Integer limitUpCount;
    private Integer limitDownCount;
    private Integer risingCount;
    private Integer fallingCount;
    private String hotTheme;
    private Integer themeLimitUpCount;
    private String sourceName;
    private String rawPayload;
}
