package cn.iocoder.yudao.module.system.service.ai;

import cn.iocoder.yudao.framework.common.util.http.HttpUtils;
import cn.iocoder.yudao.framework.test.core.ut.BaseMockitoUnitTest;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexChatRespVO;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexConfigRespVO;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mockStatic;

class CodexAiServiceTest extends BaseMockitoUnitTest {

    @Test
    void getConfig_shouldExposeSafeRuntimeConfig() throws Exception {
        Path configPath = createConfigFile();
        CodexAiService service = new CodexAiService(configPath, key -> "sk-test");

        CodexConfigRespVO config = service.getConfig();

        assertEquals("crs", config.getProvider());
        assertEquals("gpt-5.4", config.getModel());
        assertEquals("responses", config.getWireApi());
        assertTrue(config.getApiKeyConfigured());
    }

    @Test
    void chat_shouldSendResponsesRequestAndReadOutputText() throws Exception {
        Path configPath = createConfigFile();
        CodexAiService service = new CodexAiService(configPath, key -> "sk-test");
        try (MockedStatic<HttpUtils> httpUtilsMock = mockStatic(HttpUtils.class)) {
            httpUtilsMock.when(() -> HttpUtils.post(anyString(), anyMap(), anyString()))
                    .thenReturn("{\"id\":\"resp_1\",\"model\":\"gpt-5.4\",\"output_text\":\"hello from codex\"}");

            CodexChatRespVO response = service.chat("hello");

            assertEquals("gpt-5.4", response.getModel());
            assertEquals("hello from codex", response.getContent());
        }
    }

    @Test
    void chat_shouldFallbackToNestedOutputContent() throws Exception {
        Path configPath = createConfigFile();
        CodexAiService service = new CodexAiService(configPath, key -> "sk-test");
        try (MockedStatic<HttpUtils> httpUtilsMock = mockStatic(HttpUtils.class)) {
            httpUtilsMock.when(() -> HttpUtils.post(anyString(), anyMap(), anyString()))
                    .thenReturn("{\"id\":\"resp_2\",\"model\":\"gpt-5.4\",\"output\":[{\"type\":\"message\",\"content\":[{\"type\":\"output_text\",\"text\":\"nested answer\"}]}]}");

            CodexChatRespVO response = service.chat("hello");

            assertEquals("nested answer", response.getContent());
        }
    }

    private static Path createConfigFile() throws Exception {
        String toml = ""
                + "model_provider = \"crs\"\n"
                + "model = \"gpt-5.4\"\n"
                + "model_reasoning_effort = \"high\"\n"
                + "disable_response_storage = true\n"
                + "\n"
                + "[model_providers.crs]\n"
                + "base_url = \"https://codex.okksports.com/v1\"\n"
                + "wire_api = \"responses\"\n"
                + "requires_openai_auth = true\n"
                + "env_key = \"CRS_OAI_KEY\"\n";
        Path file = Files.createTempFile("codex-config", ".toml");
        Files.write(file, toml.getBytes(StandardCharsets.UTF_8));
        return file;
    }
}
