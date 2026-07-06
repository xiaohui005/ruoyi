package cn.iocoder.yudao.module.system.controller.admin.user.vo.profile;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "管理后台 - 用户消息推送配置 Response VO")
public class UserMessagePushProfileRespVO {

    @Schema(description = "是否启用 Bark 推送", requiredMode = Schema.RequiredMode.REQUIRED, example = "true")
    private Boolean enabled;

    @Schema(description = "Bark 服务地址", requiredMode = Schema.RequiredMode.REQUIRED, example = "https://api.day.app")
    private String serverUrl;

    @Schema(description = "Bark 设备 Key", example = "xxxxxxxx")
    private String deviceKey;

    @Schema(description = "是否接收系统消息", requiredMode = Schema.RequiredMode.REQUIRED, example = "true")
    private Boolean receiveSystemMessage;

    @Schema(description = "是否接收通知消息", requiredMode = Schema.RequiredMode.REQUIRED, example = "true")
    private Boolean receiveNotificationMessage;

    @Schema(description = "是否接收股票提醒", requiredMode = Schema.RequiredMode.REQUIRED, example = "true")
    private Boolean receiveStockAlert;
}
