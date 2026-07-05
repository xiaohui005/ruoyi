-- 股票模块一键初始化脚本
-- 使用方式：
-- 1. mysql 客户端进入 sql/mysql/stock 目录后执行：source 00_stock_init.sql;
-- 2. 如果使用 DataGrip / IDEA / Navicat，请按 01 -> 02 -> 03 顺序逐个执行

SOURCE 01_stock_tables.sql;
SOURCE 02_stock_menu.sql;
SOURCE 03_stock_seed.sql;
