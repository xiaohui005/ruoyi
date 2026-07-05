package cn.iocoder.yudao.module.stock.service.alert.sender;

import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.module.stock.dal.dataobject.alert.StockAlertChannelDO;
import cn.iocoder.yudao.module.stock.framework.config.StockProperties;
import cn.iocoder.yudao.module.stock.service.alert.dto.StockAlertSendResultDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class WxPusherStockAlertSender implements StockAlertSender {

    @Resource
    private RestTemplate restTemplate;
    @Resource
    private StockProperties stockProperties;

    @Override
    public String channelCode() {
        return "WXPUSHER";
    }

    @Override
    public StockAlertSendResultDTO send(StockAlertChannelDO channel, String title, String content) {
        Map<String, Object> config = JsonUtils.parseMap(channel.getConfigJson());
        Map<String, Object> body = new HashMap<>();
        body.put("appToken", config != null ? config.get("appToken") : null);
        body.put("summary", title);
        body.put("content", content);
        body.put("contentType", 1);
        Object uids = config != null ? config.get("uids") : null;
        if (uids instanceof List) {
            body.put("uids", uids);
        }
        String response = restTemplate.postForObject(stockProperties.getAlert().getWxpusher().getSendUrl(), body, String.class);
        boolean success = response != null && (response.contains("\"code\":1000") || response.contains("\"success\":true"));
        return new StockAlertSendResultDTO(success, response);
    }
}
