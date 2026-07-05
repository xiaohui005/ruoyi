package cn.iocoder.yudao.module.stock.service.news;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.service.news.dto.StockNewsItemDTO;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import java.io.File;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class StockNewsServiceImpl implements StockNewsService {

    private static final Logger log = LoggerFactory.getLogger(StockNewsServiceImpl.class);

    private static final String NEWS_CACHE_KEY_PREFIX = "stock:news:";
    private static final String NEWS_SCRIPT_RELATIVE_PATH = "yudao-module-stock/scripts/stock_news_fetch.py";

    @Autowired(required = false)
    private StringRedisTemplate stringRedisTemplate;

    @Value("${stock.news.python-command:python}")
    private String pythonCommand;

    @Value("${stock.news.script-path:}")
    private String scriptPath;

    @Override
    public List<StockNewsItemDTO> getLatestNews(String symbol, Integer limit) {
        String normalized = StockSymbolUtils.normalize(symbol);
        int safeLimit = normalizeLimit(limit);
        List<StockNewsItemDTO> cached = getCachedNews(normalized, safeLimit);
        if (!cached.isEmpty()) {
            return cached;
        }
        try {
            String keyword = StrUtil.subBefore(normalized, ".", false);
            List<StockNewsItemDTO> result = fetchNewsByPython(normalized, keyword, safeLimit);
            cacheNews(normalized, safeLimit, result);
            return result;
        } catch (Exception ex) {
            log.warn("[getLatestNews][fetch stock news failed for {}]", normalized, ex);
            return new ArrayList<>();
        }
    }

    private List<StockNewsItemDTO> fetchNewsByPython(String symbol, String keyword, int limit) throws Exception {
        Path script = resolveScriptPath();
        if (script == null) {
            log.warn("[fetchNewsByPython][news script not found, symbol={}]", symbol);
            return new ArrayList<>();
        }
        ProcessBuilder processBuilder = new ProcessBuilder(
                pythonCommand,
                "-X", "utf8",
                script.toString(),
                keyword,
                String.valueOf(limit)
        );
        processBuilder.directory(new File(System.getProperty("user.dir")));
        processBuilder.redirectErrorStream(true);
        processBuilder.environment().put("PYTHONUTF8", "1");
        Process process = processBuilder.start();
        String output;
        try {
            output = StreamUtils.copyToString(process.getInputStream(), StandardCharsets.UTF_8);
        } finally {
            process.getInputStream().close();
        }
        int exitCode = process.waitFor();
        if (exitCode != 0) {
            log.warn("[fetchNewsByPython][python script failed, symbol={}, exitCode={}, output={}]",
                    symbol, exitCode, StrUtil.maxLength(output, 1000));
            return new ArrayList<>();
        }
        if (StrUtil.isBlank(output)) {
            return new ArrayList<>();
        }
        List<StockNewsItemDTO> result = JsonUtils.parseArray(output.trim(), StockNewsItemDTO.class);
        List<StockNewsItemDTO> normalizedList = new ArrayList<>();
        for (StockNewsItemDTO dto : result) {
            if (dto == null || StrUtil.isBlank(dto.getTitle())) {
                continue;
            }
            dto.setSymbol(symbol);
            dto.setTitle(cleanHtmlTag(dto.getTitle()));
            dto.setContent(cleanHtmlTag(dto.getContent()));
            normalizedList.add(dto);
        }
        return normalizedList;
    }

    private Path resolveScriptPath() {
        if (StrUtil.isNotBlank(scriptPath)) {
            Path configuredPath = Paths.get(scriptPath).toAbsolutePath().normalize();
            if (Files.exists(configuredPath)) {
                return configuredPath;
            }
        }
        Path userDir = Paths.get(System.getProperty("user.dir")).toAbsolutePath().normalize();
        Path directPath = userDir.resolve(NEWS_SCRIPT_RELATIVE_PATH).normalize();
        if (Files.exists(directPath)) {
            return directPath;
        }
        Path parentPath = userDir.resolve("..").resolve(NEWS_SCRIPT_RELATIVE_PATH).normalize();
        if (Files.exists(parentPath)) {
            return parentPath;
        }
        return null;
    }

    private String cleanHtmlTag(String text) {
        if (StrUtil.isBlank(text)) {
            return text;
        }
        return text.replace("<em>", "")
                .replace("</em>", "")
                .replace("(<em>", "")
                .replace("</em>)", "")
                .replace("\\u3000", "")
                .replace("\u3000", "")
                .replace("\r\n", " ")
                .trim();
    }

    private int normalizeLimit(Integer limit) {
        if (limit == null) {
            return 10;
        }
        return Math.max(1, Math.min(limit, 20));
    }

    private List<StockNewsItemDTO> getCachedNews(String symbol, int limit) {
        if (stringRedisTemplate == null) {
            return new ArrayList<>();
        }
        String value = stringRedisTemplate.opsForValue().get(buildCacheKey(symbol, limit));
        return StrUtil.isBlank(value) ? new ArrayList<>() : JsonUtils.parseArray(value, StockNewsItemDTO.class);
    }

    private void cacheNews(String symbol, int limit, List<StockNewsItemDTO> newsList) {
        if (stringRedisTemplate == null || newsList == null || newsList.isEmpty()) {
            return;
        }
        stringRedisTemplate.opsForValue().set(buildCacheKey(symbol, limit),
                JsonUtils.toJsonString(newsList), Duration.ofMinutes(10));
    }

    private String buildCacheKey(String symbol, int limit) {
        return NEWS_CACHE_KEY_PREFIX + symbol + ":" + limit;
    }
}
