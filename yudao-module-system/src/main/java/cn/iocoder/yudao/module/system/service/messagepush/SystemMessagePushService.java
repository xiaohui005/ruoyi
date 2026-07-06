package cn.iocoder.yudao.module.system.service.messagepush;

import cn.iocoder.yudao.module.system.dal.dataobject.notify.NotifyTemplateDO;

import java.util.Map;

public interface SystemMessagePushService {

    void pushNotifyMessage(Long userId, Integer userType, NotifyTemplateDO template,
                           String templateContent, Map<String, Object> templateParams);
}
