# 股票分析与提醒系统实施计划

> **对于代理工作者：** 必须使用 `superpowers:executing-plans` 或等价的分阶段执行方式来实施本计划。所有任务必须在通过对应验证后再进入下一阶段。

**目标：** 在当前 `ruoyi-vue-pro / yudao` 仓库中落地第一阶段“可运行闭环”的股票分析与提醒系统，完成真实数据接入、规则识别、重点股票监控、提醒发送、前端展示与基础文档交付。

**架构：** 后端新增独立模块 `yudao-module-stock`，前端新增 `stock` 业务目录，所有策略逻辑集中在后端服务层，前端负责查询、展示、配置与确认。生产环境默认接真实数据源，Mock 仅用于测试与联调。

**技术栈：** Spring Boot 2.7、MyBatis Plus、Quartz、Redis、Vue3 + TS、Element Plus、ECharts、Tushare HTTP、AKTools HTTP、BaoStock 导入辅助。

---

## 1. 实施总原则

1. 先后端、后前端，先真实链路、后增强体验。
2. 先打通最小闭环，再做图表、记录、优化。
3. 所有业务代码放在独立 `stock` 模块，不混入 `system`。
4. 生产链路只接真实数据，测试链路才允许 Mock。
5. 每阶段必须有可验证结果。

## 2. 里程碑总览

### 里程碑 A：模块骨架与数据库落地

交付结果：

1. `yudao-module-stock` 模块创建完成
2. 核心表建表脚本完成
3. DO / Mapper 骨架完成
4. 基础菜单和权限 SQL 草案完成

### 里程碑 B：真实数据接入与行情落库

交付结果：

1. Tushare HTTP 主源接入
2. AKTools HTTP 补源接入
3. BaoStock 历史导入任务接入
4. 行情、市场快照能真实落库

### 里程碑 C：规则引擎闭环

交付结果：

1. 六大节点识别可运行
2. 量价分析可运行
3. 做T策略可运行
4. 综合决策服务可运行

### 里程碑 D：监控与提醒闭环

交付结果：

1. 自选股专门采集与调度可运行
2. Quartz 定时任务可运行
3. 提醒规则、渠道、记录可运行
4. WxPusher 与站内消息至少一种真实可验证

### 里程碑 E：前端管理端闭环

交付结果：

1. 市场节点页
2. 股票分析页
3. 自选股监控页
4. 提醒设置页
5. 历史记录页
6. 行情监控页基础版

### 里程碑 F：文档与联调验收

交付结果：

1. 部署文档
2. 使用文档
3. 测试样例
4. 风险提示
5. 验收清单

## 3. 目录与文件规划

### 3.1 后端新增目录

建议新增：

