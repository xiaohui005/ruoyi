package cn.iocoder.yudao.module.stock.service.data.provider;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import cn.iocoder.yudao.module.stock.service.data.dto.StockMarketOverviewDTO;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import com.fasterxml.jackson.databind.JsonNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class TushareStockDataProvider implements StockDataProvider {

    private static final DateTimeFormatter TUSHARE_DATE = DateTimeFormatter.ofPattern("yyyyMMdd");

    @Resource
    private RestTemplate restTemplate;
    @Resource
    private StockProperties stockProperties;

    @Override
    public String providerCode() {
        return "tushare";
    }

    @Override
    public StockMarketOverviewDTO fetchMarketOverview() {
        return null;
    }

    @Override
    public List<StockDailyKLineDTO> fetchDailyKLine(String symbol, Integer limit) {
        if (StrUtil.isBlank(stockProperties.getAlert().getTushare().getToken())) {
            return Collections.emptyList();
        }
        try {
            String normalized = StockSymbolUtils.normalize(symbol);
            Map<String, Object> params = new HashMap<>();
            params.put("ts_code", normalized);
            params.put("start_date", LocalDate.now().minusDays(Math.max(limit == null ? 240 : limit * 3L, 90L)).format(TUSHARE_DATE));
            JsonNode root = callApi("daily", params,
                    "ts_code,trade_date,open,high,low,close,pre_close,pct_chg,vol,amount");
            JsonNode data = root.path("data");
            JsonNode fields = data.path("fields");
            JsonNode items = data.path("items");
            if (!items.isArray() || items.size() == 0) {
                return Collections.emptyList();
            }
            Map<String, Integer> fieldIndexMap = buildFieldIndexMap(fields);
            List<StockDailyKLineDTO> result = new ArrayList<>();
            for (JsonNode item : items) {
                StockDailyKLineDTO dto = new StockDailyKLineDTO();
                dto.setSymbol(normalized);
                dto.setTradeDate(LocalDate.parse(item.get(fieldIndexMap.get("trade_date")).asText(), TUSHARE_DATE));
                dto.setOpenPrice(readDecimal(item, fieldIndexMap, "open"));
                dto.setHighPrice(readDecimal(item, fieldIndexMap, "high"));
                dto.setLowPrice(readDecimal(item, fieldIndexMap, "low"));
                dto.setClosePrice(readDecimal(item, fieldIndexMap, "close"));
                dto.setPreClosePrice(readDecimal(item, fieldIndexMap, "pre_close"));
                dto.setChangePct(readDecimal(item, fieldIndexMap, "pct_chg"));
                dto.setVolume(readDecimal(item, fieldIndexMap, "vol"));
                dto.setTurnoverAmount(readDecimal(item, fieldIndexMap, "amount"));
                dto.setSourceName(providerCode());
                result.add(dto);
            }
            Collections.reverse(result);
            if (limit != null && result.size() > limit) {
                return result.subList(result.size() - limit, result.size());
            }
            return result;
        } catch (Exception ex) {
            log.warn("[fetchDailyKLine][主数据源拉取 {} 日线失败]", symbol, ex);
            return Collections.emptyList();
        }
    }

    @Override
    public String fetchStockName(String symbol) {
        if (StrUtil.isBlank(stockProperties.getAlert().getTushare().getToken())) {
            return null;
        }
        try {
            String normalized = StockSymbolUtils.normalize(symbol);
            Map<String, Object> params = new HashMap<>();
            params.put("ts_code", normalized);
            JsonNode root = callApi("stock_basic", params, "ts_code,name");
            JsonNode items = root.path("data").path("items");
            if (!items.isArray() || items.size() == 0) {
                return null;
            }
            return items.get(0).get(1).asText();
        } catch (Exception ex) {
            log.warn("[fetchStockName][主数据源拉取 {} 名称失败]", symbol, ex);
            return null;
        }
    }

    private JsonNode callApi(String apiName, Map<String, Object> params, String fields) {
        Map<String, Object> request = new HashMap<>();
        request.put("api_name", apiName);
        request.put("token", stockProperties.getAlert().getTushare().getToken());
        request.put("params", params);
        request.put("fields", fields);
        String response = restTemplate.postForObject(stockProperties.getAlert().getTushare().getBaseUrl(), request, String.class);
        return JsonUtils.parseTree(response);
    }

    private Map<String, Integer> buildFieldIndexMap(JsonNode fields) {
        Map<String, Integer> fieldIndexMap = new HashMap<>();
        for (int i = 0; i < fields.size(); i++) {
            fieldIndexMap.put(fields.get(i).asText(), i);
        }
        return fieldIndexMap;
    }

    private BigDecimal readDecimal(JsonNode item, Map<String, Integer> fieldIndexMap, String field) {
        Integer index = fieldIndexMap.get(field);
        if (index == null || item.get(index) == null || item.get(index).isNull()) {
            return null;
        }
        return new BigDecimal(item.get(index).asText());
    }
}
