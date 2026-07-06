package cn.iocoder.yudao.module.system.service.messagepush;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.module.infra.api.config.ConfigApi;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.dal.dataobject.notify.NotifyTemplateDO;
import cn.iocoder.yudao.module.system.dal.mysql.messagepush.SystemMessagePushUserConfigMapper;
import cn.iocoder.yudao.module.system.enums.notify.NotifyTemplateTypeEnum;
import cn.iocoder.yudao.module.system.service.messagepush.dto.SystemMessagePushRequest;
import cn.iocoder.yudao.module.system.service.messagepush.sender.SystemMessagePushSender;
import cn.iocoder.yudao.module.system.service.messagepush.sender.SystemMessagePushSenderFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@Slf4j
public class SystemMessagePushServiceImpl implements SystemMessagePushService {

    public static final String GLOBAL_ENABLED_KEY = "system.message-push.enabled";
    public static final String GLOBAL_ENABLED_CHANNELS_KEY = "system.message-push.enabled-channels";
    public static final String BARK_CHANNEL_CODE = "BARK";
    private static final String STOCK_TEMPLATE_PREFIX = "STOCK_";

    @Resource
    private ConfigApi configApi;
    @Resource
    private SystemMessagePushUserConfigMapper userConfigMapper;
    @Resource
    private SystemMessagePushSenderFactory systemMessagePushSenderFactory;

    @Override
    public void pushNotifyMessage(Long userId, Integer userType, NotifyTemplateDO template,
                                  String templateContent, Map<String, Object> templateParams) {
        try {
            if (!isGlobalEnabled()) {
                return;
            }
            for (String channelCode : getEnabledChannels()) {
                SystemMessagePushUserConfigDO userConfig = userConfigMapper.selectByUserIdAndChannelCode(userId, channelCode);
                if (userConfig == null || !Boolean.TRUE.equals(userConfig.getEnabled())) {
                    continue;
                }
                if (!shouldPush(userConfig, template)) {
                    continue;
                }
                SystemMessagePushSender sender = systemMessagePushSenderFactory.getSender(channelCode);
                if (sender == null) {
                    log.warn("[pushNotifyMessage][skip push because sender not found for channel({})]", channelCode);
                    continue;
                }
                SystemMessagePushRequest request = buildRequest(userId, userType, channelCode, template, templateContent, templateParams);
                try {
                    sender.send(userConfig, request);
                } catch (Exception ex) {
                    log.warn("[pushNotifyMessage][push failed for channel({}) user({}) template({})]",
                            channelCode, userId, template.getCode(), ex);
                }
            }
        } catch (Exception ex) {
            log.warn("[pushNotifyMessage][skip push because routing failed for user({}) template({})]",
                    userId, template.getCode(), ex);
        }
    }

    private SystemMessagePushRequest buildRequest(Long userId, Integer userType, String channelCode,
                                                  NotifyTemplateDO template, String templateContent,
                                                  Map<String, Object> templateParams) {
        SystemMessagePushRequest request = new SystemMessagePushRequest();
        request.setUserId(userId);
        request.setUserType(userType);
        request.setChannelCode(channelCode);
        request.setTemplateCode(template.getCode());
        request.setTemplateType(template.getType());
        request.setTitle(StrUtil.blankToDefault(template.getName(), template.getCode()));
        request.setContent(templateContent);
        request.setTemplateParams(templateParams);
        return request;
    }

    private boolean shouldPush(SystemMessagePushUserConfigDO userConfig, NotifyTemplateDO template) {
        if (StrUtil.startWithIgnoreCase(template.getCode(), STOCK_TEMPLATE_PREFIX)) {
            return Boolean.TRUE.equals(userConfig.getReceiveStockAlert());
        }
        if (NotifyTemplateTypeEnum.SYSTEM_MESSAGE.getType().equals(template.getType())) {
            return Boolean.TRUE.equals(userConfig.getReceiveSystemMessage());
        }
        if (NotifyTemplateTypeEnum.NOTIFICATION_MESSAGE.getType().equals(template.getType())) {
            return Boolean.TRUE.equals(userConfig.getReceiveNotificationMessage());
        }
        return false;
    }

    private boolean isGlobalEnabled() {
        String configValue = configApi.getConfigValueByKey(GLOBAL_ENABLED_KEY);
        return !StrUtil.equalsAnyIgnoreCase(configValue, "false", "0", "off");
    }

    private List<String> getEnabledChannels() {
        String configValue = configApi.getConfigValueByKey(GLOBAL_ENABLED_CHANNELS_KEY);
        if (StrUtil.isBlank(configValue)) {
            return Collections.singletonList(BARK_CHANNEL_CODE);
        }
        return Arrays.stream(configValue.split(","))
                .map(String::trim)
                .filter(StrUtil::isNotBlank)
                .collect(Collectors.toList());
    }
}
