package cn.iocoder.yudao.module.stock.enums;

import cn.iocoder.yudao.framework.common.exception.ErrorCode;

public interface ErrorCodeConstants {

    ErrorCode WATCHLIST_NOT_FOUND = new ErrorCode(1_009_001_001, "自选股不存在");
    ErrorCode ALERT_CHANNEL_NOT_FOUND = new ErrorCode(1_009_001_002, "提醒渠道不存在");
    ErrorCode ALERT_RULE_NOT_FOUND = new ErrorCode(1_009_001_003, "提醒规则不存在");
    ErrorCode TRADE_JOURNAL_NOT_FOUND = new ErrorCode(1_009_001_004, "交易记录不存在");
    ErrorCode STOCK_CONFIG_NOT_FOUND = new ErrorCode(1_009_001_005, "分析配置不存在");
    ErrorCode KLINE_DATA_NOT_FOUND = new ErrorCode(1_009_001_006, "股票K线数据不存在");
    ErrorCode ALERT_CHANNEL_NOT_ENABLED = new ErrorCode(1_009_001_007, "提醒渠道未启用");
    ErrorCode PROVIDER_CONFIG_MISSING = new ErrorCode(1_009_001_008, "行情数据源配置缺失");
}
