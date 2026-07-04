package cn.iocoder.yudao.module.system.service.ai;

import lombok.Data;

@Data
public class CodexTomlConfig {

    private String modelProvider;
    private String model;
    private String modelReasoningEffort;
    private Boolean disableResponseStorage = false;

    private String name;
    private String baseUrl;
    private String wireApi;
    private Boolean requiresOpenAiAuth = false;
    private String envKey;
}
