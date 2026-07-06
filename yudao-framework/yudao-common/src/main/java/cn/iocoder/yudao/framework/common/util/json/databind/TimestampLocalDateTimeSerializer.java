package cn.iocoder.yudao.framework.common.util.json.databind;

import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.ReflectUtil;
import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.date.DateUtils;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.lang.reflect.Field;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Global LocalDateTime serializer.
 *
 * Default output is a formatted date-time string. Field-level {@link JsonFormat}
 * still takes precedence when present.
 */
@Slf4j
public class TimestampLocalDateTimeSerializer extends JsonSerializer<LocalDateTime> {

    public static final TimestampLocalDateTimeSerializer INSTANCE = new TimestampLocalDateTimeSerializer();

    private static final Map<Class<?>, Map<String, Field>> FIELD_CACHE = new ConcurrentHashMap<>();
    private static final DateTimeFormatter DEFAULT_FORMATTER =
            DateTimeFormatter.ofPattern(DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND);

    @Override
    public void serialize(LocalDateTime value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        String fieldName = gen.getOutputContext().getCurrentName();
        if (fieldName != null) {
            Object currentValue = gen.getOutputContext().getCurrentValue();
            if (currentValue != null) {
                Class<?> clazz = currentValue.getClass();
                Map<String, Field> fieldMap = FIELD_CACHE.computeIfAbsent(clazz, this::buildFieldMap);
                Field field = fieldMap.get(fieldName);
                if (field != null && field.isAnnotationPresent(JsonFormat.class)) {
                    JsonFormat jsonFormat = field.getAnnotation(JsonFormat.class);
                    try {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(jsonFormat.pattern());
                        gen.writeString(formatter.format(value));
                        return;
                    } catch (Exception ex) {
                        log.warn("[serialize][({}#{}) failed to apply JsonFormat pattern, fallback to default format]",
                                clazz.getName(), fieldName, ex);
                    }
                }
            }
        }

        gen.writeString(DEFAULT_FORMATTER.format(value));
    }

    private Map<String, Field> buildFieldMap(Class<?> clazz) {
        Map<String, Field> fieldMap = new HashMap<>();
        for (Field field : ReflectUtil.getFields(clazz)) {
            String fieldName = field.getName();
            JsonProperty jsonProperty = field.getAnnotation(JsonProperty.class);
            if (jsonProperty != null) {
                String value = jsonProperty.value();
                if (StrUtil.isNotEmpty(value) && ObjUtil.notEqual("\u0000", value)) {
                    fieldName = value;
                }
            }
            fieldMap.put(fieldName, field);
        }
        return fieldMap;
    }

}
