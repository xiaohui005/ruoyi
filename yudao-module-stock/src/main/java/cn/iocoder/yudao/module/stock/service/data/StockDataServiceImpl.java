package cn.iocoder.yudao.module.stock.service.data;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.dal.dataobject.basic.StockBasicInfoDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockMarketSnapshotDO;
import cn.iocoder.yudao.module.stock.dal.mysql.basic.StockBasicInfoMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockKlineDailyMapper;
import cn.iocoder.yudao.module.stock.dal.mysql.market.StockMarketSnapshotMapper;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.calendar.StockTradeCalendarService;
import cn.iocoder.yudao.module.stock.service.data.dto.StockDailyKLineDTO;
import cn.iocoder.yudao.module.stock.service.data.dto.StockMarketOverviewDTO;
import cn.iocoder.yudao.module.stock.service.data.provider.StockDataProvider;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.Duration;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@Slf4j
public class StockDataServiceImpl implements StockDataService {

    private static final String MARKET_CACHE_KEY = "stock:market:latest";
    private static final String KLINE_CACHE_KEY_PREFIX = "stock:kline:";

    @Resource
    private StockMarketSnapshotMapper stockMarketSnapshotMapper;
    @Resource
    private StockKlineDailyMapper stockKlineDailyMapper;
    @Resource
    private StockBasicInfoMapper stockBasicInfoMapper;
    @Resource
    private StockProperties stockProperties;
    @Resource
    private StockTradeCalendarService stockTradeCalendarService;

    @Autowired(required = false)
    private StringRedisTemplate stringRedisTemplate;

    private final Map<String, StockDataProvider> providerMap;

    public StockDataServiceImpl(List<StockDataProvider> providers) {
        this.providerMap = providers.stream()
                .collect(Collectors.toMap(StockDataProvider::providerCode, Function.identity()));
    }

    @Override
    public StockMarketSnapshotDO getLatestMarketSnapshot(boolean refreshIfNeeded) {
        if (!refreshIfNeeded) {
            StockMarketSnapshotDO cached = getCachedMarketSnapshot();
            if (cached != null) {
                return cached;
            }
        }
        StockMarketSnapshotDO latest = stockMarketSnapshotMapper.selectLatest();
        if (latest == null && refreshIfNeeded) {
            latest = refreshMarketSnapshot();
        }
        if (latest != null) {
            cacheMarketSnapshot(latest);
        }
        return latest;
    }

    @Override
    public StockMarketSnapshotDO refreshMarketSnapshot() {
        if (!stockTradeCalendarService.canCollectNow(java.time.LocalDateTime.now())) {
            return stockMarketSnapshotMapper.selectLatest();
        }
        StockMarketOverviewDTO overview = fetchFromProviders(StockDataProvider::fetchMarketOverview);
        if (overview == null) {
            return stockMarketSnapshotMapper.selectLatest();
        }
        StockMarketSnapshotDO snapshot = new StockMarketSnapshotDO();
        snapshot.setTradeDate(overview.getTradeDate());
        snapshot.setSnapshotTime(overview.getSnapshotTime());
        snapshot.setIndexCode(overview.getIndexCode());
        snapshot.setIndexName(overview.getIndexName());
        snapshot.setIndexClose(overview.getIndexClose());
        snapshot.setIndexChangePct(overview.getIndexChangePct());
        snapshot.setTurnoverAmount(overview.getTurnoverAmount());
        snapshot.setTurnoverRatio(overview.getTurnoverRatio());
        snapshot.setLimitUpCount(overview.getLimitUpCount());
        snapshot.setLimitDownCount(overview.getLimitDownCount());
        snapshot.setRisingCount(overview.getRisingCount());
        snapshot.setFallingCount(overview.getFallingCount());
        snapshot.setHotTheme(overview.getHotTheme());
        snapshot.setThemeLimitUpCount(overview.getThemeLimitUpCount());
        snapshot.setSourceName(overview.getSourceName());
        snapshot.setRawPayload(overview.getRawPayload());
        stockMarketSnapshotMapper.insert(snapshot);
        cacheMarketSnapshot(snapshot);
        return snapshot;
    }

