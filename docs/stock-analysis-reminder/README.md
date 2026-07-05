# 股票分析与提醒系统文档总览

本目录用于集中放置股票分析与提醒系统的可交付文档，便于直接查看，不再和其它实验性文档混在一起。

## 当前已落地内容

- 后端独立模块：`yudao-module-stock`
- 前端独立目录：`src/api/stock`、`src/views/stock`
- 菜单 SQL：`sql/mysql/stock/02_stock_menu.sql`
- 建表 SQL：`sql/mysql/stock/01_stock_tables.sql`
- 默认配置与演示数据：`sql/mysql/stock/03_stock_seed.sql`
- 一键初始化入口：`sql/mysql/stock/00_stock_init.sql`

## 前端页面清单

- 市场节点页：展示当前六大短线节点判断、市场快照、节点历史记录
- 股票分析页：按照“市场节点 -> 量价关系 -> 做T结构”输出可解释分析结果
- 行情监控页：展示 K 线、成交量、支撑位、压力位、做T标记点
- 自选股监控页：管理关注股票、采集级别、监控开关、最近分析和提醒状态
- 提醒设置页：管理提醒渠道、提醒规则、提醒记录、分析阈值配置
- 历史记录页：管理交易复盘记录，查看系统建议与人工交易结果

## 真实数据策略

- 生产模式：只允许真实数据链路参与分析与提醒
- 免费优先主链路：`Tushare` 主源，`AKTools` 补源，`BaoStock` 历史回补
- 测试模式：`Mock/CSV` 仅用于单测、联调、演示、回放，不进入生产主链路
- 付费升级预留：`Tushare Pro`、`JQData`、`Wind`、`iFinD`

## 为什么“前端看不到”

- 源码存在不代表菜单可见，若依前端页面是否显示取决于数据库中的菜单数据
- 必须先导入 `sql/mysql/stock/02_stock_menu.sql`
- 如果还是看不到，再检查当前登录角色是否拥有股票模块菜单权限
- 本次默认已为 `super_admin` 角色写入股票菜单授权

## 关注股票的专门采集与登记

- 支持用户把股票加入自选池
- 支持为每只股票单独配置采集级别、采集周期、是否启用做T分析、价格提醒、信号提醒
- 系统会记录最近采集时间、最近分析时间、最近提醒时间与最新建议
- 这部分是专门针对你“关注的股票”做的闭环，不是临时查询后即丢弃

## 扩展能力说明

- 新数据源：通过 `StockDataProvider` 扩展，不改规则主干
- 新规则：通过规则/服务扩展，不把新方法硬塞进现有单类大服务
- 新提醒渠道：通过发送器接口扩展，不改核心提醒调度逻辑
- 新配置：通过 `stock_analysis_config` 和前端配置页扩展，不魔改框架核心

## 文档入口

- [实施文档](./实施文档.md)
- [前端页面说明](./前端页面说明.md)
- [设计说明原始包](../superpowers/specs/2026-07-04-stock-analysis-reminder/stock-analysis-reminder-design.md)
- [数据库设计原始包](../superpowers/specs/2026-07-04-stock-analysis-reminder/database-design.md)
- [接口设计原始包](../superpowers/specs/2026-07-04-stock-analysis-reminder/api-design.md)
- [部署说明原始包](../superpowers/specs/2026-07-04-stock-analysis-reminder/deployment-guide.md)
- [使用说明原始包](../superpowers/specs/2026-07-04-stock-analysis-reminder/user-manual.md)

## 风险提示

本系统仅用于交易辅助分析、提醒和复盘，不构成任何投资建议。股市有风险，投资需谨慎。
