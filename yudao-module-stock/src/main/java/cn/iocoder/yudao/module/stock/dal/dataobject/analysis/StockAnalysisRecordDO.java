package cn.iocoder.yudao.module.stock.dal.dataobject.analysis;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@TableName("stock_analysis_record")
@KeySequence("stock_analysis_record_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAnalysisRecordDO extends BaseDO {

    private Long id;
    private Long userId;
    private Long watchlistId;
    private String symbol;
    private String stockName;
    private String marketSignalCode;
    private String marketSignalName;
    private String volumePriceType;
    private String pricePosition;
    private String volumePriceAdvice;
    private Boolean tStrategySuitable;
    private String adviceAction;
    private String reasonText;
    private String riskLevel;
    private String sourceName;
}
