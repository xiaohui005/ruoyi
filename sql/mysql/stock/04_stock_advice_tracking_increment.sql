-- 建议闭环增量 SQL
-- 用途：
-- 1. 新增建议闭环表和状态流水表
-- 2. 补充建议观察天数默认配置
-- 执行方式：直接在当前库执行本脚本即可，无需重刷整套 stock SQL

CREATE TABLE IF NOT EXISTS `stock_advice_tracking` (
  `tenant_id` BIGINT NOT NULL DEFAULT 1 COMMENT '租户编号',
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` BIGINT NOT NULL COMMENT '用户 ID',
  `watchlist_id` BIGINT DEFAULT NULL COMMENT '自选股 ID',
  `analysis_record_id` BIGINT DEFAULT NULL COMMENT '分析记录 ID',
  `symbol` VARCHAR(32) NOT NULL COMMENT '股票代码',
  `stock_name` VARCHAR(64) NOT NULL COMMENT '股票名称',
  `advice_type` VARCHAR(32) NOT NULL COMMENT '建议类型',
  `status` VARCHAR(32) NOT NULL COMMENT '跟踪状态',
  `advice_time` DATETIME NOT NULL COMMENT '建议生成时间',
  `latest_price_at_advice` DECIMAL(18,4) DEFAULT NULL COMMENT '建议时价格',
  `support_price` DECIMAL(18,4) DEFAULT NULL COMMENT '支撑位',
  `resistance_price` DECIMAL(18,4) DEFAULT NULL COMMENT '压力位',
  `buy_low_price` DECIMAL(18,4) DEFAULT NULL COMMENT '买入区间下沿',
  `buy_high_price` DECIMAL(18,4) DEFAULT NULL COMMENT '买入区间上沿',
  `sell_low_price` DECIMAL(18,4) DEFAULT NULL COMMENT '卖出区间下沿',
  `sell_high_price` DECIMAL(18,4) DEFAULT NULL COMMENT '卖出区间上沿',
  `position_ratio` DECIMAL(10,4) DEFAULT NULL COMMENT '建议仓位比例',
  `invalid_condition` VARCHAR(512) DEFAULT NULL COMMENT '失效条件',
  `risk_level` VARCHAR(32) DEFAULT NULL COMMENT '风险等级',
  `expected_days` INT DEFAULT NULL COMMENT '建议观察天数',
  `buy_trigger_time` DATETIME DEFAULT NULL COMMENT '买点触发时间',
  `sell_trigger_time` DATETIME DEFAULT NULL COMMENT '卖点触发时间',
  `invalidate_time` DATETIME DEFAULT NULL COMMENT '失效时间',
  `expire_time` DATETIME DEFAULT NULL COMMENT '超时时间',
  `close_reason` VARCHAR(512) DEFAULT NULL COMMENT '关闭原因',
  `actual_buy_price` DECIMAL(18,4) DEFAULT NULL COMMENT '实际买入价',
  `actual_sell_price` DECIMAL(18,4) DEFAULT NULL COMMENT '实际卖出价',
  `estimated_profit_rate` DECIMAL(10,4) DEFAULT NULL COMMENT '理论收益率',
  `actual_profit_rate` DECIMAL(10,4) DEFAULT NULL COMMENT '实际收益率',
  `result_summary` VARCHAR(1024) DEFAULT NULL COMMENT '结果说明',
  `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` BIT(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_stock_advice_tracking_user_status_time` (`user_id`, `status`, `advice_time`),
  KEY `idx_stock_advice_tracking_symbol_time` (`symbol`, `advice_time`),
  KEY `idx_stock_advice_tracking_analysis_record` (`analysis_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='建议闭环跟踪表';

CREATE TABLE IF NOT EXISTS `stock_advice_tracking_log` (
  `tenant_id` BIGINT NOT NULL DEFAULT 1 COMMENT '租户编号',
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tracking_id` BIGINT NOT NULL COMMENT '闭环记录 ID',
  `symbol` VARCHAR(32) NOT NULL COMMENT '股票代码',
  `from_status` VARCHAR(32) DEFAULT NULL COMMENT '原状态',
  `to_status` VARCHAR(32) NOT NULL COMMENT '目标状态',
  `trigger_type` VARCHAR(32) NOT NULL COMMENT '触发类型',
  `trigger_price` DECIMAL(18,4) DEFAULT NULL COMMENT '触发价格',
  `trigger_time` DATETIME DEFAULT NULL COMMENT '触发时间',
  `message` VARCHAR(1024) DEFAULT NULL COMMENT '触发说明',
  `creator` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` BIT(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_stock_advice_tracking_log_tracking` (`tracking_id`, `trigger_time`),
  KEY `idx_stock_advice_tracking_log_symbol_time` (`symbol`, `trigger_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='建议闭环状态流水表';

INSERT INTO `stock_analysis_config` (`tenant_id`, `config_key`, `config_name`, `config_value`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
SELECT
  1,
  'strategy.advice-expected-days',
  'Advice Expected Days',
  '5',
  'Default observation days for advice tracking',
  '',
  NOW(),
  '',
  NOW(),
  b'0'
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM `stock_analysis_config` WHERE `config_key` = 'strategy.advice-expected-days'
);
