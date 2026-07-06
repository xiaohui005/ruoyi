package cn.iocoder.yudao.module.system.dal.dataobject.messagepush;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@TableName("system_message_push_user_config")
@KeySequence("system_message_push_user_config_seq")
@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class SystemMessagePushUserConfigDO extends BaseDO {

    @TableId
    private Long id;

    private Long userId;

    private String channelCode;

    private Boolean enabled;

    private String endpoint;

    private String secretKey;

    private String configJson;

    private Boolean receiveSystemMessage;

    private Boolean receiveNotificationMessage;

    private Boolean receiveStockAlert;
}
