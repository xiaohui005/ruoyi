package cn.iocoder.yudao.module.stock.dal.dataobject.alert;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

@TableName("stock_alert_record")
@KeySequence("stock_alert_record_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAlertRecordDO extends BaseDO {

    private Long id;
    private Long userId;
    private Long watchlistId;
    private Long ruleId;
    private String channelCode;
    private String symbol;
    private String alertType;
    private String triggerValue;
    private String content;
    private String sendStatus;
    private LocalDateTime sendTime;
    private String responseText;
}
