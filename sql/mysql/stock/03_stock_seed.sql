-- 股票模块演示与默认配置数据
-- 说明：
-- 1. 这里的行情/分析/提醒记录仅用于初始化页面与联调验证
-- 2. 正式生产环境请通过真实数据源任务持续更新数据
-- 3. Mock/CSV 只保留给测试与演示，不作为生产主链路

INSERT INTO `stock_analysis_config`
(`config_key`, `config_name`, `config_value`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  ('market.index-rise-threshold', '市场指数涨幅阈值', '1.20', '增量共振点的指数涨幅阈值，单位百分比', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('market.turnover-ratio-threshold', '市场成交额放量阈值', '1.10', '增量共振点的成交额同比放量阈值', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('market.theme-limit-up-threshold', '题材涨停数量阈值', '3', '题材发酵点的同题材涨停数量阈值', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('market.limit-down-max', '冰点修复跌停数量上限', '10', '情绪冰点修复点的跌停数量上限', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('market.limit-up-min', '冰点修复涨停数量下限', '20', '情绪冰点修复点的涨停数量下限', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('analyzer.volume-rise-threshold', '量增阈值', '1.20', '量增价涨判断所需的成交量放大倍数', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('analyzer.volume-shrink-threshold', '量缩阈值', '0.90', '价涨量缩判断所需的成交量缩小倍数', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('strategy.position-ratio', '做T默认仓位比例', '0.30', '做T建议默认仓位比例', 'admin', NOW(), 'admin', NOW(), b'0'),
  ('strategy.invalid-break-threshold', '做T失效跌破阈值', '0.02', '跌破关键支撑位后的失效阈值，单位百分比', 'admin', NOW(), 'admin', NOW(), b'0')
ON DUPLICATE KEY UPDATE
  `config_name` = VALUES(`config_name`),
  `config_value` = VALUES(`config_value`),
  `remark` = VALUES(`remark`),
  `updater` = VALUES(`updater`),
  `update_time` = VALUES(`update_time`),
  `deleted` = VALUES(`deleted`);

INSERT INTO `stock_basic_info`
(`symbol`, `name`, `exchange`, `industry`, `concepts`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  ('600519.SH', '贵州茅台', 'SH', '白酒', '消费,白酒,龙头', 0, 'admin', NOW(), 'admin', NOW(), b'0'),
  ('300750.SZ', '宁德时代', 'SZ', '电池', '新能源,锂电池,龙头', 0, 'admin', NOW(), 'admin', NOW(), b'0'),
  ('002594.SZ', '比亚迪', 'SZ', '整车', '新能源车,锂电池,龙头', 0, 'admin', NOW(), 'admin', NOW(), b'0')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `exchange` = VALUES(`exchange`),
  `industry` = VALUES(`industry`),
  `concepts` = VALUES(`concepts`),
  `status` = VALUES(`status`),
  `updater` = VALUES(`updater`),
  `update_time` = VALUES(`update_time`),
  `deleted` = VALUES(`deleted`);

DELETE FROM `stock_market_signal_record` WHERE `id` IN (9001002);
DELETE FROM `stock_market_snapshot` WHERE `id` IN (9001001);
DELETE FROM `stock_analysis_record` WHERE `id` IN (9002001);
DELETE FROM `stock_t_strategy_record` WHERE `id` IN (9002002);
DELETE FROM `stock_alert_rule` WHERE `id` IN (9003001);
DELETE FROM `stock_alert_record` WHERE `id` IN (9003002);
DELETE FROM `stock_trade_journal` WHERE `id` IN (9004001);

INSERT INTO `stock_market_snapshot`
(`id`, `trade_date`, `snapshot_time`, `index_code`, `index_name`, `index_close`, `index_change_pct`, `turnover_amount`,
 `turnover_ratio`, `limit_up_count`, `limit_down_count`, `rising_count`, `falling_count`, `hot_theme`,
 `theme_limit_up_count`, `source_name`, `raw_payload`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9001001, CURRENT_DATE, NOW(), '000001.SH', '上证指数', 3215.8800, 1.3600, 986500000000.00,
   1.1800, 68, 4, 3562, 1297, '消费电子', 7, 'DEMO_REAL_PIPELINE',
   '{"signal":"INCREMENTAL_RESONANCE","note":"demo snapshot for stock module"}',
   'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_market_signal_record`
(`id`, `trade_date`, `signal_code`, `signal_name`, `tradable`, `risk_level`, `reason_text`, `snapshot_id`,
 `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9001002, CURRENT_DATE, 'INCREMENTAL_RESONANCE', '增量共振点', b'1', 'MEDIUM',
   '市场成交额明显放大，指数中阳线，热点题材与涨停家数同步走强，可进入观察和交易窗口。', 9001001,
   'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_watchlist`
(`user_id`, `symbol`, `name`, `collect_level`, `collect_interval_minutes`, `enable_monitor`, `enable_intraday`,
 `enable_t_strategy`, `enable_price_alert`, `enable_signal_alert`, `latest_collect_time`, `latest_analyze_time`,
 `latest_alert_time`, `latest_advice`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (1, '600519.SH', '贵州茅台', 'CORE', 5, b'1', b'0', b'1', b'1', b'1', NOW(), NOW(), NOW(),
   '节点成立后关注回踩低吸，不追高。', '演示自选股，展示专门采集、专门分析、专门提醒闭环。', 'admin', NOW(), 'admin', NOW(), b'0')
ON DUPLICATE KEY UPDATE
  `name` = VALUES(`name`),
  `collect_level` = VALUES(`collect_level`),
  `collect_interval_minutes` = VALUES(`collect_interval_minutes`),
  `enable_monitor` = VALUES(`enable_monitor`),
  `enable_intraday` = VALUES(`enable_intraday`),
  `enable_t_strategy` = VALUES(`enable_t_strategy`),
  `enable_price_alert` = VALUES(`enable_price_alert`),
  `enable_signal_alert` = VALUES(`enable_signal_alert`),
  `latest_collect_time` = VALUES(`latest_collect_time`),
  `latest_analyze_time` = VALUES(`latest_analyze_time`),
  `latest_alert_time` = VALUES(`latest_alert_time`),
  `latest_advice` = VALUES(`latest_advice`),
  `remark` = VALUES(`remark`),
  `updater` = VALUES(`updater`),
  `update_time` = VALUES(`update_time`),
  `deleted` = VALUES(`deleted`);

INSERT INTO `stock_analysis_record`
(`id`, `user_id`, `watchlist_id`, `symbol`, `stock_name`, `market_signal_code`, `market_signal_name`,
 `volume_price_type`, `price_position`, `volume_price_advice`, `t_strategy_suitable`, `advice_action`,
 `reason_text`, `risk_level`, `source_name`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9002001, 1, 1, '600519.SH', '贵州茅台', 'INCREMENTAL_RESONANCE', '增量共振点',
   '量增价涨', '低位', '低位量增价涨，符合启动和趋势延续的双重特征，可跟踪。', b'1', '低吸跟踪',
   '先满足市场节点，再满足量价共振，且结构仍处于低位抬高阶段，适合结合三重底做T。', 'MEDIUM',
   'DEMO_REAL_PIPELINE', 'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_t_strategy_record`
(`id`, `analysis_record_id`, `symbol`, `suitable`, `support_price`, `resistance_price`, `buy_low_price`,
 `buy_high_price`, `sell_low_price`, `sell_high_price`, `position_ratio`, `invalid_condition`, `reason_text`,
 `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9002002, 9002001, '600519.SH', b'1', 1488.0000, 1545.0000, 1490.0000, 1505.0000, 1530.0000, 1545.0000,
   0.3000, '跌破 1488 支撑位且放量转弱时，立即停止做T并控制仓位。',
   '三重底抬高结构成立，反弹压力区明确，优先卖出老仓、保留低位新仓。', 'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_alert_channel`
(`user_id`, `channel_code`, `channel_name`, `enabled`, `config_json`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (1, 'INTERNAL_NOTIFY', '站内信', b'1', '{"templateCode":"STOCK_ALERT_DEFAULT"}', 'admin', NOW(), 'admin', NOW(), b'0'),
  (1, 'WXPUSHER', 'WxPusher', b'0', '{"appToken":"","uids":[]}', 'admin', NOW(), 'admin', NOW(), b'0')
ON DUPLICATE KEY UPDATE
  `channel_name` = VALUES(`channel_name`),
  `enabled` = VALUES(`enabled`),
  `config_json` = VALUES(`config_json`),
  `updater` = VALUES(`updater`),
  `update_time` = VALUES(`update_time`),
  `deleted` = VALUES(`deleted`);

INSERT INTO `stock_alert_rule`
(`id`, `user_id`, `watchlist_id`, `rule_name`, `rule_type`, `enabled`, `cooldown_minutes`, `rule_json`,
 `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9003001, 1, 1, '贵州茅台做T买点提醒', 'T_POINT', b'1', 30,
   '{"symbol":"600519.SH","buyLowPrice":1490.0,"buyHighPrice":1505.0,"direction":"between"}',
   'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_alert_record`
(`id`, `user_id`, `watchlist_id`, `rule_id`, `channel_code`, `symbol`, `alert_type`, `trigger_value`, `content`,
 `send_status`, `send_time`, `response_text`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9003002, 1, 1, 9003001, 'INTERNAL_NOTIFY', '600519.SH', 'T_POINT', '1498.00',
   '贵州茅台进入做T买入区间，可按计划小仓吸纳并保留止损纪律。', 'SENT', NOW(), '站内信发送成功',
   'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `stock_trade_journal`
(`id`, `user_id`, `symbol`, `stock_name`, `buy_price`, `sell_price`, `position_ratio`, `profit_rate`,
 `system_advice`, `remark`, `trade_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (9004001, 1, '600519.SH', '贵州茅台', 1496.0000, 1536.0000, 0.3000, 2.6700,
   '按三步循环做T：低位加仓，反弹先卖老仓，保留低成本新仓。', '演示复盘记录，用于历史页面联调。',
   NOW(), 'admin', NOW(), 'admin', NOW(), b'0');
