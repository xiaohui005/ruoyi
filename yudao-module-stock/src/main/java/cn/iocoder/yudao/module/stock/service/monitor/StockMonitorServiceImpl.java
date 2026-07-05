package cn.iocoder.yudao.module.stock.service.monitor;

import cn.iocoder.yudao.framework.common.util.object.BeanUtils;
import cn.iocoder.yudao.module.stock.controller.admin.monitor.vo.StockMonitorRespVO;
import cn.iocoder.yudao.module.stock.dal.dataobject.market.StockKlineDailyDO;
import cn.iocoder.yudao.module.stock.service.analyzer.StockAnalyzerService;
import cn.iocoder.yudao.module.stock.service.analyzer.dto.StockAnalyzeResultDTO;
import cn.iocoder.yudao.module.stock.service.data.StockDataService;
import cn.iocoder.yudao.module.stock.service.news.StockNewsService;
import cn.iocoder.yudao.module.stock.service.news.dto.StockNewsItemDTO;
import cn.iocoder.yudao.module.stock.util.StockSymbolUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
public class StockMonitorServiceImpl implements StockMonitorService {

    private static final String SUPPORT_LABEL = new String(new int[]{25903, 25745, 20301}, 0, 3);
    private static final String RESISTANCE_LABEL = new String(new int[]{21387, 21147, 20301}, 0, 3);
    private static final String BUY_ZONE_LABEL = new String(new int[]{20080, 28857, 21306}, 0, 3);
    private static final String SELL_ZONE_LABEL = new String(new int[]{21334, 28857, 21306}, 0, 3);

    @Resource
    private StockDataService stockDataService;
    @Resource
    private StockAnalyzerService stockAnalyzerService;
    @Resource
    private StockNewsService stockNewsService;

    @Override
    public StockMonitorRespVO getMonitor(String symbol, Long userId, Integer limit) {
        String normalized = StockSymbolUtils.normalize(symbol);
        List<StockKlineDailyDO> klineList =
                stockDataService.getRecentDailyKLine(normalized, limit == null ? 60 : limit, true);
        klineList.sort(Comparator.comparing(StockKlineDailyDO::getTradeDate));
        StockAnalyzeResultDTO result = stockAnalyzerService.analyze(normalized, userId);

        StockMonitorRespVO respVO = new StockMonitorRespVO();
        respVO.setSymbol(normalized);
        respVO.setStockName(result.getStockName());
        respVO.setLatestPrice(result.getLatestPrice());
        respVO.setMarketSignalName(result.getMarketSignalName());
        respVO.setVolumePriceType(result.getVolumePriceType());
        respVO.setAdviceAction(result.getAdviceAction());
        respVO.setTStrategySuitable(result.getTStrategySuitable());
        respVO.setSupportPrice(result.getSupportPrice());
        respVO.setResistancePrice(result.getResistancePrice());
        respVO.setAnalyzeTime(result.getAnalyzeTime());
        respVO.setKlineList(BeanUtils.toBean(klineList, StockMonitorRespVO.KLineItem.class));

        List<StockNewsItemDTO> newsList = stockNewsService.getLatestNews(normalized, 10);
        enrichNewsReactionChangePct(newsList, klineList);
        respVO.setNewsList(BeanUtils.toBean(newsList, StockMonitorRespVO.NewsItem.class));

        respVO.setMarkLines(new ArrayList<>());
        if (result.getSupportPrice() != null) {
            StockMonitorRespVO.MarkLine support = new StockMonitorRespVO.MarkLine();
            support.setName(SUPPORT_LABEL);
            support.setValue(result.getSupportPrice());
            respVO.getMarkLines().add(support);
        }
        if (result.getResistancePrice() != null) {
            StockMonitorRespVO.MarkLine pressure = new StockMonitorRespVO.MarkLine();
            pressure.setName(RESISTANCE_LABEL);
            pressure.setValue(result.getResistancePrice());
            respVO.getMarkLines().add(pressure);
        }

        respVO.setMarkPoints(new ArrayList<>());
        if (result.getBuyHighPrice() != null && !klineList.isEmpty()) {
            StockMonitorRespVO.MarkPoint buy = new StockMonitorRespVO.MarkPoint();
            buy.setName(BUY_ZONE_LABEL);
            buy.setTradeDate(klineList.get(klineList.size() - 1).getTradeDate());
            buy.setValue(result.getBuyHighPrice());
            respVO.getMarkPoints().add(buy);
        }
        if (result.getSellLowPrice() != null && !klineList.isEmpty()) {
            StockMonitorRespVO.MarkPoint sell = new StockMonitorRespVO.MarkPoint();
            sell.setName(SELL_ZONE_LABEL);
            sell.setTradeDate(klineList.get(klineList.size() - 1).getTradeDate());
            sell.setValue(result.getSellLowPrice());
            respVO.getMarkPoints().add(sell);
        }
        return respVO;
    }

    private void enrichNewsReactionChangePct(List<StockNewsItemDTO> newsList, List<StockKlineDailyDO> klineList) {
        if (newsList == null || newsList.isEmpty() || klineList == null || klineList.isEmpty()) {
            return;
        }
        for (StockNewsItemDTO item : newsList) {
            LocalDate publishDate = extractPublishDate(item.getPublishTime());
            if (publishDate == null) {
                continue;
            }
            BigDecimal relatedChangePct = findReactionChangePct(publishDate, klineList);
            item.setRelatedChangePct(relatedChangePct);
        }
    }

    private LocalDate extractPublishDate(String publishTime) {
        if (publishTime == null || publishTime.trim().isEmpty()) {
            return null;
        }
        try {
            return LocalDateTime.parse(publishTime.replace(" ", "T")).toLocalDate();
        } catch (DateTimeParseException ignored) {
            try {
                return LocalDate.parse(publishTime.substring(0, 10));
            } catch (Exception ex) {
                return null;
            }
        }
    }

    private BigDecimal findReactionChangePct(LocalDate publishDate, List<StockKlineDailyDO> klineList) {
        for (StockKlineDailyDO item : klineList) {
            if (item.getTradeDate() == null || item.getChangePct() == null) {
                continue;
            }
            if (!item.getTradeDate().isBefore(publishDate)) {
                return item.getChangePct();
            }
        }
        for (int i = klineList.size() - 1; i >= 0; i--) {
            StockKlineDailyDO item = klineList.get(i);
            if (item.getTradeDate() == null || item.getChangePct() == null) {
                continue;
            }
            if (!item.getTradeDate().isAfter(publishDate)) {
                return item.getChangePct();
            }
        }
        return null;
    }
}
