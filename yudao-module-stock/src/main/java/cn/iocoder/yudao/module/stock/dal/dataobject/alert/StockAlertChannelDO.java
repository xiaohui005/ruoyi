package cn.iocoder.yudao.module.stock.dal.dataobject.alert;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

@TableName("stock_alert_channel")
@KeySequence("stock_alert_channel_seq")
@Data
@EqualsAndHashCode(callSuper = true)
public class StockAlertChannelDO extends BaseDO {

    private Long id;
    private Long userId;
    private String channelCode;
    private String channelName;
    private Boolean enabled;
    private String configJson;
}
