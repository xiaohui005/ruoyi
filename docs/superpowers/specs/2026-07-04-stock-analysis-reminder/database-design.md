# 股票分析与提醒系统数据库设计

## 1. 文档目标

本文档用于将《股票分析与提醒系统设计规格》中的概念表，细化为可直接落地的数据库设计方案，服务于：

1. MySQL 建表
2. DO 对象设计
3. Mapper 索引设计
4. 查询与定时任务性能评估
5. 前后端接口字段落地

本设计遵循当前仓库的真实基座规范：

1. 主键类型统一使用 `bigint`
2. 审计字段沿用 `BaseDO`
3. 多用户业务表默认按 `TenantBaseDO` 设计
4. 逻辑删除字段统一为 `deleted`

## 2. 基础约定

## 2.1 技术前提

默认数据库：

1. `MySQL 8.x`

兼容考虑：

1. 当前仓库支持多数据库方言，但股票模块第一阶段优先按 MySQL 落地
2. 对于 JSON 快照类字段，优先使用 `text` 存储 JSON 字符串，避免后续跨库适配复杂化

## 2.2 命名规范

表名统一前缀：

`stock_`

字段命名统一：

1. 小写下划线风格
2. 主键统一 `id`
3. 用户字段统一 `user_id`
4. 租户字段统一 `tenant_id`
5. 股票代码统一 `stock_code`
6. 股票名称统一 `stock_name`
7. 时间字段统一使用 `_time`、`_date`

## 2.3 审计字段规范

所有业务表默认包含以下字段：

1. `creator` `varchar(64)`
2. `create_time` `datetime`
3. `updater` `varchar(64)`
4. `update_time` `datetime`
5. `deleted` `bit(1)`

多租户业务表还应包含：

1. `tenant_id` `bigint`

推荐继承关系：

1. 全局公共只读行情表：可用 `BaseDO`
2. 用户配置、提醒、记录、交易日志表：推荐 `TenantBaseDO`

## 2.4 金额与价格字段规范

价格类字段统一建议：

1. `decimal(18,4)`

涨跌幅类字段统一建议：

1. `decimal(10,4)`

成交额类字段统一建议：

1. `decimal(20,2)`

成交量类字段统一建议：

1. `bigint`

## 2.5 状态与枚举字段规范

状态字段统一使用 `tinyint` 或 `varchar(32)`：

1. 高频过滤状态、启停状态：优先 `tinyint`
2. 规则编码、策略编码、数据源编码：优先 `varchar(32)` 或 `varchar(64)`

## 3. 表清单总览

第一阶段建议落地 13 张核心表：

1. `stock_basic_info`
2. `stock_market_snapshot`
3. `stock_kline_daily`
4. `stock_kline_intraday_snapshot`
5. `stock_market_signal_record`
6. `stock_watchlist`
7. `stock_analysis_config`
8. `stock_analysis_record`
9. `stock_t_strategy_record`
10. `stock_alert_channel`
11. `stock_alert_rule`
12. `stock_alert_record`
13. `stock_trade_journal`

## 4. 基础行情表设计

## 4.1 `stock_basic_info`

用途：

1. 存储股票基础信息
2. 支持代码联想、名称联想、所属板块展示
3. 作为自选股、分析记录、提醒记录的股票主信息来源

是否多租户：

