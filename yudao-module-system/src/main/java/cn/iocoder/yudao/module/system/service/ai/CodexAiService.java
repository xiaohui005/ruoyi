package cn.iocoder.yudao.module.system.service.ai;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.http.HttpUtils;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexChatRespVO;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexConfigRespVO;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Function;

@Service
@Slf4j
public class CodexAiService {

    static final Path DEFAULT_CONFIG_PATH = Paths.get(System.getProperty("user.home"), ".codex", "config.toml");

    private final Path configPath;
    private final Function<String, String> envReader;

    public CodexAiService() {
        this(DEFAULT_CONFIG_PATH, System::getenv);
    }

    CodexAiService(Path configPath, Function<String, String> envReader) {
        this.configPath = configPath;
        this.envReader = envReader;
    }

    public CodexConfigRespVO getConfig() throws IOException {
        CodexTomlConfig config = loadConfig();
        return new CodexConfigRespVO()
                .setProvider(config.getModelProvider())
                .setModel(config.getModel())
                .setBaseUrl(config.getBaseUrl())
                .setWireApi(config.getWireApi())
                .setEnvKey(config.getEnvKey())
                .setReasoningEffort(config.getModelReasoningEffort())
                .setApiKeyConfigured(StrUtil.isNotBlank(resolveApiKey(config)));
    }

    public CodexChatRespVO chat(String prompt) throws IOException {
        if (StrUtil.isBlank(prompt)) {
            throw new IllegalArgumentException("prompt 不能为空");
        }

        CodexTomlConfig config = loadConfig();
        if (!"responses".equalsIgnoreCase(config.getWireApi())) {
            throw new IllegalStateException("当前 Codex wire_api 不是 responses");
        }
        String apiKey = resolveApiKey(config);
        if (StrUtil.isBlank(apiKey)) {
            throw new IllegalStateException("未读取到 Codex API Key，请检查环境变量 " + config.getEnvKey());
        }
        if (StrUtil.isBlank(config.getBaseUrl()) || StrUtil.isBlank(config.getModel())) {
            throw new IllegalStateException("Codex 配置不完整，请检查 config.toml");
        }

        Map<String, Object> requestBody = new LinkedHashMap<>();
        requestBody.put("model", config.getModel());
        requestBody.put("input", prompt);
        if (StrUtil.isNotBlank(config.getModelReasoningEffort())) {
            requestBody.put("reasoning", Collections.singletonMap("effort", config.getModelReasoningEffort()));
        }
        if (Boolean.TRUE.equals(config.getDisableResponseStorage())) {
            requestBody.put("store", false);
        }

        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("Authorization", "Bearer " + apiKey);
        headers.put("Content-Type", "application/json");

        String responseBody = HttpUtils.post(buildResponsesUrl(config.getBaseUrl()), headers,
                JsonUtils.toJsonString(requestBody));
        return new CodexChatRespVO()
                .setResponseId(JsonUtils.getText(JsonUtils.parseTree(responseBody), "id"))
                .setModel(JsonUtils.getText(JsonUtils.parseTree(responseBody), "model"))
                .setContent(extractOutputText(responseBody));
    }

    private CodexTomlConfig loadConfig() throws IOException {
        if (!configPath.toFile().exists()) {
            throw new IllegalStateException("未找到 Codex 配置文件: " + configPath);
        }
        return CodexTomlParser.parse(configPath);
    }

    private String resolveApiKey(CodexTomlConfig config) {
        if (StrUtil.isBlank(config.getEnvKey())) {
            return null;
        }
        return envReader.apply(config.getEnvKey());
    }

    private static String buildResponsesUrl(String baseUrl) {
        return StrUtil.removeSuffix(baseUrl, "/") + "/responses";
    }

    private static String extractOutputText(String responseBody) {
        JsonNode root = JsonUtils.parseTree(responseBody);
        String outputText = JsonUtils.getText(root, "output_text");
        if (StrUtil.isNotBlank(outputText)) {
            return outputText;
        }

        JsonNode outputArray = root.path("output");
        if (outputArray.isArray()) {
            for (JsonNode outputNode : outputArray) {
                JsonNode contentArray = outputNode.path("content");
                if (!contentArray.isArray()) {
                    continue;
                }
                for (JsonNode contentNode : contentArray) {
                    String text = JsonUtils.getText(contentNode, "text");
                    if (StrUtil.isNotBlank(text)) {
                        return text;
                    }
                }
            }
        }
        log.warn("Unable to extract Codex output text from response: {}", responseBody);
        throw new IllegalStateException("Codex 返回结果中没有可展示的文本");
    }
}
