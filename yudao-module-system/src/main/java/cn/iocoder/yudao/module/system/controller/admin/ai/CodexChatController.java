package cn.iocoder.yudao.module.system.controller.admin.ai;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexChatReqVO;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexChatRespVO;
import cn.iocoder.yudao.module.system.controller.admin.ai.vo.CodexConfigRespVO;
import cn.iocoder.yudao.module.system.service.ai.CodexAiService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.IOException;

import static cn.iocoder.yudao.framework.common.exception.enums.GlobalErrorCodeConstants.BAD_REQUEST;
import static cn.iocoder.yudao.framework.common.exception.enums.GlobalErrorCodeConstants.ERROR_CONFIGURATION;
import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - Codex AI")
@RestController
@RequestMapping("/ai/codex")
@Validated
public class CodexChatController {

    @Resource
    private CodexAiService codexAiService;

    @GetMapping("/config")
    @Operation(summary = "获取 Codex 运行配置")
    public CommonResult<CodexConfigRespVO> getConfig() throws IOException {
        return success(codexAiService.getConfig());
    }

    @PostMapping("/chat")
    @Operation(summary = "发送 Codex 对话")
    public CommonResult<CodexChatRespVO> chat(@RequestBody @Valid CodexChatReqVO reqVO) throws IOException {
        try {
            return success(codexAiService.chat(reqVO.getPrompt()));
        } catch (IllegalArgumentException exception) {
            return CommonResult.error(BAD_REQUEST.getCode(), exception.getMessage());
        } catch (IllegalStateException exception) {
            return CommonResult.error(ERROR_CONFIGURATION.getCode(), exception.getMessage());
        }
    }
}
