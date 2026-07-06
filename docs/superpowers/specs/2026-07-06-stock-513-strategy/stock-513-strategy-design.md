# 513连板启动战法接入设计

## 1. 背景

当前股票模块已经具备以下能力：

1. 单股分析链路
2. K 线形态识别
3. 自选股定时分析
4. 提醒规则与提醒记录

现有实现里，形态提醒已经通过 `KLINE_PATTERN` 进入提醒链路，策略结果也已经以 `patternCode` 的方式参与匹配。因此，`513` 不需要单独重做一套提醒系统，最合适的做法是把它作为一条独立形态信号接入现有框架。

## 2. 设计目标

1. `513` 作为独立战法协议存在，不混入现有市场节点、量价、做 T 的主逻辑
2. 保持现有提醒链路不变，复用 `KLINE_PATTERN` 规则类型
3. 规则命中后按“任一达标就提醒”的口径处理
4. 不新增强制性的数据库表，先用现有结构完成闭环
5. 保留后续升级为“统一策略中心”的扩展口子

## 3. 现状分析

### 3.1 现有分析链路

`[StockAnalyzerServiceImpl.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\analyzer\StockAnalyzerServiceImpl.java:82>)` 已经完成：

1. 拉取 K 线
2. 计算市场节点
3. 计算量价结构
4. 计算做 T 结果
5. 识别 K 线形态
6. 落库分析结果

其中形态识别已经由 `[StockKlinePatternDetector.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\analyzer\StockKlinePatternDetector.java:18>)` 统一输出为 `StockKlinePatternDTO`。

### 3.2 现有提醒链路

`[StockAlertServiceImpl.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\alert\StockAlertServiceImpl.java:116>)` 已经支持：

1. 市场节点提醒
2. 做 T 提醒
3. K 线形态提醒
4. 自定义规则提醒

其中 `KLINE_PATTERN` 已支持按 `patternCode` 或 `patternCodes` 匹配，因此 `513` 可以直接作为一个独立 `patternCode` 接入。

### 3.3 当前数据结构

现有表足以承载这次接入：

1. `stock_alert_rule`
2. `stock_alert_record`
3. `stock_analysis_record`

当前不建议为 `513` 单独新增表，避免把一个战法接入成本抬高到“新系统”的级别。

## 4. 总体方案

### 4.1 接入原则

`513` 的接入方式：

1. 作为一个独立 `patternCode`
2. 在 K 线形态检测器中单独计算
3. 在提醒规则中通过 `KLINE_PATTERN` 命中
4. 与现有策略按 `OR` 合并

### 4.2 合并口径

默认口径为：

```text
任一策略命中 => 触发提醒
```

这是当前代码最贴合的模式，也符合“只要有达标就提醒”的要求。

### 4.3 为什么不先重构成统一策略中心

原因有三点：

1. 当前链路已经可用，没必要为了 `513` 打断已有功能
2. `KLINE_PATTERN` 已经提供了统一入口
3. 真正需要重构统一策略中心时，再补 `strategyCode / stage / score` 会更稳

## 5. `513` 规则定义

`513` 作为形态信号，内部仍按三段式判断：

1. `5`：5 连阳确认主力入场
2. `1`：1 根异动倍量阳作为启动核心
3. `3`：3 天控盘验证作为上车确认

### 5.1 输出状态

建议输出三种状态：

1. `PASS`
2. `FAIL`
3. `PENDING`

其中：

1. `PENDING` 表示只完成了前置阶段，未形成完整信号
2. `PASS` 表示完整命中
3. `FAIL` 表示不满足硬条件

### 5.2 建议的 `patternCode`

建议使用：

```text
FIVE_ONE_THREE
```

原因：

1. 语义清晰
2. 避免直接使用中文编码导致跨系统兼容问题
3. 后续如果还要加“5-1-3-A / 5-1-3-B”之类变体，也方便扩展

## 6. 代码接入点

### 6.1 形态检测器

在 `[StockKlinePatternDetector.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\analyzer\StockKlinePatternDetector.java:18>)` 中新增 `513` 识别逻辑。

输出的 `StockKlinePatternDTO` 保持现有结构不变，只新增一条记录：

1. `patternCode = FIVE_ONE_THREE`
2. `patternName = 513连板启动`
3. `signalType` 继续沿用多空方向分类
4. `description` 写清三段式判断结果
5. `tradeAdvice` 写清是否可观察、是否可提醒、是否可上车

### 6.2 分析结果 DTO

`[StockAnalyzeResultDTO.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\analyzer\dto\StockAnalyzeResultDTO.java:11>)` 现有的 `klinePatterns` 足以承载 `513`，暂不需要新增字段。

### 6.3 提醒规则

`[StockAlertServiceImpl.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\service\alert\StockAlertServiceImpl.java:203>)` 的 `KLINE_PATTERN` 匹配逻辑保持不变，只需确保规则 JSON 可写入：

```json
{"patternCodes":["FIVE_ONE_THREE"]}
```

### 6.4 规则类型枚举

`[StockAlertRuleTypeEnum.java](<D:\gongju\six6\ruoyi-vue-pro\yudao-module-stock\src\main\java\cn\iocoder\yudao\module\stock\enums\StockAlertRuleTypeEnum.java:8>)` 应补齐 `KLINE_PATTERN`，和实际代码保持一致。

## 7. 数据与配置设计

### 7.1 提醒规则表

不新增表，直接复用 `stock_alert_rule`：

1. `rule_type = KLINE_PATTERN`
2. `rule_json` 记录 `patternCode` 或 `patternCodes`
3. `cooldown_minutes` 继续控制重复提醒

### 7.2 提醒记录表

不改表结构，继续记录：

1. `alert_type = KLINE_PATTERN`
2. `trigger_value` 写命中的标题或核心值
3. `content` 写完整解释文本

### 7.3 未来扩展口子

后续如果真要做统一策略中心，再补这些字段更合适：

1. `strategy_code`
2. `signal_stage`
3. `signal_score`
4. `dedup_key`

本次不做强制升级。

## 8. 执行流程

1. 定时任务拉取自选股行情
2. 分析器执行市场节点、量价、做 T、K 线形态
3. `513` 在形态检测阶段被识别为独立 pattern
4. 分析结果写入 `stock_analysis_record`
5. 提醒服务按现有规则匹配
6. 若命中 `FIVE_ONE_THREE`，发送提醒并写入 `stock_alert_record`
7. 同票同规则按冷却时间避免重复发送

## 9. 风险与约束

1. `513` 里“5 连阳”“炸板”“控盘验证”存在主观边界，需要在代码里把阈值参数化
2. 若行情源对涨停、炸板识别不稳定，误报会偏高
3. 如果以后 `513` 要和其他策略做更复杂的组合判断，再考虑统一策略中心

## 10. 验收标准

1. `513` 能作为独立形态被识别
2. `StockAnalyzeResultDTO.klinePatterns` 能返回 `FIVE_ONE_THREE`
3. `StockAlertServiceImpl` 能通过 `KLINE_PATTERN` 命中并提醒
4. 现有市场节点、量价、做 T 提醒不受影响
5. 同一股票同一规则具备冷却去重能力

## 11. 结论

这次接入不应该做成一套新系统，而应该沿用当前模块的实际结构：`513` 独立识别，结果归一到 `klinePatterns`，提醒沿用 `KLINE_PATTERN`，合并口径用 `OR`，先把闭环跑通，再考虑统一策略中心。
