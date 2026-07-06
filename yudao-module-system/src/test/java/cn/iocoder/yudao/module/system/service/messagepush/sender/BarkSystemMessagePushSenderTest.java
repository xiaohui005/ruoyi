package cn.iocoder.yudao.module.system.service.messagepush.sender;

import cn.iocoder.yudao.framework.test.core.ut.BaseMockitoUnitTest;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.service.messagepush.dto.SystemMessagePushRequest;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.web.client.RestTemplate;

import java.net.URI;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;

class BarkSystemMessagePushSenderTest extends BaseMockitoUnitTest {

    @InjectMocks
    private BarkSystemMessagePushSender sender;

    @Mock
    private RestTemplate restTemplate;

    @Test
    void send_shouldEncodeChineseQueryParams() {
        SystemMessagePushUserConfigDO userConfig = new SystemMessagePushUserConfigDO();
        userConfig.setEndpoint("https://api.day.app");
        userConfig.setSecretKey("wjX4kyt8kcgSCGwRJAafh9");
        userConfig.setConfigJson("{\"group\":\"" + chineseGroup() + "\",\"url\":\"https://example.com/detail?symbol=600519&tab=alert\"}");

        SystemMessagePushRequest request = new SystemMessagePushRequest();
        request.setTemplateCode("STOCK_ALERT_TEST");
        request.setTitle(chineseTitle());
        request.setContent(chineseContent());

        sender.send(userConfig, request);

        ArgumentCaptor<URI> uriCaptor = ArgumentCaptor.forClass(URI.class);
        verify(restTemplate).getForObject(uriCaptor.capture(), eq(String.class));
        String uri = uriCaptor.getValue().toString();
        assertTrue(uri.contains("title=%E8%82%A1%E7%A5%A8%E6%8E%A8%E9%80%81%E6%B5%8B%E8%AF%95"));
        assertTrue(uri.contains("group=%E8%82%A1%E7%A5%A8%E6%8F%90%E9%86%92"));
        assertTrue(uri.contains("url=https%3A%2F%2Fexample.com%2Fdetail%3Fsymbol%3D600519%26tab%3Dalert"));
    }

    private static String chineseGroup() {
        return fromCodePoints(32929, 31080, 25552, 37266);
    }

    private static String chineseTitle() {
        return fromCodePoints(32929, 31080, 25512, 36865, 27979, 35797);
    }

    private static String chineseContent() {
        return fromCodePoints(32929, 31080, 32, 54, 48, 48, 53, 49, 57, 32,
                35302, 21457, 25552, 37266, 65292, 20215, 26684, 32, 49, 48, 48);
    }

    private static String fromCodePoints(int... codePoints) {
        return new String(codePoints, 0, codePoints.length);
    }
}
