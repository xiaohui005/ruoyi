package cn.iocoder.yudao.module.stock.service.alert.sender;

import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.service.alert.dto.StockAlertSendResultDTO;
import cn.iocoder.yudao.module.system.api.notify.NotifyMessageSendApi;
import cn.iocoder.yudao.module.system.api.notify.dto.NotifySendSingleToUserReqDTO;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Component
public class InternalNotifyStockAlertSender implements StockAlertSender {

    @Resource
    private NotifyMessageSendApi notifyMessageSendApi;

    @Override
    public String channelCode() {
        return "INTERNAL_NOTIFY";
    }

    @Override
    public StockAlertSendResultDTO send(StockAlertChannelDO channel, String title, String content) {
        Map<String, Object> config = JsonUtils.parseMap(channel.getConfigJson());
        NotifySendSingleToUserReqDTO reqDTO = new NotifySendSingleToUserReqDTO();
        reqDTO.setUserId(channel.getUserId());
        reqDTO.setTemplateCode(config != null && config.get("templateCode") != null
                ? String.valueOf(config.get("templateCode")) : "STOCK_ALERT_DEFAULT");
        Map<String, Object> params = new HashMap<>();
        params.put("title", title);
        params.put("content", content);
        reqDTO.setTemplateParams(params);
        Long messageId = notifyMessageSendApi.sendSingleMessageToAdmin(reqDTO);
        return new StockAlertSendResultDTO(true, "messageId=" + messageId);
    }
}
