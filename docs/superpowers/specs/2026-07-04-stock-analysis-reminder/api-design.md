# 股票分析与提醒系统接口设计

## 1. 文档目标

本文档用于定义股票分析与提醒系统第一阶段的后端接口设计，明确：

1. 接口分组
2. 路径命名
3. 权限标识
4. 请求 VO
5. 响应 VO
6. 分页规范
7. 前端 TypeScript Interface 对应关系

本设计遵循当前仓库真实接口风格：

1. Controller 返回统一 `CommonResult`
2. 分页接口返回 `CommonResult<PageResult<RespVO>>`
3. 列表查询参数继承 `PageParam`
4. 前端在 `src/api/stock/**` 中定义对应 TS Interface

## 2. 通用接口规范

## 2.1 返回结构

所有管理端接口统一返回：

```java
CommonResult<T>
```

分页统一返回：

```java
CommonResult<PageResult<T>>
```

成功结构示意：

```json
{
  "code": 0,
  "data": {},
  "msg": ""
}
```

## 2.2 分页参数

分页查询统一使用：

1. `pageNo`
2. `pageSize`

必要时追加筛选字段，不允许页面自行发明分页字段。

## 2.3 时间参数

时间查询统一优先使用：

1. 单一时间：`xxxTime`
2. 区间时间：`xxxTime[]`

日期格式遵循当前项目常规：

`yyyy-MM-dd HH:mm:ss`

## 2.4 权限标识规范

统一前缀：

`stock:*`

建议使用以下风格：

1. `stock:market-signal:query`
2. `stock:analyzer:query`
3. `stock:watchlist:create`
4. `stock:watchlist:update`
5. `stock:watchlist:delete`
6. `stock:alert-rule:query`
7. `stock:alert-rule:create`
8. `stock:alert-rule:update`
9. `stock:alert-rule:delete`
10. `stock:trade-journal:create`

## 2.5 前端接口目录规范

建议前端目录如下：

1. `src/api/stock/marketSignal/index.ts`
2. `src/api/stock/analyzer/index.ts`
3. `src/api/stock/watchlist/index.ts`
4. `src/api/stock/monitor/index.ts`
5. `src/api/stock/alert/index.ts`
6. `src/api/stock/journal/index.ts`

## 3. 接口分组总览

第一阶段建议接口分 6 组：

1. 市场节点接口
2. 股票分析接口
3. 自选股与专门采集接口
4. 行情监控接口
5. 提醒配置接口
6. 历史记录与交易复盘接口

## 4. 市场节点接口

Controller 建议：

`StockMarketSignalController`

基础路径建议：

`/stock/market-signal`

## 4.1 获取当前市场节点

### 接口

`GET /stock/market-signal/current`

### 权限

`stock:market-signal:query`

### 请求参数

无

### 响应 VO

`StockMarketSignalRespVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| signalCode | string | 节点编码 |
| signalName | string | 节点名称 |
| tradableFlag | boolean | 是否允许交易 |
| adviceType | string | 建议动作 |
| riskLevel | number | 风险等级 |
| triggerReasonText | string | 触发原因说明 |
| snapshotTime | string | 信号时间 |
| indexCode | string | 指数代码 |
| indexName | string | 指数名称 |
| indexPrice | number | 指数价格 |
| indexChangePercent | number | 指数涨跌幅 |
| marketTurnover | number | 市场成交额 |
| limitUpCount | number | 涨停家数 |
| limitDownCount | number | 跌停家数 |
| upCount | number | 上涨家数 |
| downCount | number | 下跌家数 |

### 前端用途

1. 市场节点页顶部状态卡
2. 市场概览卡
3. 股票分析页前置过滤提示

## 4.2 分页查询市场节点历史

### 接口

`GET /stock/market-signal/page`

### 权限

`stock:market-signal:query`

### 请求 VO

`StockMarketSignalPageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| signalCode | string | 节点编码筛选 |
| tradableFlag | boolean | 是否可交易 |
| riskLevel | number | 风险等级 |
| signalTime | LocalDateTime[] | 时间区间 |

### 响应

`CommonResult<PageResult<StockMarketSignalRespVO>>`

## 4.3 更新市场节点阈值配置

### 接口

`PUT /stock/market-signal/config`

### 权限

