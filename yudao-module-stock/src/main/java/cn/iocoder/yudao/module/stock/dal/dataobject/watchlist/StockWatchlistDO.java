package cn.iocoder.yudao.module.stock.dal.dataobject.watchlist;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@TableName("stock_watchlist")
@KeySequence("stock_watchlist_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockWatchlistDO extends BaseDO {

    private Long id;
    private Long userId;
    private String symbol;
    private String name;
    private String collectLevel;
    private Integer collectIntervalMinutes;
    private Boolean enableMonitor;
    private Boolean enableIntraday;
    private Boolean enableTStrategy;
    private Boolean enablePriceAlert;
    private Boolean enableSignalAlert;
    private LocalDateTime latestCollectTime;
    private LocalDateTime latestAnalyzeTime;
    private LocalDateTime latestAlertTime;
    private String latestAdvice;
    private String remark;
}
