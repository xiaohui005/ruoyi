package cn.iocoder.yudao.module.stock.service.data.provider;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import cn.iocoder.yudao.module.stock.service.data.dto.StockMarketOverviewDTO;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Compatible fallback market-data provider.
 */
@Component
public class AktoolsStockDataProvider implements StockDataProvider {

    private static final Logger log = LoggerFactory.getLogger(AktoolsStockDataProvider.class);
    private static final String DEFAULT_EM_BASE_URL = "https://push2.eastmoney.com";
    private static final String DEFAULT_EM_HISTORY_URL = "https://push2his.eastmoney.com";
    private static final String DEFAULT_TENCENT_HISTORY_URL = "https://web.ifzq.gtimg.cn/appstock/app/fqkline/get";
    private static final String DEFAULT_TENCENT_QUOTE_URL = "https://qt.gtimg.cn/q=";

    @Resource
    private RestTemplate restTemplate;
    @Resource
    private StockProperties stockProperties;

    @Override
    public String providerCode() {
        return "aktools";
    }

    @Override
    public StockMarketOverviewDTO fetchMarketOverview() {
        try {
            String indexUrl = DEFAULT_EM_BASE_URL
                    + "/api/qt/ulist.np/get?fltt=2&invt=2&secids=1.000001&fields=f2,f3,f12,f14";
            JsonNode indexRoot = JsonUtils.parseTree(restTemplate.getForObject(indexUrl, String.class));
            JsonNode indexData = indexRoot.path("data").path("diff");
            if (!indexData.isArray() || indexData.size() == 0) {
                return null;
            }

            String marketUrl = DEFAULT_EM_BASE_URL
                    + "/api/qt/clist/get?pn=1&pz=5000&po=1&np=1&fltt=2&invt=2&fid=f3"
                    + "&fs=m:0+t:6,m:0+t:80,m:1+t:2,m:1+t:23&fields=f2,f3,f6,f12,f14";
            JsonNode marketRoot = JsonUtils.parseTree(restTemplate.getForObject(marketUrl, String.class));
            JsonNode diff = marketRoot.path("data").path("diff");
            if (!diff.isArray() || diff.size() == 0) {
                return null;
            }

            int risingCount = 0;
            int fallingCount = 0;
            int limitUpCount = 0;
            int limitDownCount = 0;
            BigDecimal turnoverAmount = BigDecimal.ZERO;
            String hotTheme = null;
            BigDecimal hottestChangePct = null;
            for (JsonNode item : diff) {
                BigDecimal changePct = parseDecimal(item.get("f3"));
                BigDecimal amount = parseDecimal(item.get("f6"));
                if (amount != null) {
                    turnoverAmount = turnoverAmount.add(amount);
                }
                if (changePct == null) {
                    continue;
                }
                if (changePct.compareTo(BigDecimal.ZERO) > 0) {
                    risingCount++;
                } else if (changePct.compareTo(BigDecimal.ZERO) < 0) {
                    fallingCount++;
                }
                if (changePct.compareTo(BigDecimal.valueOf(9.7)) >= 0) {
                    limitUpCount++;
                }
                if (changePct.compareTo(BigDecimal.valueOf(-9.7)) <= 0) {
                    limitDownCount++;
                }
                if (hottestChangePct == null || changePct.compareTo(hottestChangePct) > 0) {
                    hottestChangePct = changePct;
                    hotTheme = JsonUtils.getText(item, "f14");
                }
            }

            JsonNode index = indexData.get(0);
            StockMarketOverviewDTO dto = new StockMarketOverviewDTO();
            dto.setTradeDate(LocalDate.now());
            dto.setSnapshotTime(LocalDateTime.now());
            dto.setIndexCode(JsonUtils.getText(index, "f12"));
            dto.setIndexName(JsonUtils.getText(index, "f14"));
            dto.setIndexClose(parseDecimal(index.get("f2")));
            dto.setIndexChangePct(parseDecimal(index.get("f3")));
            dto.setTurnoverAmount(turnoverAmount);
            dto.setTurnoverRatio(calculateTurnoverRatio(turnoverAmount, diff.size()));
            dto.setLimitUpCount(limitUpCount);
            dto.setLimitDownCount(limitDownCount);
            dto.setRisingCount(risingCount);
            dto.setFallingCount(fallingCount);
            dto.setHotTheme(hotTheme);
            dto.setThemeLimitUpCount(limitUpCount > 0 && StrUtil.isNotBlank(hotTheme) ? Math.min(limitUpCount, 5) : 0);
            dto.setSourceName(providerCode());
            dto.setRawPayload(marketRoot.toString());
            return dto;
        } catch (Exception ex) {
            log.warn("[fetchMarketOverview][fallback provider market overview failed]", ex);
            return null;
        }
    }

