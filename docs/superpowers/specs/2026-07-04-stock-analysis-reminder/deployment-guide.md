# 股票分析与提醒系统部署指南

## 1. 文档目标

本文档用于说明股票分析与提醒系统第一阶段在当前 `ruoyi-vue-pro / yudao` 仓库中的部署方式，覆盖：

1. 环境准备
2. 数据库初始化
3. 真实数据源配置
4. Redis 与定时任务配置
5. 前后端启动方式
6. 提醒渠道配置
7. 常见问题排查

## 2. 部署范围

本指南面向以下部署形态：

1. 本地开发环境
2. 测试环境
3. 生产环境

默认部署目标：

1. 后端模块：`yudao-server` + `yudao-module-stock`
2. 前端模块：`yudao-ui/yudao-ui-admin-vue3/yudao-ui-admin-vue3`
3. 数据库：MySQL
4. 缓存：Redis

## 3. 环境要求

## 3.1 后端环境

建议版本：

1. JDK `1.8`
2. Maven `3.8+`
3. MySQL `8.0+`
4. Redis `6.x+`

## 3.2 前端环境

建议版本：

1. Node.js `20.19.0+`
2. pnpm `8.6.0+`

## 3.3 网络要求

生产部署时必须保证后端能访问真实数据源接口：

1. Tushare HTTP
2. AKTools HTTP
3. WxPusher API
4. 邮件服务器，如果启用邮件提醒

## 4. 数据库初始化

## 4.1 基础数据库

先确保当前项目基础库已初始化成功，至少应包含：

1. `system_*`
2. `infra_*`
3. 当前仓库已启用模块对应业务表

## 4.2 股票模块建表

执行顺序建议：

1. `sql/mysql/stock/01_stock_tables.sql`
2. `sql/mysql/stock/02_stock_menu.sql`
3. `sql/mysql/stock/03_stock_seed.sql`

### 4.2.1 建表 SQL

执行：

```sql
source sql/mysql/stock/01_stock_tables.sql;
```

目标：

1. 初始化 `stock_*` 表
2. 建立索引
3. 准备用户监控、分析、提醒、交易记录能力

### 4.2.2 菜单与权限 SQL

执行：

```sql
source sql/mysql/stock/02_stock_menu.sql;
```

目标：

1. 创建一级菜单“股票分析”
2. 创建二级菜单：市场节点、股票分析、行情监控、自选股监控、提醒设置、历史记录
3. 创建按钮权限

### 4.2.3 初始化种子数据

执行：

```sql
source sql/mysql/stock/03_stock_seed.sql;
```

目标：

1. 初始化默认分析配置
2. 初始化默认提醒配置模板
3. 可选初始化少量股票基础信息测试数据

## 5. 后端配置

## 5.1 模块启用

确保根 `pom.xml` 已引入：

1. `yudao-module-stock`

确保 `yudao-server` 已正确依赖股票模块。

## 5.2 应用配置建议

建议在本地或环境配置中增加如下配置项：

```yaml
stock:
  data:
    mode: production
    provider:
      primary: tushare
      secondary: aktools
      backfill: baostock
      failover-enabled: true
      timeout-ms: 5000
  collect:
    market-cron: "0 0/3 9-15 * * ?"
    watchlist-cron: "0 0/1 9-15 * * ?"
  alert:
    enabled: true
```

说明：

1. `mode=production` 表示正式链路只使用真实数据源
2. `primary` 为主源
3. `secondary` 为补源
4. `backfill` 为历史回填源

## 5.3 Tushare 配置

建议配置项：

```yaml
stock:
  tushare:
    token: ${STOCK_TUSHARE_TOKEN:}
    base-url: ${STOCK_TUSHARE_BASE_URL:https://api.tushare.pro}
```

推荐通过环境变量提供：

1. `STOCK_TUSHARE_TOKEN`
2. `STOCK_TUSHARE_BASE_URL`

## 5.4 AKTools 配置

AKTools 通常建议独立部署一个 HTTP 服务，再由当前后端调用。

建议配置项：

```yaml
stock:
  aktools:
    base-url: ${STOCK_AKTOOLS_BASE_URL:http://127.0.0.1:8081}
    timeout-ms: 5000
```

说明：

1. 若 AKTools 未部署，可先关闭补源
2. 生产环境建议作为补充源，而不是唯一主源

## 5.5 BaoStock 配置

BaoStock 在第一阶段主要用于历史导入，不进入生产盘中主链路。

建议配置项：

```yaml
stock:
  baostock:
    enabled: true
    import-path: ${STOCK_BAOSTOCK_IMPORT_PATH:}
```

说明：

1. 可通过离线导入任务同步历史 K 线
2. 不作为实时提醒主源

## 5.6 Redis 配置

股票模块需要 Redis 支持以下用途：

