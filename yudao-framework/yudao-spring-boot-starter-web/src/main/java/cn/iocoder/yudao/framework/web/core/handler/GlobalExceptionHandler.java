package cn.iocoder.yudao.framework.web.core.handler;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.exceptions.ExceptionUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.biz.infra.logger.ApiErrorLogCommonApi;
import cn.iocoder.yudao.framework.common.biz.infra.logger.dto.ApiErrorLogCreateReqDTO;
import cn.iocoder.yudao.framework.common.exception.ServiceException;
import cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil;
import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.util.collection.SetUtils;
import cn.iocoder.yudao.framework.common.util.json.JsonUtils;
import cn.iocoder.yudao.framework.common.util.monitor.TracerUtils;
import cn.iocoder.yudao.framework.common.util.servlet.ServletUtils;
import cn.iocoder.yudao.framework.web.core.util.WebFrameworkUtils;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import com.google.common.util.concurrent.UncheckedExecutionException;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.util.Assert;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static cn.iocoder.yudao.framework.common.exception.enums.GlobalErrorCodeConstants.*;

/**
 * 鍏ㄥ眬寮傚父澶勭悊鍣紝灏?Exception 缈昏瘧鎴?CommonResult + 瀵瑰簲鐨勫紓甯哥紪鍙?
 *
 * @author 鑺嬮亾婧愮爜
 */
