# 股票分析与提醒系统实施文档

## 1. 文档目的

本文档作为股票分析与提醒系统第一阶段的统一实施入口，面向开发、联调、部署和验收人员，解决两个问题：

1. 从哪里开始做
2. 每一步做到什么程度算完成

与目录中的其他文档相比，本文件不是详细设计说明，而是“执行总览 + 操作指引”。

## 2. 项目目标

在当前 `ruoyi-vue-pro / yudao` 仓库中落地一套真实可运行的股票分析与提醒系统，第一阶段完成以下闭环：

1. 接入真实行情数据
2. 识别六大市场节点
3. 分析个股量价关系
4. 计算做T支撑位、压力位和建议仓位
5. 对关注股票进行专门采集、专门分析、专门提醒
6. 在管理端展示市场、个股、监控、提醒和历史记录

## 3. 实施边界

第一阶段必须完成：

1. 独立 `stock` 业务模块
2. 真实数据主链路
3. 六大节点规则引擎
4. 量价分析引擎
5. 做T分析引擎
6. 自选股监控与采集配置
7. 提醒渠道与提醒规则
8. 管理端基础页面

第一阶段不做：

1. 自动下单
2. 券商交易接口
3. 秒级实时流
4. 完整回测系统
5. AI 自动决策替代人工确认

## 4. 生产原则

本项目第一阶段的生产原则必须固定：

1. 正式环境默认使用真实数据源
2. Mock/CSV 仅用于测试、联调、演示和排障
3. 关注股票必须支持专门采集与专门登记
4. 策略和数据源必须按可扩展架构实现，不写死

## 5. 文档索引

当前目录下各文档的定位如下：

1. [stock-analysis-reminder-design.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/stock-analysis-reminder-design.md)
说明：总体设计规格，包含规则、前端展示、数据源推荐、扩展架构。

2. [database-design.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/database-design.md)
说明：数据库表结构、字段、索引、DO 继承建议。

3. [api-design.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/api-design.md)
说明：后端接口分组、VO、权限、前端 TS Interface 对应关系。

4. [implementation-plan.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/implementation-plan.md)
说明：详细实施计划、里程碑、任务拆分、验证命令。

5. [deployment-guide.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/deployment-guide.md)
说明：部署方式、配置项、真实数据源接入、启动和排查。

6. [user-manual.md](/D:/gongju/six6/ruoyi-vue-pro/docs/superpowers/specs/2026-07-04-stock-analysis-reminder/user-manual.md)
说明：面向业务用户的使用手册。

## 6. 实施顺序

建议按以下顺序执行，不建议跳步。

### 阶段 1：模块与数据库

目标：

1. 创建 `yudao-module-stock`
2. 补建表 SQL
3. 建立 DO / Mapper 骨架

完成标准：

1. 模块编译通过
2. 建表 SQL 可执行
3. 基础 DO/Mapper 无语法问题

### 阶段 2：真实数据链路

目标：

1. 接入 Tushare 主源
2. 接入 AKTools 补源
3. 建立 BaoStock 历史导入链路

完成标准：

1. 能查询真实股票日线
2. 能获取市场快照
3. 数据可落库

### 阶段 3：规则引擎

目标：

1. 实现市场节点识别
2. 实现量价分析
3. 实现做T分析
4. 实现统一决策服务

完成标准：

1. 输入真实股票代码能返回完整分析结果
2. 结果可解释、可落库

### 阶段 4：监控与提醒

目标：

1. 实现关注股票登记
2. 实现专门采集配置
3. 实现 Quartz 调度
4. 实现提醒规则与渠道

完成标准：

1. 关注股票可被持续采集
2. 满足条件时可发提醒
3. 提醒记录可查

### 阶段 5：前端落地

目标：

1. 市场节点页
2. 股票分析页
3. 自选股监控页
4. 提醒设置页
5. 历史记录页
6. 行情监控页基础版

完成标准：

1. 页面可打开
2. 接口可调用
3. 关键状态与图表能展示

### 阶段 6：联调、部署、验收

目标：

