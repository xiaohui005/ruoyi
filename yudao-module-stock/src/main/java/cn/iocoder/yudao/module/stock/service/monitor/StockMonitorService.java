package cn.iocoder.yudao.module.stock.service.monitor;

import cn.iocoder.yudao.module.stock.controller.admin.monitor.vo.StockMonitorRespVO;

public interface StockMonitorService {

    StockMonitorRespVO getMonitor(String symbol, Long userId, Integer limit);
}