1. 否，推荐 `BaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| stock_code | varchar(32) | 是 | 股票代码，如 `600519.SH` |
| stock_name | varchar(64) | 是 | 股票名称 |
| market | varchar(16) | 是 | 市场，如 `SH`、`SZ` |
| exchange_code | varchar(16) | 否 | 交易所代码 |
| board_code | varchar(32) | 否 | 板块代码 |
| board_name | varchar(64) | 否 | 板块名称 |
| industry_code | varchar(32) | 否 | 行业代码 |
| industry_name | varchar(64) | 否 | 行业名称 |
| listing_date | date | 否 | 上市日期 |
| status | tinyint | 是 | 状态，1 正常 0 停用 |
| data_source | varchar(32) | 是 | 数据来源 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 唯一索引：`uk_stock_code(stock_code, deleted)`
3. 普通索引：`idx_stock_name(stock_name)`
4. 普通索引：`idx_board_code(board_code)`
5. 普通索引：`idx_industry_code(industry_code)`

## 4.2 `stock_market_snapshot`

用途：

1. 存储每次市场整体快照
2. 用于六大节点识别输入
3. 用于市场页面展示与历史回放

是否多租户：

1. 否，推荐 `BaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| trade_date | date | 是 | 交易日 |
| snapshot_time | datetime | 是 | 快照时间 |
| index_code | varchar(32) | 是 | 主指数代码 |
| index_name | varchar(64) | 是 | 主指数名称 |
| index_price | decimal(18,4) | 是 | 指数最新价 |
| index_change_percent | decimal(10,4) | 是 | 指数涨跌幅 |
| market_turnover | decimal(20,2) | 是 | 市场成交额 |
| up_count | int | 是 | 上涨家数 |
| down_count | int | 是 | 下跌家数 |
| limit_up_count | int | 是 | 涨停家数 |
| limit_down_count | int | 是 | 跌停家数 |
| board_hot_json | text | 否 | 板块热度快照 JSON |
| theme_hot_json | text | 否 | 题材热度快照 JSON |
| data_source | varchar(32) | 是 | 数据来源 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_trade_date_snapshot_time(trade_date, snapshot_time)`
3. 普通索引：`idx_snapshot_time(snapshot_time)`
4. 普通索引：`idx_index_code(index_code)`

## 4.3 `stock_kline_daily`

用途：

1. 存储股票日线
2. 支持量价分析、三重底识别、图表回放

是否多租户：

1. 否，推荐 `BaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| trade_date | date | 是 | 交易日 |
| open_price | decimal(18,4) | 是 | 开盘价 |
| close_price | decimal(18,4) | 是 | 收盘价 |
| high_price | decimal(18,4) | 是 | 最高价 |
| low_price | decimal(18,4) | 是 | 最低价 |
| pre_close_price | decimal(18,4) | 否 | 前收盘价 |
| change_amount | decimal(18,4) | 否 | 涨跌额 |
| change_percent | decimal(10,4) | 否 | 涨跌幅 |
| volume | bigint | 是 | 成交量 |
| amount | decimal(20,2) | 是 | 成交额 |
| turnover_rate | decimal(10,4) | 否 | 换手率 |
| amplitude | decimal(10,4) | 否 | 振幅 |
| data_source | varchar(32) | 是 | 数据来源 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 唯一索引：`uk_stock_trade_date(stock_code, trade_date, deleted)`
3. 普通索引：`idx_trade_date(trade_date)`
4. 普通索引：`idx_stock_code_trade_date(stock_code, trade_date)`

## 4.4 `stock_kline_intraday_snapshot`

用途：

1. 存储盘中分时或分钟级快照
2. 支持盘中提醒、重点关注股监控和图表展示

是否多租户：

1. 否，推荐 `BaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| trade_date | date | 是 | 交易日 |
| snapshot_time | datetime | 是 | 快照时间 |
| period_type | varchar(16) | 是 | 周期类型，如 `1m`、`3m`、`5m`、`tick` |
| open_price | decimal(18,4) | 否 | 开盘价 |
| close_price | decimal(18,4) | 是 | 最新价 |
| high_price | decimal(18,4) | 否 | 最高价 |
| low_price | decimal(18,4) | 否 | 最低价 |
| change_percent | decimal(10,4) | 否 | 涨跌幅 |
| volume | bigint | 否 | 成交量 |
| amount | decimal(20,2) | 否 | 成交额 |
| data_source | varchar(32) | 是 | 数据来源 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_stock_snapshot(stock_code, snapshot_time)`
3. 普通索引：`idx_trade_date_period(trade_date, period_type)`
4. 普通索引：`idx_snapshot_time(snapshot_time)`