    @Override
    public List<StockDailyKLineDTO> fetchDailyKLine(String symbol, Integer limit) {
        List<StockDailyKLineDTO> eastMoneyResult = fetchDailyKLineFromEastMoney(symbol, limit);
        if (!eastMoneyResult.isEmpty()) {
            return eastMoneyResult;
        }
        return fetchDailyKLineFromTencent(symbol, limit);
    }

    private List<StockDailyKLineDTO> fetchDailyKLineFromEastMoney(String symbol, Integer limit) {
        try {
            String secId = convertSecId(symbol);
            String url = DEFAULT_EM_HISTORY_URL + "/api/qt/stock/kline/get?secid=" + secId
                    + "&ut=fa5fd1943c7b386f172d6893dbfba10b&fields1=f1,f2,f3,f4,f5,f6"
                    + "&fields2=f51,f52,f53,f54,f55,f56,f57,f58,f59,f60,f61"
                    + "&klt=101&fqt=1&end=20500000&lmt=" + (limit == null ? 120 : limit);
            JsonNode root = JsonUtils.parseTree(restTemplate.getForObject(url, String.class));
            JsonNode data = root.path("data");
            JsonNode klines = data.path("klines");
            if (!klines.isArray() || klines.size() == 0) {
                return Collections.emptyList();
            }
            String stockName = JsonUtils.getText(data, "name");
            List<StockDailyKLineDTO> result = new ArrayList<>();
            for (JsonNode line : klines) {
                String[] columns = line.asText().split(",");
                if (columns.length < 10) {
                    continue;
                }
                StockDailyKLineDTO dto = new StockDailyKLineDTO();
                dto.setSymbol(StockSymbolUtils.normalize(symbol));
                dto.setTradeDate(LocalDate.parse(columns[0]));
                dto.setOpenPrice(parseDecimal(columns[1]));
                dto.setClosePrice(parseDecimal(columns[2]));
                dto.setHighPrice(parseDecimal(columns[3]));
                dto.setLowPrice(parseDecimal(columns[4]));
                dto.setVolume(parseDecimal(columns[5]));
                dto.setTurnoverAmount(parseDecimal(columns[6]));
                dto.setChangePct(parseDecimal(columns[8]));
                dto.setSourceName(providerCode());
                result.add(dto);
            }
            if (StrUtil.isNotBlank(stockName) && !result.isEmpty()) {
                result.get(result.size() - 1).setSourceName(providerCode() + ":" + stockName);
            }
            return result;
        } catch (Exception ex) {
            log.warn("[fetchDailyKLine][eastmoney kline fetch failed for {}]", symbol, ex);
            return Collections.emptyList();
        }
    }

    private List<StockDailyKLineDTO> fetchDailyKLineFromTencent(String symbol, Integer limit) {
        try {
            String tencentSymbol = convertTencentSymbol(symbol);
            String url = DEFAULT_TENCENT_HISTORY_URL + "?param=" + tencentSymbol
                    + ",day,,," + (limit == null ? 120 : limit) + ",qfq";
            JsonNode root = JsonUtils.parseTree(restTemplate.getForObject(url, String.class));
            JsonNode stockNode = root.path("data").path(tencentSymbol);
            JsonNode qfqday = stockNode.path("qfqday");
            JsonNode dayData = qfqday.isArray() && qfqday.size() > 0 ? qfqday : stockNode.path("day");
            if (!dayData.isArray() || dayData.size() == 0) {
                return Collections.emptyList();
            }
            String stockName = readTencentStockName(stockNode, tencentSymbol);
            List<StockDailyKLineDTO> result = new ArrayList<>();
            BigDecimal previousClose = null;
            for (JsonNode line : dayData) {
                if (!line.isArray() || line.size() < 6) {
                    continue;
                }
                StockDailyKLineDTO dto = new StockDailyKLineDTO();
                dto.setSymbol(StockSymbolUtils.normalize(symbol));
                dto.setTradeDate(LocalDate.parse(line.get(0).asText()));
                dto.setOpenPrice(parseDecimal(line.get(1).asText()));
                dto.setClosePrice(parseDecimal(line.get(2).asText()));
                dto.setHighPrice(parseDecimal(line.get(3).asText()));
                dto.setLowPrice(parseDecimal(line.get(4).asText()));
                dto.setVolume(parseDecimal(line.get(5).asText()));
                dto.setPreClosePrice(previousClose);
                if (previousClose != null && previousClose.compareTo(BigDecimal.ZERO) > 0
                        && dto.getClosePrice() != null) {
                    dto.setChangePct(dto.getClosePrice().subtract(previousClose)
                            .multiply(BigDecimal.valueOf(100))
                            .divide(previousClose, 4, RoundingMode.HALF_UP));
                }
                dto.setSourceName(providerCode());
                result.add(dto);
                previousClose = dto.getClosePrice();
            }
            if (StrUtil.isNotBlank(stockName) && !result.isEmpty()) {
                result.get(result.size() - 1).setSourceName(providerCode() + ":" + stockName);
            }
            return result;
        } catch (Exception ex) {
            log.warn("[fetchDailyKLine][tencent kline fallback failed for {}]", symbol, ex);
            return Collections.emptyList();
        }
    }

