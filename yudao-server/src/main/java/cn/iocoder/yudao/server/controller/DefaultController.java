package cn.iocoder.yudao.server.controller;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.util.servlet.ServletUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;

import static cn.iocoder.yudao.framework.common.exception.enums.GlobalErrorCodeConstants.NOT_IMPLEMENTED;

/**
 * Fallback endpoints for optional modules that are not enabled.
 */
@RestController
@Slf4j
public class DefaultController {

    @RequestMapping(value = { "/admin-api/im/**" })
    public CommonResult<Boolean> im404() {
        return CommonResult.error(NOT_IMPLEMENTED.getCode(),
                "[IM yudao-module-im - disabled]");
    }

    @RequestMapping(value = { "/admin-api/ai/**" })
    public CommonResult<Boolean> ai404() {
        return CommonResult.error(NOT_IMPLEMENTED.getCode(),
                "[AI yudao-module-ai - disabled]");
    }

    @RequestMapping(value = { "/test" })
    @PermitAll
    public CommonResult<Boolean> test(HttpServletRequest request) {
        log.info("Query: {}", ServletUtils.getParamMap(request));
        log.info("Header: {}", ServletUtils.getHeaderMap(request));
        log.info("Body: {}", ServletUtils.getBody(request));
        return CommonResult.success(true);
    }

}
