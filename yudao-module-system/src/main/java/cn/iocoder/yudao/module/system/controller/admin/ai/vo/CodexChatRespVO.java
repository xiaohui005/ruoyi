package cn.iocoder.yudao.module.system.controller.admin.ai.vo;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class CodexChatRespVO {

    private String responseId;
    private String model;
    private String content;
}
