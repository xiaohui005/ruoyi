package cn.iocoder.yudao.module.system.service.messagepush.dto;

import lombok.Data;

import java.util.Map;

@Data
public class SystemMessagePushRequest {

    private Long userId;

    private Integer userType;

    private String channelCode;

    private String templateCode;

    private Integer templateType;

    private String title;

    private String content;

    private Map<String, Object> templateParams;
}
