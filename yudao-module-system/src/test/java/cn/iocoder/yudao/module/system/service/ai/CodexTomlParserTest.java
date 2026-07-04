package cn.iocoder.yudao.module.system.service.ai;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class CodexTomlParserTest {

    @Test
    void parse_shouldReadCurrentCodexFields() {
        String toml = ""
                + "model_provider = \"crs\"\n"
                + "model = \"gpt-5.4\"\n"
                + "model_reasoning_effort = \"high\"\n"
                + "disable_response_storage = true\n"
                + "\n"
                + "[model_providers.crs]\n"
                + "name = \"crs\"\n"
                + "base_url = \"https://codex.okksports.com/v1\"  # comment\n"
                + "wire_api = \"responses\"\n"
                + "requires_openai_auth = true\n"
                + "env_key = \"CRS_OAI_KEY\"\n";

        CodexTomlConfig config = CodexTomlParser.parse(toml);

        assertEquals("crs", config.getModelProvider());
        assertEquals("gpt-5.4", config.getModel());
        assertEquals("high", config.getModelReasoningEffort());
        assertEquals(true, config.getDisableResponseStorage());
        assertEquals("https://codex.okksports.com/v1", config.getBaseUrl());
        assertEquals("responses", config.getWireApi());
        assertEquals(true, config.getRequiresOpenAiAuth());
        assertEquals("CRS_OAI_KEY", config.getEnvKey());
    }
}