    @Override
    public List<StockKlineDailyDO> getRecentDailyKLine(String symbol, Integer limit, boolean refreshIfNeeded) {
        String normalized = StockSymbolUtils.normalize(symbol);
        int safeLimit = limit == null ? 120 : limit;
        if (!refreshIfNeeded) {
            List<StockKlineDailyDO> cached = getCachedKLine(normalized);
            if (cached.size() >= safeLimit) {
                return cached.subList(Math.max(cached.size() - safeLimit, 0), cached.size());
            }
        }
        List<StockKlineDailyDO> dbList = stockKlineDailyMapper.selectRecentList(normalized, safeLimit);
        if ((dbList == null || dbList.size() < safeLimit) && refreshIfNeeded) {
            dbList = refreshDailyKLine(normalized, safeLimit);
        }
        List<StockKlineDailyDO> result = new ArrayList<>(dbList == null ? new ArrayList<>() : dbList);
        result.sort((left, right) -> left.getTradeDate().compareTo(right.getTradeDate()));
        cacheKLine(normalized, result);
        return result;
    }

    @Override
    public StockKlineDailyDO getLatestDailyKLine(String symbol, boolean refreshIfNeeded) {
        List<StockKlineDailyDO> list = getRecentDailyKLine(symbol, 1, refreshIfNeeded);
        if (list == null || list.isEmpty()) {
            return null;
        }
        return list.get(list.size() - 1);
    }

    @Override
    public List<StockKlineDailyDO> refreshDailyKLine(String symbol, Integer limit) {
        String normalized = StockSymbolUtils.normalize(symbol);
        List<StockDailyKLineDTO> dtos = fetchKLineFromProviders(normalized, limit);
        if (dtos.isEmpty()) {
            return stockKlineDailyMapper.selectRecentList(normalized, limit == null ? 120 : limit);
        }
        String stockName = getNameFromDtos(dtos);
        if (StrUtil.isBlank(stockName)) {
            stockName = fetchNameFromProviders(normalized);
        }
        upsertBasicInfo(normalized, stockName);
        for (StockDailyKLineDTO dto : dtos) {
            StockKlineDailyDO existing = stockKlineDailyMapper.selectBySymbolAndTradeDate(normalized, dto.getTradeDate());
            if (existing == null) {
                StockKlineDailyDO entity = new StockKlineDailyDO();
                entity.setSymbol(normalized);
                entity.setTradeDate(dto.getTradeDate());
                entity.setOpenPrice(dto.getOpenPrice());
                entity.setHighPrice(dto.getHighPrice());
                entity.setLowPrice(dto.getLowPrice());
                entity.setClosePrice(dto.getClosePrice());
                entity.setPreClosePrice(dto.getPreClosePrice());
                entity.setChangePct(dto.getChangePct());
                entity.setVolume(dto.getVolume());
                entity.setTurnoverAmount(dto.getTurnoverAmount());
                entity.setSourceName(extractPureSourceName(dto.getSourceName()));
                stockKlineDailyMapper.insert(entity);
            } else {
                existing.setOpenPrice(dto.getOpenPrice());
                existing.setHighPrice(dto.getHighPrice());
                existing.setLowPrice(dto.getLowPrice());
                existing.setClosePrice(dto.getClosePrice());
                existing.setPreClosePrice(dto.getPreClosePrice());
                existing.setChangePct(dto.getChangePct());
                existing.setVolume(dto.getVolume());
                existing.setTurnoverAmount(dto.getTurnoverAmount());
                existing.setSourceName(extractPureSourceName(dto.getSourceName()));
                stockKlineDailyMapper.updateById(existing);
            }
        }
        List<StockKlineDailyDO> result = stockKlineDailyMapper.selectRecentList(normalized, limit == null ? 120 : limit);
        result.sort((left, right) -> left.getTradeDate().compareTo(right.getTradeDate()));
        cacheKLine(normalized, result);
        return result;
    }

    @Override
    public String getStockName(String symbol) {
        String normalized = StockSymbolUtils.normalize(symbol);
        StockBasicInfoDO basicInfo = stockBasicInfoMapper.selectBySymbol(normalized);
        if (basicInfo != null && StrUtil.isNotBlank(basicInfo.getName())) {
            return basicInfo.getName();
        }
        String stockName = fetchNameFromProviders(normalized);
        upsertBasicInfo(normalized, stockName);
        return stockName;
    }

