package cn.iocoder.yudao.framework.common.util.json.databind;

import cn.hutool.core.util.StrUtil;
import cn.iocoder.yudao.framework.common.util.date.DateUtils;
import cn.iocoder.yudao.framework.common.util.date.LocalDateTimeUtils;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;

/**
 * Global LocalDateTime deserializer.
 *
 * Supports epoch millis, epoch seconds, the default formatted string,
 * and common ISO-8601 representations.
 */
public class TimestampLocalDateTimeDeserializer extends JsonDeserializer<LocalDateTime> {

    public static final TimestampLocalDateTimeDeserializer INSTANCE = new TimestampLocalDateTimeDeserializer();

    private static final ZoneId DEFAULT_ZONE_ID = TimeZone.getTimeZone(DateUtils.TIME_ZONE_DEFAULT).toZoneId();
    private static final DateTimeFormatter DEFAULT_FORMATTER =
            DateTimeFormatter.ofPattern(DateUtils.FORMAT_YEAR_MONTH_DAY_HOUR_MINUTE_SECOND);

    @Override
    public LocalDateTime deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (p.currentToken() == JsonToken.VALUE_NUMBER_INT) {
            return fromEpoch(p.getValueAsLong());
        }

        String text = p.getValueAsString();
        if (StrUtil.isBlank(text)) {
            return null;
        }
        if (StrUtil.isNumeric(text)) {
            return fromEpoch(Long.parseLong(text));
        }
        try {
            return LocalDateTime.parse(text, DEFAULT_FORMATTER);
        } catch (Exception ignored) {
            // ignore
        }
        try {
            return LocalDateTimeUtils.parse(text);
        } catch (Exception ignored) {
            // ignore
        }
        try {
            return Instant.parse(text).atZone(DEFAULT_ZONE_ID).toLocalDateTime();
        } catch (Exception ignored) {
            // ignore
        }
        return LocalDate.parse(text).atStartOfDay();
    }

    private static LocalDateTime fromEpoch(long epoch) {
        if (String.valueOf(Math.abs(epoch)).length() == 10) {
            epoch = epoch * 1000;
        }
        return LocalDateTime.ofInstant(Instant.ofEpochMilli(epoch), DEFAULT_ZONE_ID);
    }

}