1. 最新市场快照缓存
2. 最新个股分析结果缓存
3. 提醒防重复冷却
4. 图表热点数据缓存

确保基础 Redis 配置可用。

建议额外约定缓存键前缀：

1. `stock:market:latest`
2. `stock:signal:current`
3. `stock:analyze:{userId}:{stockCode}`
4. `stock:alert:cooldown:{userId}:{ruleId}:{stockCode}`

## 5.7 Quartz 配置

股票模块依赖 Quartz 定时任务，建议至少启用：

1. 市场快照采集任务
2. 关注股分析任务
3. 历史数据补齐任务

部署时注意：

1. 定时任务线程池大小
2. 失败重试次数
3. 运行超时限制

## 6. 提醒渠道配置

## 6.1 站内信

站内信基于当前系统内部机制，默认可直接启用。

## 6.2 WxPusher

建议配置项：

```yaml
stock:
  wxpusher:
    enabled: true
    app-token: ${STOCK_WXPUSHER_APP_TOKEN:}
```

需要准备：

1. WxPusher 应用 Token
2. 用户 UID 或绑定方式

## 6.3 邮件

若需要邮件提醒，需配置系统已有邮件发送能力。

## 7. 后端启动

本地启动命令示例：

```powershell
mvn -pl yudao-server -am spring-boot:run
```

或使用当前仓库已有启动脚本。

启动后需要验证：

1. 服务正常启动
2. `stock` 模块 Bean 正常注册
3. 定时任务正常装配
4. 数据源配置已生效

## 8. 前端安装与启动

进入前端目录：

```powershell
cd yudao-ui\yudao-ui-admin-vue3\yudao-ui-admin-vue3
pnpm install
pnpm dev
```

建议验证：

1. 菜单中出现“股票分析”
2. 页面能打开
3. 接口请求无 404
4. 权限控制正常

## 9. 首次启动后的验收步骤

建议按以下顺序验收：

1. 登录后台，确认菜单出现
2. 打开“市场节点”页，确认接口返回正常
3. 打开“股票分析”页，输入一只真实股票代码查询
4. 将股票加入监控
5. 到“自选股监控”页查看是否登记成功
6. 配置 WxPusher 或站内提醒
7. 等待或手动触发一次定时采集
8. 查看提醒记录是否生成
9. 打开“历史记录”页确认分析记录与提醒记录可查

## 10. 测试模式与生产模式

## 10.1 生产模式

要求：

1. 只使用真实数据源
2. 不允许 Mock 生成正式分析结果
3. 主源异常时优先切补源或缓存

## 10.2 测试模式

允许：

1. 使用 Mock 数据
2. 使用 CSV/样例回放
3. 验证页面展示和接口联调

## 11. 常见问题排查

## 11.1 菜单不显示

检查：

1. `02_stock_menu.sql` 是否执行
2. 当前账号是否分配了股票模块权限
3. 前端路由与菜单路径是否一致

## 11.2 股票查询接口没有数据

检查：

1. Tushare Token 是否配置
2. 主源接口是否可访问
3. 股票代码格式是否正确
4. 是否命中了免费源频次或权限限制

## 11.3 提醒没有发出

检查：

1. 提醒规则是否启用
2. 提醒渠道是否启用
3. 冷却时间是否阻止重复发送
4. Quartz 任务是否实际执行
5. `stock_alert_record` 中是否已有失败记录

## 11.4 图表没有数据

检查：

1. K 线表是否已有数据
2. 图表接口是否拆分实现
3. 前端是否请求正确周期

## 11.5 生产环境不应出现 Mock 数据

检查：

1. `stock.data.mode` 是否为 `production`
2. 当前 Provider 是否错误指向 `mock-csv-provider`
3. 页面是否明确显示数据源与时间

## 12. 建议的生产部署顺序

1. 先部署数据库脚本
2. 再部署后端与配置真实数据源
3. 后端确认能拉真实行情后，再部署前端
4. 最后配置提醒渠道并进行测试发送

## 13. 安全建议

1. Tushare Token、WxPusher Token 必须通过环境变量或安全配置注入
2. 不要把生产密钥写入 Git 仓库
3. 前端不得暴露第三方密钥
4. 提醒渠道的敏感配置应脱敏展示

## 14. 交付检查清单

- [ ] 数据库脚本已执行
- [ ] 股票模块可编译
- [ ] 后端服务可启动
- [ ] 真实数据源可访问
- [ ] Redis 可用
- [ ] Quartz 可执行
- [ ] 前端菜单可见
- [ ] 股票查询可返回真实数据
- [ ] 自选股监控可用
- [ ] 提醒测试发送成功
- [ ] 历史记录可查询

## 15. 结论

本部署指南的核心原则是：

1. 生产环境必须基于真实数据运行
2. Mock 只用于测试和联调
3. 主源、补源、历史回填源要分层配置
4. 先保证数据链路真实可用，再追求界面和策略增强