`stock:market-signal:update-config`

### 请求 VO

`StockMarketSignalConfigReqVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| configId | number | 配置编号，可空 |
| configName | string | 配置名称 |
| marketSignalThresholdJson | string | 节点阈值 JSON |
| enabled | boolean | 是否启用 |

### 响应

`CommonResult<Boolean>`

## 5. 股票分析接口

Controller 建议：

`StockAnalyzerController`

基础路径建议：

`/stock/analyzer`

## 5.1 查询单只股票分析结果

### 接口

`GET /stock/analyzer/get`

### 权限

`stock:analyzer:query`

### 请求 VO

`StockAnalyzeReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| stockCode | string | 是 | 股票代码 |
| tradeDate | string | 否 | 指定交易日 |
| useWatchConfig | boolean | 否 | 是否优先使用用户监控配置 |

### 响应 VO

`StockAnalyzeRespVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| stockName | string | 股票名称 |
| marketSignalCode | string | 当前市场节点编码 |
| marketSignalName | string | 当前市场节点名称 |
| tradableFlag | boolean | 当前市场是否支持交易 |
| signalType | string | 量价类型 |
| positionType | string | 高低位类型 |
| adviceType | string | 综合建议 |
| riskLevel | number | 风险等级 |
| reasonText | string | 原因说明 |
| isTApplicable | boolean | 是否适合做T |
| supportPrice | number | 支撑位 |
| supportSource | string | 支撑来源 |
| buyPriceMin | number | 买入区间下限 |
| buyPriceMax | number | 买入区间上限 |
| pressurePrice | number | 压力位 |
| pressureSource | string | 压力来源 |
| sellPriceMin | number | 卖出区间下限 |
| sellPriceMax | number | 卖出区间上限 |
| positionRatio | number | 建议仓位 |
| invalidConditionText | string | 失效条件 |
| analysisTime | string | 分析时间 |
| fromWatchlist | boolean | 是否来自监控配置 |
| watchlistId | number | 自选股编号 |

### 前端用途

1. 股票分析页三张核心分析卡
2. 行情监控页右侧实时判断面板

## 5.2 获取分析记录分页

### 接口

`GET /stock/analyzer/record-page`

### 权限

`stock:analyzer:query`

### 请求 VO

`StockAnalysisRecordPageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| watchlistId | number | 自选股编号 |
| signalType | string | 量价类型 |
| adviceType | string | 建议动作 |
| analysisTime | LocalDateTime[] | 分析时间区间 |

### 响应

`CommonResult<PageResult<StockAnalysisRecordRespVO>>`

## 6. 自选股与专门采集接口

Controller 建议：

`StockWatchlistController`

基础路径建议：

`/stock/watchlist`

## 6.1 自选股分页

### 接口

`GET /stock/watchlist/page`

### 权限

`stock:watchlist:query`

### 请求 VO

`StockWatchlistPageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| stockName | string | 股票名称 |
| enabled | boolean | 是否启用 |
| collectLevel | string | 采集级别 |
| tApplicable | boolean | 是否适合做T，可选查询条件 |

### 响应 VO

`StockWatchlistRespVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| id | number | 自选股编号 |
| stockCode | string | 股票代码 |
| stockName | string | 股票名称 |
| enabled | boolean | 是否启用 |
| collectLevel | string | 采集级别 |
| collectIntervalMinutes | number | 采集周期 |
| needIntradayKline | boolean | 是否采集分时 |
| needBoardAnalysis | boolean | 是否分析板块 |
| needTStrategy | boolean | 是否启用做T |
| needPriceAlert | boolean | 是否启用价格提醒 |
| needSignalAlert | boolean | 是否启用信号提醒 |
| lastCollectTime | string | 最近采集时间 |
| lastAnalysisTime | string | 最近分析时间 |
| lastAlertTime | string | 最近提醒时间 |
| lastAdviceType | string | 最近建议 |
| lastRiskLevel | number | 最近风险等级 |
| remark | string | 备注 |

## 6.2 新增自选股

### 接口

`POST /stock/watchlist/create`

### 权限

`stock:watchlist:create`

### 请求 VO

`StockWatchlistCreateReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| stockCode | string | 是 | 股票代码 |
| stockName | string | 是 | 股票名称 |
| collectLevel | string | 是 | 采集级别 |
| collectIntervalMinutes | number | 是 | 采集周期 |
| needIntradayKline | boolean | 是 | 是否采集分时 |
| needBoardAnalysis | boolean | 是 | 是否分析板块 |
| needTStrategy | boolean | 是 | 是否启用做T |
| needPriceAlert | boolean | 是 | 是否启用价格提醒 |
| needSignalAlert | boolean | 是 | 是否启用信号提醒 |
| remark | string | 否 | 备注 |

### 响应

`CommonResult<Long>`

## 6.3 修改自选股基础信息

### 接口

`PUT /stock/watchlist/update`

### 权限

`stock:watchlist:update`

### 请求 VO

`StockWatchlistUpdateReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | number | 是 | 自选股编号 |
| remark | string | 否 | 备注 |
| enabled | boolean | 是 | 是否启用 |

### 响应

`CommonResult<Boolean>`

## 6.4 修改采集配置

### 接口

`PUT /stock/watchlist/update-collect-config`

### 权限

`stock:watchlist:update`

### 请求 VO

`StockWatchCollectConfigReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | number | 是 | 自选股编号 |
| collectLevel | string | 是 | 采集级别 |
| collectIntervalMinutes | number | 是 | 采集周期 |
| needIntradayKline | boolean | 是 | 是否采集分时 |
| needBoardAnalysis | boolean | 是 | 是否分析板块 |
| needTStrategy | boolean | 是 | 是否启用做T |
| needPriceAlert | boolean | 是 | 是否启用价格提醒 |
| needSignalAlert | boolean | 是 | 是否启用信号提醒 |

### 响应

`CommonResult<Boolean>`

## 6.5 启用监控

### 接口

`POST /stock/watchlist/enable-monitor`

### 权限

`stock:watchlist:update`

### 请求

`id`

### 响应

`CommonResult<Boolean>`

## 6.6 停用监控

### 接口

`POST /stock/watchlist/disable-monitor`

### 权限

`stock:watchlist:update`

### 请求

`id`

### 响应

`CommonResult<Boolean>`

## 6.7 删除自选股

### 接口

`DELETE /stock/watchlist/delete?id={id}`

### 权限

`stock:watchlist:delete`

### 响应

`CommonResult<Boolean>`

## 6.8 查询监控运行状态

### 接口

`GET /stock/watchlist/runtime-state`

### 权限

`stock:watchlist:query`

### 请求参数

| 字段 | 类型 | 说明 |
|---|---|---|
| id | number | 自选股编号 |

### 响应 VO

`StockWatchRuntimeStateRespVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| watchlistId | number | 自选股编号 |
| stockCode | string | 股票代码 |
| stockName | string | 股票名称 |
| enabled | boolean | 是否启用 |
| collectLevel | string | 采集级别 |
| currentDataSource | string | 当前数据源 |
| lastCollectTime | string | 最近采集时间 |
| nextCollectTime | string | 下次采集时间 |
| lastAnalysisTime | string | 最近分析时间 |
| lastAlertTime | string | 最近提醒时间 |
| currentAdviceType | string | 当前建议动作 |
| currentRiskLevel | number | 当前风险等级 |
| currentTApplicable | boolean | 当前是否适合做T |

## 7. 行情监控接口

Controller 建议：

`StockMonitorController`

基础路径建议：

`/stock/monitor`

## 7.1 获取图表监控数据

### 接口

`GET /stock/monitor/kline`

### 权限

`stock:monitor:query`

### 请求 VO

`StockMonitorKlineReqVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| periodType | string | 周期类型：day / 1m / 5m |
| size | number | 返回条数 |

### 响应 VO

`StockMonitorKlineRespVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| stockName | string | 股票名称 |
| periodType | string | 周期类型 |
| latestPrice | number | 最新价 |
| changePercent | number | 涨跌幅 |
| volume | number | 最新成交量 |
| amount | number | 最新成交额 |
| boardName | string | 所属板块 |
| collectLevel | string | 当前采集级别 |
| dataTime | string | 数据时间 |
| klineList | KlineItemVO[] | K线数据 |
| supportLines | PriceLineVO[] | 支撑位 |
| pressureLines | PriceLineVO[] | 压力位 |
| signalMarkers | ChartMarkerVO[] | 量价/节点/提醒标记 |

