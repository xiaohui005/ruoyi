package cn.iocoder.yudao.module.stock.service.alert.sender;

import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.service.alert.dto.StockAlertSendResultDTO;

public interface StockAlertSender {

    String channelCode();

    StockAlertSendResultDTO send(StockAlertChannelDO channel, String title, String content);
}
