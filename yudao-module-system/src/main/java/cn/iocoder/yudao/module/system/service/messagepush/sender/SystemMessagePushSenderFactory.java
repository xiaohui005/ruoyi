package cn.iocoder.yudao.module.system.service.messagepush.sender;

import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Component
public class SystemMessagePushSenderFactory {

    private final Map<String, SystemMessagePushSender> senderMap;

    public SystemMessagePushSenderFactory(List<SystemMessagePushSender> senders) {
        this.senderMap = senders.stream()
                .collect(Collectors.toMap(SystemMessagePushSender::channelCode, Function.identity()));
    }

    public SystemMessagePushSender getSender(String channelCode) {
        return senderMap.get(channelCode);
    }
}