1. `yudao-module-stock/pom.xml`
2. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/api/**`
3. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/controller/**`
4. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/convert/**`
5. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/dal/**`
6. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/enums/**`
7. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/job/**`
8. `yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/service/**`
9. `yudao-module-stock/src/main/resources/mapper/stock/**`

### 3.2 前端新增目录

建议新增：

1. `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/api/stock/**`
2. `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/views/stock/**`
3. `yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3/src/components/stock/**`

### 3.3 SQL 与文档目录

建议新增：

1. `sql/mysql/stock/01_stock_tables.sql`
2. `sql/mysql/stock/02_stock_menu.sql`
3. `sql/mysql/stock/03_stock_seed.sql`
4. `docs/superpowers/specs/2026-07-04-stock-analysis-reminder/**`

## 4. 分阶段任务

### 任务 1：创建后端模块骨架

**文件：**

- 创建：`pom.xml` 根模块引用 `yudao-module-stock`
- 创建：`yudao-module-stock/pom.xml`
- 创建：`yudao-module-stock/src/main/java/cn/iocoder/yudao/module/stock/package-info.java`
- 创建：模块基础包结构

- [ ] **步骤 1：先补模块引用**

修改根 `pom.xml` 增加 `yudao-module-stock` 模块引用。

- [ ] **步骤 2：创建 stock 模块 `pom.xml`**

引入：

1. 当前基座公共依赖
2. MyBatis Plus
3. Quartz 任务能力
4. Redis 依赖
5. HTTP 客户端依赖

- [ ] **步骤 3：创建包骨架**

建立：

1. `controller/admin`
2. `service`
3. `dal/dataobject`
4. `dal/mysql`
5. `convert`
6. `job`
7. `enums`

- [ ] **步骤 4：编译验证**

运行：

```powershell
mvn -pl yudao-module-stock -am -DskipTests compile
```

预期：

1. 模块能被识别
2. 没有包路径错误

### 任务 2：建表与 DO/Mapper 落地

**文件：**

- 创建：`sql/mysql/stock/01_stock_tables.sql`
- 创建：`stock_basic_info` 等 DO
- 创建：对应 Mapper

- [ ] **步骤 1：先写建表 SQL**

按 `database-design.md` 先落以下表：

1. `stock_basic_info`
2. `stock_market_snapshot`
3. `stock_kline_daily`
4. `stock_watchlist`
5. `stock_analysis_config`
6. `stock_analysis_record`
7. `stock_t_strategy_record`
8. `stock_alert_channel`
9. `stock_alert_rule`
10. `stock_alert_record`
11. `stock_trade_journal`

- [ ] **步骤 2：创建 DO**

建议先从这些 DO 开始：

1. `StockBasicInfoDO`
2. `StockMarketSnapshotDO`
3. `StockWatchlistDO`
4. `StockAnalysisRecordDO`
5. `StockTStrategyRecordDO`
6. `StockAlertRuleDO`
7. `StockAlertRecordDO`

- [ ] **步骤 3：创建 Mapper**

先只做基础 CRUD Mapper，不做复杂 SQL。

- [ ] **步骤 4：运行编译验证**

运行：

```powershell
mvn -pl yudao-module-stock -am -DskipTests compile
```

预期：

1. DO / Mapper 无语法错误
2. MyBatis 扫描路径正确

### 任务 3：接入真实数据源

**文件：**

- 创建：`service/data/provider/**`
- 创建：`service/data/MarketDataService.java`
- 创建：`service/data/impl/TushareHttpProvider.java`
- 创建：`service/data/impl/AktoolsHttpProvider.java`
- 创建：`service/data/impl/BaostockImportService.java`

- [ ] **步骤 1：定义数据源接口**

先定义：

1. `MarketOverviewProvider`
2. `StockQuoteProvider`
3. `KlineProvider`
4. `LimitStatisticProvider`

- [ ] **步骤 2：实现 Tushare 主源**

支持至少：

1. 个股基础行情
2. 日线
3. 交易日
4. 市场概览必要字段

- [ ] **步骤 3：实现 AKTools 补源**

补充：

1. 市场总览
2. 板块热度
3. 部分缺失行情

- [ ] **步骤 4：实现 BaoStock 导入辅助**

仅用于历史 K 线导入任务，不进入生产盘中主链路。

- [ ] **步骤 5：验证真实数据可拉取**

至少验证：

1. 能拉一只股票最近日线
2. 能拉市场概览
3. 失败时能报可读错误

### 任务 4：实现市场节点识别引擎

**文件：**

- 创建：`service/signal/MarketSignalService.java`
- 创建：`service/signal/rule/**`
- 创建：`controller/admin/market/StockMarketSignalController.java`

- [ ] **步骤 1：定义 MarketSignalRule 接口**

每个节点一个实现：

1. 增量共振点
2. 题材发酵点
3. 主线第一次分歧点
4. 分歧转一致点
5. 市场突破震荡点
6. 情绪冰点修复点

- [ ] **步骤 2：实现统一决策入口**

根据市场快照输出唯一主节点或观望状态。

- [ ] **步骤 3：落库节点结果**

写入 `stock_market_signal_record`。

- [ ] **步骤 4：暴露接口**

实现：

1. `GET /stock/market-signal/current`
2. `GET /stock/market-signal/page`

- [ ] **步骤 5：验证**

验证：

1. 有结果输出
2. 原因可读
3. 能分页查历史

### 任务 5：实现量价分析引擎

**文件：**

- 创建：`service/analyzer/VolumePriceAnalyzerService.java`
- 创建：`service/analyzer/rule/**`
- 创建：`controller/admin/analyzer/StockAnalyzerController.java`

- [ ] **步骤 1：定义 VolumePriceRule 接口**

实现：

1. 量增价涨
2. 价涨量缩
3. 价跌量增

- [ ] **步骤 2：实现位置识别**

至少输出：

1. 低位
2. 中位
3. 高位

- [ ] **步骤 3：写入分析记录**

写入 `stock_analysis_record`。

- [ ] **步骤 4：暴露查询接口**

实现：

1. `GET /stock/analyzer/get`
2. `GET /stock/analyzer/record-page`

- [ ] **步骤 5：验证**

验证：

1. 输入股票代码能得到明确的量价结论
2. 结果能落库

### 任务 6：实现做T策略引擎

**文件：**

- 创建：`service/t/TStrategyService.java`
- 创建：`service/t/rule/**`

- [ ] **步骤 1：定义 TStrategyRule 接口**

实现三重底、支撑位、压力位识别。

- [ ] **步骤 2：输出做T核心结果**

至少输出：

1. 是否适合做T
2. 支撑位
3. 压力位
4. 买卖区间
5. 仓位比例
6. 失效条件

- [ ] **步骤 3：写入结果表**

写入 `stock_t_strategy_record`。

- [ ] **步骤 4：整合到股票分析接口**

将量价与做T结果组合输出。

- [ ] **步骤 5：验证**

验证：

1. 能针对给定股票输出做T结论
2. 失效条件清晰

### 任务 7：实现自选股专门采集与运行状态

**文件：**

- 创建：`controller/admin/watchlist/StockWatchlistController.java`
- 创建：`service/watch/StockWatchlistService.java`

- [ ] **步骤 1：实现自选股 CRUD**

实现：

1. 分页
2. 新增
3. 更新
4. 删除

- [ ] **步骤 2：实现采集配置更新**

实现：

1. 更新采集级别
2. 更新采集周期
3. 更新是否启用分时/做T/提醒

- [ ] **步骤 3：实现运行状态查询**

返回：

1. 最近采集时间
2. 最近分析时间
3. 最近提醒时间
4. 当前建议

- [ ] **步骤 4：验证**

验证：

1. 自选股能单独管理
2. 不同股票采集级别可区分

### 任务 8：实现定时任务与提醒闭环

**文件：**

- 创建：`job/StockMarketCollectJob.java`
- 创建：`job/StockWatchlistAnalyzeJob.java`
- 创建：`service/alert/AlertService.java`
- 创建：`service/alert/channel/**`

- [ ] **步骤 1：实现市场采集 Job**

负责：

1. 拉市场快照
2. 识别市场节点

- [ ] **步骤 2：实现关注股分析 Job**

负责：

1. 遍历启用监控股票池
2. 拉实时行情
3. 跑量价与做T
4. 落库

- [ ] **步骤 3：实现提醒渠道**

第一阶段先做：

1. 站内信
2. WxPusher

- [ ] **步骤 4：实现提醒规则匹配**

根据市场节点、量价、做T、价格条件判断是否发提醒。

- [ ] **步骤 5：验证**

验证：

1. Quartz 能跑
2. 提醒能发
3. 提醒能记录

### 任务 9：实现前端 API 与基础页面

**文件：**

- 创建：`src/api/stock/**`
- 创建：`src/views/stock/**`

- [ ] **步骤 1：先补前端 API 文件**

按 `api-design.md` 创建：

1. `marketSignal`
2. `analyzer`
3. `watchlist`
4. `monitor`
5. `alert`
6. `journal`

- [ ] **步骤 2：实现市场节点页**

先做最基本：

1. 当前节点卡
2. 历史节点表格

- [ ] **步骤 3：实现股票分析页**

先做：

1. 股票查询
2. 量价分析卡
3. 做T建议卡
4. 加入监控按钮

- [ ] **步骤 4：实现自选股监控页**

先做：

1. 监控表格
2. 采集配置弹窗
3. 启停操作

- [ ] **步骤 5：实现提醒设置页**

先做：

1. 渠道配置
2. 规则配置
3. 测试发送

- [ ] **步骤 6：实现历史记录页**

先做：

1. 分析记录
2. 提醒记录
3. 交易记录

- [ ] **步骤 7：最后做行情监控页基础版**

包含：

1. K 线图
2. 成交量图
3. 实时判断面板

### 任务 10：菜单权限与 SQL 接入

**文件：**

- 创建：`sql/mysql/stock/02_stock_menu.sql`

- [ ] **步骤 1：新增菜单**

新增：

1. 股票分析 一级菜单
2. 二级菜单：市场节点、股票分析、行情监控、自选股监控、提醒设置、历史记录

- [ ] **步骤 2：新增按钮权限**

新增：

1. 查询
2. 新增
3. 更新
4. 删除
5. 测试发送
6. 启停监控

- [ ] **步骤 3：验证**

验证：

1. 菜单可见
2. 权限控制生效

### 任务 11：测试、样例与文档交付

**文件：**

- 创建：部署说明文档
- 创建：使用说明文档
- 创建：测试样例文档

- [ ] **步骤 1：准备测试样例**

用一只低位横盘、量价配合的样例股或模拟历史样例，验证全链路。

- [ ] **步骤 2：验证最小闭环**

闭环包含：

1. 市场节点识别
2. 股票分析
3. 加入监控
4. 定时采集
5. 提醒触发
6. 历史记录可查

- [ ] **步骤 3：整理部署步骤**

至少写清：

1. 环境变量
2. 数据源配置
3. Redis
4. Quartz
5. 前后端启动

## 5. 验证命令建议

### 后端编译

```powershell
mvn -pl yudao-module-stock -am -DskipTests compile
```

### 后端测试

```powershell
mvn -pl yudao-module-stock -am test
```

### 前端类型检查

```powershell
pnpm ts:check
```

### 前端构建

```powershell
pnpm build:dev
```

## 6. 实施优先级建议

如果时间有限，建议按这个最小交付顺序推进：

1. 模块骨架
2. 建表
3. Tushare 主源
4. 市场节点接口
5. 股票分析接口
6. 自选股监控接口
7. Quartz + 提醒
8. 市场节点页 + 股票分析页 + 自选股监控页

图表、历史详情、补源、邮件可以稍后补。

## 7. 风险清单

### 7.1 数据源风险

1. 免费源频次限制
2. 补源字段不一致
3. 盘中接口偶发失败

应对方式：

1. 主源 + 补源 + 缓存
2. Provider 归一化
3. 落地失败重试和状态展示

### 7.2 规则风险

1. 六大节点阈值初版可能偏硬
2. 做T条件对不同股票不完全适用

应对方式：

1. 参数化配置
2. 记录策略快照
3. 后续逐步回测优化

### 7.3 性能风险

1. 关注股票数量增多后轮询压力上升
2. 图表查询频繁

应对方式：

1. 按 `NORMAL / KEY / CORE` 分级采集
2. Redis 缓存最新分析结果
3. 大图表接口单独拆分

## 8. 完成标志

当以下条件同时满足时，可以认为第一阶段进入可用状态：

1. 系统能接真实数据
2. 能识别市场节点
3. 能分析单只股票
4. 能把股票加入监控
5. 能定时跑分析
6. 能发提醒
7. 能在前端查看结果
8. 能查历史记录

## 9. 后续建议

这份实施计划完成后，下一步就不是继续补规格，而是按计划正式进入编码阶段。

建议执行顺序：

1. 先把 `sql/mysql/stock/01_stock_tables.sql` 和模块骨架做出来
2. 然后实现真实数据主链路
3. 再做规则引擎与接口
4. 最后做前端页面
