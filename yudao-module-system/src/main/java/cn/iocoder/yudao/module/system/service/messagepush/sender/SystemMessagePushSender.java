package cn.iocoder.yudao.module.system.service.messagepush.sender;

import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.service.messagepush.dto.SystemMessagePushRequest;

public interface SystemMessagePushSender {

    String channelCode();

    void send(SystemMessagePushUserConfigDO userConfig, SystemMessagePushRequest request);
}