@RestControllerAdvice
@AllArgsConstructor
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 蹇界暐鐨?ServiceException 閿欒鎻愮ず锛岄伩鍏嶆墦鍗拌繃澶?logger
     */
    public static final Set<String> IGNORE_ERROR_MESSAGES = SetUtils.asSet("???????");

    @SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
    private final String applicationName;

    private final ApiErrorLogCommonApi apiErrorLogApi;

    /**
     * 澶勭悊鎵€鏈夊紓甯革紝涓昏鏄彁渚涚粰 Filter 浣跨敤
     * 鍥犱负 Filter 涓嶈蛋 SpringMVC 鐨勬祦绋嬶紝浣嗘槸鎴戜滑鍙堥渶瑕佸厹搴曞鐞嗗紓甯革紝鎵€浠ヨ繖閲屾彁渚涗竴涓叏閲忕殑寮傚父澶勭悊杩囩▼锛屼繚鎸侀€昏緫缁熶竴銆?
     *
     * @param request 璇锋眰
     * @param ex 寮傚父
     * @return 閫氱敤杩斿洖
     */
    public CommonResult<?> allExceptionHandler(HttpServletRequest request, Throwable ex) {
        if (ex instanceof MissingServletRequestParameterException) {
            return missingServletRequestParameterExceptionHandler((MissingServletRequestParameterException) ex);
        }
        if (ex instanceof MethodArgumentTypeMismatchException) {
            return methodArgumentTypeMismatchExceptionHandler((MethodArgumentTypeMismatchException) ex);
        }
        if (ex instanceof MethodArgumentNotValidException) {
            return methodArgumentNotValidExceptionExceptionHandler((MethodArgumentNotValidException) ex);
        }
        if (ex instanceof BindException) {
            return bindExceptionHandler((BindException) ex);
        }
        if (ex instanceof ConstraintViolationException) {
            return constraintViolationExceptionHandler((ConstraintViolationException) ex);
        }
        if (ex instanceof ValidationException) {
            return validationException((ValidationException) ex);
        }
        if (ex instanceof MaxUploadSizeExceededException) {
            return maxUploadSizeExceededExceptionHandler((MaxUploadSizeExceededException) ex);
        }
        if (ex instanceof NoHandlerFoundException) {
            return noHandlerFoundExceptionHandler((NoHandlerFoundException) ex);
        }
        if (ex instanceof HttpRequestMethodNotSupportedException) {
            return httpRequestMethodNotSupportedExceptionHandler((HttpRequestMethodNotSupportedException) ex);
        }
        if (ex instanceof HttpMediaTypeNotSupportedException) {
            return httpMediaTypeNotSupportedExceptionHandler((HttpMediaTypeNotSupportedException) ex);
        }
        if (ex instanceof ServiceException) {
            return serviceExceptionHandler((ServiceException) ex);
        }
        if (ex instanceof AccessDeniedException) {
            return accessDeniedExceptionHandler(request, (AccessDeniedException) ex);
        }
        return defaultExceptionHandler(request, ex);
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鍙傛暟缂哄け
     *
     * 渚嬪璇达紝鎺ュ彛涓婅缃簡 @RequestParam("xx") 鍙傛暟锛岀粨鏋滃苟鏈紶閫?xx 鍙傛暟
     */
    @ExceptionHandler(value = MissingServletRequestParameterException.class)
    public CommonResult<?> missingServletRequestParameterExceptionHandler(MissingServletRequestParameterException ex) {
        log.warn("[missingServletRequestParameterExceptionHandler]", ex);
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟缂哄け:%s", ex.getParameterName()));
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鍙傛暟绫诲瀷閿欒
     *
     * 渚嬪璇达紝鎺ュ彛涓婅缃簡 @RequestParam("xx") 鍙傛暟涓?Integer锛岀粨鏋滀紶閫?xx 鍙傛暟绫诲瀷涓?String
     */
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public CommonResult<?> methodArgumentTypeMismatchExceptionHandler(MethodArgumentTypeMismatchException ex) {
        log.warn("[methodArgumentTypeMismatchExceptionHandler]", ex);
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟绫诲瀷閿欒:%s", ex.getMessage()));
    }

    /**
     * 澶勭悊 SpringMVC 鍙傛暟鏍￠獙涓嶆纭?
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public CommonResult<?> methodArgumentNotValidExceptionExceptionHandler(MethodArgumentNotValidException ex) {
        log.warn("[methodArgumentNotValidExceptionExceptionHandler]", ex);
        // 鑾峰彇 errorMessage
        String errorMessage = null;
        FieldError fieldError = ex.getBindingResult().getFieldError();
        if (fieldError == null) {
            // 缁勫悎鏍￠獙锛屽弬鑰冭嚜 https://t.zsxq.com/3HVTx
            List<ObjectError> allErrors = ex.getBindingResult().getAllErrors();
            if (CollUtil.isNotEmpty(allErrors)) {
                errorMessage = allErrors.get(0).getDefaultMessage();
            }
        } else {
            errorMessage = fieldError.getDefaultMessage();
        }
        // 杞崲 CommonResult
        if (StrUtil.isEmpty(errorMessage)) {
            return CommonResult.error(BAD_REQUEST);
        }
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟涓嶆纭?%s", errorMessage));
    }

    /**
     * 澶勭悊 SpringMVC 鍙傛暟缁戝畾涓嶆纭紝鏈川涓婁篃鏄€氳繃 Validator 鏍￠獙
     */
    @ExceptionHandler(BindException.class)
    public CommonResult<?> bindExceptionHandler(BindException ex) {
        log.warn("[handleBindException]", ex);
        FieldError fieldError = ex.getFieldError();
        assert fieldError != null; // 鏂█锛岄伩鍏嶅憡璀?
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟涓嶆纭?%s", fieldError.getDefaultMessage()));
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鍙傛暟绫诲瀷閿欒
     *
     * 渚嬪璇达紝鎺ュ彛涓婅缃簡 @RequestBody 瀹炰綋涓?xx 灞炴€х被鍨嬩负 Integer锛岀粨鏋滀紶閫?xx 鍙傛暟绫诲瀷涓?String
     */
    @ExceptionHandler(HttpMessageNotReadableException.class)
    @SuppressWarnings("PatternVariableCanBeUsed")
    public CommonResult<?> methodArgumentTypeInvalidFormatExceptionHandler(HttpMessageNotReadableException ex) {
        log.warn("[methodArgumentTypeInvalidFormatExceptionHandler]", ex);
        if (ex.getCause() instanceof InvalidFormatException) {
            InvalidFormatException invalidFormatException = (InvalidFormatException) ex.getCause();
            return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟绫诲瀷閿欒:%s", invalidFormatException.getValue()));
        }
        if (StrUtil.startWith(ex.getMessage(), "Required request body is missing")) {
            return CommonResult.error(BAD_REQUEST.getCode(), "上传文件过大，请调整后重试");
        }
        return defaultExceptionHandler(ServletUtils.getRequest(), ex);
    }

    /**
     * 澶勭悊 Validator 鏍￠獙涓嶉€氳繃浜х敓鐨勫紓甯?
     */
    @ExceptionHandler(value = ConstraintViolationException.class)
    public CommonResult<?> constraintViolationExceptionHandler(ConstraintViolationException ex) {
        log.warn("[constraintViolationExceptionHandler]", ex);
        ConstraintViolation<?> constraintViolation = ex.getConstraintViolations().iterator().next();
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰鍙傛暟涓嶆纭?%s", constraintViolation.getMessage()));
    }

    /**
     * 澶勭悊 Dubbo Consumer 鏈湴鍙傛暟鏍￠獙鏃讹紝鎶涘嚭鐨?ValidationException 寮傚父
     */
    @ExceptionHandler(value = ValidationException.class)
    public CommonResult<?> validationException(ValidationException ex) {
        log.warn("[constraintViolationExceptionHandler]", ex);
        // 鏃犳硶鎷兼帴鏄庣粏鐨勯敊璇俊鎭紝鍥犱负 Dubbo Consumer 鎶涘嚭 ValidationException 寮傚父鏃讹紝鏄洿鎺ョ殑瀛楃涓蹭俊鎭紝涓斾汉绫讳笉鍙
        return CommonResult.error(BAD_REQUEST);
    }

    /**
     * 澶勭悊涓婁紶鏂囦欢杩囧ぇ寮傚父
     */
    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public CommonResult<?> maxUploadSizeExceededExceptionHandler(MaxUploadSizeExceededException ex) {
        return CommonResult.error(BAD_REQUEST.getCode(), "上传文件过大，请调整后重试");
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鍦板潃涓嶅瓨鍦?
     *
     * 娉ㄦ剰锛屽畠闇€瑕佽缃涓嬩袱涓厤缃」锛?
     * 1. spring.mvc.throw-exception-if-no-handler-found 涓?true
     * 2. spring.mvc.static-path-pattern 涓?/statics/**
     */
    @ExceptionHandler(NoHandlerFoundException.class)
    public CommonResult<?> noHandlerFoundExceptionHandler(NoHandlerFoundException ex) {
        log.warn("[noHandlerFoundExceptionHandler]", ex);
        return CommonResult.error(NOT_FOUND.getCode(), String.format("璇锋眰鍦板潃涓嶅瓨鍦?%s", ex.getRequestURL()));
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鏂规硶涓嶆纭?
     *
     * 渚嬪璇达紝A 鎺ュ彛鐨勬柟娉曚负 GET 鏂瑰紡锛岀粨鏋滆姹傛柟娉曚负 POST 鏂瑰紡锛屽鑷翠笉鍖归厤
     */
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public CommonResult<?> httpRequestMethodNotSupportedExceptionHandler(HttpRequestMethodNotSupportedException ex) {
        log.warn("[httpRequestMethodNotSupportedExceptionHandler]", ex);
        return CommonResult.error(METHOD_NOT_ALLOWED.getCode(), String.format("璇锋眰鏂规硶涓嶆纭?%s", ex.getMessage()));
    }

    /**
     * 澶勭悊 SpringMVC 璇锋眰鐨?Content-Type 涓嶆纭?
     *
     * 渚嬪璇达紝A 鎺ュ彛鐨?Content-Type 涓?application/json锛岀粨鏋滆姹傜殑 Content-Type 涓?application/octet-stream锛屽鑷翠笉鍖归厤
     */
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public CommonResult<?> httpMediaTypeNotSupportedExceptionHandler(HttpMediaTypeNotSupportedException ex) {
        log.warn("[httpMediaTypeNotSupportedExceptionHandler]", ex);
        return CommonResult.error(BAD_REQUEST.getCode(), String.format("璇锋眰绫诲瀷涓嶆纭?%s", ex.getMessage()));
    }

    /**
     * 澶勭悊 Spring Security 鏉冮檺涓嶈冻鐨勫紓甯?
     *
     * 鏉ユ簮鏄紝浣跨敤 @PreAuthorize 娉ㄨВ锛孉OP 杩涜鏉冮檺鎷︽埅
     */
    @ExceptionHandler(value = AccessDeniedException.class)
    public CommonResult<?> accessDeniedExceptionHandler(HttpServletRequest req, AccessDeniedException ex) {
        log.warn("[accessDeniedExceptionHandler][userId({}) 鏃犳硶璁块棶 url({})]", WebFrameworkUtils.getLoginUserId(req),
                req.getRequestURL(), ex);
        return CommonResult.error(FORBIDDEN);
    }

    /**
     * 澶勭悊 Guava UncheckedExecutionException
     *
     * 渚嬪璇达紝缂撳瓨鍔犺浇鎶ラ敊锛屽彲瑙?<a href="https://t.zsxq.com/UszdH">https://t.zsxq.com/UszdH</a>
     */
    @ExceptionHandler(value = UncheckedExecutionException.class)
    public CommonResult<?> uncheckedExecutionExceptionHandler(HttpServletRequest req, UncheckedExecutionException ex) {
        return allExceptionHandler(req, ex.getCause());
    }

    /**
     * 澶勭悊涓氬姟寮傚父 ServiceException
     *
     * 渚嬪璇达紝鍟嗗搧搴撳瓨涓嶈冻锛岀敤鎴锋墜鏈哄彿宸插瓨鍦ㄣ€?
     */
    @ExceptionHandler(value = ServiceException.class)
    public CommonResult<?> serviceExceptionHandler(ServiceException ex) {
        // 涓嶅寘鍚殑鏃跺€欙紝鎵嶈繘琛屾墦鍗帮紝閬垮厤 ex 鍫嗘爤杩囧
        if (!IGNORE_ERROR_MESSAGES.contains(ex.getMessage())) {
            // 鍗充娇鎵撳嵃锛屼篃鍙墦鍗扮涓€灞?StackTraceElement锛屽苟涓斾娇鐢?warn 鍦ㄦ帶鍒跺彴杈撳嚭锛屾洿瀹规槗鐪嬪埌
            try {
                StackTraceElement[] stackTraces = ex.getStackTrace();
                for (StackTraceElement stackTrace : stackTraces) {
                    if (ObjUtil.notEqual(stackTrace.getClassName(), ServiceExceptionUtil.class.getName())) {
                        log.warn("[serviceExceptionHandler]\n\t{}", stackTrace);
                        break;
                    }
                }
            } catch (Exception ignored) {
                // 蹇界暐鏃ュ織锛岄伩鍏嶅奖鍝嶄富娴佺▼
            }
        }
        return CommonResult.error(ex.getCode(), ex.getMessage());
    }

    /**
     * 澶勭悊绯荤粺寮傚父锛屽厹搴曞鐞嗘墍鏈夌殑涓€鍒?
     */
    @ExceptionHandler(value = Exception.class)
    public CommonResult<?> defaultExceptionHandler(HttpServletRequest req, Throwable ex) {
        // 鐗规畩锛氬鏋滄槸 ServiceException 鐨勫紓甯革紝鍒欑洿鎺ヨ繑鍥?
        // 渚嬪璇达細https://gitee.com/zhijiantianya/yudao-cloud/issues/ICSSRM銆乭ttps://gitee.com/zhijiantianya/yudao-cloud/issues/ICT6FM
        if (ex.getCause() != null && ex.getCause() instanceof ServiceException) {
            return serviceExceptionHandler((ServiceException) ex.getCause());
        }

        // 鎯呭喌涓€锛氬鐞嗚〃涓嶅瓨鍦ㄧ殑寮傚父
        CommonResult<?> tableNotExistsResult = handleTableNotExists(ex);
        if (tableNotExistsResult != null) {
            return tableNotExistsResult;
        }

        // 鎯呭喌浜岋細澶勭悊寮傚父
        log.error("[defaultExceptionHandler]", ex);
        // 鎻掑叆寮傚父鏃ュ織
        createExceptionLog(req, ex);
        // 杩斿洖 ERROR CommonResult
        return CommonResult.error(INTERNAL_SERVER_ERROR.getCode(), INTERNAL_SERVER_ERROR.getMsg());
    }

    private void createExceptionLog(HttpServletRequest req, Throwable e) {
        // 鎻掑叆閿欒鏃ュ織
        ApiErrorLogCreateReqDTO errorLog = new ApiErrorLogCreateReqDTO();
        try {
            // 鍒濆鍖?errorLog
            buildExceptionLog(errorLog, req, e);
            // 鎵ц鎻掑叆 errorLog
            apiErrorLogApi.createApiErrorLogAsync(errorLog);
        } catch (Throwable th) {
            log.error("[createExceptionLog][url({}) log({}) 鍙戠敓寮傚父]", req.getRequestURI(),  JsonUtils.toJsonString(errorLog), th);
        }
    }

    private void buildExceptionLog(ApiErrorLogCreateReqDTO errorLog, HttpServletRequest request, Throwable e) {
        // 澶勭悊鐢ㄦ埛淇℃伅
        errorLog.setUserId(WebFrameworkUtils.getLoginUserId(request));
        errorLog.setUserType(WebFrameworkUtils.getLoginUserType(request));
        // 璁剧疆寮傚父瀛楁
        errorLog.setExceptionName(e.getClass().getName());
        errorLog.setExceptionMessage(ExceptionUtil.getMessage(e));
        errorLog.setExceptionRootCauseMessage(ExceptionUtil.getRootCauseMessage(e));
        errorLog.setExceptionStackTrace(ExceptionUtil.stacktraceToString(e));
        StackTraceElement[] stackTraceElements = e.getStackTrace();
        Assert.notEmpty(stackTraceElements, "寮傚父 stackTraceElements 涓嶈兘涓虹┖");
        StackTraceElement stackTraceElement = stackTraceElements[0];
        errorLog.setExceptionClassName(stackTraceElement.getClassName());
        errorLog.setExceptionFileName(stackTraceElement.getFileName());
        errorLog.setExceptionMethodName(stackTraceElement.getMethodName());
        errorLog.setExceptionLineNumber(stackTraceElement.getLineNumber());
        // 璁剧疆鍏跺畠瀛楁
        errorLog.setTraceId(TracerUtils.getTraceId());
        errorLog.setApplicationName(applicationName);
        errorLog.setRequestUrl(request.getRequestURI());
        Map<String, Object> requestParams = MapUtil.<String, Object>builder()
                .put("query", ServletUtils.getParamMap(request))
                .put("body", ServletUtils.getBody(request)).build();
        errorLog.setRequestParams(JsonUtils.toJsonString(requestParams));
        errorLog.setRequestMethod(request.getMethod());
        errorLog.setUserAgent(ServletUtils.getUserAgent(request));
        errorLog.setUserIp(ServletUtils.getClientIP(request));
        errorLog.setExceptionTime(LocalDateTime.now());
    }

    /**
     * 澶勭悊 Table 涓嶅瓨鍦ㄧ殑寮傚父鎯呭喌
     *
     * @param ex 寮傚父
     * @return 濡傛灉鏄?Table 涓嶅瓨鍦ㄧ殑寮傚父锛屽垯杩斿洖瀵瑰簲鐨?CommonResult
     */
    private CommonResult<?> handleTableNotExists(Throwable ex) {
        String message = ExceptionUtil.getRootCauseMessage(ex);
        if (!message.contains("doesn't exist")) {
            return null;
        }
        // 8. IM 鍗虫椂閫氳
        if (message.contains("im_")) {
            log.error("[IM 鍗虫椂閫氳 yudao-module-im - 琛ㄧ粨鏋勬湭瀵煎叆][鍙傝€?https://doc.iocoder.cn/im/build/ 寮€鍚痌");
            return CommonResult.error(NOT_IMPLEMENTED.getCode(),
                    "[IM 鍗虫椂閫氳 yudao-module-im - 琛ㄧ粨鏋勬湭瀵煎叆][鍙傝€?https://doc.iocoder.cn/im/build/ 寮€鍚痌");
        }
        // 11. AI 澶фā鍨?
        if (message.contains("ai_")) {
            log.error("[AI 澶фā鍨?yudao-module-ai - 琛ㄧ粨鏋勬湭瀵煎叆][鍙傝€?https://cloud.iocoder.cn/ai/build/ 寮€鍚痌");
            return CommonResult.error(NOT_IMPLEMENTED.getCode(),
                    "[AI 澶фā鍨?yudao-module-ai - 琛ㄧ粨鏋勬湭瀵煎叆][鍙傝€?https://cloud.iocoder.cn/ai/build/ 寮€鍚痌");
        }
        return null;
    }

}
