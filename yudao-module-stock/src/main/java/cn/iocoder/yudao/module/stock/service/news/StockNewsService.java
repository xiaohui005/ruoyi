package cn.iocoder.yudao.module.stock.service.news;

import cn.iocoder.yudao.module.stock.service.news.dto.StockNewsItemDTO;

import java.util.List;

public interface StockNewsService {

    List<StockNewsItemDTO> getLatestNews(String symbol, Integer limit);
}
