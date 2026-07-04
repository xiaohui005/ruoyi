package cn.iocoder.yudao.module.system.controller.admin.ai.vo;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CodexConfigRespVO {

    private String provider;
    private String model;
    private String baseUrl;
    private String wireApi;
    private String envKey;
    private String reasoningEffort;
    private Boolean apiKeyConfigured;
}