## 5. 市场节点与分析表设计

## 5.1 `stock_market_signal_record`

用途：

1. 存储六大节点识别结果
2. 供市场节点页展示和历史复盘

是否多租户：

1. 否，推荐 `BaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| trade_date | date | 是 | 交易日 |
| signal_time | datetime | 是 | 信号时间 |
| signal_code | varchar(32) | 是 | 节点编码 |
| signal_name | varchar(64) | 是 | 节点名称 |
| tradable_flag | tinyint | 是 | 是否可交易 |
| risk_level | tinyint | 是 | 风险等级 |
| advice_type | varchar(32) | 是 | 建议动作 |
| trigger_reason_text | varchar(1000) | 是 | 触发原因摘要 |
| trigger_snapshot_json | text | 否 | 触发快照 JSON |
| data_source | varchar(32) | 是 | 数据来源 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_trade_date_signal_time(trade_date, signal_time)`
3. 普通索引：`idx_signal_code(signal_code)`
4. 普通索引：`idx_tradable_flag(tradable_flag)`

## 5.2 `stock_analysis_record`

用途：

1. 记录股票量价分析结论
2. 区分监控链路分析与手工查询分析

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| watchlist_id | bigint | 否 | 来源自选股编号 |
| from_watchlist | tinyint | 是 | 是否来自监控链路 |
| collect_level | varchar(16) | 否 | 采集级别 |
| market_signal_code | varchar(32) | 否 | 当时市场节点编码 |
| signal_type | varchar(32) | 是 | 量价类型 |
| position_type | varchar(32) | 是 | 高低位类型 |
| advice_type | varchar(32) | 是 | 操作建议 |
| risk_level | tinyint | 是 | 风险等级 |
| reason_text | varchar(1000) | 是 | 原因说明 |
| feature_snapshot_json | text | 否 | 量价特征快照 |
| provider_code | varchar(32) | 否 | 数据源编码 |
| strategy_code | varchar(32) | 否 | 策略编码 |
| strategy_version | varchar(32) | 否 | 策略版本 |
| analysis_time | datetime | 是 | 分析时间 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_stock_analysis_time(user_id, stock_code, analysis_time)`
3. 普通索引：`idx_watchlist_analysis_time(watchlist_id, analysis_time)`
4. 普通索引：`idx_signal_type(signal_type)`
5. 普通索引：`idx_market_signal_code(market_signal_code)`

## 5.3 `stock_t_strategy_record`

用途：

1. 记录做T结构判断和买卖价位
2. 支持监控页、历史记录页和提醒触发

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| watchlist_id | bigint | 否 | 自选股编号 |
| market_signal_code | varchar(32) | 否 | 市场节点编码 |
| is_t_applicable | tinyint | 是 | 是否适合做T |
| support_price | decimal(18,4) | 否 | 支撑位 |
| support_source | varchar(32) | 否 | 支撑来源 |
| buy_price_min | decimal(18,4) | 否 | 买入区间下限 |
| buy_price_max | decimal(18,4) | 否 | 买入区间上限 |
| pressure_price | decimal(18,4) | 否 | 压力位 |
| pressure_source | varchar(32) | 否 | 压力来源 |
| sell_price_min | decimal(18,4) | 否 | 卖出区间下限 |
| sell_price_max | decimal(18,4) | 否 | 卖出区间上限 |
| position_ratio | decimal(10,4) | 否 | 建议仓位比例 |
| invalid_condition_text | varchar(1000) | 否 | 失效条件 |
| risk_level | tinyint | 否 | 风险等级 |
| strategy_snapshot_json | text | 否 | 做T计算快照 |
| strategy_code | varchar(32) | 否 | 策略编码 |
| strategy_version | varchar(32) | 否 | 策略版本 |
| analysis_time | datetime | 是 | 分析时间 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_stock_analysis_time(user_id, stock_code, analysis_time)`
3. 普通索引：`idx_watchlist_analysis_time(watchlist_id, analysis_time)`
4. 普通索引：`idx_t_applicable(is_t_applicable)`

