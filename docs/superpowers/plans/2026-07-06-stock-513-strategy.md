# 513连板启动战法接入实施计划

> **对于代理工作者：** 必需子技能：使用 superpowers:subagent-driven-development（推荐）或 superpowers:executing-plans 来逐任务实施此计划。步骤使用复选框（`- [ ]`）语法进行跟踪。

**目标：** 将 `513` 连板启动战法接入现有股票模块，作为独立 K 线形态信号输出，并复用现有 `KLINE_PATTERN` 提醒链路实现“任一命中就提醒”。

**架构：** 保持当前分析主链路不变：`StockAnalyzerServiceImpl` 继续负责单股分析，`StockKlinePatternDetector` 负责形态识别，`StockAlertServiceImpl` 继续负责提醒分发。`513` 只作为一个新的 `patternCode` 接入，不新增提醒主流程，不新增强制性表结构，先用现有 `stock_alert_rule` / `stock_alert_record` 跑通闭环。后续如需更细的策略汇总中心，再单独升级。

**技术栈：** Spring Boot、JUnit 5、MyBatis-Plus、Quartz、现有 `yudao-module-stock` 分析与提醒模块

---

### 任务 1：补测试，先锁定 513 形态规则

**文件：**
- 修改：`yudao-module-stock/src/test/java/cn/iocoder/yudao/module/stock/service/analyzer/StockKlinePatternDetectorTest.java`

- [ ] **步骤 1：增加失败用例，覆盖 `513` 完整命中场景**

新增一个测试方法，构造至少 9 根日线：前 5 根满足连续小阳且底部抬高，第 6 根满足“先冲涨停再炸板、长上影、倍量”，后 3 根满足“开盘不破异动阳开盘价、量能不超过异动日、振幅不超过 5%”。断言 `detect(...)` 的结果包含 `patternCode = FIVE_ONE_THREE`。

- [ ] **步骤 2：增加失败用例，覆盖 513 不完整时不命中**

再补一个测试方法，只满足前 5 连阳但缺少倍量炸板，或者满足炸板但后 3 天不满足控盘验证，断言结果不包含 `FIVE_ONE_THREE`。

- [ ] **步骤 3：运行该测试类并确认新增测试先失败**

运行：`mvn -pl yudao-module-stock -Dtest=StockKlinePatternDetectorTest test`

预期：新增 `513` 用例失败，说明检测逻辑尚未实现。

### 任务 2：实现 513 形态检测逻辑

**文件：**
- 修改：`yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/service/analyzer/StockKlinePatternDetector.java`
- 如有必要，修改：`yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/service/analyzer/dto/StockKlinePatternDTO.java`

- [ ] **步骤 1：在检测器中新增 513 识别分支**

新增一个独立的 `matchFiveOneThree(...)` 方法，并在 `detect(...)` 中调用。判断顺序固定为：先 5 连阳，再 1 根异动倍量阳，再 3 天控盘验证。方法内部尽量复用现有 `StockKlineDailyDO` 字段，不引入新的数据依赖。

- [ ] **步骤 2：补齐 513 的结果组装**

新增一个 `build(...)` 调用，输出：

```text
patternCode = FIVE_ONE_THREE
patternName = 513连板启动
signalType = BULLISH
signalLabel = 利多
description = 说明三段式命中情况
tradeAdvice = 说明是否可观察、可提醒、可上车
```

- [ ] **步骤 3：运行测试验证通过**

运行：`mvn -pl yudao-module-stock -Dtest=StockKlinePatternDetectorTest test`

预期：`513` 命中和不命中用例都通过，原有五个形态测试保持通过。

### 任务 3：让提醒规则类型与现有实现对齐

**文件：**
- 修改：`yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/enums/StockAlertRuleTypeEnum.java`
- 如有必要，修改：`sql/mysql/stock/03_stock_seed.sql`
- 如有必要，修改：`sql/mysql/stock/01_stock_tables.sql`

- [ ] **步骤 1：补齐规则类型枚举**

把 `KLINE_PATTERN` 加进 `StockAlertRuleTypeEnum`，与 `StockAlertServiceImpl` 现有分支保持一致，避免配置层和执行层不一致。

- [ ] **步骤 2：补 513 的初始化规则样例**

在 `03_stock_seed.sql` 里增加一条 `KLINE_PATTERN` 规则样例，`rule_json` 使用 `{"patternCodes":["FIVE_ONE_THREE"]}`，用于联调和页面验证。

- [ ] **步骤 3：仅在必要时补表结构说明**

当前不新增表。如果后续确认需要更细的去重字段，再单独评估是否给 `stock_alert_record` 增加 `strategy_code` 或 `dedup_key`，本计划阶段先不动表结构。

### 任务 4：验证分析到提醒的闭环

**文件：**
- 创建：`yudao-module-stock/src/test/java/cn/iocoder/yudao/module/stock/service/alert/StockAlertServiceImplTest.java`
- 可能修改：`yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/service/alert/StockAlertServiceImpl.java`（仅在测试暴露出需要小幅调整时）

- [ ] **步骤 1：增加一个面向 `KLINE_PATTERN` 的提醒匹配测试**

构造 `StockAnalyzeResultDTO`，塞入一个 `patternCode = FIVE_ONE_THREE` 的 `klinePatterns`，断言 `evaluateAndSend(...)` 会走到提醒分支。

- [ ] **步骤 2：增加一个不命中的反例测试**

构造不含 `FIVE_ONE_THREE` 的 `klinePatterns`，断言不会进入发送分支。

- [ ] **步骤 3：运行提醒相关测试并确认通过**

运行：`mvn -pl yudao-module-stock test`

预期：新增提醒测试通过，现有分析与提醒测试保持通过。

### 任务 5：执行一次模块级验证

**文件：**
- 无新增文件

- [ ] **步骤 1：编译股票模块**

运行：`mvn -pl yudao-module-stock -am -DskipTests compile`

预期：编译通过。

- [ ] **步骤 2：跑股票模块测试**

运行：`mvn -pl yudao-module-stock test`

预期：股票模块测试通过，新增 `513` 用例稳定通过。

- [ ] **步骤 3：人工检查提醒设置页的规则展示**

确认规则类型里能配置 `KLINE_PATTERN`，`patternCodes` 能写入 `FIVE_ONE_THREE`，页面/接口不会因为枚举缺失而报错。