1. 配置真实数据源
2. 配置提醒渠道
3. 跑通全链路
4. 补部署文档和使用手册

完成标准：

1. 能查
2. 能监控
3. 能提醒
4. 能记录

## 7. 关键实施路径

如果只看最短交付路径，建议按这个顺序推进：

1. 根 `pom.xml` 引入 `yudao-module-stock`
2. 建表脚本落地
3. `stock_watchlist`、`stock_analysis_record`、`stock_alert_rule`、`stock_alert_record` 先落
4. 实现 Tushare 主源
5. 实现市场节点接口
6. 实现股票分析接口
7. 实现自选股监控接口
8. 实现 Quartz + 提醒发送
9. 实现市场节点页、股票分析页、自选股监控页

这条路径最先打通核心闭环。

## 8. 重点关注的业务点

### 8.1 真实数据不是可选项

必须明确：

1. 生产环境分析和提醒必须依赖真实数据
2. 不允许用 Mock 数据替代正式生产判断

### 8.2 关注股票必须被专门盯

必须支持：

1. 用户把股票加入监控
2. 针对这只股票配置采集级别
3. 按不同周期轮询
4. 记录最近采集、最近分析、最近提醒

### 8.3 三套规则必须形成过滤链

必须坚持：

1. 先看市场节点
2. 再看量价
3. 最后看做T

不能绕过前置条件直接生成做T建议。

## 9. 代码落地建议

### 9.1 后端优先级

后端建议优先开发：

1. `MarketDataService`
2. `MarketSignalService`
3. `VolumePriceAnalyzerService`
4. `TStrategyService`
5. `StockDecisionService`
6. `StockWatchlistService`
7. `AlertService`

### 9.2 前端优先级

前端建议优先开发：

1. `src/api/stock/**`
2. 市场节点页
3. 股票分析页
4. 自选股监控页
5. 提醒设置页
6. 历史记录页
7. 行情监控页

## 10. 验证方式

### 10.1 后端验证

```powershell
mvn -pl yudao-module-stock -am -DskipTests compile
mvn -pl yudao-module-stock -am test
```

### 10.2 前端验证

```powershell
cd yudao-ui\yudao-ui-admin-vue3\yudao-ui-admin-vue3
pnpm ts:check
pnpm build:dev
```

### 10.3 业务验证

至少验证以下场景：

1. 能查询当前市场节点
2. 能查询某只股票分析结果
3. 能把股票加入监控
4. 能看到监控状态变化
5. 能收到一次真实提醒
6. 能在历史记录中找到分析与提醒记录

## 11. 输出物清单

实施完成后应至少交付：

1. `yudao-module-stock` 模块代码
2. `sql/mysql/stock/*.sql`
3. 前端 `src/api/stock/**`
4. 前端 `src/views/stock/**`
5. 相关配置项说明
6. 部署文档
7. 使用手册

## 12. 风险与应对

### 12.1 免费源频次不足

应对：

1. 减少轮询范围
2. 按关注级别采集
3. 后续平滑升级到付费源

### 12.2 图表和实时监控开发成本偏高

应对：

1. 第一阶段先做基础图表
2. 高级交互后置

### 12.3 规则阈值初版不够稳

应对：

1. 全部参数化
2. 支持用户调整阈值
3. 通过历史记录逐步优化

## 13. 验收标准

达到以下条件视为第一阶段可交付：

1. 能接真实数据
2. 能识别市场节点
3. 能分析股票
4. 能做关注股专门采集
5. 能发提醒
6. 能前端展示
7. 能历史留痕

## 14. 推荐下一步

如果这份实施文档没有问题，后续工作不再是补文档，而是正式按以下顺序开工：

1. 先落 `yudao-module-stock`
2. 再落 `01_stock_tables.sql`
3. 再接真实数据源
4. 再写规则引擎和接口
5. 最后做前端页面

## 15. 结论

本文件的作用是把当前目录的 6 份文档串成一条可执行路径。后续无论是你自己开发，还是交给别的开发，都应该先看这份，再看详细设计分文档。
