package cn.iocoder.yudao.module.system.service.messagepush;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.module.system.controller.admin.user.vo.profile.UserMessagePushProfileUpdateReqVO;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.dal.mysql.messagepush.SystemMessagePushUserConfigMapper;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import javax.annotation.Resource;

@Service
@Validated
public class SystemMessagePushUserConfigServiceImpl implements SystemMessagePushUserConfigService {

    public static final String BARK_CHANNEL_CODE = "BARK";
    public static final String DEFAULT_BARK_SERVER_URL = "https://api.day.app";

    @Resource
    private SystemMessagePushUserConfigMapper userConfigMapper;

    @Override
    public SystemMessagePushUserConfigDO getBarkConfig(Long userId) {
        SystemMessagePushUserConfigDO config = userConfigMapper.selectByUserIdAndChannelCode(userId, BARK_CHANNEL_CODE);
        return config != null ? config : buildDefault(userId);
    }

    @Override
    public void saveBarkConfig(Long userId, UserMessagePushProfileUpdateReqVO reqVO) {
        if (Boolean.TRUE.equals(reqVO.getEnabled()) && StrUtil.isBlank(reqVO.getDeviceKey())) {
            throw ServiceExceptionUtil.exception0(1_002_029_000, "Bark deviceKey is required");
        }
        SystemMessagePushUserConfigDO config = userConfigMapper.selectByUserIdAndChannelCode(userId, BARK_CHANNEL_CODE);
        if (config == null) {
            config = buildDefault(userId);
        }
        config.setEnabled(reqVO.getEnabled());
        config.setEndpoint(StrUtil.blankToDefault(reqVO.getServerUrl(), DEFAULT_BARK_SERVER_URL));
        config.setSecretKey(StrUtil.blankToDefault(reqVO.getDeviceKey(), ""));
        config.setReceiveSystemMessage(reqVO.getReceiveSystemMessage());
        config.setReceiveNotificationMessage(reqVO.getReceiveNotificationMessage());
        config.setReceiveStockAlert(reqVO.getReceiveStockAlert());
        if (config.getId() == null) {
            userConfigMapper.insert(config);
            return;
        }
        userConfigMapper.updateById(config);
    }

    private SystemMessagePushUserConfigDO buildDefault(Long userId) {
        SystemMessagePushUserConfigDO config = new SystemMessagePushUserConfigDO();
        config.setUserId(userId);
        config.setChannelCode(BARK_CHANNEL_CODE);
        config.setEnabled(false);
        config.setEndpoint(DEFAULT_BARK_SERVER_URL);
        config.setSecretKey("");
        config.setReceiveSystemMessage(true);
        config.setReceiveNotificationMessage(true);
        config.setReceiveStockAlert(true);
        return config;
    }
}