### 子 VO 建议

#### `KlineItemVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| time | string | 时间 |
| openPrice | number | 开盘价 |
| closePrice | number | 收盘/最新价 |
| highPrice | number | 最高价 |
| lowPrice | number | 最低价 |
| volume | number | 成交量 |

#### `PriceLineVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| label | string | 名称 |
| price | number | 价格 |
| type | string | support / pressure / buy / sell |

#### `ChartMarkerVO`

| 字段 | 类型 | 说明 |
|---|---|---|
| time | string | 触发时间 |
| label | string | 标记文案 |
| markerType | string | signal / alert / t-point |
| price | number | 触发价格 |

## 7.2 获取提醒时间轴

### 接口

`GET /stock/monitor/alert-timeline`

### 权限

`stock:monitor:query`

### 请求参数

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| size | number | 最近条数 |

### 响应

`CommonResult<List<StockAlertTimelineRespVO>>`

## 8. 提醒配置接口

Controller 建议：

`StockAlertController`

基础路径建议：

`/stock/alert`

## 8.1 渠道列表

### 接口

`GET /stock/alert/channel-list`

### 权限

`stock:alert-channel:query`

### 响应

`CommonResult<List<StockAlertChannelRespVO>>`

## 8.2 新增或更新提醒渠道

### 接口

`POST /stock/alert/channel/save`

### 权限

`stock:alert-channel:update`

### 请求 VO

`StockAlertChannelSaveReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | number | 否 | 主键，更新时传 |
| channelCode | string | 是 | 渠道编码 |
| channelName | string | 是 | 渠道名称 |
| enabled | boolean | 是 | 是否启用 |
| configJson | string | 是 | 渠道配置 JSON |
| remark | string | 否 | 备注 |

### 响应

`CommonResult<Long>`

## 8.3 测试发送

### 接口

`POST /stock/alert/channel/test-send`

### 权限

`stock:alert-channel:update`

### 请求 VO

`StockAlertChannelTestSendReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| channelId | number | 是 | 渠道编号 |
| messageTitle | string | 是 | 消息标题 |
| messageContent | string | 是 | 消息内容 |

### 响应

`CommonResult<Boolean>`

## 8.4 提醒规则分页

### 接口

`GET /stock/alert/rule-page`

### 权限

`stock:alert-rule:query`

### 请求 VO

`StockAlertRulePageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| ruleType | string | 规则类型 |
| enabled | boolean | 是否启用 |
| stockCode | string | 股票代码 |
| watchlistId | number | 自选股编号 |

### 响应

`CommonResult<PageResult<StockAlertRuleRespVO>>`

## 8.5 新增提醒规则

### 接口

`POST /stock/alert/rule/create`

### 权限

`stock:alert-rule:create`

### 请求 VO

`StockAlertRuleSaveReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| id | number | 否 | 更新时传 |
| ruleName | string | 是 | 规则名称 |
| ruleType | string | 是 | 规则类型 |
| bindScope | string | 是 | 绑定范围 |
| watchlistId | number | 否 | 自选股编号 |
| stockCode | string | 否 | 股票代码 |
| channelIds | string[] | 否 | 绑定渠道 |
| enabled | boolean | 是 | 是否启用 |
| cooldownMinutes | number | 是 | 冷却时间 |
| conditionJson | string | 是 | 触发条件 |
| templateJson | string | 否 | 模板配置 |
| priority | number | 是 | 优先级 |
| remark | string | 否 | 备注 |

### 响应

`CommonResult<Long>`

## 8.6 修改提醒规则

### 接口

`PUT /stock/alert/rule/update`

### 权限

`stock:alert-rule:update`

### 请求

同 `StockAlertRuleSaveReqVO`

### 响应

`CommonResult<Boolean>`

## 8.7 删除提醒规则

### 接口

`DELETE /stock/alert/rule/delete?id={id}`

### 权限

`stock:alert-rule:delete`

### 响应

`CommonResult<Boolean>`

## 8.8 提醒记录分页

### 接口

`GET /stock/alert/record-page`

### 权限

`stock:alert-record:query`

### 请求 VO

`StockAlertRecordPageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| triggerType | string | 触发类型 |
| sendStatus | number | 发送状态 |
| triggerTime | LocalDateTime[] | 触发时间区间 |

### 响应

`CommonResult<PageResult<StockAlertRecordRespVO>>`

## 9. 历史记录与交易复盘接口

Controller 建议：

`StockJournalController`

基础路径建议：

`/stock/journal`

## 9.1 交易记录分页

### 接口

`GET /stock/journal/page`

### 权限

`stock:trade-journal:query`

### 请求 VO

`StockTradeJournalPageReqVO extends PageParam`

| 字段 | 类型 | 说明 |
|---|---|---|
| stockCode | string | 股票代码 |
| tradeType | string | 交易类型 |
| tradeDate | LocalDateTime[] | 交易日期区间 |

### 响应

`CommonResult<PageResult<StockTradeJournalRespVO>>`

## 9.2 新增交易复盘记录

### 接口

`POST /stock/journal/create`

### 权限

`stock:trade-journal:create`

### 请求 VO

`StockTradeJournalSaveReqVO`

| 字段 | 类型 | 必填 | 说明 |
|---|---|---:|---|
| watchlistId | number | 否 | 自选股编号 |
| stockCode | string | 是 | 股票代码 |
| stockName | string | 是 | 股票名称 |
| tradeType | string | 是 | 交易类型 |
| tradeDate | string | 是 | 交易日期 |
| tradeTime | string | 否 | 交易时间 |
| price | number | 是 | 成交价格 |
| quantity | number | 否 | 数量 |
| amount | number | 否 | 成交额 |
| feeAmount | number | 否 | 手续费 |
| pnlAmount | number | 否 | 盈亏金额 |
| pnlPercent | number | 否 | 盈亏比例 |
| relatedAnalysisId | number | 否 | 关联分析记录 |
| relatedTStrategyId | number | 否 | 关联做T记录 |
| userNote | string | 否 | 用户备注 |

### 响应

`CommonResult<Long>`

## 10. 前端 TypeScript Interface 建议

前端建议在每组 API 文件中定义和后端 VO 对齐的 Interface。

例如：

```ts
export interface StockMarketSignalRespVO {
  signalCode: string
  signalName: string
  tradableFlag: boolean
  adviceType: string
  riskLevel: number
  triggerReasonText: string
  snapshotTime: string
}
```

分页参数建议：

```ts
export interface StockWatchlistPageReqVO extends PageParam {
  stockCode?: string
  stockName?: string
  enabled?: boolean
  collectLevel?: string
}
```

## 11. 建议的 VO 文件结构

后端建议目录：

1. `controller/admin/market/vo/**`
2. `controller/admin/analyzer/vo/**`
3. `controller/admin/watchlist/vo/**`
4. `controller/admin/alert/vo/**`
5. `controller/admin/journal/vo/**`

建议命名：

1. `StockMarketSignalRespVO`
2. `StockMarketSignalPageReqVO`
3. `StockAnalyzeReqVO`
4. `StockAnalyzeRespVO`
5. `StockWatchlistCreateReqVO`
6. `StockWatchlistUpdateReqVO`
7. `StockWatchCollectConfigReqVO`
8. `StockAlertRuleSaveReqVO`
9. `StockTradeJournalSaveReqVO`

## 12. 第一阶段可延期接口

以下接口可作为第一阶段后半段或第二阶段补充：

1. `GET /stock/monitor/kline`
2. `GET /stock/monitor/alert-timeline`
3. `GET /stock/analyzer/record-page`

原因：

1. 第一阶段先跑通分析闭环、监控配置、提醒发送即可
2. 图表和历史细分接口可以后置，但建议文档先预留

## 13. 错误码建议

建议新增独立错误码常量类：

`StockErrorCodeConstants`

建议覆盖：

1. 股票代码不存在
2. 自选股已存在
3. 自选股不存在
4. 提醒渠道不存在
5. 提醒规则不存在
6. 数据源不可用
7. 当前无有效市场快照
8. 当前股票无足够历史数据

## 14. 结论

这份接口设计文档的目标不是把 Controller 方法名简单列出来，而是把：

1. 路径
2. 权限
3. 请求字段
4. 响应字段
5. 前端绑定关系

全部定清楚。这样后端与前端都可以在不反复对齐字段的前提下直接开工。