## 6. 用户关注与配置表设计

## 6.1 `stock_watchlist`

用途：

1. 存储用户关注股票
2. 控制专门采集强度与监控开关

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| enabled | tinyint | 是 | 是否启用监控 |
| collect_level | varchar(16) | 是 | 采集级别：NORMAL/KEY/CORE |
| collect_interval_minutes | int | 是 | 采集周期，单位分钟 |
| need_intraday_kline | tinyint | 是 | 是否采集分时 |
| need_board_analysis | tinyint | 是 | 是否采集板块联动 |
| need_t_strategy | tinyint | 是 | 是否启用做T分析 |
| need_price_alert | tinyint | 是 | 是否启用价格提醒 |
| need_signal_alert | tinyint | 是 | 是否启用信号提醒 |
| last_collect_time | datetime | 否 | 最近采集时间 |
| last_analysis_time | datetime | 否 | 最近分析时间 |
| last_alert_time | datetime | 否 | 最近提醒时间 |
| last_advice_type | varchar(32) | 否 | 最近建议动作 |
| last_risk_level | tinyint | 否 | 最近风险等级 |
| remark | varchar(500) | 否 | 备注 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 唯一索引：`uk_tenant_user_stock(tenant_id, user_id, stock_code, deleted)`
3. 普通索引：`idx_user_enabled(user_id, enabled)`
4. 普通索引：`idx_collect_level_enabled(collect_level, enabled)`
5. 普通索引：`idx_last_collect_time(last_collect_time)`

## 6.2 `stock_analysis_config`

用途：

1. 存储用户分析参数与阈值
2. 支持不同策略和不同用户的参数隔离

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| config_name | varchar(64) | 是 | 配置名称 |
| strategy_code | varchar(32) | 是 | 策略编码 |
| strategy_version | varchar(32) | 否 | 策略版本 |
| market_signal_threshold_json | text | 否 | 节点阈值 |
| volume_price_threshold_json | text | 否 | 量价阈值 |
| t_strategy_threshold_json | text | 否 | 做T阈值 |
| risk_control_threshold_json | text | 否 | 风控阈值 |
| default_position_ratio | decimal(10,4) | 否 | 默认仓位 |
| enabled | tinyint | 是 | 是否启用 |
| is_default | tinyint | 是 | 是否默认配置 |
| remark | varchar(500) | 否 | 备注 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_enabled(user_id, enabled)`
3. 普通索引：`idx_user_strategy(user_id, strategy_code)`
4. 普通索引：`idx_user_default(user_id, is_default)`

## 7. 提醒相关表设计

## 7.1 `stock_alert_channel`

用途：

1. 存储用户提醒渠道配置
2. 支持 WxPusher、站内信、邮件等

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| channel_code | varchar(32) | 是 | 渠道编码 |
| channel_name | varchar(64) | 是 | 渠道名称 |
| enabled | tinyint | 是 | 是否启用 |
| config_json | text | 是 | 渠道配置 JSON |
| last_test_time | datetime | 否 | 最近测试时间 |
| last_test_result | varchar(255) | 否 | 最近测试结果 |
| remark | varchar(500) | 否 | 备注 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_channel(user_id, channel_code)`
3. 普通索引：`idx_user_enabled(user_id, enabled)`

## 7.2 `stock_alert_rule`

用途：

