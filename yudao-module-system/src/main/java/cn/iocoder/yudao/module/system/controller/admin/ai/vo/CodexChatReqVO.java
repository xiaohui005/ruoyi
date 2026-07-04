package cn.iocoder.yudao.module.system.controller.admin.ai.vo;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CodexChatReqVO {

    @NotBlank(message = "prompt 不能为空")
    private String prompt;
}
