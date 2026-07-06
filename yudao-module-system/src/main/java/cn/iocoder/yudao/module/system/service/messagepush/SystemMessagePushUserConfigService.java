package cn.iocoder.yudao.module.system.service.messagepush;

import cn.iocoder.yudao.module.system.controller.admin.user.vo.profile.UserMessagePushProfileUpdateReqVO;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;

public interface SystemMessagePushUserConfigService {

    SystemMessagePushUserConfigDO getBarkConfig(Long userId);

    void saveBarkConfig(Long userId, UserMessagePushProfileUpdateReqVO reqVO);
}