1. 定义提醒触发规则
2. 支持绑定全部关注股或指定股票

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| rule_name | varchar(64) | 是 | 规则名称 |
| rule_type | varchar(32) | 是 | 规则类型 |
| bind_scope | varchar(16) | 是 | 绑定范围：ALL / WATCHLIST / STOCK |
| watchlist_id | bigint | 否 | 自选股编号 |
| stock_code | varchar(32) | 否 | 绑定股票代码 |
| channel_ids | varchar(500) | 否 | 绑定渠道编号列表，逗号分隔或 JSON |
| enabled | tinyint | 是 | 是否启用 |
| cooldown_minutes | int | 是 | 冷却分钟数 |
| condition_json | text | 是 | 触发条件 |
| template_json | text | 否 | 消息模板 |
| priority | tinyint | 是 | 优先级 |
| remark | varchar(500) | 否 | 备注 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_enabled(user_id, enabled)`
3. 普通索引：`idx_rule_type(rule_type)`
4. 普通索引：`idx_watchlist_id(watchlist_id)`
5. 普通索引：`idx_stock_code(stock_code)`

## 7.3 `stock_alert_record`

用途：

1. 记录每次实际触发和发送结果
2. 支持发送审计与重发排查

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| watchlist_id | bigint | 否 | 自选股编号 |
| rule_id | bigint | 否 | 提醒规则编号 |
| channel_id | bigint | 否 | 渠道编号 |
| trigger_type | varchar(32) | 是 | 触发类型 |
| stock_code | varchar(32) | 否 | 股票代码 |
| stock_name | varchar(64) | 否 | 股票名称 |
| trigger_time | datetime | 是 | 触发时间 |
| trigger_price | decimal(18,4) | 否 | 触发价格 |
| message_title | varchar(255) | 否 | 消息标题 |
| message_content | text | 否 | 消息内容 |
| send_status | tinyint | 是 | 发送状态 |
| send_time | datetime | 否 | 发送时间 |
| fail_reason | varchar(1000) | 否 | 失败原因 |
| trigger_snapshot_json | text | 否 | 触发快照 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_trigger_time(user_id, trigger_time)`
3. 普通索引：`idx_watchlist_trigger_time(watchlist_id, trigger_time)`
4. 普通索引：`idx_rule_id(rule_id)`
5. 普通索引：`idx_send_status(send_status)`

## 8. 复盘与交易记录表设计

## 8.1 `stock_trade_journal`

用途：

1. 存储用户手工买卖记录
2. 记录系统建议与用户实际操作对照
3. 用于复盘收益与策略效果

是否多租户：

1. 是，推荐 `TenantBaseDO`

### 字段设计

| 字段名 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | bigint | 是 | 主键 |
| tenant_id | bigint | 是 | 租户编号 |
| user_id | bigint | 是 | 用户编号 |
| watchlist_id | bigint | 否 | 自选股编号 |
| stock_code | varchar(32) | 是 | 股票代码 |
| stock_name | varchar(64) | 是 | 股票名称 |
| trade_type | varchar(16) | 是 | BUY / SELL / T_BUY / T_SELL |
| trade_date | date | 是 | 交易日期 |
| trade_time | datetime | 否 | 交易时间 |
| price | decimal(18,4) | 是 | 成交价格 |
| quantity | bigint | 否 | 数量 |
| amount | decimal(20,2) | 否 | 成交额 |
| fee_amount | decimal(18,2) | 否 | 手续费 |
| pnl_amount | decimal(18,2) | 否 | 盈亏金额 |
| pnl_percent | decimal(10,4) | 否 | 盈亏比例 |
| related_analysis_id | bigint | 否 | 关联量价分析记录 |
| related_t_strategy_id | bigint | 否 | 关联做T记录 |
| system_advice_snapshot | text | 否 | 当时系统建议 |
| user_note | varchar(1000) | 否 | 用户备注 |
| creator | varchar(64) | 否 | 创建者 |
| create_time | datetime | 是 | 创建时间 |
| updater | varchar(64) | 否 | 更新者 |
| update_time | datetime | 是 | 更新时间 |
| deleted | bit(1) | 是 | 逻辑删除 |

### 索引设计

1. 主键：`pk_id(id)`
2. 普通索引：`idx_user_trade_date(user_id, trade_date)`
3. 普通索引：`idx_stock_trade_date(stock_code, trade_date)`
4. 普通索引：`idx_watchlist_id(watchlist_id)`

## 9. 典型查询与索引校验

本节用于验证表设计是否覆盖主要业务查询。

## 9.1 市场节点页

典型查询：

