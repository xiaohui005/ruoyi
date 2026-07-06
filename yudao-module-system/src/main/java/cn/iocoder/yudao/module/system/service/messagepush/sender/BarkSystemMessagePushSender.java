package cn.iocoder.yudao.module.system.service.messagepush.sender;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.system.dal.dataobject.messagepush.SystemMessagePushUserConfigDO;
import cn.iocoder.yudao.module.system.service.messagepush.dto.SystemMessagePushRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.springframework.web.util.UriUtils;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Component
public class BarkSystemMessagePushSender implements SystemMessagePushSender {

    private static final String DEFAULT_SERVER_URL = "https://api.day.app";

    @Resource
    private RestTemplate restTemplate;

    @Override
    public String channelCode() {
        return "BARK";
    }

    @Override
    public void send(SystemMessagePushUserConfigDO userConfig, SystemMessagePushRequest request) {
        String serverUrl = StrUtil.blankToDefault(userConfig.getEndpoint(), DEFAULT_SERVER_URL);
        String deviceKey = UriUtils.encodePathSegment(userConfig.getSecretKey(), StandardCharsets.UTF_8);
        String content = UriUtils.encodePathSegment(StrUtil.blankToDefault(request.getContent(), "-"), StandardCharsets.UTF_8);
        UriComponentsBuilder builder = UriComponentsBuilder.fromHttpUrl(serverUrl)
                .pathSegment(deviceKey, content)
                .queryParam("title", encodeQueryParam(StrUtil.blankToDefault(request.getTitle(), request.getTemplateCode())));
        Map<String, Object> extraConfig = JsonUtils.parseMap(userConfig.getConfigJson());
        appendIfPresent(builder, "group", extraConfig != null ? extraConfig.get("group") : null);
        appendIfPresent(builder, "icon", extraConfig != null ? extraConfig.get("icon") : null);
        appendIfPresent(builder, "sound", extraConfig != null ? extraConfig.get("sound") : null);
        appendIfPresent(builder, "url", extraConfig != null ? extraConfig.get("url") : null);
        restTemplate.getForObject(builder.build(true).toUri(), String.class);
    }

    private void appendIfPresent(UriComponentsBuilder builder, String key, Object value) {
        if (value != null && StrUtil.isNotBlank(String.valueOf(value))) {
            builder.queryParam(key, encodeQueryParam(String.valueOf(value)));
        }
    }

    private String encodeQueryParam(String value) {
        return UriUtils.encodeQueryParam(value, StandardCharsets.UTF_8);
    }
}