    private StockMarketOverviewDTO fetchFromProviders(Function<StockDataProvider, StockMarketOverviewDTO> function) {
        for (StockDataProvider provider : orderedProviders()) {
            StockMarketOverviewDTO result = function.apply(provider);
            if (result != null) {
                return result;
            }
        }
        return null;
    }

    private List<StockDailyKLineDTO> fetchKLineFromProviders(String symbol, Integer limit) {
        for (StockDataProvider provider : orderedProviders()) {
            List<StockDailyKLineDTO> result = provider.fetchDailyKLine(symbol, limit);
            if (result != null && !result.isEmpty()) {
                return result;
            }
        }
        return new ArrayList<>();
    }

    private String fetchNameFromProviders(String symbol) {
        for (StockDataProvider provider : orderedProviders()) {
            String result = provider.fetchStockName(symbol);
            if (StrUtil.isNotBlank(result)) {
                return result;
            }
        }
        return StockSymbolUtils.display(symbol);
    }

    private List<StockDataProvider> orderedProviders() {
        LinkedHashSet<String> codes = new LinkedHashSet<>();
        if (stockProperties.getData() != null && stockProperties.getData().getProvider() != null) {
            codes.add(stockProperties.getData().getProvider().getPrimary());
            codes.add(stockProperties.getData().getProvider().getSecondary());
            codes.add(stockProperties.getData().getProvider().getBackfill());
        }
        return codes.stream()
                .map(providerMap::get)
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }

    private void upsertBasicInfo(String symbol, String stockName) {
        if (StrUtil.isBlank(symbol) || StrUtil.isBlank(stockName)) {
            return;
        }
        StockBasicInfoDO existing = stockBasicInfoMapper.selectBySymbol(symbol);
        if (existing == null) {
            StockBasicInfoDO entity = new StockBasicInfoDO();
            entity.setSymbol(symbol);
            entity.setName(stockName);
            entity.setExchange(StrUtil.subAfter(symbol, ".", false));
            entity.setStatus(0);
            stockBasicInfoMapper.insert(entity);
            return;
        }
        existing.setName(stockName);
        existing.setExchange(StrUtil.subAfter(symbol, ".", false));
        stockBasicInfoMapper.updateById(existing);
    }

    private String getNameFromDtos(List<StockDailyKLineDTO> dtos) {
        if (dtos.isEmpty()) {
            return null;
        }
        String sourceName = dtos.get(dtos.size() - 1).getSourceName();
        if (StrUtil.contains(sourceName, ":")) {
            return StrUtil.subAfter(sourceName, ":", false);
        }
        return null;
    }

    private String extractPureSourceName(String sourceName) {
        if (StrUtil.isBlank(sourceName)) {
            return null;
        }
        return StrUtil.subBefore(sourceName, ":", false);
    }

    private StockMarketSnapshotDO getCachedMarketSnapshot() {
        if (stringRedisTemplate == null) {
            return null;
        }
        String value = stringRedisTemplate.opsForValue().get(MARKET_CACHE_KEY);
        return StrUtil.isBlank(value) ? null : JsonUtils.parseObjectQuietly(value, StockMarketSnapshotDO.class);
    }

    private void cacheMarketSnapshot(StockMarketSnapshotDO snapshot) {
        if (stringRedisTemplate == null || snapshot == null) {
            return;
        }
        stringRedisTemplate.opsForValue().set(MARKET_CACHE_KEY, JsonUtils.toJsonString(snapshot), Duration.ofMinutes(3));
    }

    private List<StockKlineDailyDO> getCachedKLine(String symbol) {
        if (stringRedisTemplate == null) {
            return new ArrayList<>();
        }
        String value = stringRedisTemplate.opsForValue().get(KLINE_CACHE_KEY_PREFIX + symbol);
        if (StrUtil.isBlank(value)) {
            return new ArrayList<>();
        }
        return JsonUtils.parseArray(value, StockKlineDailyDO.class);
    }

    private void cacheKLine(String symbol, List<StockKlineDailyDO> list) {
        if (stringRedisTemplate == null || list == null || list.isEmpty()) {
            return;
        }
        stringRedisTemplate.opsForValue().set(KLINE_CACHE_KEY_PREFIX + symbol, JsonUtils.toJsonString(list), Duration.ofMinutes(10));
    }
}