1. 查询最新市场节点
2. 按日期分页查询市场节点历史

依赖索引：

1. `stock_market_signal_record.idx_trade_date_signal_time`

## 9.2 自选股监控页

典型查询：

1. 查询当前用户启用监控的股票池
2. 按采集级别筛选
3. 查看最近采集时间和最近提醒时间

依赖索引：

1. `stock_watchlist.uk_tenant_user_stock`
2. `stock_watchlist.idx_user_enabled`
3. `stock_watchlist.idx_collect_level_enabled`

## 9.3 股票分析历史

典型查询：

1. 查询某用户某股票最近 N 条分析记录
2. 查询某自选股最近分析结果

依赖索引：

1. `stock_analysis_record.idx_user_stock_analysis_time`
2. `stock_analysis_record.idx_watchlist_analysis_time`

## 9.4 提醒记录

典型查询：

1. 查询用户最近提醒
2. 查询某股票提醒历史
3. 查询发送失败记录

依赖索引：

1. `stock_alert_record.idx_user_trigger_time`
2. `stock_alert_record.idx_watchlist_trigger_time`
3. `stock_alert_record.idx_send_status`

## 10. 建表顺序建议

建议按以下顺序建表：

1. `stock_basic_info`
2. `stock_market_snapshot`
3. `stock_kline_daily`
4. `stock_kline_intraday_snapshot`
5. `stock_market_signal_record`
6. `stock_watchlist`
7. `stock_analysis_config`
8. `stock_analysis_record`
9. `stock_t_strategy_record`
10. `stock_alert_channel`
11. `stock_alert_rule`
12. `stock_alert_record`
13. `stock_trade_journal`

## 11. DO 设计建议

## 11.1 推荐继承关系

推荐采用：

1. `stock_basic_info` -> `BaseDO`
2. `stock_market_snapshot` -> `BaseDO`
3. `stock_kline_daily` -> `BaseDO`
4. `stock_kline_intraday_snapshot` -> `BaseDO`
5. `stock_market_signal_record` -> `BaseDO`
6. 其余用户配置、提醒、分析、交易记录表 -> `TenantBaseDO`

## 11.2 推荐包结构

建议目录：

1. `dal/dataobject/basic`
2. `dal/dataobject/market`
3. `dal/dataobject/analyze`
4. `dal/dataobject/watch`
5. `dal/dataobject/alert`
6. `dal/dataobject/journal`

## 12. 第一阶段可延后字段

以下字段可在第一阶段先预留，必要时第二阶段再启用：

1. `provider_extra`
2. `strategy_version`
3. `template_json`
4. `board_hot_json`
5. `feature_snapshot_json`
6. `system_advice_snapshot`

它们不影响主功能，但对后续扩展、排障、回放很有价值。

## 13. 风险与取舍

### 13.1 为什么不把所有 JSON 拆平

原因：

1. 第一阶段规则会持续迭代
2. 量价快照、触发快照、策略快照字段结构变化大
3. 先存 JSON 更利于快速演进

### 13.2 为什么仍然保留核心结构化字段

原因：

1. 页面高频展示字段必须可索引
2. 定时任务筛选和提醒触发不能依赖全文 JSON 查询
3. 高频条件必须结构化，例如股票代码、用户、风险等级、分析时间、发送状态

## 14. 后续文档衔接

这份数据库设计完成后，下一步建议继续补两份文档：

1. `api-design.md`
2. `implementation-plan.md`

这样就形成完整链路：

1. 设计规格
2. 数据库设计
3. 接口设计
4. 实施计划

## 15. 结论

本数据库设计遵循当前 `ruoyi-vue-pro / yudao` 的字段风格和多租户习惯，重点保证三件事：

1. 真实数据采集与市场分析能落地
2. 用户关注股票能被专门采集、专门分析、专门提醒、专门登记
3. 后续新增策略、数据源、提醒渠道时，不需要推翻现有表结构

这保证第一阶段既能快速上线，又不会把后续扩展空间封死。
