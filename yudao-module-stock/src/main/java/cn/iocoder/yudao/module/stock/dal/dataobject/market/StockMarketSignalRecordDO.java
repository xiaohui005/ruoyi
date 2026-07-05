package cn.iocoder.yudao.module.stock.dal.dataobject.market;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDate;

@TableName("stock_market_signal_record")
@KeySequence("stock_market_signal_record_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockMarketSignalRecordDO extends BaseDO {

    private Long id;
    private LocalDate tradeDate;
    private String signalCode;
    private String signalName;
    private Boolean tradable;
    private String riskLevel;
    private String reasonText;
    private Long snapshotId;
}
