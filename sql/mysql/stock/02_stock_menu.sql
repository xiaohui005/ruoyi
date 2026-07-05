-- 股票模块菜单与管理员授权脚本
-- 说明：
-- 1. 菜单仅落在独立 stock 目录，不混入 system 模块
-- 2. 导入后如果前端看不到页面，优先检查本脚本是否执行成功
-- 3. 默认给 super_admin（role_id = 1，tenant_id = 1）授权

DELETE FROM `system_role_menu` WHERE `menu_id` BETWEEN 6100 AND 6171;
DELETE FROM `system_menu` WHERE `id` BETWEEN 6100 AND 6171;

INSERT INTO `system_menu`
(`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`,
 `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
VALUES
  (6100, '股票分析', '', 1, 80, 0, '/stock', 'ep:data-analysis', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6101, '市场节点', 'stock:market-signal:query', 2, 1, 6100, 'market-signal', 'fa:line-chart', 'stock/market-signal/index', 'StockMarketSignal', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6102, '股票分析', 'stock:analyzer:query', 2, 2, 6100, 'analyzer', 'ep:trend-charts', 'stock/analyzer/index', 'StockAnalyzer', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6103, '行情监控', 'stock:monitor:query', 2, 3, 6100, 'monitor', 'ep:histogram', 'stock/monitor/index', 'StockMonitor', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6104, '自选股监控', 'stock:watchlist:query', 2, 4, 6100, 'watchlist', 'ep:star', 'stock/watchlist/index', 'StockWatchlist', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6105, '提醒设置', 'stock:alert-rule:query', 2, 5, 6100, 'alert', 'ep:bell', 'stock/alert/index', 'StockAlert', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6106, '历史记录', 'stock:history:query', 2, 6, 6100, 'history', 'ep:clock', 'stock/history/index', 'StockHistory', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6107, '推荐股票', 'stock:recommend:query', 2, 7, 6100, 'recommend', 'ep:magic-stick', 'stock/recommend/index', 'StockRecommend', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6111, '市场节点查询', 'stock:market-signal:query', 3, 1, 6101, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6121, '股票分析查询', 'stock:analyzer:query', 3, 1, 6102, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6122, '股票分析配置', 'stock:analyzer:update-config', 3, 2, 6102, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6131, '行情监控查询', 'stock:monitor:query', 3, 1, 6103, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6141, '自选股查询', 'stock:watchlist:query', 3, 1, 6104, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6142, '自选股新增', 'stock:watchlist:create', 3, 2, 6104, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6143, '自选股修改', 'stock:watchlist:update', 3, 3, 6104, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6144, '自选股删除', 'stock:watchlist:delete', 3, 4, 6104, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6151, '提醒规则查询', 'stock:alert-rule:query', 3, 1, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6152, '提醒规则新增', 'stock:alert-rule:create', 3, 2, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6153, '提醒规则修改', 'stock:alert-rule:update', 3, 3, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6154, '提醒规则删除', 'stock:alert-rule:delete', 3, 4, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6155, '提醒渠道测试', 'stock:alert-channel:test', 3, 5, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6156, '提醒渠道修改', 'stock:alert-channel:update', 3, 6, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6157, '提醒记录查询', 'stock:alert-record:query', 3, 7, 6105, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6161, '历史记录查询', 'stock:history:query', 3, 1, 6106, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6162, '交易复盘新增', 'stock:trade-journal:create', 3, 2, 6106, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),
  (6163, '交易复盘删除', 'stock:trade-journal:delete', 3, 3, 6106, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0'),

  (6171, '推荐股票查询', 'stock:recommend:query', 3, 1, 6107, '', '', '', '', 0, b'1', b'1', b'1', 'admin', NOW(), 'admin', NOW(), b'0');

INSERT INTO `system_role_menu`
(`role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`)
SELECT 1, `id`, 'admin', NOW(), 'admin', NOW(), b'0', 1
FROM `system_menu`
WHERE `id` BETWEEN 6100 AND 6171;
