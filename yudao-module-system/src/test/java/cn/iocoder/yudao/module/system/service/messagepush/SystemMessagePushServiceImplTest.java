package cn.iocoder.yudao.module.system.service.messagepush;

import cn.iocoder.yudao.framework.common.enums.UserTypeEnum;
import cn.iocoder.yudao.framework.test.core.ut.BaseMockitoUnitTest;
import cn.iocoder.yudao.module.infra.api.config.ConfigApi;
import cn.iocoder.yudao.module.system.dal.dataobject.notify.NotifyTemplateDO;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.dal.mysql.messagepush.SystemMessagePushUserConfigMapper;
import cn.iocoder.yudao.module.system.enums.notify.NotifyTemplateTypeEnum;
import cn.iocoder.yudao.module.system.service.messagepush.sender.SystemMessagePushSenderFactory;
import cn.iocoder.yudao.module.system.service.messagepush.sender.SystemMessagePushSender;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.randomLongId;
import static cn.iocoder.yudao.framework.test.core.util.RandomUtils.randomPojo;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

class SystemMessagePushServiceImplTest extends BaseMockitoUnitTest {

    @InjectMocks
    private SystemMessagePushServiceImpl systemMessagePushService;

    @Mock
    private ConfigApi configApi;
    @Mock
    private SystemMessagePushUserConfigMapper userConfigMapper;
    @Mock
    private SystemMessagePushSenderFactory systemMessagePushSenderFactory;
    @Mock
    private SystemMessagePushSender barkSystemMessagePushSender;

    @Test
    void testPushNotifyMessage_skipWhenGlobalDisabled() {
        Long userId = randomLongId();
        NotifyTemplateDO template = randomPojo(NotifyTemplateDO.class, o -> {
            o.setCode("STOCK_ALERT_DEFAULT");
            o.setType(NotifyTemplateTypeEnum.NOTIFICATION_MESSAGE.getType());
        });
        when(configApi.getConfigValueByKey(SystemMessagePushServiceImpl.GLOBAL_ENABLED_KEY)).thenReturn("false");

        systemMessagePushService.pushNotifyMessage(userId, UserTypeEnum.ADMIN.getValue(), template,
                "content", Collections.emptyMap());

        verify(userConfigMapper, never()).selectByUserIdAndChannelCode(any(), any());
        verifyNoInteractions(barkSystemMessagePushSender);
    }

    @Test
    void testPushNotifyMessage_skipWhenUserBarkDisabled() {
        Long userId = randomLongId();
        NotifyTemplateDO template = randomPojo(NotifyTemplateDO.class, o -> {
            o.setCode("STOCK_ALERT_DEFAULT");
            o.setType(NotifyTemplateTypeEnum.NOTIFICATION_MESSAGE.getType());
        });
        SystemMessagePushUserConfigDO config = randomPojo(SystemMessagePushUserConfigDO.class, o -> {
            o.setUserId(userId);
            o.setChannelCode("BARK");
            o.setEnabled(false);
        });
        mockGlobalDefaults();
        when(userConfigMapper.selectByUserIdAndChannelCode(userId, "BARK")).thenReturn(config);

        systemMessagePushService.pushNotifyMessage(userId, UserTypeEnum.ADMIN.getValue(), template,
                "content", Collections.emptyMap());

        verifyNoInteractions(barkSystemMessagePushSender);
    }

    @Test
    void testPushNotifyMessage_sendStockAlertWhenSubscribed() {
        Long userId = randomLongId();
        NotifyTemplateDO template = randomPojo(NotifyTemplateDO.class, o -> {
            o.setCode("STOCK_ALERT_DEFAULT");
            o.setName("Stock Alert");
            o.setType(NotifyTemplateTypeEnum.NOTIFICATION_MESSAGE.getType());
        });
        SystemMessagePushUserConfigDO config = randomPojo(SystemMessagePushUserConfigDO.class, o -> {
            o.setUserId(userId);
            o.setChannelCode("BARK");
            o.setEnabled(true);
            o.setReceiveStockAlert(true);
            o.setReceiveNotificationMessage(false);
            o.setReceiveSystemMessage(false);
        });
        mockGlobalDefaults();
        when(userConfigMapper.selectByUserIdAndChannelCode(userId, "BARK")).thenReturn(config);
        when(systemMessagePushSenderFactory.getSender("BARK")).thenReturn(barkSystemMessagePushSender);

        systemMessagePushService.pushNotifyMessage(userId, UserTypeEnum.ADMIN.getValue(), template,
                "stock content", Collections.singletonMap("symbol", "600519.SH"));

        verify(barkSystemMessagePushSender).send(eq(config), any());
    }

    @Test
    void testPushNotifyMessage_sendSystemMessageWhenSubscribed() {
        Long userId = randomLongId();
        NotifyTemplateDO template = randomPojo(NotifyTemplateDO.class, o -> {
            o.setCode("SYSTEM_LOGIN_NOTICE");
            o.setName("System Notice");
            o.setType(NotifyTemplateTypeEnum.SYSTEM_MESSAGE.getType());
        });
        SystemMessagePushUserConfigDO config = randomPojo(SystemMessagePushUserConfigDO.class, o -> {
            o.setUserId(userId);
            o.setChannelCode("BARK");
            o.setEnabled(true);
            o.setReceiveStockAlert(false);
            o.setReceiveNotificationMessage(false);
            o.setReceiveSystemMessage(true);
        });
        mockGlobalDefaults();
        when(userConfigMapper.selectByUserIdAndChannelCode(userId, "BARK")).thenReturn(config);
        when(systemMessagePushSenderFactory.getSender("BARK")).thenReturn(barkSystemMessagePushSender);

        systemMessagePushService.pushNotifyMessage(userId, UserTypeEnum.ADMIN.getValue(), template,
                "system content", Collections.<String, Object>singletonMap("title", "hello"));

        verify(barkSystemMessagePushSender).send(eq(config), any());
    }

    private void mockGlobalDefaults() {
        when(configApi.getConfigValueByKey(SystemMessagePushServiceImpl.GLOBAL_ENABLED_KEY)).thenReturn("true");
        when(configApi.getConfigValueByKey(SystemMessagePushServiceImpl.GLOBAL_ENABLED_CHANNELS_KEY)).thenReturn("BARK");
    }
}