    @Override
    public String fetchStockName(String symbol) {
        String eastMoneyName = fetchStockNameFromEastMoney(symbol);
        if (StrUtil.isNotBlank(eastMoneyName)) {
            return eastMoneyName;
        }
        return fetchStockNameFromTencent(symbol);
    }

    private String fetchStockNameFromEastMoney(String symbol) {
        try {
            String secId = convertSecId(symbol);
            String url = DEFAULT_EM_BASE_URL + "/api/qt/stock/get?secid=" + secId + "&fields=f58";
            JsonNode root = JsonUtils.parseTree(restTemplate.getForObject(url, String.class));
            return JsonUtils.getText(root.path("data"), "f58");
        } catch (Exception ex) {
            log.warn("[fetchStockName][eastmoney name fetch failed for {}]", symbol, ex);
            return null;
        }
    }

    private String fetchStockNameFromTencent(String symbol) {
        try {
            String response = restTemplate.getForObject(DEFAULT_TENCENT_QUOTE_URL + convertTencentSymbol(symbol), String.class);
            if (StrUtil.isBlank(response)) {
                return null;
            }
            String[] segments = response.split("~");
            return segments.length > 1 ? segments[1] : null;
        } catch (Exception ex) {
            log.warn("[fetchStockName][tencent name fallback failed for {}]", symbol, ex);
            return null;
        }
    }

    private String convertSecId(String symbol) {
        String normalized = StockSymbolUtils.normalize(symbol);
        if (normalized.endsWith(".SH")) {
            return "1." + StrUtil.subBefore(normalized, ".", false);
        }
        if (normalized.endsWith(".SZ")) {
            return "0." + StrUtil.subBefore(normalized, ".", false);
        }
        if (normalized.endsWith(".BJ")) {
            return "0." + StrUtil.subBefore(normalized, ".", false);
        }
        return normalized;
    }

    private String convertTencentSymbol(String symbol) {
        String normalized = StockSymbolUtils.normalize(symbol);
        String code = StrUtil.subBefore(normalized, ".", false);
        if (normalized.endsWith(".SH")) {
            return "sh" + code;
        }
        if (normalized.endsWith(".SZ")) {
            return "sz" + code;
        }
        if (normalized.endsWith(".BJ")) {
            return "bj" + code;
        }
        return normalized.toLowerCase();
    }

    private String readTencentStockName(JsonNode stockNode, String tencentSymbol) {
        JsonNode quoteNode = stockNode.path("qt").path(tencentSymbol);
        if (quoteNode.isArray() && quoteNode.size() > 1) {
            return quoteNode.get(1).asText();
        }
        return null;
    }

    private BigDecimal parseDecimal(JsonNode node) {
        if (node == null || node.isNull()) {
            return null;
        }
        return parseDecimal(node.asText());
    }

    private BigDecimal parseDecimal(String value) {
        if (StrUtil.isBlank(value) || StrUtil.equalsAny(value, "-", "--")) {
            return null;
        }
        return new BigDecimal(value.trim());
    }

    private BigDecimal calculateTurnoverRatio(BigDecimal turnoverAmount, int stockCount) {
        if (turnoverAmount == null || stockCount <= 0) {
            return BigDecimal.ONE;
        }
        BigDecimal divisor = BigDecimal.valueOf(stockCount).multiply(BigDecimal.valueOf(1_000_000L));
        if (divisor.compareTo(BigDecimal.ZERO) == 0) {
            return BigDecimal.ONE;
        }
        return turnoverAmount.divide(divisor, 4, RoundingMode.HALF_UP);
    }
}
