package cn.iocoder.yudao.module.system.service.ai;

import cn.hutool.core.util.StrUtil;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

public final class CodexTomlParser {

    private CodexTomlParser() {
    }

    public static CodexTomlConfig parse(Path path) throws IOException {
        return parse(new String(Files.readAllBytes(path), StandardCharsets.UTF_8));
    }

    public static CodexTomlConfig parse(String toml) {
        Map<String, String> root = new HashMap<>();
        Map<String, Map<String, String>> sections = new HashMap<>();
        String currentSection = null;
        for (String rawLine : toml.split("\\r?\\n")) {
            String line = stripInlineComment(rawLine).trim();
            if (line.isEmpty()) {
                continue;
            }
            if (line.startsWith("[") && line.endsWith("]")) {
                currentSection = line.substring(1, line.length() - 1).trim();
                continue;
            }
            int separatorIndex = line.indexOf('=');
            if (separatorIndex < 0) {
                continue;
            }
            String key = line.substring(0, separatorIndex).trim();
            String value = parseValue(line.substring(separatorIndex + 1).trim());
            if (currentSection == null) {
                root.put(key, value);
            } else {
                sections.computeIfAbsent(currentSection, ignored -> new HashMap<>()).put(key, value);
            }
        }

        CodexTomlConfig config = new CodexTomlConfig();
        config.setModelProvider(root.get("model_provider"));
        config.setModel(root.get("model"));
        config.setModelReasoningEffort(root.get("model_reasoning_effort"));
        config.setDisableResponseStorage(parseBoolean(root.get("disable_response_storage")));

        String providerSection = StrUtil.isBlank(config.getModelProvider())
                ? null
                : "model_providers." + config.getModelProvider();
        Map<String, String> providerConfig = providerSection == null
                ? new HashMap<String, String>()
                : sections.getOrDefault(providerSection, new HashMap<String, String>());
        config.setName(providerConfig.get("name"));
        config.setBaseUrl(providerConfig.get("base_url"));
        config.setWireApi(providerConfig.get("wire_api"));
        config.setRequiresOpenAiAuth(parseBoolean(providerConfig.get("requires_openai_auth")));
        config.setEnvKey(providerConfig.get("env_key"));
        return config;
    }

    private static String stripInlineComment(String line) {
        boolean inQuotes = false;
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < line.length(); i++) {
            char current = line.charAt(i);
            if (current == '"' && (i == 0 || line.charAt(i - 1) != '\\')) {
                inQuotes = !inQuotes;
            }
            if (!inQuotes && current == '#') {
                break;
            }
            builder.append(current);
        }
        return builder.toString();
    }

    private static String parseValue(String rawValue) {
        if (rawValue.length() >= 2 && rawValue.startsWith("\"") && rawValue.endsWith("\"")) {
            return rawValue.substring(1, rawValue.length() - 1)
                    .replace("\\\"", "\"")
                    .replace("\\\\", "\\");
        }
        return rawValue;
    }

    private static Boolean parseBoolean(String value) {
        return "true".equalsIgnoreCase(value);
    }
}
