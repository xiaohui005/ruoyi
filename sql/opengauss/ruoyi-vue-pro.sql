/*
 Yudao Database Transfer Tool

 Source Server Type    : MySQL

 Target Server Type    : OpenGauss

 Date: 2026-05-03 09:41:52
*/


-- ----------------------------
-- Table structure for dual
-- ----------------------------
DROP TABLE IF EXISTS dual;
CREATE TABLE dual
(
    id int2
);

COMMENT ON TABLE dual IS '閺佺増宓佹惔鎾圭箾閹恒儳娈戠悰?;

-- ----------------------------
-- Records of dual
-- ----------------------------
-- @formatter:off
INSERT INTO dual VALUES (1);
-- @formatter:on

-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS infra_api_access_log;
CREATE TABLE infra_api_access_log (
    id int8 NOT NULL,
  trace_id varchar(64) NULL DEFAULT '',
  user_id int8 NOT NULL DEFAULT 0,
  user_type int2 NOT NULL DEFAULT 0,
  application_name varchar(50) NOT NULL,
  request_method varchar(16) NULL DEFAULT '',
  request_url varchar(255) NULL DEFAULT '',
  request_params text NULL,
  response_body text NULL,
  user_ip varchar(50) NOT NULL,
  user_agent varchar(512) NOT NULL,
  operate_module varchar(50) NULL DEFAULT NULL,
  operate_name varchar(50) NULL DEFAULT NULL,
  operate_type int2 NULL DEFAULT 0,
  begin_time timestamp NOT NULL,
  end_time timestamp NOT NULL,
  duration int4 NOT NULL,
  result_code int4 NOT NULL DEFAULT 0,
  result_msg varchar(512) NULL DEFAULT '',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE infra_api_access_log ADD CONSTRAINT pk_infra_api_access_log PRIMARY KEY (id);

CREATE INDEX idx_infra_api_access_log_01 ON infra_api_access_log (create_time);

COMMENT ON COLUMN infra_api_access_log.id IS '閺冦儱绻旀稉濠氭暛';
COMMENT ON COLUMN infra_api_access_log.trace_id IS '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?;
COMMENT ON COLUMN infra_api_access_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN infra_api_access_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN infra_api_access_log.application_name IS '鎼存梻鏁ら崥?;
COMMENT ON COLUMN infra_api_access_log.request_method IS '鐠囬攱鐪伴弬瑙勭《閸?;
COMMENT ON COLUMN infra_api_access_log.request_url IS '鐠囬攱鐪伴崷鏉挎絻';
COMMENT ON COLUMN infra_api_access_log.request_params IS '鐠囬攱鐪伴崣鍌涙殶';
COMMENT ON COLUMN infra_api_access_log.response_body IS '閸濆秴绨茬紒鎾寸亯';
COMMENT ON COLUMN infra_api_access_log.user_ip IS '閻劍鍩?IP';
COMMENT ON COLUMN infra_api_access_log.user_agent IS '濞村繗顫嶉崳?UA';
COMMENT ON COLUMN infra_api_access_log.operate_module IS '閹垮秳缍斿Ο鈥虫健';
COMMENT ON COLUMN infra_api_access_log.operate_name IS '閹垮秳缍旈崥?;
COMMENT ON COLUMN infra_api_access_log.operate_type IS '閹垮秳缍旈崚鍡欒';
COMMENT ON COLUMN infra_api_access_log.begin_time IS '瀵偓婵顕Ч鍌涙闂?;
COMMENT ON COLUMN infra_api_access_log.end_time IS '缂佹挻娼拠閿嬬湴閺冨爼妫?;
COMMENT ON COLUMN infra_api_access_log.duration IS '閹笛嗩攽閺冨爼鏆?;
COMMENT ON COLUMN infra_api_access_log.result_code IS '缂佹挻鐏夐惍?;
COMMENT ON COLUMN infra_api_access_log.result_msg IS '缂佹挻鐏夐幓鎰仛';
COMMENT ON COLUMN infra_api_access_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_api_access_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_api_access_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_api_access_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_api_access_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN infra_api_access_log.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE infra_api_access_log IS 'API 鐠佸潡妫堕弮銉ョ箶鐞?;

DROP SEQUENCE IF EXISTS infra_api_access_log_seq;
CREATE SEQUENCE infra_api_access_log_seq
    START 1;

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
DROP TABLE IF EXISTS infra_api_error_log;
CREATE TABLE infra_api_error_log (
    id int8 NOT NULL,
  trace_id varchar(64) NOT NULL,
  user_id int8 NOT NULL DEFAULT 0,
  user_type int2 NOT NULL DEFAULT 0,
  application_name varchar(50) NOT NULL,
  request_method varchar(16) NOT NULL,
  request_url varchar(255) NOT NULL,
  request_params varchar(8000) NOT NULL,
  user_ip varchar(50) NOT NULL,
  user_agent varchar(512) NOT NULL,
  exception_time timestamp NOT NULL,
  exception_name varchar(128) NULL DEFAULT '',
  exception_message text NULL,
  exception_root_cause_message text NULL,
  exception_stack_trace text NULL,
  exception_class_name varchar(512) NOT NULL,
  exception_file_name varchar(512) NOT NULL,
  exception_method_name varchar(512) NOT NULL,
  exception_line_number int4 NOT NULL,
  process_status int2 NOT NULL,
  process_time timestamp NULL DEFAULT NULL,
  process_user_id int4 NULL DEFAULT 0,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE infra_api_error_log ADD CONSTRAINT pk_infra_api_error_log PRIMARY KEY (id);

CREATE INDEX idx_infra_api_error_log_01 ON infra_api_error_log (create_time);

COMMENT ON COLUMN infra_api_error_log.id IS '缂傛牕褰?;
COMMENT ON COLUMN infra_api_error_log.trace_id IS '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?;
COMMENT ON COLUMN infra_api_error_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN infra_api_error_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN infra_api_error_log.application_name IS '鎼存梻鏁ら崥?;
COMMENT ON COLUMN infra_api_error_log.request_method IS '鐠囬攱鐪伴弬瑙勭《閸?;
COMMENT ON COLUMN infra_api_error_log.request_url IS '鐠囬攱鐪伴崷鏉挎絻';
COMMENT ON COLUMN infra_api_error_log.request_params IS '鐠囬攱鐪伴崣鍌涙殶';
COMMENT ON COLUMN infra_api_error_log.user_ip IS '閻劍鍩?IP';
COMMENT ON COLUMN infra_api_error_log.user_agent IS '濞村繗顫嶉崳?UA';
COMMENT ON COLUMN infra_api_error_log.exception_time IS '瀵倸鐖堕崣鎴犳晸閺冨爼妫?;
COMMENT ON COLUMN infra_api_error_log.exception_name IS '瀵倸鐖堕崥?;
COMMENT ON COLUMN infra_api_error_log.exception_message IS '瀵倸鐖剁€佃壈鍤ч惃鍕Х閹?;
COMMENT ON COLUMN infra_api_error_log.exception_root_cause_message IS '瀵倸鐖剁€佃壈鍤ч惃鍕壌濞戝牊浼?;
COMMENT ON COLUMN infra_api_error_log.exception_stack_trace IS '瀵倸鐖堕惃鍕垽鏉炪劏鎶?;
COMMENT ON COLUMN infra_api_error_log.exception_class_name IS '瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚崗銊ユ倳';
COMMENT ON COLUMN infra_api_error_log.exception_file_name IS '瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚弬鍥︽';
COMMENT ON COLUMN infra_api_error_log.exception_method_name IS '瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇炴倳';
COMMENT ON COLUMN infra_api_error_log.exception_line_number IS '瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇熷閸︺劏顢?;
COMMENT ON COLUMN infra_api_error_log.process_status IS '婢跺嫮鎮婇悩鑸碘偓?;
COMMENT ON COLUMN infra_api_error_log.process_time IS '婢跺嫮鎮婇弮鍫曟？';
COMMENT ON COLUMN infra_api_error_log.process_user_id IS '婢跺嫮鎮婇悽銊﹀煕缂傛牕褰?;
COMMENT ON COLUMN infra_api_error_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_api_error_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_api_error_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_api_error_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_api_error_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN infra_api_error_log.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE infra_api_error_log IS '缁崵绮哄鍌氱埗閺冦儱绻?;

DROP SEQUENCE IF EXISTS infra_api_error_log_seq;
CREATE SEQUENCE infra_api_error_log_seq
    START 1;

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
DROP TABLE IF EXISTS infra_codegen_column;
CREATE TABLE infra_codegen_column (
    id int8 NOT NULL,
  table_id int8 NOT NULL,
  column_name varchar(200) NOT NULL,
  data_type varchar(100) NOT NULL,
  column_comment varchar(500) NOT NULL,
  nullable bool NOT NULL,
  primary_key bool NOT NULL,
  ordinal_position int4 NOT NULL,
  java_type varchar(32) NOT NULL,
  java_field varchar(64) NOT NULL,
  dict_type varchar(200) NULL DEFAULT '',
  example varchar(64) NULL DEFAULT NULL,
  create_operation bool NOT NULL,
  update_operation bool NOT NULL,
  list_operation bool NOT NULL,
  list_operation_condition varchar(32) NOT NULL DEFAULT '=',
  list_operation_result bool NOT NULL,
  html_type varchar(32) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_codegen_column ADD CONSTRAINT pk_infra_codegen_column PRIMARY KEY (id);

CREATE INDEX idx_infra_codegen_column_01 ON infra_codegen_column (table_id);

COMMENT ON COLUMN infra_codegen_column.id IS '缂傛牕褰?;
COMMENT ON COLUMN infra_codegen_column.table_id IS '鐞涖劎绱崣?;
COMMENT ON COLUMN infra_codegen_column.column_name IS '鐎涙顔岄崥?;
COMMENT ON COLUMN infra_codegen_column.data_type IS '鐎涙顔岀猾璇茬€?;
COMMENT ON COLUMN infra_codegen_column.column_comment IS '鐎涙顔岄幓蹇氬牚';
COMMENT ON COLUMN infra_codegen_column.nullable IS '閺勵垰鎯侀崗浣筋啅娑撹櫣鈹?;
COMMENT ON COLUMN infra_codegen_column.primary_key IS '閺勵垰鎯佹稉濠氭暛';
COMMENT ON COLUMN infra_codegen_column.ordinal_position IS '閹烘帒绨?;
COMMENT ON COLUMN infra_codegen_column.java_type IS 'Java 鐏炵偞鈧呰閸?;
COMMENT ON COLUMN infra_codegen_column.java_field IS 'Java 鐏炵偞鈧冩倳';
COMMENT ON COLUMN infra_codegen_column.dict_type IS '鐎涙鍚€缁鐎?;
COMMENT ON COLUMN infra_codegen_column.example IS '閺佺増宓佺粈杞扮伐';
COMMENT ON COLUMN infra_codegen_column.create_operation IS '閺勵垰鎯佹稉?Create 閸掓稑缂撻幙宥勭稊閻ㄥ嫬鐡у▓?;
COMMENT ON COLUMN infra_codegen_column.update_operation IS '閺勵垰鎯佹稉?Update 閺囧瓨鏌婇幙宥勭稊閻ㄥ嫬鐡у▓?;
COMMENT ON COLUMN infra_codegen_column.list_operation IS '閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫬鐡у▓?;
COMMENT ON COLUMN infra_codegen_column.list_operation_condition IS 'List 閺屻儴顕楅幙宥勭稊閻ㄥ嫭娼禒鍓佽閸?;
COMMENT ON COLUMN infra_codegen_column.list_operation_result IS '閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫯绻戦崶鐐茬摟濞?;
COMMENT ON COLUMN infra_codegen_column.html_type IS '閺勫墽銇氱猾璇茬€?;
COMMENT ON COLUMN infra_codegen_column.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_codegen_column.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_codegen_column.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_codegen_column.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_codegen_column.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_codegen_column IS '娴狅絿鐖滈悽鐔稿灇鐞涖劌鐡у▓闈涚暰娑?;

DROP SEQUENCE IF EXISTS infra_codegen_column_seq;
CREATE SEQUENCE infra_codegen_column_seq
    START 1;

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
DROP TABLE IF EXISTS infra_codegen_table;
CREATE TABLE infra_codegen_table (
    id int8 NOT NULL,
  data_source_config_id int8 NOT NULL,
  scene int2 NOT NULL DEFAULT 1,
  table_name varchar(200) NULL DEFAULT '',
  table_comment varchar(500) NULL DEFAULT '',
  remark varchar(500) NULL DEFAULT NULL,
  module_name varchar(30) NOT NULL,
  business_name varchar(30) NOT NULL,
  class_name varchar(100) NULL DEFAULT '',
  class_comment varchar(50) NOT NULL,
  author varchar(50) NOT NULL,
  template_type int2 NOT NULL DEFAULT 1,
  front_type int2 NOT NULL,
  parent_menu_id int8 NULL DEFAULT NULL,
  master_table_id int8 NULL DEFAULT NULL,
  sub_join_column_id int8 NULL DEFAULT NULL,
  sub_join_many bool NULL DEFAULT NULL,
  tree_parent_column_id int8 NULL DEFAULT NULL,
  tree_name_column_id int8 NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_codegen_table ADD CONSTRAINT pk_infra_codegen_table PRIMARY KEY (id);

COMMENT ON COLUMN infra_codegen_table.id IS '缂傛牕褰?;
COMMENT ON COLUMN infra_codegen_table.data_source_config_id IS '閺佺増宓佸┃鎰板帳缂冾喚娈戠紓鏍у娇';
COMMENT ON COLUMN infra_codegen_table.scene IS '閻㈢喐鍨氶崷鐑樻珯';
COMMENT ON COLUMN infra_codegen_table.table_name IS '鐞涖劌鎮曠粔?;
COMMENT ON COLUMN infra_codegen_table.table_comment IS '鐞涖劍寮挎潻?;
COMMENT ON COLUMN infra_codegen_table.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN infra_codegen_table.module_name IS '濡€虫健閸?;
COMMENT ON COLUMN infra_codegen_table.business_name IS '娑撴艾濮熼崥?;
COMMENT ON COLUMN infra_codegen_table.class_name IS '缁鎮曠粔?;
COMMENT ON COLUMN infra_codegen_table.class_comment IS '缁粯寮挎潻?;
COMMENT ON COLUMN infra_codegen_table.author IS '娴ｆ粏鈧?;
COMMENT ON COLUMN infra_codegen_table.template_type IS '濡剝婢樼猾璇茬€?;
COMMENT ON COLUMN infra_codegen_table.front_type IS '閸撳秶顏猾璇茬€?;
COMMENT ON COLUMN infra_codegen_table.parent_menu_id IS '閻栨儼褰嶉崡鏇犵椽閸?;
COMMENT ON COLUMN infra_codegen_table.master_table_id IS '娑撴槒銆冮惃鍕椽閸?;
COMMENT ON COLUMN infra_codegen_table.sub_join_column_id IS '鐎涙劘銆冮崗瀹犱粓娑撴槒銆冮惃鍕摟濞堢數绱崣?;
COMMENT ON COLUMN infra_codegen_table.sub_join_many IS '娑撴槒銆冩稉搴＄摍鐞涖劍妲搁崥锔跨鐎电懓顦?;
COMMENT ON COLUMN infra_codegen_table.tree_parent_column_id IS '閺嶆垼銆冮惃鍕煑鐎涙顔岀紓鏍у娇';
COMMENT ON COLUMN infra_codegen_table.tree_name_column_id IS '閺嶆垼銆冮惃鍕倳鐎涙鐡у▓鐢电椽閸?;
COMMENT ON COLUMN infra_codegen_table.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_codegen_table.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_codegen_table.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_codegen_table.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_codegen_table.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_codegen_table IS '娴狅絿鐖滈悽鐔稿灇鐞涖劌鐣炬稊?;

DROP SEQUENCE IF EXISTS infra_codegen_table_seq;
CREATE SEQUENCE infra_codegen_table_seq
    START 1;

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
DROP TABLE IF EXISTS infra_config;
CREATE TABLE infra_config (
    id int8 NOT NULL,
  category varchar(50) NOT NULL,
  type int2 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  config_key varchar(100) NULL DEFAULT '',
  value varchar(500) NULL DEFAULT '',
  visible bool NOT NULL,
  remark varchar(500) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_config ADD CONSTRAINT pk_infra_config PRIMARY KEY (id);

CREATE INDEX idx_infra_config_01 ON infra_config (config_key);

COMMENT ON COLUMN infra_config.id IS '閸欏倹鏆熸稉濠氭暛';
COMMENT ON COLUMN infra_config.category IS '閸欏倹鏆熼崚鍡欑矋';
COMMENT ON COLUMN infra_config.type IS '閸欏倹鏆熺猾璇茬€?;
COMMENT ON COLUMN infra_config.name IS '閸欏倹鏆熼崥宥囆?;
COMMENT ON COLUMN infra_config.config_key IS '閸欏倹鏆熼柨顔兼倳';
COMMENT ON COLUMN infra_config.value IS '閸欏倹鏆熼柨顔尖偓?;
COMMENT ON COLUMN infra_config.visible IS '閺勵垰鎯侀崣顖濐潌';
COMMENT ON COLUMN infra_config.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN infra_config.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_config.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_config.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_config.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_config.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_config IS '閸欏倹鏆熼柊宥囩枂鐞?;

-- ----------------------------
-- Records of infra_config
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (2, 'biz', 1, '閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, 'system.user.init-password', '123456', '0', '閸掓繂顫愰崠鏍х槕閻?123456', 'admin', '2021-01-05 17:03:48', '1', '2024-07-20 17:22:47', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (7, 'url', 2, 'MySQL 閻╂垶甯堕惃鍕勾閸р偓', 'url.druid', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:33:38', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (8, 'url', 2, 'SkyWalking 閻╂垶甯堕惃鍕勾閸р偓', 'url.skywalking', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:57:03', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (9, 'url', 2, 'Spring Boot Admin 閻╂垶甯堕惃鍕勾閸р偓', 'url.spring-boot-admin', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:52:07', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (10, 'url', 2, 'Swagger 閹恒儱褰涢弬鍥ㄣ€傞惃鍕勾閸р偓', 'url.swagger', '', '1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:59:00', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (12, 'test2', 2, 'test3', 'test4', 'test5', '1', 'test6', '1', '2023-12-03 09:55:16', '1', '2025-04-06 21:00:09', '0');
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (13, '閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, 2, '閻劍鍩涚粻锛勬倞-濞夈劌鍞藉鈧崗?, 'system.user.register-enabled', 'true', '0', '', '1', '2025-04-26 17:23:41', '1', '2025-04-26 17:23:41', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS infra_config_seq;
CREATE SEQUENCE infra_config_seq
    START 14;

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS infra_data_source_config;
CREATE TABLE infra_data_source_config (
    id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  url varchar(1024) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NULL DEFAULT '',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_data_source_config ADD CONSTRAINT pk_infra_data_source_config PRIMARY KEY (id);

COMMENT ON COLUMN infra_data_source_config.id IS '娑撳鏁紓鏍у娇';
COMMENT ON COLUMN infra_data_source_config.name IS '閸欏倹鏆熼崥宥囆?;
COMMENT ON COLUMN infra_data_source_config.url IS '閺佺増宓佸┃鎰箾閹?;
COMMENT ON COLUMN infra_data_source_config.username IS '閻劍鍩涢崥?;
COMMENT ON COLUMN infra_data_source_config.password IS '鐎靛棛鐖?;
COMMENT ON COLUMN infra_data_source_config.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_data_source_config.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_data_source_config.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_data_source_config.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_data_source_config.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_data_source_config IS '閺佺増宓佸┃鎰板帳缂冾喛銆?;

DROP SEQUENCE IF EXISTS infra_data_source_config_seq;
CREATE SEQUENCE infra_data_source_config_seq
    START 1;

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
DROP TABLE IF EXISTS infra_file;
CREATE TABLE infra_file (
    id int8 NOT NULL,
  config_id int8 NULL DEFAULT NULL,
  name varchar(256) NULL DEFAULT NULL,
  path varchar(512) NOT NULL,
  url varchar(1024) NOT NULL,
  type varchar(128) NULL DEFAULT NULL,
  size int4 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_file ADD CONSTRAINT pk_infra_file PRIMARY KEY (id);

COMMENT ON COLUMN infra_file.id IS '閺傚洣娆㈢紓鏍у娇';
COMMENT ON COLUMN infra_file.config_id IS '闁板秶鐤嗙紓鏍у娇';
COMMENT ON COLUMN infra_file.name IS '閺傚洣娆㈤崥?;
COMMENT ON COLUMN infra_file.path IS '閺傚洣娆㈢捄顖氱窞';
COMMENT ON COLUMN infra_file.url IS '閺傚洣娆?URL';
COMMENT ON COLUMN infra_file.type IS '閺傚洣娆㈢猾璇茬€?;
COMMENT ON COLUMN infra_file.size IS '閺傚洣娆㈡径褍鐨?;
COMMENT ON COLUMN infra_file.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_file.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_file.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_file.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_file.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_file IS '閺傚洣娆㈢悰?;

DROP SEQUENCE IF EXISTS infra_file_seq;
CREATE SEQUENCE infra_file_seq
    START 1;

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
DROP TABLE IF EXISTS infra_file_config;
CREATE TABLE infra_file_config (
    id int8 NOT NULL,
  name varchar(63) NOT NULL,
  storage int2 NOT NULL,
  remark varchar(255) NULL DEFAULT NULL,
  master bool NOT NULL,
  config varchar(4096) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_file_config ADD CONSTRAINT pk_infra_file_config PRIMARY KEY (id);

COMMENT ON COLUMN infra_file_config.id IS '缂傛牕褰?;
COMMENT ON COLUMN infra_file_config.name IS '闁板秶鐤嗛崥?;
COMMENT ON COLUMN infra_file_config.storage IS '鐎涙ê鍋嶉崳?;
COMMENT ON COLUMN infra_file_config.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN infra_file_config.master IS '閺勵垰鎯佹稉杞板瘜闁板秶鐤?;
COMMENT ON COLUMN infra_file_config.config IS '鐎涙ê鍋嶉柊宥囩枂';
COMMENT ON COLUMN infra_file_config.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_file_config.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_file_config.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_file_config.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_file_config.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_file_config IS '閺傚洣娆㈤柊宥囩枂鐞?;

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (4, '閺佺増宓佹惔鎿勭礄缁€杞扮伐閿?, 1, '閹存垶妲搁弫鐗堝祦鎼?, '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.db.DBFileClientConfig","domain":"http://127.0.0.1:48080"}', '1', '2022-03-15 23:56:24', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (22, '娑撳啰澧扮€涙ê鍋嶉崳顭掔礄缁€杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', '1', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"s3.cn-south-1.qiniucs.com","domain":"http://test.yudao.iocoder.cn","bucket":"ruoyi-vue-pro","accessKey":"demo-qiniu-access-key","accessSecret":"demo-qiniu-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-01-13 22:11:12', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (24, '閼垫崘顔嗘禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閻ㄥ嫬鐦戦柦銉磼閿涗緤绱?, '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"https://cos.ap-shanghai.myqcloud.com","domain":"http://tengxun-oss.iocoder.cn","bucket":"aoteman-1255880240","accessKey":"demo-tencent-secret-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-11-09 16:03:22', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (25, '闂冨潡鍣锋禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"oss-cn-beijing.aliyuncs.com","domain":"http://ali-oss.iocoder.cn","bucket":"yunai-aoteman","accessKey":"demo-aliyun-access-key-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-11-09 16:47:08', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (26, '閻忣偄鍖楁禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"tos-s3-cn-beijing.volces.com","domain":null,"bucket":"yunai","accessKey":"demo-volcengine-access-key-id","accessSecret":"demo-volcengine-access-key-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-11-09 16:56:42', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (27, '閸楀簼璐熸禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"obs.cn-east-3.myhuaweicloud.com","domain":"","bucket":"yudao","accessKey":"demo-huawei-access-key-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-11-09 17:18:41', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (28, 'MinIO 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 20, '', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"http://127.0.0.1:9000","domain":"http://127.0.0.1:9000/yudao","bucket":"yudao","accessKey":"admin","accessSecret":"password","enablePathStyleAccess":false,"enablePublicAccess":true}', '1', '2024-11-09 17:43:10', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (29, '閺堫剙婀寸€涙ê鍋嶉敍鍫仛娓氬绱?, 10, 'mac/linux 娴ｈ法鏁?/閿涘瘍indows 娴ｈ法鏁?\', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.local.LocalFileClientConfig","basePath":"/Users/yunai/tmp/file","domain":"http://127.0.0.1:48080"}', '1', '2025-05-02 11:25:45', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (30, 'SFTP 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 12, '', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.sftp.SftpFileClientConfig","basePath":"/upload","domain":"http://127.0.0.1:48080","host":"127.0.0.1","port":2222,"username":"foo","password":"pass"}', '1', '2025-05-02 16:34:10', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (34, '娑撳啰澧版禍鎴濈摠閸屻劊鈧劗顫嗛張澶堚偓鎴礄缁€杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"s3.cn-south-1.qiniucs.com","domain":"http://t151glocd.hn-bkt.clouddn.com","bucket":"ruoyi-vue-pro-private","accessKey":"demo-qiniu-access-key","accessSecret":"demo-qiniu-access-secret","enablePathStyleAccess":false,"enablePublicAccess":false}', '1', '2025-08-17 21:22:00', '1', '2025-11-24 20:57:14', '0');
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (35, '1', 20, '1', '0', '{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"http://www.baidu.com","domain":"http://www.xxx.com","bucket":"1","accessKey":"2","accessSecret":"3","enablePathStyleAccess":false,"enablePublicAccess":false,"region":"1"}', '1', '2025-10-02 14:32:12', '1', '2025-11-29 15:59:39', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS infra_file_config_seq;
CREATE SEQUENCE infra_file_config_seq
    START 36;

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
DROP TABLE IF EXISTS infra_file_content;
CREATE TABLE infra_file_content (
    id int8 NOT NULL,
  config_id int8 NOT NULL,
  path varchar(512) NOT NULL,
  content bytea NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_file_content ADD CONSTRAINT pk_infra_file_content PRIMARY KEY (id);

CREATE INDEX idx_infra_file_content_01 ON infra_file_content (config_id, path);

COMMENT ON COLUMN infra_file_content.id IS '缂傛牕褰?;
COMMENT ON COLUMN infra_file_content.config_id IS '闁板秶鐤嗙紓鏍у娇';
COMMENT ON COLUMN infra_file_content.path IS '閺傚洣娆㈢捄顖氱窞';
COMMENT ON COLUMN infra_file_content.content IS '閺傚洣娆㈤崘鍛啇';
COMMENT ON COLUMN infra_file_content.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_file_content.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_file_content.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_file_content.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_file_content.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_file_content IS '閺傚洣娆㈢悰?;

DROP SEQUENCE IF EXISTS infra_file_content_seq;
CREATE SEQUENCE infra_file_content_seq
    START 1;

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
DROP TABLE IF EXISTS infra_job;
CREATE TABLE infra_job (
    id int8 NOT NULL,
  name varchar(32) NOT NULL,
  status int2 NOT NULL,
  handler_name varchar(64) NOT NULL,
  handler_param varchar(255) NULL DEFAULT NULL,
  cron_expression varchar(32) NOT NULL,
  retry_count int4 NOT NULL DEFAULT 0,
  retry_interval int4 NOT NULL DEFAULT 0,
  monitor_timeout int4 NOT NULL DEFAULT 0,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_job ADD CONSTRAINT pk_infra_job PRIMARY KEY (id);

COMMENT ON COLUMN infra_job.id IS '娴犺濮熺紓鏍у娇';
COMMENT ON COLUMN infra_job.name IS '娴犺濮熼崥宥囆?;
COMMENT ON COLUMN infra_job.status IS '娴犺濮熼悩鑸碘偓?;
COMMENT ON COLUMN infra_job.handler_name IS '婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?;
COMMENT ON COLUMN infra_job.handler_param IS '婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?;
COMMENT ON COLUMN infra_job.cron_expression IS 'CRON 鐞涖劏鎻?;
COMMENT ON COLUMN infra_job.retry_count IS '闁插秷鐦▎鈩冩殶';
COMMENT ON COLUMN infra_job.retry_interval IS '闁插秷鐦梻鎾';
COMMENT ON COLUMN infra_job.monitor_timeout IS '閻╂垶甯剁搾鍛閺冨爼妫?;
COMMENT ON COLUMN infra_job.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_job.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_job.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_job.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_job.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_job IS '鐎规碍妞傛禒璇插鐞?;

-- ----------------------------
-- Records of infra_job
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (5, '閺€顖欑帛闁氨鐓?Job', 2, 'payNotifyJob', NULL, '* * * * * ?', 0, 0, 0, '1', '2021-10-27 08:34:42', '1', '2024-09-12 13:32:48', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (17, '閺€顖欑帛鐠併垹宕熼崥灞绢劄 Job', 2, 'payOrderSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 14:36:26', '1', '2023-07-22 15:39:08', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (18, '閺€顖欑帛鐠併垹宕熸潻鍥ㄦ埂 Job', 2, 'payOrderExpireJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 15:36:23', '1', '2023-07-22 15:39:54', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (19, '闁偓濞嗘崘顓归崡鏇犳畱閸氬本顒?Job', 2, 'payRefundSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-23 21:03:44', '1', '2023-07-23 21:09:00', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (25, '鐠佸潡妫堕弮銉ョ箶濞撳懐鎮?Job', 2, 'accessLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 10:59:41', '1', '2023-10-03 11:01:10', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (26, '闁挎瑨顕ら弮銉ョ箶濞撳懐鎮?Job', 2, 'errorLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:00:43', '1', '2023-10-03 11:01:12', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (27, '娴犺濮熼弮銉ョ箶濞撳懐鎮?Job', 2, 'jobLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:01:33', '1', '2024-09-12 13:40:34', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (33, 'demoJob', 2, 'demoJob', '', '0 * * * * ?', 1, 1, 0, '1', '2024-10-27 19:38:46', '1', '2025-05-10 18:13:54', '0');
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (35, '鏉烆剝澶勭拋銏犲礋閻ㄥ嫬鎮撳?Job', 2, 'payTransferSyncJob', '', '0 * * * * ?', 0, 0, 0, '1', '2025-05-10 17:35:54', '1', '2025-05-10 18:13:52', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS infra_job_seq;
CREATE SEQUENCE infra_job_seq
    START 41;

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
DROP TABLE IF EXISTS infra_job_log;
CREATE TABLE infra_job_log (
    id int8 NOT NULL,
  job_id int8 NOT NULL,
  handler_name varchar(64) NOT NULL,
  handler_param varchar(255) NULL DEFAULT NULL,
  execute_index int2 NOT NULL DEFAULT 1,
  begin_time timestamp NOT NULL,
  end_time timestamp NULL DEFAULT NULL,
  duration int4 NULL DEFAULT NULL,
  status int2 NOT NULL,
  result varchar(4000) NULL DEFAULT '',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE infra_job_log ADD CONSTRAINT pk_infra_job_log PRIMARY KEY (id);

CREATE INDEX idx_infra_job_log_01 ON infra_job_log (job_id);
CREATE INDEX idx_infra_job_log_02 ON infra_job_log (create_time);

COMMENT ON COLUMN infra_job_log.id IS '閺冦儱绻旂紓鏍у娇';
COMMENT ON COLUMN infra_job_log.job_id IS '娴犺濮熺紓鏍у娇';
COMMENT ON COLUMN infra_job_log.handler_name IS '婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?;
COMMENT ON COLUMN infra_job_log.handler_param IS '婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?;
COMMENT ON COLUMN infra_job_log.execute_index IS '缁楊剙鍤戝▎鈩冨⒔鐞?;
COMMENT ON COLUMN infra_job_log.begin_time IS '瀵偓婵澧界悰灞炬闂?;
COMMENT ON COLUMN infra_job_log.end_time IS '缂佹挻娼幍褑顢戦弮鍫曟？';
COMMENT ON COLUMN infra_job_log.duration IS '閹笛嗩攽閺冨爼鏆?;
COMMENT ON COLUMN infra_job_log.status IS '娴犺濮熼悩鑸碘偓?;
COMMENT ON COLUMN infra_job_log.result IS '缂佹挻鐏夐弫鐗堝祦';
COMMENT ON COLUMN infra_job_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN infra_job_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN infra_job_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN infra_job_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN infra_job_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE infra_job_log IS '鐎规碍妞傛禒璇插閺冦儱绻旂悰?;

DROP SEQUENCE IF EXISTS infra_job_log_seq;
CREATE SEQUENCE infra_job_log_seq
    START 1;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS system_dept;
CREATE TABLE system_dept (
    id int8 NOT NULL,
  name varchar(30) NULL DEFAULT '',
  parent_id int8 NOT NULL DEFAULT 0,
  sort int4 NOT NULL DEFAULT 0,
  leader_user_id int8 NULL DEFAULT NULL,
  phone varchar(11) NULL DEFAULT NULL,
  email varchar(50) NULL DEFAULT NULL,
  status int2 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_dept ADD CONSTRAINT pk_system_dept PRIMARY KEY (id);

COMMENT ON COLUMN system_dept.id IS '闁劑妫琲d';
COMMENT ON COLUMN system_dept.name IS '闁劑妫崥宥囆?;
COMMENT ON COLUMN system_dept.parent_id IS '閻栧爼鍎撮梻鈺';
COMMENT ON COLUMN system_dept.sort IS '閺勫墽銇氭い鍝勭碍';
COMMENT ON COLUMN system_dept.leader_user_id IS '鐠愮喕鐭楁禍?;
COMMENT ON COLUMN system_dept.phone IS '閼辨梻閮撮悽浣冪樈';
COMMENT ON COLUMN system_dept.email IS '闁喚顔?;
COMMENT ON COLUMN system_dept.status IS '闁劑妫悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_dept.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_dept.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_dept.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_dept.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_dept.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_dept.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_dept IS '闁劑妫悰?;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, '閼哄浜惧┃鎰垳', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2026-01-04 18:01:12', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, '濞ｅ崬婀烽幀璇插彆閸?, 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2025-03-29 15:49:55', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (102, '闂€鎸庣煓閸掑棗鍙曢崣?, 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, '閻柨褰傞柈銊╂，', 101, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2026-01-04 18:01:24', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, '鐢倸婧€闁劑妫?, 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (105, '濞村鐦柈銊╂，', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (106, '鐠愩垹濮熼柈銊╂，', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, '鏉╂劗娣柈銊╂，', 101, 5, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-12-02 09:28:22', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, '鐢倸婧€闁劑妫?, 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '鐠愩垹濮熼柈銊╂，', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, '閺備即鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', '0', 121);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '妞ゅ墎楠囬柈銊╂，', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', '0', 122);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, '娴溠冩惂闁劑妫?, 101, 100, 1, NULL, NULL, 1, '1', '2023-12-02 09:45:13', '1', '2023-12-02 09:45:31', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, '閺€顖涘瘮闁劑妫?, 102, 3, 104, NULL, NULL, 1, '1', '2023-12-02 09:47:38', '1', '2025-03-29 15:00:56', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, '閺屾劒閲滅€涙劙鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, '1', '2025-12-08 14:51:12', '1', '2025-12-08 14:51:12', '0', 1);
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, '閺屾劒閲滅€涙劙鍎撮梻?2', 0, 2, NULL, NULL, NULL, 0, '1', '2025-12-08 14:51:25', '1', '2025-12-08 14:51:25', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_dept_seq;
CREATE SEQUENCE system_dept_seq
    START 118;

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS system_dict_data;
CREATE TABLE system_dict_data (
    id int8 NOT NULL,
  sort int4 NOT NULL DEFAULT 0,
  label varchar(100) NULL DEFAULT '',
  value varchar(100) NULL DEFAULT '',
  dict_type varchar(100) NULL DEFAULT '',
  status int2 NOT NULL DEFAULT 0,
  color_type varchar(100) NULL DEFAULT '',
  css_class varchar(100) NULL DEFAULT '',
  remark varchar(500) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_dict_data ADD CONSTRAINT pk_system_dict_data PRIMARY KEY (id);

COMMENT ON COLUMN system_dict_data.id IS '鐎涙鍚€缂傛牜鐖?;
COMMENT ON COLUMN system_dict_data.sort IS '鐎涙鍚€閹烘帒绨?;
COMMENT ON COLUMN system_dict_data.label IS '鐎涙鍚€閺嶅洨顒?;
COMMENT ON COLUMN system_dict_data.value IS '鐎涙鍚€闁款喖鈧?;
COMMENT ON COLUMN system_dict_data.dict_type IS '鐎涙鍚€缁鐎?;
COMMENT ON COLUMN system_dict_data.status IS '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_dict_data.color_type IS '妫版粏澹婄猾璇茬€?;
COMMENT ON COLUMN system_dict_data.css_class IS 'css 閺嶅嘲绱?;
COMMENT ON COLUMN system_dict_data.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_dict_data.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_dict_data.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_dict_data.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_dict_data.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_dict_data.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_dict_data IS '鐎涙鍚€閺佺増宓佺悰?;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1, 1, '閻?, '1', 'system_user_sex', 0, 'primary', 'A', '閹冨焼閻?, 'admin', '2021-01-05 17:03:48', '1', '2025-12-10 13:19:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (2, 2, '婵?, '2', 'system_user_sex', 0, 'success', '', '閹冨焼婵?, 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 23:30:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (8, 1, '濮濓絽鐖?, '1', 'infra_job_status', 0, 'success', '', '濮濓絽鐖堕悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (9, 2, '閺嗗倸浠?, '2', 'infra_job_status', 0, 'danger', '', '閸嬫粎鏁ら悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (12, 1, '缁崵绮洪崘鍛枂', '1', 'infra_config_type', 0, 'danger', '', '閸欏倹鏆熺猾璇茬€?- 缁崵绮洪崘鍛枂', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (13, 2, '閼奉亜鐣炬稊?, '2', 'infra_config_type', 0, 'primary', '', '閸欏倹鏆熺猾璇茬€?- 閼奉亜鐣炬稊?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (14, 1, '闁氨鐓?, '1', 'system_notice_type', 0, 'success', '', '闁氨鐓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:05:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (15, 2, '閸忣剙鎲?, '2', 'system_notice_type', 0, 'info', '', '閸忣剙鎲?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:06:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (16, 0, '閸忚泛鐣?, '0', 'infra_operate_type', 0, 'default', '', '閸忚泛鐣犻幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (17, 1, '閺屻儴顕?, '1', 'infra_operate_type', 0, 'info', '', '閺屻儴顕楅幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (18, 2, '閺傛澘顤?, '2', 'infra_operate_type', 0, 'primary', '', '閺傛澘顤冮幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (19, 3, '娣囶喗鏁?, '3', 'infra_operate_type', 0, 'warning', '', '娣囶喗鏁奸幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (20, 4, '閸掔娀娅?, '4', 'infra_operate_type', 0, 'danger', '', '閸掔娀娅庨幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (22, 5, '鐎电厧鍤?, '5', 'infra_operate_type', 0, 'default', '', '鐎电厧鍤幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (23, 6, '鐎电厧鍙?, '6', 'infra_operate_type', 0, 'default', '', '鐎电厧鍙嗛幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (27, 1, '瀵偓閸?, '0', 'common_status', 0, 'primary', '', '瀵偓閸氼垳濮搁幀?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (28, 2, '閸忔娊妫?, '1', 'common_status', 0, 'info', '', '閸忔娊妫撮悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (29, 1, '閻╊喖缍?, '1', 'system_menu_type', 0, '', '', '閻╊喖缍?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (30, 2, '閼挎粌宕?, '2', 'system_menu_type', 0, '', '', '閼挎粌宕?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (31, 3, '閹稿鎸?, '3', 'system_menu_type', 0, '', '', '閹稿鎸?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (32, 1, '閸愬懐鐤?, '1', 'system_role_type', 0, 'danger', '', '閸愬懐鐤嗙憴鎺曞', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (33, 2, '閼奉亜鐣炬稊?, '2', 'system_role_type', 0, 'primary', '', '閼奉亜鐣炬稊澶庮潡閼?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (34, 1, '閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, '1', 'system_data_scope', 0, '', '', '閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (35, 2, '閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', '2', 'system_data_scope', 0, '', '', '閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (36, 3, '閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, '3', 'system_data_scope', 0, '', '', '閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (37, 4, '閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, '4', 'system_data_scope', 0, '', '', '閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:21', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (38, 5, '娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, '5', 'system_data_scope', 0, '', '', '娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (39, 0, '閹存劕濮?, '0', 'system_login_result', 0, 'success', '', '閻у妾扮紒鎾寸亯 - 閹存劕濮?, '', '2021-01-18 06:17:36', '1', '2022-02-16 13:23:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (40, 10, '鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, '10', 'system_login_result', 0, 'primary', '', '閻у妾扮紒鎾寸亯 - 鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (41, 20, '閻劍鍩涚悮顐ゎ洣閻?, '20', 'system_login_result', 0, 'warning', '', '閻у妾扮紒鎾寸亯 - 閻劍鍩涚悮顐ゎ洣閻?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:23:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (42, 30, '妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, '30', 'system_login_result', 0, 'info', '', '閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (43, 31, '妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, '31', 'system_login_result', 0, 'info', '', '閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (44, 100, '閺堫亞鐓″鍌氱埗', '100', 'system_login_result', 0, 'danger', '', '閻у妾扮紒鎾寸亯 - 閺堫亞鐓″鍌氱埗', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (45, 1, '閺?, 'true', 'infra_boolean_string', 0, 'danger', '', 'Boolean 閺勵垰鎯佺猾璇茬€?- 閺?, '', '2021-01-19 03:20:55', '1', '2022-03-15 23:01:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (46, 1, '閸?, 'false', 'infra_boolean_string', 0, 'info', '', 'Boolean 閺勵垰鎯佺猾璇茬€?- 閸?, '', '2021-01-19 03:20:55', '1', '2022-03-15 23:09:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (50, 1, '閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '1', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:09:06', '', '2022-03-10 16:33:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (51, 2, '閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '2', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:14:46', '', '2022-03-10 16:33:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (53, 0, '閸掓繂顫愰崠鏍﹁厬', '0', 'infra_job_status', 0, 'primary', '', NULL, '', '2021-02-07 07:46:49', '1', '2022-02-16 19:33:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (57, 0, '鏉╂劘顢戞稉?, '0', 'infra_job_log_status', 0, 'primary', '', 'RUNNING', '', '2021-02-08 10:04:24', '1', '2022-02-16 19:07:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (58, 1, '閹存劕濮?, '1', 'infra_job_log_status', 0, 'success', '', NULL, '', '2021-02-08 10:06:57', '1', '2022-02-16 19:07:52', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (59, 2, '婢惰精瑙?, '2', 'infra_job_log_status', 0, 'warning', '', '婢惰精瑙?, '', '2021-02-08 10:07:38', '1', '2022-02-16 19:07:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (60, 1, '娴兼艾鎲?, '1', 'user_type', 0, 'primary', '', NULL, '', '2021-02-26 00:16:27', '1', '2022-02-16 10:22:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (61, 2, '缁狅紕鎮婇崨?, '2', 'user_type', 0, 'success', '', NULL, '', '2021-02-26 00:16:34', '1', '2025-04-06 18:37:43', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (62, 0, '閺堫亜顦╅悶?, '0', 'infra_api_error_log_process_status', 0, 'primary', '', NULL, '', '2021-02-26 07:07:19', '1', '2022-02-16 20:14:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (63, 1, '瀹告彃顦╅悶?, '1', 'infra_api_error_log_process_status', 0, 'success', '', NULL, '', '2021-02-26 07:07:26', '1', '2022-02-16 20:14:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (64, 2, '瀹告彃鎷烽悾?, '2', 'infra_api_error_log_process_status', 0, 'danger', '', NULL, '', '2021-02-26 07:07:34', '1', '2022-02-16 20:14:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (66, 1, '闂冨潡鍣锋禍?, 'ALIYUN', 'system_sms_channel_code', 0, 'primary', '', NULL, '1', '2021-04-05 01:05:26', '1', '2024-07-22 22:23:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (67, 1, '妤犲矁鐦夐惍?, '1', 'system_sms_template_type', 0, 'warning', '', NULL, '1', '2021-04-05 21:50:57', '1', '2022-02-16 12:48:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (68, 2, '闁氨鐓?, '2', 'system_sms_template_type', 0, 'primary', '', NULL, '1', '2021-04-05 21:51:08', '1', '2022-02-16 12:48:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (69, 0, '閽€銉╂敘', '3', 'system_sms_template_type', 0, 'danger', '', NULL, '1', '2021-04-05 21:51:15', '1', '2022-02-16 12:48:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (70, 0, '閸掓繂顫愰崠?, '0', 'system_sms_send_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:18:33', '1', '2022-02-16 10:26:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (71, 1, '閸欐垿鈧焦鍨氶崝?, '10', 'system_sms_send_status', 0, 'success', '', NULL, '1', '2021-04-11 20:18:43', '1', '2022-02-16 10:25:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (72, 2, '閸欐垿鈧礁銇戠拹?, '20', 'system_sms_send_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:18:49', '1', '2022-02-16 10:26:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (73, 3, '娑撳秴褰傞柅?, '30', 'system_sms_send_status', 0, 'info', '', NULL, '1', '2021-04-11 20:19:44', '1', '2022-02-16 10:26:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (74, 0, '缁涘绶熺紒鎾寸亯', '0', 'system_sms_receive_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:27:43', '1', '2022-02-16 10:28:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (75, 1, '閹恒儲鏁归幋鎰', '10', 'system_sms_receive_status', 0, 'success', '', NULL, '1', '2021-04-11 20:29:25', '1', '2022-02-16 10:28:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (76, 2, '閹恒儲鏁规径杈Е', '20', 'system_sms_receive_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:29:31', '1', '2022-02-16 10:28:32', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (77, 0, '鐠嬪啳鐦?闁藉鎷?', 'DEBUG_DING_TALK', 'system_sms_channel_code', 0, 'info', '', NULL, '1', '2021-04-13 00:20:37', '1', '2022-02-16 10:10:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (80, 100, '鐠愶箑褰块惂璇茬秿', '100', 'system_login_type', 0, 'primary', '', '鐠愶箑褰块惂璇茬秿', '1', '2021-10-06 00:52:02', '1', '2022-02-16 13:11:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (81, 101, '缁€鍙ユ唉閻ц缍?, '101', 'system_login_type', 0, 'info', '', '缁€鍙ユ唉閻ц缍?, '1', '2021-10-06 00:52:17', '1', '2022-02-16 13:11:40', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (83, 200, '娑撹濮╅惂璇插毉', '200', 'system_login_type', 0, 'primary', '', '娑撹濮╅惂璇插毉', '1', '2021-10-06 00:52:58', '1', '2022-02-16 13:11:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (85, 202, '瀵搫鍩楅惂璇插毉', '202', 'system_login_type', 0, 'danger', '', '瀵搫鍩楅柅鈧崙?, '1', '2021-10-06 00:53:41', '1', '2022-02-16 13:11:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1145, 1, '缁狅紕鎮婇崥搴″酱', '1', 'infra_codegen_scene', 0, '', '', '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 缁狅紕鎮婇崥搴″酱', '1', '2022-02-02 13:15:06', '1', '2022-03-10 16:32:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1146, 2, '閻劍鍩?APP', '2', 'infra_codegen_scene', 0, '', '', '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 閻劍鍩?APP', '1', '2022-02-02 13:15:19', '1', '2022-03-10 16:33:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1150, 1, '閺佺増宓佹惔?, '1', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:28', '1', '2022-03-15 00:25:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1151, 10, '閺堫剙婀寸壕浣烘磸', '10', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:41', '1', '2022-03-15 00:25:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1152, 11, 'FTP 閺堝秴濮熼崳?, '11', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:06', '1', '2022-03-15 00:26:10', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1153, 12, 'SFTP 閺堝秴濮熼崳?, '12', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:22', '1', '2022-03-15 00:26:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1154, 20, 'S3 鐎电钖勭€涙ê鍋?, '20', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:31', '1', '2022-03-15 00:26:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1155, 103, '閻厺淇婇惂璇茬秿', '103', 'system_login_type', 0, 'default', '', NULL, '1', '2022-05-09 23:57:58', '1', '2022-05-09 23:58:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1156, 1, 'password', 'password', 'system_oauth2_grant_type', 0, 'default', '', '鐎靛棛鐖滃Ο鈥崇础', '1', '2022-05-12 00:22:05', '1', '2022-05-11 16:26:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1157, 2, 'authorization_code', 'authorization_code', 'system_oauth2_grant_type', 0, 'primary', '', '閹哄牊娼堥惍浣鼓佸?, '1', '2022-05-12 00:22:59', '1', '2022-05-11 16:26:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1158, 3, 'implicit', 'implicit', 'system_oauth2_grant_type', 0, 'success', '', '缁犫偓閸栨牗膩瀵?, '1', '2022-05-12 00:23:40', '1', '2022-05-11 16:26:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1159, 4, 'client_credentials', 'client_credentials', 'system_oauth2_grant_type', 0, 'default', '', '鐎广垺鍩涚粩顖浤佸?, '1', '2022-05-12 00:23:51', '1', '2022-05-11 16:26:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1160, 5, 'refresh_token', 'refresh_token', 'system_oauth2_grant_type', 0, 'info', '', '閸掗攱鏌婂Ο鈥崇础', '1', '2022-05-12 00:24:02', '1', '2022-05-11 16:26:11', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1194, 10, '瀵邦喕淇婄亸蹇曗柤鎼?, '10', 'terminal', 0, 'default', '', '缂佸牏顏?- 瀵邦喕淇婄亸蹇曗柤鎼?, '1', '2022-12-10 10:51:11', '1', '2022-12-10 10:51:57', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1195, 20, 'H5 缂冩垿銆?, '20', 'terminal', 0, 'default', '', '缂佸牏顏?- H5 缂冩垿銆?, '1', '2022-12-10 10:51:30', '1', '2022-12-10 10:51:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1196, 11, '瀵邦喕淇婇崗顑跨船閸?, '11', 'terminal', 0, 'default', '', '缂佸牏顏?- 瀵邦喕淇婇崗顑跨船閸?, '1', '2022-12-10 10:54:16', '1', '2022-12-10 10:52:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1197, 31, '閼昏鐏?App', '31', 'terminal', 0, 'default', '', '缂佸牏顏?- 閼昏鐏?App', '1', '2022-12-10 10:54:42', '1', '2022-12-10 10:52:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1198, 32, '鐎瑰宕?App', '32', 'terminal', 0, 'default', '', '缂佸牏顏?- 鐎瑰宕?App', '1', '2022-12-10 10:55:02', '1', '2022-12-10 10:59:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1223, 0, '閸掓繂顫愰崠?, '0', 'system_mail_send_status', 0, 'primary', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸掓繂顫愰崠鏈秐', '1', '2023-01-26 09:53:49', '1', '2023-01-26 16:36:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1224, 10, '閸欐垿鈧焦鍨氶崝?, '10', 'system_mail_send_status', 0, 'success', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧焦鍨氶崝?, '1', '2023-01-26 09:54:28', '1', '2023-01-26 16:36:22', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1225, 20, '閸欐垿鈧礁銇戠拹?, '20', 'system_mail_send_status', 0, 'danger', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧礁銇戠拹?, '1', '2023-01-26 09:54:50', '1', '2023-01-26 16:36:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1226, 30, '娑撳秴褰傞柅?, '30', 'system_mail_send_status', 0, 'info', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?-  娑撳秴褰傞柅?, '1', '2023-01-26 09:55:06', '1', '2023-01-26 16:36:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1227, 1, '闁氨鐓￠崗顒€鎲?, '1', 'system_notify_template_type', 0, 'primary', '', '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 闁氨鐓￠崗顒€鎲?, '1', '2023-01-28 10:35:59', '1', '2023-01-28 10:35:59', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1228, 2, '缁崵绮哄☉鍫熶紖', '2', 'system_notify_template_type', 0, 'success', '', '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 缁崵绮哄☉鍫熶紖', '1', '2023-01-28 10:36:20', '1', '2023-01-28 10:36:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1231, 10, 'Vue2 Element UI 閺嶅洤鍣Ο锛勫', '10', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:03:55', '1', '2023-04-13 00:03:55', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1232, 20, 'Vue3 Element Plus 閺嶅洤鍣Ο锛勫', '20', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:08', '1', '2023-04-13 00:04:08', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1234, 30, 'Vben2.0 Ant Design Schema 濡紕澧?, '30', 'infra_codegen_front_type', 1, '', '', '', '1', '2023-04-13 00:04:26', '1', '2025-07-27 10:55:14', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1435, 10, 'Gitee', '10', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:42', '1', '2023-11-04 13:04:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1436, 20, '闁藉鎷?, '20', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:54', '1', '2023-11-04 13:04:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1437, 30, '娴间椒绗熷顔讳繆', '30', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:09', '1', '2023-11-04 13:05:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1438, 31, '瀵邦喕淇婇崗顑跨船楠炲啿褰?, '31', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:18', '1', '2023-11-04 13:05:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1439, 32, '瀵邦喕淇婂鈧弨鎯ч挬閸?, '32', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:30', '1', '2023-11-04 13:05:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1440, 34, '瀵邦喕淇婄亸蹇曗柤鎼?, '34', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1443, 15, '鐎涙劘銆?, '15', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-13 23:06:16', '1', '2023-11-13 23:06:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1444, 10, '娑撴槒銆冮敍鍫熺垼閸戝棙膩瀵骏绱?, '10', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:32:49', '1', '2023-11-14 12:32:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1445, 11, '娑撴槒銆冮敍鍦桼P 濡€崇础閿?, '11', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:33:05', '1', '2023-11-14 12:33:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1446, 12, '娑撴槒銆冮敍鍫濆敶瀹撳本膩瀵骏绱?, '12', 'infra_codegen_template_type', 0, '', '', '', '1', '2023-11-14 12:33:31', '1', '2023-11-14 12:33:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1529, 1, '婢?, '1', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:26', '1', '2024-03-29 22:50:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1530, 2, '閸?, '2', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:36', '1', '2024-03-29 22:50:36', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1531, 3, '閺?, '3', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:46', '1', '2024-03-29 22:50:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1532, 4, '鐎涳絽瀹?, '4', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:01', '1', '2024-03-29 22:51:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1533, 5, '楠?, '5', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:07', '1', '2024-03-29 22:51:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1537, 1, 'OpenAI', 'OpenAI', 'ai_platform', 0, '', '', '', '1', '2024-05-09 22:33:47', '1', '2024-05-09 22:58:46', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1538, 2, 'Ollama', 'Ollama', 'ai_platform', 0, '', '', '', '1', '2024-05-17 23:02:55', '1', '2024-05-17 23:02:55', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1539, 3, '閺傚洤绺炬稉鈧懛鈧?, 'YiYan', 'ai_platform', 0, '', '', '', '1', '2024-05-18 09:24:20', '1', '2024-05-18 09:29:01', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1540, 4, '鐠侇垶顥ｉ弰鐔轰紑', 'XingHuo', 'ai_platform', 0, '', '', '', '1', '2024-05-18 10:08:56', '1', '2024-05-18 10:08:56', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1541, 5, '闁矮绠熼崡鍐６', 'TongYi', 'ai_platform', 0, '', '', '', '1', '2024-05-18 10:32:29', '1', '2024-07-06 15:42:29', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1542, 6, 'StableDiffusion', 'StableDiffusion', 'ai_platform', 0, '', '', '', '1', '2024-06-01 15:09:31', '1', '2024-06-01 15:10:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1543, 10, '鏉╂稖顢戞稉?, '10', 'ai_image_status', 0, 'primary', '', '', '1', '2024-06-26 20:51:41', '1', '2024-06-26 20:52:48', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1544, 20, '瀹告彃鐣幋?, '20', 'ai_image_status', 0, 'success', '', '', '1', '2024-06-26 20:52:07', '1', '2024-06-26 20:52:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1545, 30, '瀹告彃銇戠拹?, '30', 'ai_image_status', 0, 'warning', '', '', '1', '2024-06-26 20:52:25', '1', '2024-06-26 20:52:35', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1546, 7, 'Midjourney', 'Midjourney', 'ai_platform', 0, '', '', '', '1', '2024-06-26 22:14:46', '1', '2024-06-26 22:14:46', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1547, 10, '鏉╂稖顢戞稉?, '10', 'ai_music_status', 0, 'primary', '', '', '1', '2024-06-27 22:45:22', '1', '2024-06-28 00:56:17', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1548, 20, '瀹告彃鐣幋?, '20', 'ai_music_status', 0, 'success', '', '', '1', '2024-06-27 22:45:33', '1', '2024-06-28 00:56:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1549, 30, '瀹告彃銇戠拹?, '30', 'ai_music_status', 0, 'danger', '', '', '1', '2024-06-27 22:45:44', '1', '2024-06-28 00:56:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1550, 1, '濮濆矁鐦濆Ο鈥崇础', '1', 'ai_generate_mode', 0, '', '', '', '1', '2024-06-27 22:46:31', '1', '2024-06-28 01:22:25', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1551, 2, '閹诲繗鍫Ο鈥崇础', '2', 'ai_generate_mode', 0, '', '', '', '1', '2024-06-27 22:46:37', '1', '2024-06-28 01:22:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1552, 8, 'Suno', 'Suno', 'ai_platform', 0, '', '', '', '1', '2024-06-29 09:13:36', '1', '2024-06-29 09:13:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1553, 9, 'DeepSeek', 'DeepSeek', 'ai_platform', 0, '', '', '', '1', '2024-07-06 12:04:30', '1', '2024-07-06 12:05:20', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1554, 13, '閺呴缚姘?, 'ZhiPu', 'ai_platform', 0, '', '', '', '1', '2024-07-06 18:00:35', '1', '2025-02-24 20:18:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1555, 4, '闂€?, '4', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:49:03', '1', '2024-07-07 15:49:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1556, 5, '濞堜絻鎯?, '5', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:49:54', '1', '2024-07-07 15:49:54', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1557, 6, '閺傚洨鐝?, '6', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:05', '1', '2024-07-07 15:50:05', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1558, 7, '閸楁艾顓归弬鍥╃彿', '7', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:23', '1', '2024-07-07 15:50:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1559, 8, '閹櫕纭?, '8', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:31', '1', '2024-07-07 15:50:31', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1560, 9, '婢堆呯堪', '9', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:37', '1', '2024-07-07 15:50:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1561, 1, '閼奉亜濮?, '1', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:06', '1', '2024-07-07 15:51:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1562, 2, '閸欏鏉?, '2', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:19', '1', '2024-07-07 15:51:19', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1563, 3, '闂呭繑鍓?, '3', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:27', '1', '2024-07-07 15:51:27', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1564, 4, '閸欏銈?, '4', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:37', '1', '2024-07-07 15:51:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1565, 5, '娑撴挷绗?, '5', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:49', '1', '2024-07-07 15:52:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1566, 6, '鐠囨瑨鐨?, '6', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:52:15', '1', '2024-07-07 15:52:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1567, 7, '閺堝鍙?, '7', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:52:24', '1', '2024-07-07 15:52:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1568, 8, '濮濓絽绱?, '8', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:54:33', '1', '2024-07-07 15:54:33', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1570, 1, '閼奉亜濮?, '1', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:19:34', '1', '2024-07-07 15:19:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1571, 2, '閻㈤潧鐡欓柇顔绘', '2', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:19:50', '1', '2024-07-07 15:49:30', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1572, 3, '濞戝牊浼?, '3', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:20:01', '1', '2024-07-07 15:49:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1573, 4, '鐠囧嫯顔?, '4', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:20:13', '1', '2024-07-07 15:49:45', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1574, 1, '閼奉亜濮?, '1', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:18', '1', '2024-07-07 15:44:18', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1575, 2, '娑擃厽鏋?, '2', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:28', '1', '2024-07-07 15:44:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1576, 3, '閼昏鲸鏋?, '3', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:37', '1', '2024-07-07 15:44:37', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1577, 4, '闂娾晞顕?, '4', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:46:28', '1', '2024-07-07 15:46:28', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1578, 5, '閺冦儴顕?, '5', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:46:44', '1', '2024-07-07 15:46:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1579, 1, '閼奉亜濮?, '1', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:34', '1', '2024-07-07 15:48:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1580, 2, '閻?, '2', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:44', '1', '2024-07-07 15:48:44', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1581, 3, '娑擃厾鐡?, '3', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:52', '1', '2024-07-07 15:48:52', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1584, 1, '閹炬澘鍟?, '1', 'ai_write_type', 0, '', '', '', '1', '2024-07-10 21:26:00', '1', '2024-07-10 21:26:00', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1585, 2, '閸ョ偛顦?, '2', 'ai_write_type', 0, '', '', '', '1', '2024-07-10 21:26:06', '1', '2024-07-10 21:26:06', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1586, 2, '閼垫崘顔嗘禍?, 'TENCENT', 'system_sms_channel_code', 0, '', '', '', '1', '2024-07-22 22:23:16', '1', '2024-07-22 22:23:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1587, 3, '閸楀簼璐熸禍?, 'HUAWEI', 'system_sms_channel_code', 0, '', '', '', '1', '2024-07-22 22:23:46', '1', '2024-07-22 22:23:53', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1588, 1, 'OpenAI 瀵邦喛钂?, 'AzureOpenAI', 'ai_platform', 0, '', '', '', '1', '2024-08-10 14:07:41', '1', '2024-08-10 14:07:41', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1591, 4, '娑撳啰澧版禍?, 'QINIU', 'system_sms_channel_code', 0, '', '', '', '1', '2024-08-31 08:45:03', '1', '2024-08-31 08:45:24', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1683, 10, '鐎涙濡挒鍡楀瘶', 'DouBao', 'ai_platform', 0, '', '', '', '1', '2025-02-23 19:51:40', '1', '2025-02-23 19:52:02', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1684, 11, '閼垫崘顔嗗ǎ宄板帗', 'HunYuan', 'ai_platform', 0, '', '', '', '1', '2025-02-23 20:58:04', '1', '2025-02-23 20:58:04', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1685, 12, '绾懎鐔€濞翠礁濮?, 'SiliconFlow', 'ai_platform', 0, '', '', '', '1', '2025-02-24 20:19:09', '1', '2025-02-24 20:19:09', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1686, 1, '閼卞﹤銇?, '1', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:26:34', '1', '2025-03-03 12:26:34', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1687, 2, '閸ユ儳鍎?, '2', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:27:23', '1', '2025-03-03 12:27:23', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1688, 3, '闂婃娊顣?, '3', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:27:51', '1', '2025-03-03 12:27:51', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1689, 4, '鐟欏棝顣?, '4', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:03', '1', '2025-03-03 12:28:03', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1690, 5, '閸氭垿鍣?, '5', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:15', '1', '2025-03-03 12:28:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1691, 6, '闁插秵甯?, '6', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:26', '1', '2025-03-03 12:28:26', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1692, 14, 'MiniMax', 'MiniMax', 'ai_platform', 0, '', '', '', '1', '2025-03-11 20:04:51', '1', '2025-03-11 20:04:51', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1693, 15, '閺堝牅绠ｉ弳妤呮桨', 'Moonshot', 'ai_platform', 0, '', '', '', '1', '2025-03-11 20:05:08', '1', '2025-11-24 07:17:39', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3000, 16, '閻ф儳绐涢弲楦垮厴', 'BaiChuan', 'ai_platform', 0, '', '', '', '1', '2025-03-23 12:15:46', '1', '2025-03-23 12:15:46', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3001, 40, 'Vben5.0 Ant Design Schema 濡紕澧?, '40', 'infra_codegen_front_type', 0, '', '', NULL, '1', '2025-04-23 21:47:47', '1', '2025-09-04 23:25:12', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3028, 2, 'Anthropic', 'Anthropic', 'ai_platform', 0, '', '', '', '1', '2025-08-21 22:54:24', '1', '2025-08-21 22:57:58', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3029, 2, '鐠嬮攱鐡?Gemini', 'Gemini', 'ai_platform', 0, '', '', '', '1', '2025-08-22 22:39:35', '1', '2025-08-22 22:44:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3030, 1, '閺傚洣娆㈢化鑽ょ埠', 'filesystem', 'ai_mcp_client_name', 0, '', '', '', '1', '2025-08-28 13:58:43', '1', '2025-08-28 21:19:42', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3031, 41, 'Vben5.0 Ant Design 閺嶅洤鍣Ο锛勫', '41', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:07', '1', '2025-09-04 23:26:07', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3032, 50, 'Vben5.0 Element Plus Schema 濡紕澧?, '50', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:38', '1', '2025-09-04 23:26:38', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3033, 51, 'Vben5.0 Element Plus 閺嶅洤鍣Ο锛勫', '51', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:49', '1', '2025-09-04 23:26:49', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3035, 40, '閺€顖欑帛鐎规繂鐨粙瀣碍', '40', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3036, 60, 'Admin Uniapp 缁夎濮╃粩?, '60', 'infra_codegen_front_type', 0, '', '', NULL, '1', '2025-12-16 19:25:51', '1', '2025-12-17 09:46:15', '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3037, 42, 'Vben5.0 Antdv Next Schema 濡紕澧?, '42', 'infra_codegen_front_type', 0, '', '', '', '1', NOW(), '1', NOW(), '0');
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3038, 43, 'Vben5.0 Antdv Next 閺嶅洤鍣Ο锛勫', '43', 'infra_codegen_front_type', 0, '', '', '', '1', NOW(), '1', NOW(), '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_dict_data_seq;
CREATE SEQUENCE system_dict_data_seq
    START 3449;

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS system_dict_type;
CREATE TABLE system_dict_type (
    id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  type varchar(100) NULL DEFAULT '',
  status int2 NOT NULL DEFAULT 0,
  remark varchar(500) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  deleted_time timestamp NULL DEFAULT NULL
);

ALTER TABLE system_dict_type ADD CONSTRAINT pk_system_dict_type PRIMARY KEY (id);

COMMENT ON COLUMN system_dict_type.id IS '鐎涙鍚€娑撳鏁?;
COMMENT ON COLUMN system_dict_type.name IS '鐎涙鍚€閸氬秶袨';
COMMENT ON COLUMN system_dict_type.type IS '鐎涙鍚€缁鐎?;
COMMENT ON COLUMN system_dict_type.status IS '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_dict_type.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_dict_type.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_dict_type.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_dict_type.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_dict_type.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_dict_type.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_dict_type.deleted_time IS '閸掔娀娅庨弮鍫曟？';
COMMENT ON TABLE system_dict_type IS '鐎涙鍚€缁鐎风悰?;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (1, '閻劍鍩涢幀褍鍩?, 'system_user_sex', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-05-16 20:29:32', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (6, '閸欏倹鏆熺猾璇茬€?, 'infra_config_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:36:54', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (7, '闁氨鐓＄猾璇茬€?, 'system_notice_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:35:26', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (9, '閹垮秳缍旂猾璇茬€?, 'infra_operate_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:01', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (10, '缁崵绮洪悩鑸碘偓?, 'common_status', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:21:28', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (11, 'Boolean 閺勵垰鎯佺猾璇茬€?, 'infra_boolean_string', 0, 'boolean 鏉烆剚妲搁崥?, '', '2021-01-19 03:20:08', '', '2022-02-01 16:37:10', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (104, '閻у妾扮紒鎾寸亯', 'system_login_result', 0, '閻у妾扮紒鎾寸亯', '', '2021-01-18 06:17:11', '', '2022-02-01 16:36:00', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (106, '娴狅絿鐖滈悽鐔稿灇濡剝婢樼猾璇茬€?, 'infra_codegen_template_type', 0, NULL, '', '2021-02-05 07:08:06', '1', '2022-05-16 20:26:50', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (107, '鐎规碍妞傛禒璇插閻樿埖鈧?, 'infra_job_status', 0, NULL, '', '2021-02-07 07:44:16', '', '2022-02-01 16:51:11', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (108, '鐎规碍妞傛禒璇插閺冦儱绻旈悩鑸碘偓?, 'infra_job_log_status', 0, NULL, '', '2021-02-08 10:03:51', '', '2022-02-01 16:50:43', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (109, '閻劍鍩涚猾璇茬€?, 'user_type', 0, NULL, '', '2021-02-26 00:15:51', '', '2021-02-26 00:15:51', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (110, 'API 瀵倸鐖堕弫鐗堝祦閻ㄥ嫬顦╅悶鍡欏Ц閹?, 'infra_api_error_log_process_status', 0, NULL, '', '2021-02-26 07:07:01', '', '2022-02-01 16:50:53', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (111, '閻厺淇婂〒鐘讳壕缂傛牜鐖?, 'system_sms_channel_code', 0, NULL, '1', '2021-04-05 01:04:50', '1', '2022-02-16 02:09:08', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (112, '閻厺淇婂Ο鈩冩緲閻ㄥ嫮琚崹?, 'system_sms_template_type', 0, NULL, '1', '2021-04-05 21:50:43', '1', '2022-02-01 16:35:06', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (113, '閻厺淇婇崣鎴︹偓浣哄Ц閹?, 'system_sms_send_status', 0, NULL, '1', '2021-04-11 20:18:03', '1', '2022-02-01 16:35:09', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (114, '閻厺淇婇幒銉︽暪閻樿埖鈧?, 'system_sms_receive_status', 0, NULL, '1', '2021-04-11 20:27:14', '1', '2022-02-01 16:35:14', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (116, '閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, 'system_login_type', 0, '閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, '1', '2021-10-06 00:50:46', '1', '2022-02-01 16:35:56', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (144, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, 'infra_codegen_scene', 0, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, '1', '2022-02-02 13:14:45', '1', '2022-03-10 16:33:46', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (145, '鐟欐帟澹婄猾璇茬€?, 'system_role_type', 0, '鐟欐帟澹婄猾璇茬€?, '1', '2022-02-16 13:01:46', '1', '2022-02-16 13:01:46', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (146, '閺傚洣娆㈢€涙ê鍋嶉崳?, 'infra_file_storage', 0, '閺傚洣娆㈢€涙ê鍋嶉崳?, '1', '2022-03-15 00:24:38', '1', '2022-03-15 00:24:38', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (147, 'OAuth 2.0 閹哄牊娼堢猾璇茬€?, 'system_oauth2_grant_type', 0, 'OAuth 2.0 閹哄牊娼堢猾璇茬€烽敍鍫熌佸蹇ョ礆', '1', '2022-05-12 00:20:52', '1', '2022-05-11 16:25:49', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (160, '缂佸牏顏?, 'terminal', 0, '缂佸牏顏?, '1', '2022-12-10 10:50:50', '1', '2022-12-10 10:53:11', '0', NULL);
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (166, '闁喕娆㈤崣鎴︹偓浣哄Ц閹?, 'system_mail_send_status', 0, '闁喕娆㈤崣鎴︹偓浣哄Ц閹?, '1', '2023-01-26 09:53:13', '1', '2023-01-26 09:53:13', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (167, '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, 'system_notify_template_type', 0, '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, '1', '2023-01-28 10:35:10', '1', '2023-01-28 10:35:10', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (168, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬澧犵粩顖滆閸?, 'infra_codegen_front_type', 0, '', '1', '2023-04-12 23:57:52', '1', '2023-04-12 23:57:52', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (601, '缁€鍙ユ唉缁鐎?, 'system_social_type', 0, '', '1', '2023-11-04 13:03:54', '1', '2023-11-04 13:03:54', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (616, '閺冨爼妫块梻鎾', 'date_interval', 0, '', '1', '2024-03-29 22:50:09', '1', '2024-03-29 22:50:09', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (620, 'AI 濡€崇€烽獮鍐插酱', 'ai_platform', 0, '', '1', '2024-05-09 22:27:38', '1', '2024-05-09 22:27:38', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (621, 'AI 缂佹鏁鹃悩鑸碘偓?, 'ai_image_status', 0, '', '1', '2024-06-26 20:51:23', '1', '2024-06-26 20:51:23', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (622, 'AI 闂婂厖绠伴悩鑸碘偓?, 'ai_music_status', 0, '', '1', '2024-06-27 22:45:07', '1', '2024-06-28 00:56:27', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (623, 'AI 闂婂厖绠伴悽鐔稿灇濡€崇础', 'ai_generate_mode', 0, '', '1', '2024-06-27 22:46:21', '1', '2024-06-28 01:22:29', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (624, '閸愭瑤缍旂拠顓熺毜', 'ai_write_tone', 0, '', '1', '2024-07-07 15:19:02', '1', '2024-07-07 15:19:02', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (625, '閸愭瑤缍旂拠顓♀枅', 'ai_write_language', 0, '', '1', '2024-07-07 15:18:52', '1', '2024-07-07 15:18:52', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (626, '閸愭瑤缍旈梹鍨', 'ai_write_length', 0, '', '1', '2024-07-07 15:18:41', '1', '2024-07-07 15:18:41', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (627, '閸愭瑤缍旈弽鐓庣础', 'ai_write_format', 0, '', '1', '2024-07-07 15:14:34', '1', '2024-07-07 15:14:34', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (628, 'AI 閸愭瑤缍旂猾璇茬€?, 'ai_write_type', 0, '', '1', '2024-07-10 21:25:29', '1', '2024-07-10 21:25:29', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (640, 'AI 濡€崇€风猾璇茬€?, 'ai_model_type', 0, '', '1', '2025-03-03 12:24:07', '1', '2025-03-03 12:24:07', '0', '1970-01-01 00:00:00');
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (2007, 'AI MCP 鐎广垺鍩涚粩顖氭倳鐎?, 'ai_mcp_client_name', 0, '', '1', '2025-08-28 13:57:40', '1', '2025-08-28 13:57:40', '0', '1970-01-01 00:00:00');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_dict_type_seq;
CREATE SEQUENCE system_dict_type_seq
    START 2139;

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS system_login_log;
CREATE TABLE system_login_log (
    id int8 NOT NULL,
  log_type int8 NOT NULL,
  trace_id varchar(64) NULL DEFAULT '',
  user_id int8 NOT NULL DEFAULT 0,
  user_type int2 NOT NULL DEFAULT 0,
  username varchar(50) NULL DEFAULT '',
  result int2 NOT NULL,
  user_ip varchar(50) NOT NULL,
  user_agent varchar(512) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_login_log ADD CONSTRAINT pk_system_login_log PRIMARY KEY (id);

CREATE INDEX idx_system_login_log_01 ON system_login_log (username);
CREATE INDEX idx_system_login_log_02 ON system_login_log (create_time);

COMMENT ON COLUMN system_login_log.id IS '鐠佸潡妫禝D';
COMMENT ON COLUMN system_login_log.log_type IS '閺冦儱绻旂猾璇茬€?;
COMMENT ON COLUMN system_login_log.trace_id IS '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?;
COMMENT ON COLUMN system_login_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_login_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_login_log.username IS '閻劍鍩涚拹锕€褰?;
COMMENT ON COLUMN system_login_log.result IS '閻у妾扮紒鎾寸亯';
COMMENT ON COLUMN system_login_log.user_ip IS '閻劍鍩?IP';
COMMENT ON COLUMN system_login_log.user_agent IS '濞村繗顫嶉崳?UA';
COMMENT ON COLUMN system_login_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_login_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_login_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_login_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_login_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_login_log.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_login_log IS '缁崵绮虹拋鍧楁６鐠佹澘缍?;

DROP SEQUENCE IF EXISTS system_login_log_seq;
CREATE SEQUENCE system_login_log_seq
    START 1;

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
DROP TABLE IF EXISTS system_mail_account;
CREATE TABLE system_mail_account (
    id int8 NOT NULL,
  mail varchar(255) NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  host varchar(255) NOT NULL,
  port int4 NOT NULL,
  ssl_enable bool NOT NULL DEFAULT '0',
  starttls_enable bool NOT NULL DEFAULT '0',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_mail_account ADD CONSTRAINT pk_system_mail_account PRIMARY KEY (id);

COMMENT ON COLUMN system_mail_account.id IS '娑撳鏁?;
COMMENT ON COLUMN system_mail_account.mail IS '闁喚顔?;
COMMENT ON COLUMN system_mail_account.username IS '閻劍鍩涢崥?;
COMMENT ON COLUMN system_mail_account.password IS '鐎靛棛鐖?;
COMMENT ON COLUMN system_mail_account.host IS 'SMTP 閺堝秴濮熼崳銊ョ厵閸?;
COMMENT ON COLUMN system_mail_account.port IS 'SMTP 閺堝秴濮熼崳銊ь伂閸?;
COMMENT ON COLUMN system_mail_account.ssl_enable IS '閺勵垰鎯佸鈧崥?SSL';
COMMENT ON COLUMN system_mail_account.starttls_enable IS '閺勵垰鎯佸鈧崥?STARTTLS';
COMMENT ON COLUMN system_mail_account.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_mail_account.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_mail_account.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_mail_account.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_mail_account.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_mail_account IS '闁喚顔堢拹锕€褰跨悰?;

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (1, '7684413@qq.com', '7684413@qq.com', '1234576', '127.0.0.1', 8080, '0', '0', '1', '2023-01-25 17:39:52', '1', '2025-04-04 16:34:40', '0');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, '1', '0', '1', '2023-01-26 01:26:03', '1', '2025-12-20 18:09:32', '0');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, '0', '0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', '1');
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, '1', '0', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', '1');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_mail_account_seq;
CREATE SEQUENCE system_mail_account_seq
    START 5;

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
DROP TABLE IF EXISTS system_mail_log;
CREATE TABLE system_mail_log (
    id int8 NOT NULL,
  user_id int8 NULL DEFAULT NULL,
  user_type int2 NULL DEFAULT NULL,
  to_mails varchar(1024) NOT NULL,
  cc_mails varchar(1024) NULL DEFAULT NULL,
  bcc_mails varchar(1024) NULL DEFAULT NULL,
  account_id int8 NOT NULL,
  from_mail varchar(255) NOT NULL,
  template_id int8 NOT NULL,
  template_code varchar(63) NOT NULL,
  template_nickname varchar(255) NULL DEFAULT NULL,
  template_title varchar(255) NOT NULL,
  template_content text NULL,
  template_params varchar(255) NOT NULL,
  send_status int2 NOT NULL DEFAULT 0,
  send_time timestamp NULL DEFAULT NULL,
  send_message_id varchar(255) NULL DEFAULT NULL,
  send_exception varchar(4096) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_mail_log ADD CONSTRAINT pk_system_mail_log PRIMARY KEY (id);

COMMENT ON COLUMN system_mail_log.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_mail_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_mail_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_mail_log.to_mails IS '閹恒儲鏁归柇顔绢唸閸︽澘娼?;
COMMENT ON COLUMN system_mail_log.cc_mails IS '閹跺嫰鈧線鍋栫粻鍗炴勾閸р偓';
COMMENT ON COLUMN system_mail_log.bcc_mails IS '鐎靛棝鈧線鍋栫粻鍗炴勾閸р偓';
COMMENT ON COLUMN system_mail_log.account_id IS '闁喚顔堢拹锕€褰跨紓鏍у娇';
COMMENT ON COLUMN system_mail_log.from_mail IS '閸欐垿鈧線鍋栫粻鍗炴勾閸р偓';
COMMENT ON COLUMN system_mail_log.template_id IS '濡剝婢樼紓鏍у娇';
COMMENT ON COLUMN system_mail_log.template_code IS '濡剝婢樼紓鏍垳';
COMMENT ON COLUMN system_mail_log.template_nickname IS '濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨';
COMMENT ON COLUMN system_mail_log.template_title IS '闁喕娆㈤弽鍥暯';
COMMENT ON COLUMN system_mail_log.template_content IS '闁喕娆㈤崘鍛啇';
COMMENT ON COLUMN system_mail_log.template_params IS '闁喕娆㈤崣鍌涙殶';
COMMENT ON COLUMN system_mail_log.send_status IS '閸欐垿鈧胶濮搁幀?;
COMMENT ON COLUMN system_mail_log.send_time IS '閸欐垿鈧焦妞傞梻?;
COMMENT ON COLUMN system_mail_log.send_message_id IS '閸欐垿鈧浇绻戦崶鐐垫畱濞戝牊浼?ID';
COMMENT ON COLUMN system_mail_log.send_exception IS '閸欐垿鈧礁绱撶敮?;
COMMENT ON COLUMN system_mail_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_mail_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_mail_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_mail_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_mail_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_mail_log IS '闁喕娆㈤弮銉ョ箶鐞?;

DROP SEQUENCE IF EXISTS system_mail_log_seq;
CREATE SEQUENCE system_mail_log_seq
    START 1;

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
DROP TABLE IF EXISTS system_mail_template;
CREATE TABLE system_mail_template (
    id int8 NOT NULL,
  name varchar(63) NOT NULL,
  code varchar(63) NOT NULL,
  account_id int8 NOT NULL,
  nickname varchar(255) NULL DEFAULT NULL,
  title varchar(255) NOT NULL,
  content varchar(10240) NOT NULL,
  params varchar(255) NOT NULL,
  status int2 NOT NULL,
  remark varchar(255) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_mail_template ADD CONSTRAINT pk_system_mail_template PRIMARY KEY (id);

COMMENT ON COLUMN system_mail_template.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_mail_template.name IS '濡剝婢橀崥宥囆?;
COMMENT ON COLUMN system_mail_template.code IS '濡剝婢樼紓鏍垳';
COMMENT ON COLUMN system_mail_template.account_id IS '閸欐垿鈧胶娈戦柇顔绢唸鐠愶箑褰跨紓鏍у娇';
COMMENT ON COLUMN system_mail_template.nickname IS '閸欐垿鈧椒姹夐崥宥囆?;
COMMENT ON COLUMN system_mail_template.title IS '濡剝婢橀弽鍥暯';
COMMENT ON COLUMN system_mail_template.content IS '濡剝婢橀崘鍛啇';
COMMENT ON COLUMN system_mail_template.params IS '閸欏倹鏆熼弫鎵矋';
COMMENT ON COLUMN system_mail_template.status IS '瀵偓閸氼垳濮搁幀?;
COMMENT ON COLUMN system_mail_template.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_mail_template.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_mail_template.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_mail_template.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_mail_template.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_mail_template.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_mail_template IS '闁喕娆㈠Ο锛勫鐞?;

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (13, '閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', 'admin-sms-login', 1, '婵傘儳澹掗弴?, '娴ｇ姷瀵介幋鎴犲', '<p>閹劎娈戞宀冪槈閻焦妲竰code}閿涘苯鎮曠€涙妲竰name}</p>', '["code","name"]', 0, '3', '1', '2021-10-11 08:10:00', '1', '2023-12-02 19:51:14', '0');
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (14, '濞村鐦Ο锛勫', 'test_01', 2, '閼哄澹?, '娑撯偓娑擃亝鐖ｆ０?, '<p>娴ｇ姵妲?{key01} 閸氭绱?/p><p><br></p><p>閺勵垳娈戠拠婵撶礉鐠у墎鎻?{key02} 娑撯偓娑撳绱?/p>', '["key01","key02"]', 0, NULL, '1', '2023-01-26 01:27:40', '1', '2025-07-26 21:48:45', '0');
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (15, '3', '2', 2, '7', '4', '<p>45</p>', '[]', 1, '80', '1', '2023-01-27 15:50:35', '1', '2025-07-26 21:47:49', '1');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_mail_template_seq;
CREATE SEQUENCE system_mail_template_seq
    START 16;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS system_menu;
CREATE TABLE system_menu (
    id int8 NOT NULL,
  name varchar(50) NOT NULL,
  permission varchar(100) NULL DEFAULT '',
  type int2 NOT NULL,
  sort int4 NOT NULL DEFAULT 0,
  parent_id int8 NOT NULL DEFAULT 0,
  path varchar(200) NULL DEFAULT '',
  icon varchar(100) NULL DEFAULT '#',
  component varchar(255) NULL DEFAULT NULL,
  component_name varchar(255) NULL DEFAULT NULL,
  status int2 NOT NULL DEFAULT 0,
  visible bool NOT NULL DEFAULT '1',
  keep_alive bool NOT NULL DEFAULT '1',
  always_show bool NOT NULL DEFAULT '1',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_menu ADD CONSTRAINT pk_system_menu PRIMARY KEY (id);

COMMENT ON COLUMN system_menu.id IS '閼挎粌宕烮D';
COMMENT ON COLUMN system_menu.name IS '閼挎粌宕熼崥宥囆?;
COMMENT ON COLUMN system_menu.permission IS '閺夊啴妾洪弽鍥槕';
COMMENT ON COLUMN system_menu.type IS '閼挎粌宕熺猾璇茬€?;
COMMENT ON COLUMN system_menu.sort IS '閺勫墽銇氭い鍝勭碍';
COMMENT ON COLUMN system_menu.parent_id IS '閻栨儼褰嶉崡鏃綝';
COMMENT ON COLUMN system_menu.path IS '鐠侯垳鏁遍崷鏉挎絻';
COMMENT ON COLUMN system_menu.icon IS '閼挎粌宕熼崶鐐垼';
COMMENT ON COLUMN system_menu.component IS '缂佸嫪娆㈢捄顖氱窞';
COMMENT ON COLUMN system_menu.component_name IS '缂佸嫪娆㈤崥?;
COMMENT ON COLUMN system_menu.status IS '閼挎粌宕熼悩鑸碘偓?;
COMMENT ON COLUMN system_menu.visible IS '閺勵垰鎯侀崣顖濐潌';
COMMENT ON COLUMN system_menu.keep_alive IS '閺勵垰鎯佺紓鎾崇摠';
COMMENT ON COLUMN system_menu.always_show IS '閺勵垰鎯侀幀缁樻Ц閺勫墽銇?;
COMMENT ON COLUMN system_menu.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_menu.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_menu.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_menu.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_menu.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_menu IS '閼挎粌宕熼弶鍐鐞?;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1, '缁崵绮虹粻锛勬倞', '', 1, 10, 0, '/system', 'ep:tools', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2025-03-15 21:30:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2, '閸╄櫣顢呯拋鐐煢', '', 1, 20, 0, '/infra', 'ep:monitor', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-03-01 08:28:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5, 'OA 缁€杞扮伐', '', 1, 40, 1185, 'oa', 'fa:road', NULL, NULL, 0, '1', '1', '1', 'admin', '2021-09-20 16:26:19', '1', '2024-02-29 12:38:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (100, '閻劍鍩涚粻锛勬倞', 'system:user:list', 2, 1, 1, 'user', 'ep:avatar', 'system/user/index', 'SystemUser', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2026-01-01 18:43:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (101, '鐟欐帟澹婄粻锛勬倞', '', 2, 2, 1, 'role', 'ep:user', 'system/role/index', 'SystemRole', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2026-01-05 19:30:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (102, '閼挎粌宕熺粻锛勬倞', '', 2, 3, 1, 'menu', 'ep:menu', 'system/menu/index', 'SystemMenu', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:03:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (103, '闁劑妫粻锛勬倞', '', 2, 4, 1, 'dept', 'fa:address-card', 'system/dept/index', 'SystemDept', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (104, '瀹€妞剧秴缁狅紕鎮?, '', 2, 5, 1, 'post', 'fa:address-book-o', 'system/post/index', 'SystemPost', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:39', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (105, '鐎涙鍚€缁狅紕鎮?, '', 2, 6, 1, 'dict', 'ep:collection', 'system/dict/index', 'SystemDictType', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:07:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (106, '闁板秶鐤嗙粻锛勬倞', '', 2, 8, 2, 'config', 'fa:connectdevelop', 'infra/config/index', 'InfraConfig', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:02:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (107, '闁氨鐓￠崗顒€鎲?, '', 2, 4, 2739, 'notice', 'ep:takeaway-box', 'system/notice/index', 'SystemNotice', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-22 23:56:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (108, '鐎孤ゎ吀閺冦儱绻?, '', 1, 9, 1, 'log', 'ep:document-copy', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:08:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (109, '娴犮倗澧濈粻锛勬倞', '', 2, 2, 1261, 'token', 'fa:key', 'system/oauth2/token/index', 'SystemTokenClient', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:13:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (110, '鐎规碍妞傛禒璇插', '', 2, 7, 2, 'job', 'fa-solid:tasks', 'infra/job/index', 'InfraJob', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:57:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (111, 'MySQL 閻╂垶甯?, '', 2, 1, 2740, 'druid', 'fa-solid:box', 'infra/druid/index', 'InfraDruid', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:05:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (112, 'Java 閻╂垶甯?, '', 2, 3, 2740, 'admin-server', 'ep:coffee-cup', 'infra/server/index', 'InfraAdminServer', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (113, 'Redis 閻╂垶甯?, '', 2, 2, 2740, 'redis', 'fa:reddit-square', 'infra/redis/index', 'InfraRedis', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (114, '鐞涖劌宕熼弸鍕紦', 'infra:build:list', 2, 2, 2, 'build', 'fa:wpforms', 'infra/build/index', 'InfraBuild', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (115, '娴狅絿鐖滈悽鐔稿灇', 'infra:codegen:query', 2, 1, 2, 'codegen', 'ep:document-copy', 'infra/codegen/index', 'InfraCodegen', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (116, 'API 閹恒儱褰?, 'infra:swagger:list', 2, 3, 2, 'swagger', 'fa:fighter-jet', 'infra/swagger/index', 'InfraSwagger', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:01:24', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (500, '閹垮秳缍旈弮銉ョ箶', '', 2, 1, 108, 'operate-log', 'ep:position', 'system/operatelog/index', 'SystemOperateLog', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:09:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (501, '閻ц缍嶉弮銉ョ箶', '', 2, 2, 108, 'login-log', 'ep:promotion', 'system/loginlog/index', 'SystemLoginLog', 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:10:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1001, '閻劍鍩涢弻銉嚄', 'system:user:query', 3, 1, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1002, '閻劍鍩涢弬鏉款杻', 'system:user:create', 3, 2, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1003, '閻劍鍩涙穱顔芥暭', 'system:user:update', 3, 3, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1004, '閻劍鍩涢崚鐘绘珟', 'system:user:delete', 3, 4, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1005, '閻劍鍩涚€电厧鍤?, 'system:user:export', 3, 5, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1006, '閻劍鍩涚€电厧鍙?, 'system:user:import', 3, 6, 100, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1007, '闁插秶鐤嗙€靛棛鐖?, 'system:user:update-password', 3, 7, 100, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1008, '鐟欐帟澹婇弻銉嚄', 'system:role:query', 3, 1, 101, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1009, '鐟欐帟澹婇弬鏉款杻', 'system:role:create', 3, 2, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1010, '鐟欐帟澹婃穱顔芥暭', 'system:role:update', 3, 3, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1011, '鐟欐帟澹婇崚鐘绘珟', 'system:role:delete', 3, 4, 101, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1012, '鐟欐帟澹婄€电厧鍤?, 'system:role:export', 3, 5, 101, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1013, '閼挎粌宕熼弻銉嚄', 'system:menu:query', 3, 1, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1014, '閼挎粌宕熼弬鏉款杻', 'system:menu:create', 3, 2, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1015, '閼挎粌宕熸穱顔芥暭', 'system:menu:update', 3, 3, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1016, '閼挎粌宕熼崚鐘绘珟', 'system:menu:delete', 3, 4, 102, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1017, '闁劑妫弻銉嚄', 'system:dept:query', 3, 1, 103, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1018, '闁劑妫弬鏉款杻', 'system:dept:create', 3, 2, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1019, '闁劑妫穱顔芥暭', 'system:dept:update', 3, 3, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1020, '闁劑妫崚鐘绘珟', 'system:dept:delete', 3, 4, 103, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1021, '瀹€妞剧秴閺屻儴顕?, 'system:post:query', 3, 1, 104, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1022, '瀹€妞剧秴閺傛澘顤?, 'system:post:create', 3, 2, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1023, '瀹€妞剧秴娣囶喗鏁?, 'system:post:update', 3, 3, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1024, '瀹€妞剧秴閸掔娀娅?, 'system:post:delete', 3, 4, 104, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1025, '瀹€妞剧秴鐎电厧鍤?, 'system:post:export', 3, 5, 104, '', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1026, '鐎涙鍚€閺屻儴顕?, 'system:dict:query', 3, 1, 105, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1027, '鐎涙鍚€閺傛澘顤?, 'system:dict:create', 3, 2, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1028, '鐎涙鍚€娣囶喗鏁?, 'system:dict:update', 3, 3, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1029, '鐎涙鍚€閸掔娀娅?, 'system:dict:delete', 3, 4, 105, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1030, '鐎涙鍚€鐎电厧鍤?, 'system:dict:export', 3, 5, 105, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1031, '闁板秶鐤嗛弻銉嚄', 'infra:config:query', 3, 1, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1032, '闁板秶鐤嗛弬鏉款杻', 'infra:config:create', 3, 2, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1033, '闁板秶鐤嗘穱顔芥暭', 'infra:config:update', 3, 3, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1034, '闁板秶鐤嗛崚鐘绘珟', 'infra:config:delete', 3, 4, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1035, '闁板秶鐤嗙€电厧鍤?, 'infra:config:export', 3, 5, 106, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1036, '閸忣剙鎲￠弻銉嚄', 'system:notice:query', 3, 1, 107, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1037, '閸忣剙鎲￠弬鏉款杻', 'system:notice:create', 3, 2, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1038, '閸忣剙鎲℃穱顔芥暭', 'system:notice:update', 3, 3, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1039, '閸忣剙鎲￠崚鐘绘珟', 'system:notice:delete', 3, 4, 107, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1040, '閹垮秳缍旈弻銉嚄', 'system:operate-log:query', 3, 1, 500, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1042, '閺冦儱绻旂€电厧鍤?, 'system:operate-log:export', 3, 2, 500, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1043, '閻ц缍嶉弻銉嚄', 'system:login-log:query', 3, 1, 501, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1045, '閺冦儱绻旂€电厧鍤?, 'system:login-log:export', 3, 3, 501, '#', '#', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1046, '娴犮倗澧濋崚妤勩€?, 'system:oauth2-token:page', 3, 1, 109, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1048, '娴犮倗澧濋崚鐘绘珟', 'system:oauth2-token:delete', 3, 2, 109, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1050, '娴犺濮熼弬鏉款杻', 'infra:job:create', 3, 2, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1051, '娴犺濮熸穱顔芥暭', 'infra:job:update', 3, 3, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1052, '娴犺濮熼崚鐘绘珟', 'infra:job:delete', 3, 4, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1053, '閻樿埖鈧椒鎱ㄩ弨?, 'infra:job:update', 3, 5, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1054, '娴犺濮熺€电厧鍤?, 'infra:job:export', 3, 7, 110, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1056, '閻㈢喐鍨氭穱顔芥暭', 'infra:codegen:update', 3, 2, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1057, '閻㈢喐鍨氶崚鐘绘珟', 'infra:codegen:delete', 3, 3, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1058, '鐎电厧鍙嗘禒锝囩垳', 'infra:codegen:create', 3, 2, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1059, '妫板嫯顫嶆禒锝囩垳', 'infra:codegen:preview', 3, 4, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1060, '閻㈢喐鍨氭禒锝囩垳', 'infra:codegen:download', 3, 5, 115, '', '', '', NULL, 0, '1', '1', '1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1063, '鐠佸墽鐤嗙憴鎺曞閼挎粌宕熼弶鍐', 'system:permission:assign-role-menu', 3, 6, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-06 17:53:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1064, '鐠佸墽鐤嗙憴鎺曞閺佺増宓侀弶鍐', 'system:permission:assign-role-data-scope', 3, 7, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-06 17:56:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1065, '鐠佸墽鐤嗛悽銊﹀煕鐟欐帟澹?, 'system:permission:assign-user-role', 3, 8, 101, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-07 10:23:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1066, '閼惧嘲绶?Redis 閻╂垶甯舵穱鈩冧紖', 'infra:redis:get-monitor-info', 3, 1, 113, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-26 01:02:31', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1067, '閼惧嘲绶?Redis Key 閸掓銆?, 'infra:redis:get-key-list', 3, 2, 113, '', '', '', NULL, 0, '1', '1', '1', '', '2021-01-26 01:02:52', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1070, '娴狅絿鐖滈悽鐔稿灇濡楀牅绶?, '', 1, 1, 2, 'demo', 'ep:aim', 'infra/testDemo/index', NULL, 0, '1', '1', '1', '', '2021-02-06 12:42:49', '1', '2023-11-15 23:45:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1075, '娴犺濮熺憴锕€褰?, 'infra:job:trigger', 3, 8, 110, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-07 13:03:10', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1077, '闁炬崘鐭炬潻鍊熼嚋', '', 2, 4, 2740, 'skywalking', 'fa:eye', 'infra/skywalking/index', 'InfraSkyWalking', 0, '1', '1', '1', '', '2021-02-08 20:41:31', '1', '2024-04-23 00:07:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1078, '鐠佸潡妫堕弮銉ョ箶', '', 2, 1, 1083, 'api-access-log', 'ep:place', 'infra/apiAccessLog/index', 'InfraApiAccessLog', 0, '1', '1', '1', '', '2021-02-26 01:32:59', '1', '2024-02-29 08:54:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1082, '閺冦儱绻旂€电厧鍤?, 'infra:api-access-log:export', 3, 2, 1078, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 01:32:59', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1083, 'API 閺冦儱绻?, '', 2, 4, 2, 'log', 'fa:tasks', NULL, NULL, 0, '1', '1', '1', '', '2021-02-26 02:18:24', '1', '2024-04-22 23:58:36', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1084, '闁挎瑨顕ら弮銉ョ箶', 'infra:api-error-log:query', 2, 2, 1083, 'api-error-log', 'ep:warning-filled', 'infra/apiErrorLog/index', 'InfraApiErrorLog', 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2024-02-29 08:55:17', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1085, '閺冦儱绻旀径鍕倞', 'infra:api-error-log:update-status', 3, 2, 1084, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1086, '閺冦儱绻旂€电厧鍤?, 'infra:api-error-log:export', 3, 3, 1084, '', '', '', NULL, 0, '1', '1', '1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1087, '娴犺濮熼弻銉嚄', 'infra:job:query', 3, 1, 110, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:26:19', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1088, '閺冦儱绻旈弻銉嚄', 'infra:api-access-log:query', 3, 1, 1078, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:28:04', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1089, '閺冦儱绻旈弻銉嚄', 'infra:api-error-log:query', 3, 1, 1084, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-03-10 01:29:09', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1090, '閺傚洣娆㈤崚妤勩€?, '', 2, 5, 1243, 'file', 'ep:upload-filled', 'infra/file/index', 'InfraFile', 0, '1', '1', '1', '', '2021-03-12 20:16:20', '1', '2024-02-29 08:53:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1091, '閺傚洣娆㈤弻銉嚄', 'infra:file:query', 3, 1, 1090, '', '', '', NULL, 0, '1', '1', '1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1092, '閺傚洣娆㈤崚鐘绘珟', 'infra:file:delete', 3, 4, 1090, '', '', '', NULL, 0, '1', '1', '1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1094, '閻厺淇婂〒鐘讳壕', '', 2, 0, 1093, 'sms-channel', 'fa:stack-exchange', 'system/sms/channel/index', 'SystemSmsChannel', 0, '1', '1', '1', '', '2021-04-01 11:07:15', '1', '2024-02-29 01:15:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1095, '閻厺淇婂〒鐘讳壕閺屻儴顕?, 'system:sms-channel:query', 3, 1, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1096, '閻厺淇婂〒鐘讳壕閸掓稑缂?, 'system:sms-channel:create', 3, 2, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1097, '閻厺淇婂〒鐘讳壕閺囧瓨鏌?, 'system:sms-channel:update', 3, 3, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1098, '閻厺淇婂〒鐘讳壕閸掔娀娅?, 'system:sms-channel:delete', 3, 4, 1094, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1100, '閻厺淇婂Ο鈩冩緲', '', 2, 1, 1093, 'sms-template', 'ep:connection', 'system/sms/template/index', 'SystemSmsTemplate', 0, '1', '1', '1', '', '2021-04-01 17:35:17', '1', '2024-02-29 01:16:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1101, '閻厺淇婂Ο鈩冩緲閺屻儴顕?, 'system:sms-template:query', 3, 1, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1102, '閻厺淇婂Ο鈩冩緲閸掓稑缂?, 'system:sms-template:create', 3, 2, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1103, '閻厺淇婂Ο鈩冩緲閺囧瓨鏌?, 'system:sms-template:update', 3, 3, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1104, '閻厺淇婂Ο鈩冩緲閸掔娀娅?, 'system:sms-template:delete', 3, 4, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1105, '閻厺淇婂Ο鈩冩緲鐎电厧鍤?, 'system:sms-template:export', 3, 5, 1100, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1106, '閸欐垿鈧焦绁寸拠鏇犵叚娣?, 'system:sms-template:send-sms', 3, 6, 1100, '', '', '', NULL, 0, '1', '1', '1', '1', '2021-04-11 00:26:40', '1', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1107, '閻厺淇婇弮銉ョ箶', '', 2, 2, 1093, 'sms-log', 'fa:edit', 'system/sms/log/index', 'SystemSmsLog', 0, '1', '1', '1', '', '2021-04-11 08:37:05', '1', '2024-02-29 08:49:02', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1108, '閻厺淇婇弮銉ョ箶閺屻儴顕?, 'system:sms-log:query', 3, 1, 1107, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1109, '閻厺淇婇弮銉ョ箶鐎电厧鍤?, 'system:sms-log:export', 3, 5, 1107, '', '', '', NULL, 0, '1', '1', '1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1138, '缁夌喐鍩涢崚妤勩€?, '', 2, 0, 1224, 'list', 'ep:house', 'system/tenant/index', 'SystemTenant', 0, '1', '1', '1', '', '2021-12-14 12:31:43', '1', '2024-02-29 01:01:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1139, '缁夌喐鍩涢弻銉嚄', 'system:tenant:query', 3, 1, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1140, '缁夌喐鍩涢崚娑樼紦', 'system:tenant:create', 3, 2, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1141, '缁夌喐鍩涢弴瀛樻煀', 'system:tenant:update', 3, 3, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1142, '缁夌喐鍩涢崚鐘绘珟', 'system:tenant:delete', 3, 4, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1143, '缁夌喐鍩涚€电厧鍤?, 'system:tenant:export', 3, 5, 1138, '', '', '', NULL, 0, '1', '1', '1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1224, '缁夌喐鍩涚粻锛勬倞', '', 2, 0, 1, 'tenant', 'fa-solid:house-user', NULL, NULL, 0, '1', '1', '1', '1', '2022-02-20 01:41:13', '1', '2024-02-29 00:59:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1225, '缁夌喐鍩涙總妤咁樀', '', 2, 0, 1224, 'package', 'fa:bars', 'system/tenantPackage/index', 'SystemTenantPackage', 0, '1', '1', '1', '', '2022-02-19 17:44:06', '1', '2024-02-29 01:01:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1226, '缁夌喐鍩涙總妤咁樀閺屻儴顕?, 'system:tenant-package:query', 3, 1, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1227, '缁夌喐鍩涙總妤咁樀閸掓稑缂?, 'system:tenant-package:create', 3, 2, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1228, '缁夌喐鍩涙總妤咁樀閺囧瓨鏌?, 'system:tenant-package:update', 3, 3, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1229, '缁夌喐鍩涙總妤咁樀閸掔娀娅?, 'system:tenant-package:delete', 3, 4, 1225, '', '', '', NULL, 0, '1', '1', '1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1237, '閺傚洣娆㈤柊宥囩枂', '', 2, 0, 1243, 'file-config', 'fa-solid:file-signature', 'infra/fileConfig/index', 'InfraFileConfig', 0, '1', '1', '1', '', '2022-03-15 14:35:28', '1', '2024-02-29 08:52:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1238, '閺傚洣娆㈤柊宥囩枂閺屻儴顕?, 'infra:file-config:query', 3, 1, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1239, '閺傚洣娆㈤柊宥囩枂閸掓稑缂?, 'infra:file-config:create', 3, 2, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1240, '閺傚洣娆㈤柊宥囩枂閺囧瓨鏌?, 'infra:file-config:update', 3, 3, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1241, '閺傚洣娆㈤柊宥囩枂閸掔娀娅?, 'infra:file-config:delete', 3, 4, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1242, '閺傚洣娆㈤柊宥囩枂鐎电厧鍤?, 'infra:file-config:export', 3, 5, 1237, '', '', '', NULL, 0, '1', '1', '1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1243, '閺傚洣娆㈢粻锛勬倞', '', 2, 6, 2, 'file', 'ep:files', NULL, '', 0, '1', '1', '1', '1', '2022-03-16 23:47:40', '1', '2024-04-23 00:02:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1254, '娴ｆ粏鈧懎濮╅幀?, '', 1, 0, 0, 'https://www.iocoder.cn', 'ep:avatar', NULL, NULL, 0, '1', '1', '1', '1', '2022-04-23 01:03:15', '1', '2025-04-29 17:45:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1255, '閺佺増宓佸┃鎰板帳缂?, '', 2, 1, 2, 'data-source-config', 'ep:data-analysis', 'infra/dataSourceConfig/index', 'InfraDataSourceConfig', 0, '1', '1', '1', '', '2022-04-27 14:37:32', '1', '2024-02-29 08:51:25', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1256, '閺佺増宓佸┃鎰板帳缂冾喗鐓＄拠?, 'infra:data-source-config:query', 3, 1, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1257, '閺佺増宓佸┃鎰板帳缂冾喖鍨卞?, 'infra:data-source-config:create', 3, 2, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1258, '閺佺増宓佸┃鎰板帳缂冾喗娲块弬?, 'infra:data-source-config:update', 3, 3, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1259, '閺佺増宓佸┃鎰板帳缂冾喖鍨归梽?, 'infra:data-source-config:delete', 3, 4, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1260, '閺佺増宓佸┃鎰板帳缂冾喖顕遍崙?, 'infra:data-source-config:export', 3, 5, 1255, '', '', '', NULL, 0, '1', '1', '1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1261, 'OAuth 2.0', '', 2, 10, 1, 'oauth2', 'fa:dashcube', NULL, NULL, 0, '1', '1', '1', '1', '2022-05-09 23:38:17', '1', '2024-02-29 01:12:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1263, '鎼存梻鏁ょ粻锛勬倞', '', 2, 0, 1261, 'oauth2/application', 'fa:hdd-o', 'system/oauth2/client/index', 'SystemOAuth2Client', 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2024-02-29 01:13:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1264, '鐎广垺鍩涚粩顖涚叀鐠?, 'system:oauth2-client:query', 3, 1, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1265, '鐎广垺鍩涚粩顖氬灡瀵?, 'system:oauth2-client:create', 3, 2, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:23', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1266, '鐎广垺鍩涚粩顖涙纯閺?, 'system:oauth2-client:update', 3, 3, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1267, '鐎广垺鍩涚粩顖氬灩闂?, 'system:oauth2-client:delete', 3, 4, 1263, '', '', '', NULL, 0, '1', '1', '1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2083, '閸︽澘灏粻锛勬倞', '', 2, 14, 1, 'area', 'fa:map-marker', 'system/area/index', 'SystemArea', 0, '1', '1', '1', '1', '2022-12-23 17:35:05', '1', '2024-02-29 08:50:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2130, '闁喚顔堢粻锛勬倞', '', 2, 2, 2739, 'mail', 'fa-solid:mail-bulk', NULL, NULL, 0, '1', '1', '1', '1', '2023-01-25 17:27:44', '1', '2024-04-22 23:56:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2131, '闁喚顔堢拹锕€褰?, '', 2, 0, 2130, 'mail-account', 'fa:universal-access', 'system/mail/account/index', 'SystemMailAccount', 0, '1', '1', '1', '', '2023-01-25 09:33:48', '1', '2024-02-29 08:48:16', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2132, '鐠愶箑褰块弻銉嚄', 'system:mail-account:query', 3, 1, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2133, '鐠愶箑褰块崚娑樼紦', 'system:mail-account:create', 3, 2, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2134, '鐠愶箑褰块弴瀛樻煀', 'system:mail-account:update', 3, 3, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2135, '鐠愶箑褰块崚鐘绘珟', 'system:mail-account:delete', 3, 4, 2131, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2136, '闁喕娆㈠Ο锛勫', '', 2, 0, 2130, 'mail-template', 'fa:tag', 'system/mail/template/index', 'SystemMailTemplate', 0, '1', '1', '1', '', '2023-01-25 12:05:31', '1', '2024-02-29 08:48:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2137, '濡紕澧楅弻銉嚄', 'system:mail-template:query', 3, 1, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2138, '濡紕澧楅崚娑樼紦', 'system:mail-template:create', 3, 2, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2139, '濡紕澧楅弴瀛樻煀', 'system:mail-template:update', 3, 3, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2140, '濡紕澧楅崚鐘绘珟', 'system:mail-template:delete', 3, 4, 2136, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2141, '闁喕娆㈢拋鏉跨秿', '', 2, 0, 2130, 'mail-log', 'fa:edit', 'system/mail/log/index', 'SystemMailLog', 0, '1', '1', '1', '', '2023-01-26 02:16:50', '1', '2024-02-29 08:48:51', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2142, '閺冦儱绻旈弻銉嚄', 'system:mail-log:query', 3, 1, 2141, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-26 02:16:50', '', '2023-01-26 02:16:50', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2143, '閸欐垿鈧焦绁寸拠鏇㈠仏娴?, 'system:mail-template:send-mail', 3, 5, 2136, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-26 23:29:15', '1', '2023-01-26 23:29:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2145, '濡剝婢樼粻锛勬倞', '', 2, 0, 2144, 'notify-template', 'fa:archive', 'system/notify/template/index', 'SystemNotifyTemplate', 0, '1', '1', '1', '', '2023-01-28 02:26:42', '1', '2024-02-29 08:49:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2146, '缁旀瑥鍞存穱鈩兡侀弶鎸庣叀鐠?, 'system:notify-template:query', 3, 1, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2147, '缁旀瑥鍞存穱鈩兡侀弶鍨灡瀵?, 'system:notify-template:create', 3, 2, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2148, '缁旀瑥鍞存穱鈩兡侀弶鎸庢纯閺?, 'system:notify-template:update', 3, 3, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2149, '缁旀瑥鍞存穱鈩兡侀弶鍨灩闂?, 'system:notify-template:delete', 3, 4, 2145, '', '', '', NULL, 0, '1', '1', '1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2150, '閸欐垿鈧焦绁寸拠鏇犵彲閸愬懍淇?, 'system:notify-template:send-notify', 3, 5, 2145, '', '', '', NULL, 0, '1', '1', '1', '1', '2023-01-28 10:54:43', '1', '2023-01-28 10:54:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2159, 'Boot 瀵偓閸欐垶鏋冨?, '', 1, 1, 0, 'https://doc.iocoder.cn/', 'ep:document', NULL, NULL, 0, '1', '1', '1', '1', '2023-02-10 22:46:28', '1', '2026-01-05 19:31:07', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2160, 'Cloud 瀵偓閸欐垶鏋冨?, '', 1, 2, 0, 'https://cloud.iocoder.cn', 'ep:document-copy', NULL, NULL, 0, '1', '1', '1', '1', '2023-02-10 22:47:07', '1', '2023-12-02 21:32:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2390, '娴兼ɑ鍎ú璇插З', '', 1, 99, 2030, 'youhui', 'ep:aim', '', '', 0, '1', '1', '1', '1', '2023-10-21 19:23:49', '1', '2023-10-21 19:23:49', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2447, '娑撳鏌熼惂璇茬秿', '', 1, 10, 1, 'social', 'fa:rocket', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:12:01', '1', '2024-02-29 01:14:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2448, '娑撳鏌熸惔鏃傛暏', '', 2, 1, 2447, 'client', 'ep:set-up', 'system/social/client/index.vue', 'SocialClient', 0, '1', '1', '1', '1', '2023-11-04 12:17:19', '1', '2024-05-04 19:09:54', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2449, '娑撳鏌熸惔鏃傛暏閺屻儴顕?, 'system:social-client:query', 3, 1, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:43:12', '1', '2023-11-04 12:43:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2450, '娑撳鏌熸惔鏃傛暏閸掓稑缂?, 'system:social-client:create', 3, 2, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:43:58', '1', '2023-11-04 12:43:58', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2451, '娑撳鏌熸惔鏃傛暏閺囧瓨鏌?, 'system:social-client:update', 3, 3, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:44:27', '1', '2023-11-04 12:44:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2452, '娑撳鏌熸惔鏃傛暏閸掔娀娅?, 'system:social-client:delete', 3, 4, 2448, '', '', '', '', 0, '1', '1', '1', '1', '2023-11-04 12:44:43', '1', '2023-11-04 12:44:43', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2453, '娑撳鏌熼悽銊﹀煕', 'system:social-user:query', 2, 2, 2447, 'user', 'ep:avatar', 'system/social/user/index.vue', 'SocialUser', 0, '1', '1', '1', '1', '2023-11-04 14:01:05', '1', '2023-11-04 14:01:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2472, '娑撹鐡欑悰顭掔礄閸愬懎绁甸敍?, '', 2, 12, 1070, 'demo03-inner', 'fa:power-off', 'infra/demo/demo03/inner/index', 'Demo03StudentInner', 0, '1', '1', '1', '', '2023-11-13 04:39:51', '1', '2023-11-16 23:53:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2478, '閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '', 2, 1, 1070, 'demo01-contact', 'ep:bicycle', 'infra/demo/demo01/index', 'Demo01Contact', 0, '1', '1', '1', '', '2023-11-15 14:42:30', '1', '2023-11-16 20:34:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2479, '缁€杞扮伐閼辨梻閮存禍鐑樼叀鐠?, 'infra:demo01-contact:query', 3, 1, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2480, '缁€杞扮伐閼辨梻閮存禍鍝勫灡瀵?, 'infra:demo01-contact:create', 3, 2, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2481, '缁€杞扮伐閼辨梻閮存禍鐑樻纯閺?, 'infra:demo01-contact:update', 3, 3, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2482, '缁€杞扮伐閼辨梻閮存禍鍝勫灩闂?, 'infra:demo01-contact:delete', 3, 4, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2483, '缁€杞扮伐閼辨梻閮存禍鍝勵嚤閸?, 'infra:demo01-contact:export', 3, 5, 2478, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2484, '閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '', 2, 2, 1070, 'demo02-category', 'fa:tree', 'infra/demo/demo02/index', 'Demo02Category', 0, '1', '1', '1', '', '2023-11-16 12:18:27', '1', '2023-11-16 20:35:01', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2485, '缁€杞扮伐閸掑棛琚弻銉嚄', 'infra:demo02-category:query', 3, 1, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2486, '缁€杞扮伐閸掑棛琚崚娑樼紦', 'infra:demo02-category:create', 3, 2, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2487, '缁€杞扮伐閸掑棛琚弴瀛樻煀', 'infra:demo02-category:update', 3, 3, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2488, '缁€杞扮伐閸掑棛琚崚鐘绘珟', 'infra:demo02-category:delete', 3, 4, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2489, '缁€杞扮伐閸掑棛琚€电厧鍤?, 'infra:demo02-category:export', 3, 5, 2484, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2490, '娑撹鐡欑悰顭掔礄閺嶅洤鍣敍?, '', 2, 10, 1070, 'demo03-normal', 'fa:battery-3', 'infra/demo/demo03/normal/index', 'Demo03StudentNormal', 0, '1', '1', '1', '', '2023-11-16 12:53:37', '1', '2023-11-16 23:10:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2491, '鐎涳妇鏁撻弻銉嚄', 'infra:demo03-student:query', 3, 1, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2492, '鐎涳妇鏁撻崚娑樼紦', 'infra:demo03-student:create', 3, 2, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2493, '鐎涳妇鏁撻弴瀛樻煀', 'infra:demo03-student:update', 3, 3, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2494, '鐎涳妇鏁撻崚鐘绘珟', 'infra:demo03-student:delete', 3, 4, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2495, '鐎涳妇鏁撶€电厧鍤?, 'infra:demo03-student:export', 3, 5, 2490, '', '', '', NULL, 0, '1', '1', '1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2497, '娑撹鐡欑悰顭掔礄ERP閿?, '', 2, 11, 1070, 'demo03-erp', 'ep:calendar', 'infra/demo/demo03/erp/index', 'Demo03StudentERP', 0, '1', '1', '1', '', '2023-11-16 15:50:59', '1', '2023-11-17 13:19:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2525, 'WebSocket', '', 2, 5, 2, 'websocket', 'ep:connection', 'infra/webSocket/index', 'InfraWebSocket', 0, '1', '1', '1', '1', '2023-11-23 19:41:55', '1', '2024-04-23 00:02:00', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2740, '閻╂垶甯舵稉顓炵妇', '', 1, 10, 2, 'monitors', 'ep:monitor', '', '', 0, '1', '1', '1', '1', '2024-04-23 00:04:44', '1', '2024-04-23 00:04:44', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2758, 'AI 婢堆勀侀崹?, '', 1, 400, 0, '/ai', 'tabler:ai', '', '', 0, '1', '1', '1', '1', '2024-05-07 15:07:56', '1', '2025-04-19 18:57:05', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2760, '閹貉冨煑閸?, '', 1, 100, 2758, 'console', 'ep:setting', '', '', 0, '1', '1', '1', '1', '2024-05-09 22:39:09', '1', '2024-05-24 23:34:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2761, 'API 鐎靛棝鎸?, '', 2, 0, 2760, 'api-key', 'ep:key', 'ai/model/apiKey/index.vue', 'AiApiKey', 0, '1', '1', '1', '', '2024-05-09 14:52:56', '1', '2024-05-10 22:44:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2762, 'API 鐎靛棝鎸滈弻銉嚄', 'ai:api-key:query', 3, 1, 2761, '', '', '', '', 0, '1', '1', '1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2763, 'API 鐎靛棝鎸滈崚娑樼紦', 'ai:api-key:create', 3, 2, 2761, '', '', '', '', 0, '1', '1', '1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:26', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2764, 'API 鐎靛棝鎸滈弴瀛樻煀', 'ai:api-key:update', 3, 3, 2761, '', '', '', '', 0, '1', '1', '1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2765, 'API 鐎靛棝鎸滈崚鐘绘珟', 'ai:api-key:delete', 3, 4, 2761, '', '', '', '', 0, '1', '1', '1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:48', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2767, '濡€崇€烽柊宥囩枂', '', 2, 0, 2760, 'model', 'fa-solid:abacus', 'ai/model/model/index.vue', 'AiModel', 0, '1', '1', '1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:57:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2768, '閼卞﹤銇夊Ο鈥崇€烽弻銉嚄', 'ai:model:query', 3, 1, 2767, '', '', '', '', 0, '1', '1', '1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:19:46', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2769, '閼卞﹤銇夊Ο鈥崇€烽崚娑樼紦', 'ai:model:create', 3, 2, 2767, '', '', '', '', 0, '1', '1', '1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:10', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2770, '閼卞﹤銇夊Ο鈥崇€烽弴瀛樻煀', 'ai:model:update', 3, 3, 2767, '', '', '', '', 0, '1', '1', '1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:14', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2771, '閼卞﹤銇夊Ο鈥崇€烽崚鐘绘珟', 'ai:model:delete', 3, 4, 2767, '', '', '', '', 0, '1', '1', '1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:27', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2773, '閼卞﹤銇夌憴鎺曞', '', 2, 0, 2760, 'chat-role', 'fa:user-secret', 'ai/model/chatRole/index.vue', 'AiChatRole', 0, '1', '1', '1', '', '2024-05-13 12:39:28', '1', '2024-05-13 20:41:45', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2774, '閼卞﹤銇夌憴鎺曞閺屻儴顕?, 'ai:chat-role:query', 3, 1, 2773, '', '', '', NULL, 0, '1', '1', '1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2775, '閼卞﹤銇夌憴鎺曞閸掓稑缂?, 'ai:chat-role:create', 3, 2, 2773, '', '', '', NULL, 0, '1', '1', '1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2776, '閼卞﹤銇夌憴鎺曞閺囧瓨鏌?, 'ai:chat-role:update', 3, 3, 2773, '', '', '', NULL, 0, '1', '1', '1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2777, '閼卞﹤銇夌憴鎺曞閸掔娀娅?, 'ai:chat-role:delete', 3, 4, 2773, '', '', '', '', 0, '1', '1', '1', '1', '2024-05-13 21:43:38', '1', '2024-05-13 21:43:38', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2778, '閼卞﹤銇夌粻锛勬倞', '', 2, 10, 2760, 'chat-conversation', 'ep:chat-square', 'ai/chat/manager/index.vue', 'AiChatManager', 0, '1', '1', '1', '', '2024-05-24 15:39:18', '1', '2024-06-26 21:36:56', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2779, '娴兼俺鐦介弻銉嚄', 'ai:chat-conversation:query', 3, 1, 2778, '', '', '', '', 0, '1', '1', '1', '', '2024-05-24 15:39:18', '1', '2024-05-25 08:38:30', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2780, '娴兼俺鐦介崚鐘绘珟', 'ai:chat-conversation:delete', 3, 2, 2778, '', '', '', '', 0, '1', '1', '1', '', '2024-05-24 15:39:18', '1', '2024-05-25 08:38:40', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2783, 'AI 缂佹鏁?, '', 2, 2, 2758, 'image', 'ep:picture-rounded', 'ai/image/index/index.vue', 'AiImage', 0, '1', '1', '1', '1', '2024-05-26 11:45:17', '1', '2024-07-07 17:18:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2784, '缂佹鏁剧粻锛勬倞', '', 2, 11, 2760, 'image', 'fa:file-image-o', 'ai/image/manager/index.vue', 'AiImageManager', 0, '1', '1', '1', '', '2024-06-26 13:32:31', '1', '2024-06-26 21:37:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2785, '缂佹鏁鹃弻銉嚄', 'ai:image:query', 3, 1, 2784, '', '', '', '', 0, '1', '1', '1', '', '2024-06-26 13:32:31', '1', '2024-06-26 22:21:57', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2786, '缂佹鏁鹃崚鐘绘珟', 'ai:image:delete', 3, 4, 2784, '', '', '', '', 0, '1', '1', '1', '', '2024-06-26 13:32:31', '1', '2024-06-26 22:22:08', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2787, '缂佹ê娴橀弴瀛樻煀', 'ai:image:update', 3, 2, 2784, '', '', '', '', 0, '1', '1', '1', '1', '2024-06-26 22:47:56', '1', '2024-08-31 09:21:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2788, '闂婂厖绠扮粻锛勬倞', '', 2, 12, 2760, 'music', 'fa:music', 'ai/music/manager/index.vue', 'AiMusicManager', 0, '1', '1', '1', '', '2024-06-27 15:03:33', '1', '2024-06-27 23:04:19', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2789, '闂婂厖绠伴弻銉嚄', 'ai:music:query', 3, 1, 2788, '', '', '', NULL, 0, '1', '1', '1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2790, '闂婂厖绠伴弴瀛樻煀', 'ai:music:update', 3, 3, 2788, '', '', '', NULL, 0, '1', '1', '1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2791, '闂婂厖绠伴崚鐘绘珟', 'ai:music:delete', 3, 4, 2788, '', '', '', NULL, 0, '1', '1', '1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2792, 'AI 閸愭瑤缍?, '', 2, 3, 2758, 'write', 'fa-solid:book-reader', 'ai/write/index/index.vue', 'AiWrite', 0, '1', '1', '1', '1', '2024-07-08 09:26:44', '1', '2024-07-16 13:03:06', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2793, '閸愭瑤缍旂粻锛勬倞', '', 2, 13, 2760, 'write', 'fa:bookmark-o', 'ai/write/manager/index.vue', 'AiWriteManager', 0, '1', '1', '1', '', '2024-07-10 13:24:34', '1', '2024-07-10 21:31:59', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2794, 'AI 閸愭瑤缍旈弻銉嚄', 'ai:write:query', 3, 1, 2793, '', '', '', NULL, 0, '1', '1', '1', '', '2024-07-10 13:24:34', '', '2024-07-10 13:24:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2795, 'AI 閸愭瑤缍旈崚鐘绘珟', 'ai:write:delete', 3, 4, 2793, '', '', '', NULL, 0, '1', '1', '1', '', '2024-07-10 13:24:34', '', '2024-07-10 13:24:34', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2796, 'AI 闂婂厖绠?, '', 2, 4, 2758, 'music', 'fa:music', 'ai/music/index/index.vue', 'AiMusic', 0, '1', '1', '1', '1', '2024-07-17 09:21:12', '1', '2024-07-29 21:11:52', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2798, 'AI 閹繄娣€电厧娴?, '', 2, 6, 2758, 'mind-map', 'fa:sitemap', 'ai/mindmap/index/index.vue', 'AiMindMap', 0, '1', '1', '1', '1', '2024-07-29 21:31:59', '1', '2025-03-02 18:57:31', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2799, '鐎电厧娴樼粻锛勬倞', '', 2, 14, 2760, 'mind-map', 'fa:map', 'ai/mindmap/manager/index', 'AiMindMapManager', 0, '1', '1', '1', '', '2024-08-10 09:15:09', '1', '2024-08-10 17:24:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2800, '閹繄娣€电厧娴橀弻銉嚄', 'ai:mind-map:query', 3, 1, 2799, '', '', '', NULL, 0, '1', '1', '1', '', '2024-08-10 09:15:09', '', '2024-08-10 09:15:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2801, '閹繄娣€电厧娴橀崚鐘绘珟', 'ai:mind-map:delete', 3, 4, 2799, '', '', '', NULL, 0, '1', '1', '1', '', '2024-08-10 09:15:09', '', '2024-08-10 09:15:09', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2915, 'AI 閻儴鐦戞惔?, '', 2, 5, 2758, 'knowledge', 'ep:notebook', 'ai/knowledge/knowledge/index', 'AiKnowledge', 0, '1', '1', '1', '', '2025-02-28 07:04:21', '1', '2025-03-02 18:58:37', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2916, 'AI 閻儴鐦戞惔鎾寸叀鐠?, 'ai:knowledge:query', 3, 1, 2915, '', '', '', NULL, 0, '1', '1', '1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2917, 'AI 閻儴鐦戞惔鎾冲灡瀵?, 'ai:knowledge:create', 3, 2, 2915, '', '', '', NULL, 0, '1', '1', '1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2918, 'AI 閻儴鐦戞惔鎾存纯閺?, 'ai:knowledge:update', 3, 3, 2915, '', '', '', NULL, 0, '1', '1', '1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2919, 'AI 閻儴鐦戞惔鎾冲灩闂?, 'ai:knowledge:delete', 3, 4, 2915, '', '', '', NULL, 0, '1', '1', '1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2920, '瀹搞儱鍙跨粻锛勬倞', '', 2, 0, 2760, 'tool', 'fa-solid:tools', 'ai/model/tool/index.vue', 'AiTool', 0, '1', '1', '1', '', '2025-03-14 11:19:29', '1', '2025-03-14 19:20:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2921, '瀹搞儱鍙块弻銉嚄', 'ai:tool:query', 3, 1, 2920, '', '', '', NULL, 0, '1', '1', '1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2922, '瀹搞儱鍙块崚娑樼紦', 'ai:tool:create', 3, 2, 2920, '', '', '', NULL, 0, '1', '1', '1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2923, '瀹搞儱鍙块弴瀛樻煀', 'ai:tool:update', 3, 3, 2920, '', '', '', NULL, 0, '1', '1', '1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2924, '瀹搞儱鍙块崚鐘绘珟', 'ai:tool:delete', 3, 4, 2920, '', '', '', NULL, 0, '1', '1', '1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5000, 'AI 瀹搞儰缍斿ù?, '', 2, 5, 2758, 'workflow', 'fa:hand-grab-o', 'ai/workflow/index.vue', 'AiWorkflow', 0, '1', '1', '1', '1', '2025-03-25 09:50:27', '1', '2025-05-03 18:55:12', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5001, 'AI 瀹搞儰缍斿ù浣圭叀鐠?, 'ai:workflow:query', 3, 1, 5000, '', '', '', '', 0, '1', '1', '1', '1', '2025-03-25 09:51:11', '1', '2025-03-25 09:51:11', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5002, 'AI 瀹搞儰缍斿ù浣稿灡瀵?, 'ai:workflow:create', 3, 2, 5000, '', '', '', '', 0, '1', '1', '1', '1', '2025-03-25 09:51:28', '1', '2025-03-25 09:51:28', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5003, 'AI 瀹搞儰缍斿ù浣规纯閺?, 'ai:workflow:update', 3, 3, 5000, '', '', '', '', 0, '1', '1', '1', '1', '2025-03-25 09:51:42', '1', '2025-03-25 09:51:42', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5004, 'AI 瀹搞儰缍斿ù浣稿灩闂?, 'ai:workflow:delete', 3, 4, 5000, '', '', '', '', 0, '1', '1', '1', '1', '2025-03-25 09:51:55', '1', '2025-03-25 09:52:03', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5005, 'AI 瀹搞儰缍斿ù浣圭ゴ鐠?, 'ai:workflow:test', 3, 5, 5000, '', '', '', '', 0, '1', '1', '1', '1', '2025-03-30 10:29:41', '1', '2025-03-30 10:29:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5010, '缁夌喐鍩涢崚鍥ㄥ床', 'system:tenant:visit', 3, 999, 1138, '', '', '', '', 0, '1', '1', '1', '1', '2025-05-05 15:25:32', '1', '2025-05-05 15:25:32', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5101, '閸╄櫣顢呴弫鐗堝祦', '', 1, 10, 5100, 'md', 'ep:data-analysis', '', '', 0, '1', '1', '1', '1', '2026-02-15 00:40:13', '1', '2026-02-15 00:40:13', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5200, '閹烘帞褰粻锛勬倞', '', 1, 70, 5100, 'cal', 'ep:calendar', '', '', 0, '1', '1', '1', '1', '2026-02-16 07:35:50', '1', '2026-02-16 15:37:53', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5300, '鐠佹儳顦粻锛勬倞', '', 1, 30, 5100, 'dv', 'ep:cpu', '', '', 0, '1', '1', '1', '1', '2026-02-17 00:59:58', '1', '2026-02-17 09:01:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5400, '瀹搞儱鍙跨粻锛勬倞', '', 1, 40, 5100, 'tm', 'ep:scissor', '', '', 0, '1', '1', '1', '1', '2026-02-16 11:10:55', '1', '2026-03-21 14:20:41', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5500, '鐠愩劑鍣虹粻锛勬倞', '', 1, 60, 5100, 'qc', 'ep:check', '', '', 0, '1', '1', '1', '1', '2026-02-17 02:18:18', '1', '2026-02-17 14:36:15', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5700, '閻㈢喍楠囩粻锛勬倞', '', 1, 50, 5100, 'pro', 'ep:management', '', '', 0, '1', '1', '1', '1', '2026-02-17 11:39:58', '1', '2026-02-17 19:53:35', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5780, '娴犳挸绨辩粻锛勬倞', '', 1, 20, 5100, 'wm', 'ep:box', '', '', 0, '1', '1', '1', '1', '2026-02-17 15:37:58', '1', '2026-02-17 23:38:18', '0');
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5950, '鎼存挸鐡ㄩ惄妯煎仯', '', 1, 13, 5780, 'stock-taking', 'ep:circle-check-filled', '', '', 0, '1', '1', '1', '1', '2026-03-09 00:00:00', '1', '2026-03-09 21:19:09', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_menu_seq;
CREATE SEQUENCE system_menu_seq
    START 5986;

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS system_notice;
CREATE TABLE system_notice (
    id int8 NOT NULL,
  title varchar(50) NOT NULL,
  content text NULL,
  type int2 NOT NULL,
  status int2 NOT NULL DEFAULT 0,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_notice ADD CONSTRAINT pk_system_notice PRIMARY KEY (id);

COMMENT ON COLUMN system_notice.id IS '閸忣剙鎲D';
COMMENT ON COLUMN system_notice.title IS '閸忣剙鎲￠弽鍥暯';
COMMENT ON COLUMN system_notice.content IS '閸忣剙鎲￠崘鍛啇';
COMMENT ON COLUMN system_notice.type IS '閸忣剙鎲＄猾璇茬€烽敍?闁氨鐓?2閸忣剙鎲￠敍?;
COMMENT ON COLUMN system_notice.status IS '閸忣剙鎲￠悩鑸碘偓渚婄礄0濮濓絽鐖?1閸忔娊妫撮敍?;
COMMENT ON COLUMN system_notice.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_notice.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_notice.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_notice.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_notice.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_notice.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_notice IS '闁氨鐓￠崗顒€鎲＄悰?;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '閼哄浜鹃惃鍕彆娴?, '<p>閺傛壆澧楅張顒€鍞寸€?33222</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '"1"', '2025-08-31 09:38:22', '0', 1);
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '缂佸瓨濮㈤柅姘辩叀閿?018-07-01 缁崵绮洪崙灞炬珤缂佸瓨濮?, '<p><img src="http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg" alt="" data-href="">11112222<img src="http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png" alt="image" data-href="http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png">3333</p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2025-04-18 23:56:40', '0', 1);
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, '閹存垶妲稿ù瀣槸閺嶅洭顣?, '<p>閸濆牆鎼遍崫鍫濇惐123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', '0', 121);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_notice_seq;
CREATE SEQUENCE system_notice_seq
    START 5;

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
DROP TABLE IF EXISTS system_notify_message;
CREATE TABLE system_notify_message (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  user_type int2 NOT NULL,
  template_id int8 NOT NULL,
  template_code varchar(64) NOT NULL,
  template_nickname varchar(63) NOT NULL,
  template_content varchar(1024) NOT NULL,
  template_type int4 NOT NULL,
  template_params varchar(255) NOT NULL,
  read_status bool NOT NULL,
  read_time timestamp NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_notify_message ADD CONSTRAINT pk_system_notify_message PRIMARY KEY (id);

CREATE INDEX idx_system_notify_message_01 ON system_notify_message (user_id, user_type, read_status);

COMMENT ON COLUMN system_notify_message.id IS '閻劍鍩汭D';
COMMENT ON COLUMN system_notify_message.user_id IS '閻劍鍩沬d';
COMMENT ON COLUMN system_notify_message.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_notify_message.template_id IS '濡紕澧楃紓鏍у娇';
COMMENT ON COLUMN system_notify_message.template_code IS '濡剝婢樼紓鏍垳';
COMMENT ON COLUMN system_notify_message.template_nickname IS '濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨';
COMMENT ON COLUMN system_notify_message.template_content IS '濡紕澧楅崘鍛啇';
COMMENT ON COLUMN system_notify_message.template_type IS '濡紕澧楃猾璇茬€?;
COMMENT ON COLUMN system_notify_message.template_params IS '濡紕澧楅崣鍌涙殶';
COMMENT ON COLUMN system_notify_message.read_status IS '閺勵垰鎯佸鑼额嚢';
COMMENT ON COLUMN system_notify_message.read_time IS '闂冨懓顕伴弮鍫曟？';
COMMENT ON COLUMN system_notify_message.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_notify_message.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_notify_message.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_notify_message.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_notify_message.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_notify_message.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_notify_message IS '缁旀瑥鍞存穱鈩冪Х閹垵銆?;

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 1, 2, 1, 'test', '123', '閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, '{"name":"1","what":"2"}', '1', '2025-12-15 21:24:36', '1', '2023-01-28 11:44:08', '1', '2025-12-15 21:24:36', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 1, 2, 1, 'test', '123', '閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, '{"name":"1","what":"2"}', '1', '2025-12-15 21:24:36', '1', '2023-01-28 11:45:04', '1', '2025-12-15 21:24:36', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 103, 2, 2, 'register', '缁崵绮哄☉鍫熶紖', '娴ｇ姴銈介敍灞绢偨鏉?閸濆牆鎼?閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, '{"name":"閸濆牆鎼?}', '0', NULL, '1', '2023-01-28 21:02:20', '1', '2023-01-28 21:02:20', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 1, 2, 1, 'test', '123', '閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, '{"name":"閼哄澹?,"what":"閸愭瑤鍞惍?}', '1', '2025-12-08 17:25:28', '1', '2023-01-28 22:21:42', '1', '2025-12-08 17:25:28', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 1, 2, 1, 'test', '123', '閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, '{"name":"閼哄澹?,"what":"閸愭瑤鍞惍?}', '1', '2025-12-08 17:25:30', '1', '2023-01-28 22:22:07', '1', '2025-12-08 17:25:30', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 1, 2, 1, 'test', '123', '閹存垶妲?2閿涘本鍨滃鈧慨?3 娴?, 1, '{"name":"2","what":"3"}', '1', '2025-12-08 17:25:22', '1', '2023-01-28 23:45:21', '1', '2025-12-08 17:25:22', '0', 1);
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 1, 2, 2, 'register', '缁崵绮哄☉鍫熶紖', '娴ｇ姴銈介敍灞绢偨鏉?123 閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, '{"name":"123"}', '1', '2025-12-08 16:46:01', '1', '2023-01-28 23:50:21', '1', '2025-12-08 16:46:01', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_notify_message_seq;
CREATE SEQUENCE system_notify_message_seq
    START 11;

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
DROP TABLE IF EXISTS system_notify_template;
CREATE TABLE system_notify_template (
    id int8 NOT NULL,
  name varchar(63) NOT NULL,
  code varchar(64) NOT NULL,
  nickname varchar(255) NOT NULL,
  content varchar(1024) NOT NULL,
  type int2 NOT NULL,
  params varchar(255) NULL DEFAULT NULL,
  status int2 NOT NULL,
  remark varchar(255) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_notify_template ADD CONSTRAINT pk_system_notify_template PRIMARY KEY (id);

COMMENT ON COLUMN system_notify_template.id IS '娑撳鏁?;
COMMENT ON COLUMN system_notify_template.name IS '濡剝婢橀崥宥囆?;
COMMENT ON COLUMN system_notify_template.code IS '濡紕澧楃紓鏍垳';
COMMENT ON COLUMN system_notify_template.nickname IS '閸欐垿鈧椒姹夐崥宥囆?;
COMMENT ON COLUMN system_notify_template.content IS '濡紕澧楅崘鍛啇';
COMMENT ON COLUMN system_notify_template.type IS '缁鐎?;
COMMENT ON COLUMN system_notify_template.params IS '閸欏倹鏆熼弫鎵矋';
COMMENT ON COLUMN system_notify_template.status IS '閻樿埖鈧?;
COMMENT ON COLUMN system_notify_template.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_notify_template.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_notify_template.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_notify_template.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_notify_template.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_notify_template.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_notify_template IS '缁旀瑥鍞存穱鈩兡侀弶鑳€?;

DROP SEQUENCE IF EXISTS system_notify_template_seq;
CREATE SEQUENCE system_notify_template_seq
    START 1;

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_access_token;
CREATE TABLE system_oauth2_access_token (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  user_type int2 NOT NULL,
  user_info varchar(512) NOT NULL,
  access_token varchar(255) NOT NULL,
  refresh_token varchar(32) NOT NULL,
  client_id varchar(255) NOT NULL,
  scopes varchar(255) NULL DEFAULT NULL,
  expires_time timestamp NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_oauth2_access_token ADD CONSTRAINT pk_system_oauth2_access_token PRIMARY KEY (id);

CREATE INDEX idx_system_oauth2_access_token_01 ON system_oauth2_access_token (access_token);
CREATE INDEX idx_system_oauth2_access_token_02 ON system_oauth2_access_token (refresh_token);

COMMENT ON COLUMN system_oauth2_access_token.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_oauth2_access_token.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_oauth2_access_token.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_oauth2_access_token.user_info IS '閻劍鍩涙穱鈩冧紖';
COMMENT ON COLUMN system_oauth2_access_token.access_token IS '鐠佸潡妫舵禒銈囧';
COMMENT ON COLUMN system_oauth2_access_token.refresh_token IS '閸掗攱鏌婃禒銈囧';
COMMENT ON COLUMN system_oauth2_access_token.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_oauth2_access_token.scopes IS '閹哄牊娼堥懠鍐ㄦ纯';
COMMENT ON COLUMN system_oauth2_access_token.expires_time IS '鏉╁洦婀￠弮鍫曟？';
COMMENT ON COLUMN system_oauth2_access_token.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_oauth2_access_token.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_oauth2_access_token.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_oauth2_access_token.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_oauth2_access_token.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_oauth2_access_token.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_oauth2_access_token IS 'OAuth2 鐠佸潡妫舵禒銈囧';

DROP SEQUENCE IF EXISTS system_oauth2_access_token_seq;
CREATE SEQUENCE system_oauth2_access_token_seq
    START 1;

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_approve;
CREATE TABLE system_oauth2_approve (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  user_type int2 NOT NULL,
  client_id varchar(255) NOT NULL,
  scope varchar(255) NULL DEFAULT '',
  approved bool NOT NULL DEFAULT '0',
  expires_time timestamp NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_oauth2_approve ADD CONSTRAINT pk_system_oauth2_approve PRIMARY KEY (id);

CREATE INDEX idx_system_oauth2_approve_01 ON system_oauth2_approve (user_id, user_type, client_id);

COMMENT ON COLUMN system_oauth2_approve.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_oauth2_approve.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_oauth2_approve.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_oauth2_approve.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_oauth2_approve.scope IS '閹哄牊娼堥懠鍐ㄦ纯';
COMMENT ON COLUMN system_oauth2_approve.approved IS '閺勵垰鎯侀幒銉ュ綀';
COMMENT ON COLUMN system_oauth2_approve.expires_time IS '鏉╁洦婀￠弮鍫曟？';
COMMENT ON COLUMN system_oauth2_approve.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_oauth2_approve.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_oauth2_approve.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_oauth2_approve.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_oauth2_approve.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_oauth2_approve.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_oauth2_approve IS 'OAuth2 閹电懓鍣悰?;

DROP SEQUENCE IF EXISTS system_oauth2_approve_seq;
CREATE SEQUENCE system_oauth2_approve_seq
    START 1;

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_client;
CREATE TABLE system_oauth2_client (
    id int8 NOT NULL,
  client_id varchar(255) NOT NULL,
  secret varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  logo varchar(255) NOT NULL,
  description varchar(255) NULL DEFAULT NULL,
  status int2 NOT NULL,
  access_token_validity_seconds int4 NOT NULL,
  refresh_token_validity_seconds int4 NOT NULL,
  redirect_uris varchar(255) NOT NULL,
  authorized_grant_types varchar(255) NOT NULL,
  scopes varchar(255) NULL DEFAULT NULL,
  auto_approve_scopes varchar(255) NULL DEFAULT NULL,
  authorities varchar(255) NULL DEFAULT NULL,
  resource_ids varchar(255) NULL DEFAULT NULL,
  additional_information varchar(4096) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_oauth2_client ADD CONSTRAINT pk_system_oauth2_client PRIMARY KEY (id);

CREATE INDEX idx_system_oauth2_client_01 ON system_oauth2_client (client_id);

COMMENT ON COLUMN system_oauth2_client.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_oauth2_client.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_oauth2_client.secret IS '鐎广垺鍩涚粩顖氱槕闁?;
COMMENT ON COLUMN system_oauth2_client.name IS '鎼存梻鏁ら崥?;
COMMENT ON COLUMN system_oauth2_client.logo IS '鎼存梻鏁ら崶鐐垼';
COMMENT ON COLUMN system_oauth2_client.description IS '鎼存梻鏁ら幓蹇氬牚';
COMMENT ON COLUMN system_oauth2_client.status IS '閻樿埖鈧?;
COMMENT ON COLUMN system_oauth2_client.access_token_validity_seconds IS '鐠佸潡妫舵禒銈囧閻ㄥ嫭婀侀弫鍫熸埂';
COMMENT ON COLUMN system_oauth2_client.refresh_token_validity_seconds IS '閸掗攱鏌婃禒銈囧閻ㄥ嫭婀侀弫鍫熸埂';
COMMENT ON COLUMN system_oauth2_client.redirect_uris IS '閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?;
COMMENT ON COLUMN system_oauth2_client.authorized_grant_types IS '閹哄牊娼堢猾璇茬€?;
COMMENT ON COLUMN system_oauth2_client.scopes IS '閹哄牊娼堥懠鍐ㄦ纯';
COMMENT ON COLUMN system_oauth2_client.auto_approve_scopes IS '閼奉亜濮╅柅姘崇箖閻ㄥ嫭宸块弶鍐瘱閸?;
COMMENT ON COLUMN system_oauth2_client.authorities IS '閺夊啴妾?;
COMMENT ON COLUMN system_oauth2_client.resource_ids IS '鐠у嫭绨?;
COMMENT ON COLUMN system_oauth2_client.additional_information IS '闂勫嫬濮炴穱鈩冧紖';
COMMENT ON COLUMN system_oauth2_client.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_oauth2_client.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_oauth2_client.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_oauth2_client.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_oauth2_client.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_oauth2_client IS 'OAuth2 鐎广垺鍩涚粩顖濄€?;

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (1, 'default', 'admin123', '閼哄浜惧┃鎰垳', 'http://test.yudao.iocoder.cn/20250502/sort2_1746189740718.png', '閹存垶妲搁幓蹇氬牚', 0, 1800, 2592000, '["https://www.iocoder.cn","https://doc.iocoder.cn"]', '["password","authorization_code","implicit","refresh_token","client_credentials"]', '["user.read","user.write"]', '[]', '["user.read","user.write"]', '[]', '{}', '1', '2022-05-11 21:47:12', '1', '2025-12-07 20:07:09', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (40, 'test', 'test2', 'biubiu', 'http://test.yudao.iocoder.cn/20251227/javayuanma_1766829882970.jpg', '閸燂箑鏆掗崯锕€鏆?, 0, 1800, 43200, '["https://www.iocoder.cn"]', '["password","authorization_code","implicit"]', '["user_info","projects"]', '["user_info"]', '[]', '[]', '{}', '1', '2022-05-12 00:28:20', '1', '2025-12-27 18:04:44', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (41, 'yudao-sso-demo-by-code', 'test', '閸╄桨绨幒鍫熸綀閻焦膩瀵骏绱濇俊鍌欑秿鐎圭偟骞?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, 'http://test.yudao.iocoder.cn/it/20250502/sign_1746181948685.png', NULL, 0, 1800, 43200, '["http://127.0.0.1:18080"]', '["authorization_code","refresh_token"]', '["user.read","user.write"]', '[]', '[]', '[]', NULL, '1', '2022-09-29 13:28:31', '1', '2025-05-02 18:32:30', '0');
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (42, 'yudao-sso-demo-by-password', 'test', '閸╄桨绨€靛棛鐖滃Ο鈥崇础閿涘苯顩ф担鏇炵杽閻?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, 'http://test.yudao.iocoder.cn/20251025/images (3)_1761360515810.jpeg', NULL, 0, 1800, 43200, '["http://127.0.0.1:18080"]', '["password","refresh_token"]', '["user.read","user.write"]', '[]', '[]', '[]', NULL, '1', '2022-10-04 17:40:16', '1', '2025-10-25 10:49:40', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_oauth2_client_seq;
CREATE SEQUENCE system_oauth2_client_seq
    START 43;

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_code;
CREATE TABLE system_oauth2_code (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  user_type int2 NOT NULL,
  code varchar(32) NOT NULL,
  client_id varchar(255) NOT NULL,
  scopes varchar(255) NULL DEFAULT '',
  expires_time timestamp NOT NULL,
  redirect_uri varchar(255) NULL DEFAULT NULL,
  state varchar(255) NULL DEFAULT '',
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_oauth2_code ADD CONSTRAINT pk_system_oauth2_code PRIMARY KEY (id);

CREATE INDEX idx_system_oauth2_code_01 ON system_oauth2_code (code);

COMMENT ON COLUMN system_oauth2_code.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_oauth2_code.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_oauth2_code.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_oauth2_code.code IS '閹哄牊娼堥惍?;
COMMENT ON COLUMN system_oauth2_code.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_oauth2_code.scopes IS '閹哄牊娼堥懠鍐ㄦ纯';
COMMENT ON COLUMN system_oauth2_code.expires_time IS '鏉╁洦婀￠弮鍫曟？';
COMMENT ON COLUMN system_oauth2_code.redirect_uri IS '閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?;
COMMENT ON COLUMN system_oauth2_code.state IS '閻樿埖鈧?;
COMMENT ON COLUMN system_oauth2_code.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_oauth2_code.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_oauth2_code.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_oauth2_code.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_oauth2_code.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_oauth2_code.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_oauth2_code IS 'OAuth2 閹哄牊娼堥惍浣姐€?;

DROP SEQUENCE IF EXISTS system_oauth2_code_seq;
CREATE SEQUENCE system_oauth2_code_seq
    START 1;

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_refresh_token;
CREATE TABLE system_oauth2_refresh_token (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  refresh_token varchar(32) NOT NULL,
  user_type int2 NOT NULL,
  client_id varchar(255) NOT NULL,
  scopes varchar(255) NULL DEFAULT NULL,
  expires_time timestamp NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_oauth2_refresh_token ADD CONSTRAINT pk_system_oauth2_refresh_token PRIMARY KEY (id);

CREATE INDEX idx_system_oauth2_refresh_token_01 ON system_oauth2_refresh_token (refresh_token);

COMMENT ON COLUMN system_oauth2_refresh_token.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_oauth2_refresh_token.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_oauth2_refresh_token.refresh_token IS '閸掗攱鏌婃禒銈囧';
COMMENT ON COLUMN system_oauth2_refresh_token.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_oauth2_refresh_token.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_oauth2_refresh_token.scopes IS '閹哄牊娼堥懠鍐ㄦ纯';
COMMENT ON COLUMN system_oauth2_refresh_token.expires_time IS '鏉╁洦婀￠弮鍫曟？';
COMMENT ON COLUMN system_oauth2_refresh_token.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_oauth2_refresh_token.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_oauth2_refresh_token.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_oauth2_refresh_token.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_oauth2_refresh_token.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_oauth2_refresh_token.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_oauth2_refresh_token IS 'OAuth2 閸掗攱鏌婃禒銈囧';

DROP SEQUENCE IF EXISTS system_oauth2_refresh_token_seq;
CREATE SEQUENCE system_oauth2_refresh_token_seq
    START 1;

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
DROP TABLE IF EXISTS system_operate_log;
CREATE TABLE system_operate_log (
    id int8 NOT NULL,
  trace_id varchar(64) NULL DEFAULT '',
  user_id int8 NOT NULL,
  user_type int2 NOT NULL DEFAULT 0,
  type varchar(50) NOT NULL,
  sub_type varchar(50) NOT NULL,
  biz_id int8 NOT NULL,
  action varchar(2000) NULL DEFAULT '',
  success bool NOT NULL DEFAULT '1',
  extra varchar(2000) NULL DEFAULT '',
  request_method varchar(16) NULL DEFAULT '',
  request_url varchar(255) NULL DEFAULT '',
  user_ip varchar(50) NULL DEFAULT NULL,
  user_agent varchar(512) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_operate_log ADD CONSTRAINT pk_system_operate_log PRIMARY KEY (id);

CREATE INDEX idx_system_operate_log_01 ON system_operate_log (user_id);
CREATE INDEX idx_system_operate_log_02 ON system_operate_log (create_time);

COMMENT ON COLUMN system_operate_log.id IS '閺冦儱绻旀稉濠氭暛';
COMMENT ON COLUMN system_operate_log.trace_id IS '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?;
COMMENT ON COLUMN system_operate_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_operate_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_operate_log.type IS '閹垮秳缍斿Ο鈥虫健缁鐎?;
COMMENT ON COLUMN system_operate_log.sub_type IS '閹垮秳缍旈崥?;
COMMENT ON COLUMN system_operate_log.biz_id IS '閹垮秳缍旈弫鐗堝祦濡€虫健缂傛牕褰?;
COMMENT ON COLUMN system_operate_log.action IS '閹垮秳缍旈崘鍛啇';
COMMENT ON COLUMN system_operate_log.success IS '閹垮秳缍旂紒鎾寸亯';
COMMENT ON COLUMN system_operate_log.extra IS '閹锋挸鐫嶇€涙顔?;
COMMENT ON COLUMN system_operate_log.request_method IS '鐠囬攱鐪伴弬瑙勭《閸?;
COMMENT ON COLUMN system_operate_log.request_url IS '鐠囬攱鐪伴崷鏉挎絻';
COMMENT ON COLUMN system_operate_log.user_ip IS '閻劍鍩?IP';
COMMENT ON COLUMN system_operate_log.user_agent IS '濞村繗顫嶉崳?UA';
COMMENT ON COLUMN system_operate_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_operate_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_operate_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_operate_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_operate_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_operate_log.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_operate_log IS '閹垮秳缍旈弮銉ョ箶鐠佹澘缍?V2 閻楀牊婀?;

DROP SEQUENCE IF EXISTS system_operate_log_seq;
CREATE SEQUENCE system_operate_log_seq
    START 1;

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS system_post;
CREATE TABLE system_post (
    id int8 NOT NULL,
  code varchar(64) NOT NULL,
  name varchar(50) NOT NULL,
  sort int4 NOT NULL,
  status int2 NOT NULL,
  remark varchar(500) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_post ADD CONSTRAINT pk_system_post PRIMARY KEY (id);

COMMENT ON COLUMN system_post.id IS '瀹€妞剧秴ID';
COMMENT ON COLUMN system_post.code IS '瀹€妞剧秴缂傛牜鐖?;
COMMENT ON COLUMN system_post.name IS '瀹€妞剧秴閸氬秶袨';
COMMENT ON COLUMN system_post.sort IS '閺勫墽銇氭い鍝勭碍';
COMMENT ON COLUMN system_post.status IS '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_post.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_post.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_post.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_post.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_post.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_post.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_post.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_post IS '瀹€妞剧秴娣団剝浼呯悰?;

-- ----------------------------
-- Records of system_post
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 'se', '妞ゅ湱娲扮紒蹇曟倞', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2025-12-15 22:38:43', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 'user', '閺咁噣鈧艾鎲冲?, 4, 0, '111222', 'admin', '2021-01-05 17:03:48', '1', '2025-03-24 21:32:40', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 'HR', '娴滃搫濮忕挧鍕爱', 5, 0, '`', '1', '2024-03-24 20:45:40', '1', '2025-03-29 19:08:10', '0', 1);
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 'test', '濞村鐦?, 10, 0, NULL, '1', '2025-09-02 08:45:57', '1', '2025-09-02 08:45:57', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_post_seq;
CREATE SEQUENCE system_post_seq
    START 8;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS system_role;
CREATE TABLE system_role (
    id int8 NOT NULL,
  name varchar(30) NOT NULL,
  code varchar(100) NOT NULL,
  sort int4 NOT NULL,
  data_scope int2 NOT NULL DEFAULT 1,
  data_scope_dept_ids varchar(500) NULL DEFAULT '',
  status int2 NOT NULL,
  type int2 NOT NULL,
  remark varchar(500) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_role ADD CONSTRAINT pk_system_role PRIMARY KEY (id);

COMMENT ON COLUMN system_role.id IS '鐟欐帟澹奍D';
COMMENT ON COLUMN system_role.name IS '鐟欐帟澹婇崥宥囆?;
COMMENT ON COLUMN system_role.code IS '鐟欐帟澹婇弶鍐鐎涙顑佹稉?;
COMMENT ON COLUMN system_role.sort IS '閺勫墽銇氭い鍝勭碍';
COMMENT ON COLUMN system_role.data_scope IS '閺佺増宓侀懠鍐ㄦ纯閿?閿涙艾鍙忛柈銊︽殶閹诡喗娼堥梽?2閿涙俺鍤滅€规碍鏆熼幑顔芥綀闂?3閿涙碍婀伴柈銊╂，閺佺増宓侀弶鍐 4閿涙碍婀伴柈銊╂，閸欏﹣浜掓稉瀣殶閹诡喗娼堥梽鎰剁礆';
COMMENT ON COLUMN system_role.data_scope_dept_ids IS '閺佺増宓侀懠鍐ㄦ纯(閹稿洤鐣鹃柈銊╂，閺佹壆绮?';
COMMENT ON COLUMN system_role.status IS '鐟欐帟澹婇悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_role.type IS '鐟欐帟澹婄猾璇茬€?;
COMMENT ON COLUMN system_role.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_role.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_role.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_role.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_role.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_role.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_role.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_role IS '鐟欐帟澹婃穱鈩冧紖鐞?;

-- ----------------------------
-- Records of system_role
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '鐡掑懐楠囩粻锛勬倞閸?, 'super_admin', 1, 1, '', 0, 1, '鐡掑懐楠囩粻锛勬倞閸?, 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '閺咁噣鈧俺顫楅懝?, 'common', 2, 2, '', 0, 1, '閺咁噣鈧俺顫楅懝?, 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', '0', 1);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, '缁夌喐鍩涚粻锛勬倞閸?, 'tenant_admin', 0, 1, '', 0, 1, '缁崵绮洪懛顏勫З閻㈢喐鍨?, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, '缁夌喐鍩涚粻锛勬倞閸?, 'tenant_admin', 0, 1, '', 0, 1, '缁崵绮洪懛顏勫З閻㈢喐鍨?, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (155, '濞村鐦弫鐗堝祦閺夊啴妾?', 'test-dp', 4, 2, '[112,100,102,103,104,105,107,108]', 0, 2, '1111', '1', '2025-03-31 14:58:06', '1', '2025-12-04 23:29:40', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_role_seq;
CREATE SEQUENCE system_role_seq
    START 156;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS system_role_menu;
CREATE TABLE system_role_menu (
    id int8 NOT NULL,
  role_id int8 NOT NULL,
  menu_id int8 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_role_menu ADD CONSTRAINT pk_system_role_menu PRIMARY KEY (id);

CREATE INDEX idx_system_role_menu_01 ON system_role_menu (role_id);

COMMENT ON COLUMN system_role_menu.id IS '閼奉亜顤冪紓鏍у娇';
COMMENT ON COLUMN system_role_menu.role_id IS '鐟欐帟澹奍D';
COMMENT ON COLUMN system_role_menu.menu_id IS '閼挎粌宕烮D';
COMMENT ON COLUMN system_role_menu.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_role_menu.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_role_menu.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_role_menu.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_role_menu.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_role_menu.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_role_menu IS '鐟欐帟澹婇崪宀冨綅閸楁洖鍙ч懕鏃囥€?;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (263, 109, 1, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (434, 2, 1, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (454, 2, 1093, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (455, 2, 1094, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (460, 2, 1100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (467, 2, 1107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (477, 2, 100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (478, 2, 101, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (479, 2, 102, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (481, 2, 103, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (483, 2, 104, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (485, 2, 105, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (488, 2, 107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (490, 2, 108, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (492, 2, 109, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (498, 2, 1138, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (523, 2, 1224, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (524, 2, 1225, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (541, 2, 500, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (543, 2, 501, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (675, 2, 2, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (689, 2, 1077, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (690, 2, 1078, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (692, 2, 1083, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (693, 2, 1084, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (699, 2, 1090, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (703, 2, 106, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (704, 2, 110, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (705, 2, 111, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (706, 2, 112, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (707, 2, 113, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1296, 110, 1, '110', '2022-02-23 00:23:55', '110', '2022-02-23 00:23:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1578, 111, 1, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1729, 109, 100, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1730, 109, 101, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1731, 109, 1063, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1732, 109, 1064, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1733, 109, 1001, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1734, 109, 1065, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1735, 109, 1002, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1736, 109, 1003, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1737, 109, 1004, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1738, 109, 1005, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1739, 109, 1006, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1740, 109, 1007, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1741, 109, 1008, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1742, 109, 1009, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1743, 109, 1010, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1744, 109, 1011, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1745, 109, 1012, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1746, 111, 100, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1747, 111, 101, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1748, 111, 1063, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1749, 111, 1064, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1750, 111, 1001, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1751, 111, 1065, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1752, 111, 1002, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1753, 111, 1003, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1754, 111, 1004, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1755, 111, 1005, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1756, 111, 1006, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1757, 111, 1007, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1758, 111, 1008, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1759, 111, 1009, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1760, 111, 1010, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1761, 111, 1011, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1762, 111, 1012, '1', '2022-09-21 22:08:52', '1', '2022-09-21 22:08:52', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1763, 109, 100, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1764, 109, 101, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1765, 109, 1063, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1766, 109, 1064, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1767, 109, 1001, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1768, 109, 1065, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1769, 109, 1002, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1770, 109, 1003, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1771, 109, 1004, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1772, 109, 1005, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1773, 109, 1006, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1774, 109, 1007, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1775, 109, 1008, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1776, 109, 1009, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1777, 109, 1010, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1778, 109, 1011, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1779, 109, 1012, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1780, 111, 100, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1781, 111, 101, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1782, 111, 1063, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1783, 111, 1064, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1784, 111, 1001, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1785, 111, 1065, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1786, 111, 1002, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1787, 111, 1003, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1788, 111, 1004, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1789, 111, 1005, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1790, 111, 1006, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1791, 111, 1007, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1792, 111, 1008, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1793, 111, 1009, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1794, 111, 1010, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1795, 111, 1011, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1796, 111, 1012, '1', '2022-09-21 22:08:54', '1', '2022-09-21 22:08:54', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1797, 109, 100, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1798, 109, 101, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1799, 109, 1063, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1800, 109, 1064, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1801, 109, 1001, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1802, 109, 1065, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1803, 109, 1002, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1804, 109, 1003, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1805, 109, 1004, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1806, 109, 1005, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1807, 109, 1006, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1808, 109, 1007, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1809, 109, 1008, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1810, 109, 1009, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1811, 109, 1010, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1812, 109, 1011, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1813, 109, 1012, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1814, 111, 100, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1815, 111, 101, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1816, 111, 1063, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1817, 111, 1064, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1818, 111, 1001, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1819, 111, 1065, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1820, 111, 1002, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1821, 111, 1003, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1822, 111, 1004, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1823, 111, 1005, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1824, 111, 1006, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1825, 111, 1007, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1826, 111, 1008, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1827, 111, 1009, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1828, 111, 1010, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1829, 111, 1011, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1830, 111, 1012, '1', '2022-09-21 22:08:56', '1', '2022-09-21 22:08:56', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1831, 109, 103, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1832, 109, 1017, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1833, 109, 1018, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1834, 109, 1019, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1835, 109, 1020, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1836, 111, 103, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1837, 111, 1017, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1838, 111, 1018, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1839, 111, 1019, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1840, 111, 1020, '1', '2022-09-21 22:43:24', '1', '2022-09-21 22:43:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1841, 109, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1842, 109, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1843, 109, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1844, 109, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1845, 109, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1846, 111, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1847, 111, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1848, 111, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1849, 111, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1850, 111, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1991, 2, 1024, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1992, 2, 1025, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1993, 2, 1026, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1994, 2, 1027, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1995, 2, 1028, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1996, 2, 1029, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1997, 2, 1030, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1998, 2, 1031, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1999, 2, 1032, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2000, 2, 1033, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2001, 2, 1034, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2002, 2, 1035, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2003, 2, 1036, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2004, 2, 1037, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2005, 2, 1038, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2006, 2, 1039, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2007, 2, 1040, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2008, 2, 1042, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2009, 2, 1043, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2010, 2, 1045, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2011, 2, 1046, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2012, 2, 1048, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2013, 2, 1050, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2014, 2, 1051, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2015, 2, 1052, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2016, 2, 1053, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2017, 2, 1054, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2018, 2, 1056, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2019, 2, 1057, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2020, 2, 1058, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2021, 2, 2083, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2022, 2, 1059, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2023, 2, 1060, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2024, 2, 1063, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2025, 2, 1064, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2026, 2, 1065, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2027, 2, 1066, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2028, 2, 1067, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2029, 2, 1070, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2034, 2, 1075, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2036, 2, 1082, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2037, 2, 1085, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2038, 2, 1086, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2039, 2, 1087, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2040, 2, 1088, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2041, 2, 1089, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2042, 2, 1091, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2043, 2, 1092, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2044, 2, 1095, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2045, 2, 1096, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2046, 2, 1097, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2047, 2, 1098, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2048, 2, 1101, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2049, 2, 1102, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2050, 2, 1103, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2051, 2, 1104, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2052, 2, 1105, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2053, 2, 1106, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2054, 2, 1108, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2055, 2, 1109, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2072, 2, 114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2073, 2, 1139, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2074, 2, 115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2075, 2, 1140, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2076, 2, 116, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2077, 2, 1141, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2078, 2, 1142, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2079, 2, 1143, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2099, 2, 1226, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2100, 2, 1227, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2101, 2, 1228, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2102, 2, 1229, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2103, 2, 1237, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2104, 2, 1238, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2105, 2, 1239, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2106, 2, 1240, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2107, 2, 1241, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2108, 2, 1242, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2109, 2, 1243, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2116, 2, 1254, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2117, 2, 1255, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2118, 2, 1256, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2119, 2, 1257, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2120, 2, 1258, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2121, 2, 1259, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2122, 2, 1260, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2123, 2, 1261, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2124, 2, 1263, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2125, 2, 1264, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2126, 2, 1265, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2127, 2, 1266, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2128, 2, 1267, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2129, 2, 1001, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2130, 2, 1002, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2131, 2, 1003, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2132, 2, 1004, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2133, 2, 1005, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2134, 2, 1006, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2135, 2, 1007, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2136, 2, 1008, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2137, 2, 1009, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2138, 2, 1010, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2139, 2, 1011, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2140, 2, 1012, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2141, 2, 1013, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2143, 2, 1015, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2145, 2, 1017, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2146, 2, 1018, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2147, 2, 1019, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2148, 2, 1020, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2149, 2, 1021, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2150, 2, 1022, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2151, 2, 1023, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2929, 109, 1224, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2930, 109, 1225, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2931, 109, 1226, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2932, 109, 1227, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2933, 109, 1228, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2934, 109, 1229, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2935, 109, 1138, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2936, 109, 1139, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2937, 109, 1140, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2938, 109, 1141, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2939, 109, 1142, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2940, 109, 1143, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2941, 111, 1224, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2942, 111, 1225, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2943, 111, 1226, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2944, 111, 1227, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2945, 111, 1228, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2946, 111, 1229, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2947, 111, 1138, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2948, 111, 1139, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2949, 111, 1140, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2950, 111, 1141, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2951, 111, 1142, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2952, 111, 1143, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2993, 109, 2, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2994, 109, 1031, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2995, 109, 1032, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2996, 109, 1033, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2997, 109, 1034, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2998, 109, 1035, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2999, 109, 1050, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3000, 109, 1051, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3001, 109, 1052, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3002, 109, 1053, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3003, 109, 1054, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3004, 109, 1056, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3005, 109, 1057, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3006, 109, 1058, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3007, 109, 1059, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3008, 109, 1060, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3009, 109, 1066, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3010, 109, 1067, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3011, 109, 1070, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3012, 109, 1075, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3014, 109, 1077, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3015, 109, 1078, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3016, 109, 1082, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3017, 109, 1083, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3018, 109, 1084, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3019, 109, 1085, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3020, 109, 1086, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3021, 109, 1087, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3022, 109, 1088, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3023, 109, 1089, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3024, 109, 1090, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3025, 109, 1091, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3026, 109, 1092, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3027, 109, 106, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3028, 109, 110, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3029, 109, 111, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3030, 109, 112, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3031, 109, 113, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3032, 109, 114, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3033, 109, 115, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3034, 109, 116, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3035, 109, 2472, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3036, 109, 2478, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3037, 109, 2479, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3038, 109, 2480, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3039, 109, 2481, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3040, 109, 2482, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3041, 109, 2483, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3042, 109, 2484, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3043, 109, 2485, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3044, 109, 2486, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3045, 109, 2487, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3046, 109, 2488, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3047, 109, 2489, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3048, 109, 2490, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3049, 109, 2491, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3050, 109, 2492, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3051, 109, 2493, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3052, 109, 2494, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3053, 109, 2495, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3054, 109, 2497, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3055, 109, 1237, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3056, 109, 1238, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3057, 109, 1239, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3058, 109, 1240, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3059, 109, 1241, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3060, 109, 1242, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3061, 109, 1243, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3062, 109, 2525, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3063, 109, 1255, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3064, 109, 1256, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3065, 109, 1257, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3066, 109, 1258, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3067, 109, 1259, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3068, 109, 1260, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3069, 111, 2, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3070, 111, 1031, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3071, 111, 1032, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3072, 111, 1033, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3073, 111, 1034, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3074, 111, 1035, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3075, 111, 1050, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3076, 111, 1051, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3077, 111, 1052, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3078, 111, 1053, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3079, 111, 1054, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3080, 111, 1056, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3081, 111, 1057, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3082, 111, 1058, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3083, 111, 1059, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3084, 111, 1060, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3085, 111, 1066, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3086, 111, 1067, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3087, 111, 1070, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3088, 111, 1075, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3090, 111, 1077, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3091, 111, 1078, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3092, 111, 1082, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3093, 111, 1083, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3094, 111, 1084, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3095, 111, 1085, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3096, 111, 1086, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3097, 111, 1087, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3098, 111, 1088, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3099, 111, 1089, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3100, 111, 1090, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3101, 111, 1091, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3102, 111, 1092, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3103, 111, 106, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3104, 111, 110, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3105, 111, 111, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3106, 111, 112, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3107, 111, 113, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3108, 111, 114, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3109, 111, 115, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3110, 111, 116, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3111, 111, 2472, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3112, 111, 2478, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3113, 111, 2479, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3114, 111, 2480, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3115, 111, 2481, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3116, 111, 2482, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3117, 111, 2483, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3118, 111, 2484, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3119, 111, 2485, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3120, 111, 2486, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3121, 111, 2487, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3122, 111, 2488, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3123, 111, 2489, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3124, 111, 2490, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3125, 111, 2491, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3126, 111, 2492, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3127, 111, 2493, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3128, 111, 2494, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3129, 111, 2495, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3130, 111, 2497, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3131, 111, 1237, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3132, 111, 1238, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3133, 111, 1239, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3134, 111, 1240, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3135, 111, 1241, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3136, 111, 1242, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3137, 111, 1243, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3138, 111, 2525, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3139, 111, 1255, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3140, 111, 1256, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3141, 111, 1257, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3142, 111, 1258, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3143, 111, 1259, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3144, 111, 1260, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3221, 109, 102, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3222, 109, 1013, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3223, 109, 1014, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3224, 109, 1015, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3225, 109, 1016, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3226, 111, 102, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3227, 111, 1013, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3228, 111, 1014, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3229, 111, 1015, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3230, 111, 1016, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4163, 109, 5, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4222, 111, 5, '1', '2024-03-30 17:53:18', '1', '2024-03-30 17:53:18', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5779, 2, 2739, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5780, 2, 2740, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5781, 2, 2758, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5782, 2, 2759, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', '0', 1);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5789, 109, 2739, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5790, 109, 2740, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', '0', 121);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5791, 111, 2739, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5792, 111, 2740, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', '0', 122);
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6293, 2, 5, '1', '2026-01-04 18:09:41', '1', '2026-01-04 18:09:41', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_role_menu_seq;
CREATE SEQUENCE system_role_menu_seq
    START 6365;

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS system_sms_channel;
CREATE TABLE system_sms_channel (
    id int8 NOT NULL,
  signature varchar(12) NOT NULL,
  code varchar(63) NOT NULL,
  status int2 NOT NULL,
  remark varchar(255) NULL DEFAULT NULL,
  api_key varchar(128) NOT NULL,
  api_secret varchar(128) NULL DEFAULT NULL,
  callback_url varchar(255) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_sms_channel ADD CONSTRAINT pk_system_sms_channel PRIMARY KEY (id);

COMMENT ON COLUMN system_sms_channel.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_sms_channel.signature IS '閻厺淇婄粵鎯ф倳';
COMMENT ON COLUMN system_sms_channel.code IS '濞撶娀浜剧紓鏍垳';
COMMENT ON COLUMN system_sms_channel.status IS '瀵偓閸氼垳濮搁幀?;
COMMENT ON COLUMN system_sms_channel.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_sms_channel.api_key IS '閻厺淇?API 閻ㄥ嫯澶勯崣?;
COMMENT ON COLUMN system_sms_channel.api_secret IS '閻厺淇?API 閻ㄥ嫮顫濋柦?;
COMMENT ON COLUMN system_sms_channel.callback_url IS '閻厺淇婇崣鎴︹偓浣告礀鐠?URL';
COMMENT ON COLUMN system_sms_channel.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_sms_channel.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_sms_channel.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_sms_channel.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_sms_channel.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_sms_channel IS '閻厺淇婂〒鐘讳壕';

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (2, 'Ballcat', 'ALIYUN', 0, '娴ｇ姾顩﹂弨鐟版憹閿涘苯褰ч張澶嬪灉閸欘垯浜掗悽顭掔磼閿涗緤绱掗敍?, 'demo-aliyun-sms-api-key', 'demo-aliyun-sms-api-secret', NULL, '', '2021-03-31 11:53:10', '1', '2024-08-04 08:53:26', '0');
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (4, '濞村鐦〒鐘讳壕', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', '0');
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (7, 'mock閼垫崘顔嗘禍?, 'TENCENT', 0, '123', '1 2', '2 3', '', '1', '2024-09-30 08:53:45', '1', '2025-12-20 11:30:18', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_sms_channel_seq;
CREATE SEQUENCE system_sms_channel_seq
    START 8;

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS system_sms_code;
CREATE TABLE system_sms_code (
    id int8 NOT NULL,
  mobile varchar(11) NOT NULL,
  code varchar(6) NOT NULL,
  create_ip varchar(15) NOT NULL,
  scene int2 NOT NULL,
  today_index int2 NOT NULL,
  used int2 NOT NULL,
  used_time timestamp NULL DEFAULT NULL,
  used_ip varchar(255) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_sms_code ADD CONSTRAINT pk_system_sms_code PRIMARY KEY (id);

CREATE INDEX idx_system_sms_code_01 ON system_sms_code (mobile);

COMMENT ON COLUMN system_sms_code.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_sms_code.mobile IS '閹靛婧€閸?;
COMMENT ON COLUMN system_sms_code.code IS '妤犲矁鐦夐惍?;
COMMENT ON COLUMN system_sms_code.create_ip IS '閸掓稑缂?IP';
COMMENT ON COLUMN system_sms_code.scene IS '閸欐垿鈧礁婧€閺?;
COMMENT ON COLUMN system_sms_code.today_index IS '娴犲﹥妫╅崣鎴︹偓浣烘畱缁楊剙鍤戦弶?;
COMMENT ON COLUMN system_sms_code.used IS '閺勵垰鎯佹担璺ㄦ暏';
COMMENT ON COLUMN system_sms_code.used_time IS '娴ｈ法鏁ら弮鍫曟？';
COMMENT ON COLUMN system_sms_code.used_ip IS '娴ｈ法鏁?IP';
COMMENT ON COLUMN system_sms_code.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_sms_code.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_sms_code.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_sms_code.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_sms_code.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_sms_code.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_sms_code IS '閹靛婧€妤犲矁鐦夐惍?;

DROP SEQUENCE IF EXISTS system_sms_code_seq;
CREATE SEQUENCE system_sms_code_seq
    START 1;

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS system_sms_log;
CREATE TABLE system_sms_log (
    id int8 NOT NULL,
  channel_id int8 NOT NULL,
  channel_code varchar(63) NOT NULL,
  template_id int8 NOT NULL,
  template_code varchar(63) NOT NULL,
  template_type int2 NOT NULL,
  template_content varchar(255) NOT NULL,
  template_params varchar(255) NOT NULL,
  api_template_id varchar(63) NOT NULL,
  mobile varchar(11) NOT NULL,
  user_id int8 NULL DEFAULT NULL,
  user_type int2 NULL DEFAULT NULL,
  send_status int2 NOT NULL DEFAULT 0,
  send_time timestamp NULL DEFAULT NULL,
  api_send_code varchar(63) NULL DEFAULT NULL,
  api_send_msg varchar(255) NULL DEFAULT NULL,
  api_request_id varchar(255) NULL DEFAULT NULL,
  api_serial_no varchar(255) NULL DEFAULT NULL,
  receive_status int2 NOT NULL DEFAULT 0,
  receive_time timestamp NULL DEFAULT NULL,
  api_receive_code varchar(63) NULL DEFAULT NULL,
  api_receive_msg varchar(255) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_sms_log ADD CONSTRAINT pk_system_sms_log PRIMARY KEY (id);

COMMENT ON COLUMN system_sms_log.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_sms_log.channel_id IS '閻厺淇婂〒鐘讳壕缂傛牕褰?;
COMMENT ON COLUMN system_sms_log.channel_code IS '閻厺淇婂〒鐘讳壕缂傛牜鐖?;
COMMENT ON COLUMN system_sms_log.template_id IS '濡剝婢樼紓鏍у娇';
COMMENT ON COLUMN system_sms_log.template_code IS '濡剝婢樼紓鏍垳';
COMMENT ON COLUMN system_sms_log.template_type IS '閻厺淇婄猾璇茬€?;
COMMENT ON COLUMN system_sms_log.template_content IS '閻厺淇婇崘鍛啇';
COMMENT ON COLUMN system_sms_log.template_params IS '閻厺淇婇崣鍌涙殶';
COMMENT ON COLUMN system_sms_log.api_template_id IS '閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?;
COMMENT ON COLUMN system_sms_log.mobile IS '閹靛婧€閸?;
COMMENT ON COLUMN system_sms_log.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_sms_log.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_sms_log.send_status IS '閸欐垿鈧胶濮搁幀?;
COMMENT ON COLUMN system_sms_log.send_time IS '閸欐垿鈧焦妞傞梻?;
COMMENT ON COLUMN system_sms_log.api_send_code IS '閻厺淇?API 閸欐垿鈧胶绮ㄩ弸婊呮畱缂傛牜鐖?;
COMMENT ON COLUMN system_sms_log.api_send_msg IS '閻厺淇?API 閸欐垿鈧礁銇戠拹銉ф畱閹绘劗銇?;
COMMENT ON COLUMN system_sms_log.api_request_id IS '閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱閸烆垯绔寸拠閿嬬湴 ID';
COMMENT ON COLUMN system_sms_log.api_serial_no IS '閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱鎼村繐褰?;
COMMENT ON COLUMN system_sms_log.receive_status IS '閹恒儲鏁归悩鑸碘偓?;
COMMENT ON COLUMN system_sms_log.receive_time IS '閹恒儲鏁归弮鍫曟？';
COMMENT ON COLUMN system_sms_log.api_receive_code IS 'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫮绱惍?;
COMMENT ON COLUMN system_sms_log.api_receive_msg IS 'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫯顕╅弰?;
COMMENT ON COLUMN system_sms_log.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_sms_log.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_sms_log.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_sms_log.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_sms_log.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_sms_log IS '閻厺淇婇弮銉ョ箶';

DROP SEQUENCE IF EXISTS system_sms_log_seq;
CREATE SEQUENCE system_sms_log_seq
    START 1;

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS system_sms_template;
CREATE TABLE system_sms_template (
    id int8 NOT NULL,
  type int2 NOT NULL,
  status int2 NOT NULL,
  code varchar(63) NOT NULL,
  name varchar(63) NOT NULL,
  content varchar(255) NOT NULL,
  params varchar(255) NOT NULL,
  remark varchar(255) NULL DEFAULT NULL,
  api_template_id varchar(63) NOT NULL,
  channel_id int8 NOT NULL,
  channel_code varchar(63) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_sms_template ADD CONSTRAINT pk_system_sms_template PRIMARY KEY (id);

COMMENT ON COLUMN system_sms_template.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_sms_template.type IS '濡剝婢樼猾璇茬€?;
COMMENT ON COLUMN system_sms_template.status IS '瀵偓閸氼垳濮搁幀?;
COMMENT ON COLUMN system_sms_template.code IS '濡剝婢樼紓鏍垳';
COMMENT ON COLUMN system_sms_template.name IS '濡剝婢橀崥宥囆?;
COMMENT ON COLUMN system_sms_template.content IS '濡剝婢橀崘鍛啇';
COMMENT ON COLUMN system_sms_template.params IS '閸欏倹鏆熼弫鎵矋';
COMMENT ON COLUMN system_sms_template.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_sms_template.api_template_id IS '閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?;
COMMENT ON COLUMN system_sms_template.channel_id IS '閻厺淇婂〒鐘讳壕缂傛牕褰?;
COMMENT ON COLUMN system_sms_template.channel_code IS '閻厺淇婂〒鐘讳壕缂傛牜鐖?;
COMMENT ON COLUMN system_sms_template.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_sms_template.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_sms_template.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_sms_template.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_sms_template.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_sms_template IS '閻厺淇婂Ο鈩冩緲';

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (2, 1, 0, 'test_01', '濞村鐦宀冪槈閻胶鐓穱?, '濮濓絽婀潻娑滎攽閻ц缍嶉幙宥勭稊{operation}閿涘本鍋嶉惃鍕崣鐠囦胶鐖滈弰鐦俢ode}', '["operation","code"]', '濞村鐦径鍥ㄦ暈', '4383920', 4, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2024-08-18 11:57:18', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (3, 1, 0, 'test_02', '閸忣剙鎲￠柅姘辩叀', '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '["code"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (6, 3, 0, 'test-01', '濞村鐦Ο鈩冩緲', '閸濆牆鎼遍崫?{name}', '["name"]', 'f閸濆牆鎼遍崫?, '4383920', 4, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2024-08-18 11:57:07', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (7, 3, 0, 'test-04', '濞村鐦稉?, '閼颁線娴畕name}閿涘瞼澧伴柅绱峜ode}', '["name","code"]', '閸濆牆鎼遍崫鍫濇惐', 'suibian', 7, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2024-09-30 00:56:24', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (8, 1, 0, 'user-sms-login', '閸撳秴褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', '閹劎娈戞宀冪槈閻焦妲竰code}', '["code"]', NULL, '4372216', 4, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2024-08-18 11:57:06', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (12, 2, 0, 'demo', '濠曟梻銇氬Ο鈩冩緲', '閹存垵姘ㄩ弰顖涚ゴ鐠囨洑绔存稉瀣╃瑓', '[]', NULL, 'biubiubiu', 4, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2024-08-18 11:57:04', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (14, 1, 0, 'user-update-mobile', '娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁奸幍瀣簚', '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:04', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (15, 1, 0, 'user-update-password', '娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁肩€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (16, 1, 0, 'user-reset-password', '娴兼艾鎲抽悽銊﹀煕 - 闁插秶鐤嗙€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-12-02 22:35:27', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (18, 1, 0, 'admin-reset-password', '閸氬骸褰撮悽銊﹀煕 - 韫囨顔囩€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '["code"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2025-03-16 14:19:34', '1', '2025-03-16 14:19:45', '0');
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (19, 1, 0, 'admin-sms-login', '閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', '閹劎娈戞宀冪槈閻焦妲竰code}', '["code"]', '', '4372216', 4, 'DEBUG_DING_TALK', '1', '2025-04-08 09:36:03', '1', '2025-04-08 09:36:17', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_sms_template_seq;
CREATE SEQUENCE system_sms_template_seq
    START 20;

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
DROP TABLE IF EXISTS system_social_client;
CREATE TABLE system_social_client (
    id int8 NOT NULL,
  name varchar(255) NOT NULL,
  social_type int2 NOT NULL,
  user_type int2 NOT NULL,
  client_id varchar(255) NOT NULL,
  client_secret varchar(255) NOT NULL,
  agent_id varchar(255) NULL DEFAULT NULL,
  public_key varchar(2048) NULL DEFAULT NULL,
  status int2 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_social_client ADD CONSTRAINT pk_system_social_client PRIMARY KEY (id);

COMMENT ON COLUMN system_social_client.id IS '缂傛牕褰?;
COMMENT ON COLUMN system_social_client.name IS '鎼存梻鏁ら崥?;
COMMENT ON COLUMN system_social_client.social_type IS '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?;
COMMENT ON COLUMN system_social_client.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_social_client.client_id IS '鐎广垺鍩涚粩顖滅椽閸?;
COMMENT ON COLUMN system_social_client.client_secret IS '鐎广垺鍩涚粩顖氱槕闁?;
COMMENT ON COLUMN system_social_client.agent_id IS '娴狅絿鎮婄紓鏍у娇';
COMMENT ON COLUMN system_social_client.public_key IS 'publicKey 閸忣剟鎸?;
COMMENT ON COLUMN system_social_client.status IS '閻樿埖鈧?;
COMMENT ON COLUMN system_social_client.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_social_client.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_social_client.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_social_client.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_social_client.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_social_client.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_social_client IS '缁€鍙ユ唉鐎广垺鍩涚粩顖濄€?;

-- ----------------------------
-- Records of system_social_client
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '闁藉鎷?, 20, 2, 'dingvrnreaje3yqvzhxg', 'i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI', NULL, NULL, 0, '', '2023-10-18 11:21:18', '1', '2023-12-20 21:28:26', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '闁藉鎷ら敍鍫㈠竾閸︾喕鐪撮敍?, 20, 2, 'dingtsu9hpepjkbmthhw', 'FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP', NULL, NULL, 0, '', '2023-10-18 11:21:18', '', '2023-12-20 21:28:26', '1', 121);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, '瀵邦喕淇婇崗顑跨船閸?, 31, 1, 'wx5b23ba7a5589ecbb', '2a7b3b20c537e52e74afd395eb85f61f', NULL, NULL, 0, '', '2023-10-18 16:07:46', '1', '2023-12-20 21:28:23', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (43, '瀵邦喕淇婄亸蹇曗柤鎼?, 34, 1, 'wx63c280fe3248a3e7', '6f270509224a7ae1296bbf1c8cb97aed', NULL, NULL, 0, '', '2023-10-19 13:37:41', '1', '2023-12-20 21:28:25', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (44, '1', 10, 1, '2', '3', NULL, NULL, 0, '1', '2025-04-06 20:36:28', '1', '2025-04-06 20:43:12', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (45, '1', 10, 1, '2', '3', NULL, NULL, 1, '1', '2025-09-06 20:26:15', '1', '2025-09-06 20:27:55', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (46, '1', 10, 1, '2', '3', NULL, NULL, 0, '1', '2025-11-29 16:04:23', '1', '2025-11-29 16:04:26', '1', 1);
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (47, '123', 10, 1, '1', '2', '3', NULL, 0, '1', '2025-12-21 10:27:02', '1', '2025-12-21 10:27:20', '1', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_social_client_seq;
CREATE SEQUENCE system_social_client_seq
    START 48;

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS system_social_user;
CREATE TABLE system_social_user (
    id int8 NOT NULL,
  type int2 NOT NULL,
  openid varchar(32) NOT NULL,
  token varchar(256) NULL DEFAULT NULL,
  raw_token_info varchar(1024) NOT NULL,
  nickname varchar(32) NOT NULL,
  avatar varchar(255) NULL DEFAULT NULL,
  raw_user_info varchar(1024) NOT NULL,
  code varchar(256) NOT NULL,
  state varchar(256) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_social_user ADD CONSTRAINT pk_system_social_user PRIMARY KEY (id);

CREATE INDEX idx_system_social_user_01 ON system_social_user (type, openid);
CREATE INDEX idx_system_social_user_02 ON system_social_user (type, code, state);

COMMENT ON COLUMN system_social_user.id IS '娑撳鏁?閼奉亜顤冪粵鏍殣)';
COMMENT ON COLUMN system_social_user.type IS '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?;
COMMENT ON COLUMN system_social_user.openid IS '缁€鍙ユ唉 openid';
COMMENT ON COLUMN system_social_user.token IS '缁€鍙ユ唉 token';
COMMENT ON COLUMN system_social_user.raw_token_info IS '閸樼喎顫?Token 閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?;
COMMENT ON COLUMN system_social_user.nickname IS '閻劍鍩涢弰鐢敌?;
COMMENT ON COLUMN system_social_user.avatar IS '閻劍鍩涙径鏉戝剼';
COMMENT ON COLUMN system_social_user.raw_user_info IS '閸樼喎顫愰悽銊﹀煕閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?;
COMMENT ON COLUMN system_social_user.code IS '閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?code';
COMMENT ON COLUMN system_social_user.state IS '閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?state';
COMMENT ON COLUMN system_social_user.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_social_user.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_social_user.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_social_user.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_social_user.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_social_user.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_social_user IS '缁€鍙ユ唉閻劍鍩涚悰?;

DROP SEQUENCE IF EXISTS system_social_user_seq;
CREATE SEQUENCE system_social_user_seq
    START 1;

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS system_social_user_bind;
CREATE TABLE system_social_user_bind (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  user_type int2 NOT NULL,
  social_type int2 NOT NULL,
  social_user_id int8 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_social_user_bind ADD CONSTRAINT pk_system_social_user_bind PRIMARY KEY (id);

CREATE INDEX idx_system_social_user_bind_01 ON system_social_user_bind (user_type, social_user_id);

COMMENT ON COLUMN system_social_user_bind.id IS '娑撳鏁?閼奉亜顤冪粵鏍殣)';
COMMENT ON COLUMN system_social_user_bind.user_id IS '閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_social_user_bind.user_type IS '閻劍鍩涚猾璇茬€?;
COMMENT ON COLUMN system_social_user_bind.social_type IS '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?;
COMMENT ON COLUMN system_social_user_bind.social_user_id IS '缁€鍙ユ唉閻劍鍩涢惃鍕椽閸?;
COMMENT ON COLUMN system_social_user_bind.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_social_user_bind.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_social_user_bind.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_social_user_bind.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_social_user_bind.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_social_user_bind.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_social_user_bind IS '缁€鍙ユ唉缂佹垵鐣剧悰?;

DROP SEQUENCE IF EXISTS system_social_user_bind_seq;
CREATE SEQUENCE system_social_user_bind_seq
    START 1;

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS system_tenant;
CREATE TABLE system_tenant (
    id int8 NOT NULL,
  name varchar(30) NOT NULL,
  contact_user_id int8 NULL DEFAULT NULL,
  contact_name varchar(30) NOT NULL,
  contact_mobile varchar(500) NULL DEFAULT NULL,
  status int2 NOT NULL DEFAULT 0,
  websites varchar(1024) NULL DEFAULT '',
  package_id int8 NOT NULL,
  expire_time timestamp NOT NULL,
  account_count int4 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_tenant ADD CONSTRAINT pk_system_tenant PRIMARY KEY (id);

COMMENT ON COLUMN system_tenant.id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON COLUMN system_tenant.name IS '缁夌喐鍩涢崥?;
COMMENT ON COLUMN system_tenant.contact_user_id IS '閼辨梻閮存禍铏规畱閻劍鍩涚紓鏍у娇';
COMMENT ON COLUMN system_tenant.contact_name IS '閼辨梻閮存禍?;
COMMENT ON COLUMN system_tenant.contact_mobile IS '閼辨梻閮撮幍瀣簚';
COMMENT ON COLUMN system_tenant.status IS '缁夌喐鍩涢悩鑸碘偓?;
COMMENT ON COLUMN system_tenant.websites IS '缂佹垵鐣鹃崺鐔锋倳閺佹壆绮?;
COMMENT ON COLUMN system_tenant.package_id IS '缁夌喐鍩涙總妤咁樀缂傛牕褰?;
COMMENT ON COLUMN system_tenant.expire_time IS '鏉╁洦婀￠弮鍫曟？';
COMMENT ON COLUMN system_tenant.account_count IS '鐠愶箑褰块弫浼村櫤';
COMMENT ON COLUMN system_tenant.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_tenant.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_tenant.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_tenant.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_tenant.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_tenant IS '缁夌喐鍩涚悰?;

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (1, '閼哄浜惧┃鎰垳', NULL, '閼哄澹?, '17321315478', 0, 'www.iocoder.cn,127.0.0.1:3000,wxc4598c446f8a9cb3', 0, '2099-02-19 17:14:16', 9999, '1', '2021-01-05 17:03:47', '1', '2025-08-19 05:18:41', '0');
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (121, '鐏忓繒顫ら幋?, 110, '鐏忓繒甯?', '15601691300', 0, 'zsxq.iocoder.cn,123321', 111, '2026-07-10 00:00:00', 30, '1', '2022-02-22 00:56:14', '1', '2025-08-19 21:19:29', '0');
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (122, '濞村鐦粔鐔稿煕', 113, '閼哄浜?, '15601691300', 0, 'test.iocoder.cn,222,333', 111, '2023-04-29 00:00:00', 50, '1', '2022-03-07 21:37:58', '1', '2025-12-21 09:50:00', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_tenant_seq;
CREATE SEQUENCE system_tenant_seq
    START 123;

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS system_tenant_package;
CREATE TABLE system_tenant_package (
    id int8 NOT NULL,
  name varchar(30) NOT NULL,
  status int2 NOT NULL DEFAULT 0,
  remark varchar(256) NULL DEFAULT '',
  menu_ids varchar(4096) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0
);

ALTER TABLE system_tenant_package ADD CONSTRAINT pk_system_tenant_package PRIMARY KEY (id);

COMMENT ON COLUMN system_tenant_package.id IS '婵傛顦电紓鏍у娇';
COMMENT ON COLUMN system_tenant_package.name IS '婵傛顦甸崥?;
COMMENT ON COLUMN system_tenant_package.status IS '缁夌喐鍩涢悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_tenant_package.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_tenant_package.menu_ids IS '閸忓疇浠堥惃鍕綅閸楁洜绱崣?;
COMMENT ON COLUMN system_tenant_package.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_tenant_package.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_tenant_package.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_tenant_package.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_tenant_package.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON TABLE system_tenant_package IS '缁夌喐鍩涙總妤咁樀鐞?;

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_tenant_package (id, name, status, remark, menu_ids, creator, create_time, updater, update_time, deleted) VALUES (111, '閺咁噣鈧艾顨滄?, 0, '鐏忓繐濮涢懗?, '[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,100,101,102,103,106,107,110,111,112,113,114,1138,1139,115,1140,116,1141,1142,1143,2739,2740,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,1255,1256,1257,1258,1259,1260,2472,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491,2492,2493,2494,2495,2497,2525,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]', '1', '2022-02-22 00:54:00', '1', '2025-09-06 20:52:25', '0');
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_tenant_package_seq;
CREATE SEQUENCE system_tenant_package_seq
    START 112;

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS system_user_post;
CREATE TABLE system_user_post (
    id int8 NOT NULL,
  user_id int8 NOT NULL DEFAULT 0,
  post_id int8 NOT NULL DEFAULT 0,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_user_post ADD CONSTRAINT pk_system_user_post PRIMARY KEY (id);

COMMENT ON COLUMN system_user_post.id IS 'id';
COMMENT ON COLUMN system_user_post.user_id IS '閻劍鍩汭D';
COMMENT ON COLUMN system_user_post.post_id IS '瀹€妞剧秴ID';
COMMENT ON COLUMN system_user_post.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_user_post.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_user_post.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_user_post.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_user_post.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_user_post.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_user_post IS '閻劍鍩涘畝妞剧秴鐞?;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (119, 114, 5, '1', '2024-03-24 20:45:51', '1', '2024-03-24 20:45:51', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (123, 115, 1, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (124, 115, 2, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (125, 1, 2, '1', '2024-07-13 22:31:39', '1', '2024-07-13 22:31:39', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (128, 139, 2, '1', '2025-12-05 21:43:27', '1', '2025-12-05 21:43:27', '0', 1);
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (129, 139, 4, '1', '2025-12-05 21:43:27', '1', '2025-12-05 21:43:27', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_user_post_seq;
CREATE SEQUENCE system_user_post_seq
    START 130;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS system_user_role;
CREATE TABLE system_user_role (
    id int8 NOT NULL,
  user_id int8 NOT NULL,
  role_id int8 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_user_role ADD CONSTRAINT pk_system_user_role PRIMARY KEY (id);

CREATE INDEX idx_system_user_role_01 ON system_user_role (user_id);

COMMENT ON COLUMN system_user_role.id IS '閼奉亜顤冪紓鏍у娇';
COMMENT ON COLUMN system_user_role.user_id IS '閻劍鍩汭D';
COMMENT ON COLUMN system_user_role.role_id IS '鐟欐帟澹奍D';
COMMENT ON COLUMN system_user_role.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_user_role.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_user_role.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_user_role.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_user_role.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_user_role.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_user_role IS '閻劍鍩涢崪宀冾潡閼规彃鍙ч懕鏃囥€?;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', '0', 121);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', '0', 122);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (35, 112, 1, '1', '2024-03-15 20:00:24', '1', '2024-03-15 20:00:24', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (36, 118, 1, '1', '2024-03-17 09:12:08', '1', '2024-03-17 09:12:08', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (46, 117, 1, '1', '2024-10-02 10:16:11', '1', '2024-10-02 10:16:11', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (47, 104, 2, '1', '2025-01-04 10:40:33', '1', '2025-01-04 10:40:33', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (48, 100, 155, '1', '2025-04-04 10:41:14', '1', '2025-04-04 10:41:14', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (49, 142, 1, '1', '2025-07-23 09:11:42', '1', '2025-07-23 09:11:42', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (50, 142, 2, '1', '2025-10-07 20:50:37', '1', '2025-10-07 20:50:37', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (51, 139, 1, '1', '2025-12-05 22:36:57', '1', '2025-12-05 22:36:57', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (52, 139, 2, '1', '2025-12-05 22:37:00', '1', '2025-12-05 22:37:00', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (53, 114, 2, '1', '2026-01-04 18:15:40', '1', '2026-01-04 18:15:40', '0', 1);
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (54, 114, 3, '1', '2026-01-04 18:16:19', '1', '2026-01-04 18:16:19', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_user_role_seq;
CREATE SEQUENCE system_user_role_seq
    START 55;

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS system_users;
CREATE TABLE system_users (
    id int8 NOT NULL,
  username varchar(30) NOT NULL,
  password varchar(100) NULL DEFAULT '',
  nickname varchar(30) NOT NULL,
  remark varchar(500) NULL DEFAULT NULL,
  dept_id int8 NULL DEFAULT NULL,
  post_ids varchar(255) NULL DEFAULT NULL,
  email varchar(50) NULL DEFAULT '',
  mobile varchar(11) NULL DEFAULT '',
  sex int2 NULL DEFAULT 0,
  avatar varchar(512) NULL DEFAULT '',
  status int2 NOT NULL DEFAULT 0,
  login_ip varchar(50) NULL DEFAULT '',
  login_date timestamp NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE system_users ADD CONSTRAINT pk_system_users PRIMARY KEY (id);

CREATE INDEX idx_system_users_01 ON system_users (username);
CREATE INDEX idx_system_users_02 ON system_users (mobile);
CREATE INDEX idx_system_users_03 ON system_users (email);
CREATE INDEX idx_system_users_04 ON system_users (dept_id);

COMMENT ON COLUMN system_users.id IS '閻劍鍩汭D';
COMMENT ON COLUMN system_users.username IS '閻劍鍩涚拹锕€褰?;
COMMENT ON COLUMN system_users.password IS '鐎靛棛鐖?;
COMMENT ON COLUMN system_users.nickname IS '閻劍鍩涢弰鐢敌?;
COMMENT ON COLUMN system_users.remark IS '婢跺洦鏁?;
COMMENT ON COLUMN system_users.dept_id IS '闁劑妫琁D';
COMMENT ON COLUMN system_users.post_ids IS '瀹€妞剧秴缂傛牕褰块弫鎵矋';
COMMENT ON COLUMN system_users.email IS '閻劍鍩涢柇顔绢唸';
COMMENT ON COLUMN system_users.mobile IS '閹靛婧€閸欓鐖?;
COMMENT ON COLUMN system_users.sex IS '閻劍鍩涢幀褍鍩?;
COMMENT ON COLUMN system_users.avatar IS '婢舵潙鍎氶崷鏉挎絻';
COMMENT ON COLUMN system_users.status IS '鐢劕褰块悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?;
COMMENT ON COLUMN system_users.login_ip IS '閺堚偓閸氬海娅ヨぐ鏃綪';
COMMENT ON COLUMN system_users.login_date IS '閺堚偓閸氬海娅ヨぐ鏇熸闂?;
COMMENT ON COLUMN system_users.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN system_users.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN system_users.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN system_users.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN system_users.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN system_users.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE system_users IS '閻劍鍩涙穱鈩冧紖鐞?;

-- ----------------------------
-- Records of system_users
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 'admin', '$2a$04$.vd8nPeLwxt6hnSzmAoAyul8BOLX7Cib6QhcxRe30rfvrIPQHH1OG', '閼哄浜惧┃鎰垳', '缁狅紕鎮婇崨?, 103, '[1,2]', '13aoteman@126.com', '18818260272', 1, 'http://test.yudao.iocoder.cn/user/avatar/20251220/blob_1766215463801.jpg', 0, '0:0:0:0:0:0:0:1', '2026-04-17 08:47:40', 'admin', '2021-01-05 17:03:47', NULL, '2026-04-17 08:47:40', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, 'yudao', '$2a$04$h.aaPKgO.odHepnk5PCsWeEwKdojFWdTItxGKfx1r0e1CSeBzsTJ6', '閼哄浜?, '娑撳秷顩﹂崥鎾村灉', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-12-15 21:47:26', '', '2021-01-07 09:07:17', NULL, '2025-12-15 21:47:26', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, 'yuanma', '$2a$04$fUBSmjKCPYAUmnMzOb6qE.eZCGPhHi1JmAKclODbfS/O7fHOl2bH6', '濠ф劗鐖?, NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-08-11 17:48:12', '', '2021-01-13 23:50:35', '1', '2025-07-09 23:41:58', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, 'test', '$2a$04$BrwaYn303hjA/6TnXqdGoOLhyHOAA0bVrAFu6.1dJKycqKUnIoRz2', '濞村鐦崣?, NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2026-01-04 18:09:54', '', '2021-01-21 02:13:53', NULL, '2026-01-04 18:09:54', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2025-04-21 14:23:08', '0', 118);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2025-04-21 14:23:08', '0', 119);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2025-04-21 14:23:08', '0', 120);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '鐏忓繒甯?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-07-20 22:23:17', '1', '2022-02-22 00:56:14', NULL, '2025-04-21 14:23:08', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '濞村鐦悽銊﹀煕', NULL, NULL, '[]', '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2023-12-30 11:42:17', '110', '2022-02-23 13:14:33', NULL, '2025-04-21 14:23:08', '0', 121);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 'newobject', '$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', '閺傛澘顕挒?, NULL, 100, '[]', '', '15601691235', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-03-16 23:11:38', '1', '2022-02-23 19:08:03', NULL, '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '閼哄浜?', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', '1', '2025-05-05 15:30:53', '0', 122);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr 鐏忓繐顫曟慨?, NULL, NULL, '[5]', '', '15601691236', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2026-01-04 18:16:01', '1', '2022-03-19 21:50:58', NULL, '2026-01-04 18:16:01', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 'aotemane', '$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', '闂冨灝鎲?, '11222', 102, '[1,2]', '7648@qq.com', '15601691229', 2, NULL, 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2025-04-21 14:23:08', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 'admin123', '$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W', '濞村鐦崣?2', '1111', 100, '[2]', '', '15601691234', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-10-02 10:16:20', '1', '2022-07-09 17:40:26', '1', '2025-05-14 09:56:04', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (118, 'goudan', '$2a$04$3suGZjnA6rM5bErf38u1felbgqbsPHGdRG3l9NkxPCEt2ah9Y6aJi', '閻欐娉?, NULL, 103, '[1]', '', '15601691239', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-11-23 15:28:25', '1', '2022-07-09 17:44:43', NULL, '2025-11-23 15:28:25', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (139, 'wwbwwb', '$2a$04$FJLIyg8lbPytP29pbZaiU.LesJvCsYfEaHqQfB0pGQhK3e9BeZmLy', '鐏忓繒顫堟径?, '123', 108, '[2,4]', '', '', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-09-10 21:03:58', NULL, '2024-09-10 21:03:58', '1', '2025-12-15 22:38:15', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (141, 'admin1', '$2a$04$oj6F6d7HrZ70kYVD3TNzEu.m3TPUzajOVuC66zdKna8KRerK1FmVa', '閺傛壆鏁ら幋?, NULL, NULL, NULL, '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2025-04-08 13:09:07', '1', '2025-04-08 13:09:07', '1', '2025-05-14 19:11:48', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (142, 'test01', '$2a$04$4bCYWZkjxxOC4QE0LY2M9uEEKWeJbLfs489NFtQoyidL5I0FndRaO', 'test01', '', NULL, '[]', '', '19021719925', 1, '', 0, '0:0:0:0:0:0:0:1', '2025-07-29 19:47:17', '1', '2025-07-09 21:07:10', NULL, '2025-12-02 13:23:11', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (143, 'a00001', '$2a$04$GhVHFviOw/SsTmiQtifHJesDYFlHMeGK7OWh7aGCCjGGVCmbHVAwa', 'a00001', NULL, 104, NULL, '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2025-12-01 16:10:13', NULL, '2025-12-01 16:10:13', '1', '2025-12-05 21:34:05', '0', 1);
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (144, 'aoteman001', '$2a$04$omQOmhz8OyUFBKw77nr8KOtMp6xdvoQ1gWStjk9r8.OYT3Bv6oEYe', 'aoteman001', NULL, 116, NULL, '', '', 0, '', 1, '0:0:0:0:0:0:0:1', '2025-12-01 17:05:27', '1', '2025-12-01 17:05:27', '1', '2025-12-15 15:55:54', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS system_users_seq;
CREATE SEQUENCE system_users_seq
    START 145;

-- ----------------------------
-- Table structure for yudao_demo01_contact
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo01_contact;
CREATE TABLE yudao_demo01_contact (
    id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  sex int2 NOT NULL,
  birthday timestamp NOT NULL,
  description varchar(255) NOT NULL,
  avatar varchar(512) NULL DEFAULT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE yudao_demo01_contact ADD CONSTRAINT pk_yudao_demo01_contact PRIMARY KEY (id);

COMMENT ON COLUMN yudao_demo01_contact.id IS '缂傛牕褰?;
COMMENT ON COLUMN yudao_demo01_contact.name IS '閸氬秴鐡?;
COMMENT ON COLUMN yudao_demo01_contact.sex IS '閹冨焼';
COMMENT ON COLUMN yudao_demo01_contact.birthday IS '閸戣櫣鏁撻獮?;
COMMENT ON COLUMN yudao_demo01_contact.description IS '缁犫偓娴?;
COMMENT ON COLUMN yudao_demo01_contact.avatar IS '婢舵潙鍎?;
COMMENT ON COLUMN yudao_demo01_contact.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN yudao_demo01_contact.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN yudao_demo01_contact.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN yudao_demo01_contact.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN yudao_demo01_contact.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN yudao_demo01_contact.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE yudao_demo01_contact IS '缁€杞扮伐閼辨梻閮存禍楦裤€?;

-- ----------------------------
-- Records of yudao_demo01_contact
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO yudao_demo01_contact (id, name, sex, birthday, description, avatar, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '閸︾喕鐪?, 2, '2023-11-07 00:00:00', '<p>婢垛晞娈ㄩ崷鐔荤湸閿涗礁鎲?/p>', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', '1', '2023-11-15 23:34:30', '1', '2023-11-15 23:47:39', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS yudao_demo01_contact_seq;
CREATE SEQUENCE yudao_demo01_contact_seq
    START 2;

-- ----------------------------
-- Table structure for yudao_demo02_category
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo02_category;
CREATE TABLE yudao_demo02_category (
    id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  parent_id int8 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE yudao_demo02_category ADD CONSTRAINT pk_yudao_demo02_category PRIMARY KEY (id);

COMMENT ON COLUMN yudao_demo02_category.id IS '缂傛牕褰?;
COMMENT ON COLUMN yudao_demo02_category.name IS '閸氬秴鐡?;
COMMENT ON COLUMN yudao_demo02_category.parent_id IS '閻栧墎楠囩紓鏍у娇';
COMMENT ON COLUMN yudao_demo02_category.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN yudao_demo02_category.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN yudao_demo02_category.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN yudao_demo02_category.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN yudao_demo02_category.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN yudao_demo02_category.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE yudao_demo02_category IS '缁€杞扮伐閸掑棛琚悰?;

-- ----------------------------
-- Records of yudao_demo02_category
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, '閸︾喕鐪?, 0, '1', '2023-11-15 23:34:30', '1', '2023-11-16 20:24:23', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '閻ｎ亣瀵?, 0, '1', '2023-11-16 20:24:00', '1', '2023-11-16 20:24:15', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, '閹亝鈧?, 0, '1', '2023-11-16 20:24:32', '1', '2023-11-16 20:24:32', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, '鐏忓繒鏆橀懠?, 2, '1', '2023-11-16 20:24:39', '1', '2023-11-16 20:24:39', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, '婢堆呮殬閼?, 2, '1', '2023-11-16 20:24:46', '1', '2023-11-16 20:24:46', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, '11', 3, '1', '2023-11-24 19:29:34', '1', '2023-11-24 19:29:34', '0', 1);
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, '1', 0, '1', '2025-10-01 09:19:20', '1', '2025-10-01 09:19:20', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS yudao_demo02_category_seq;
CREATE SEQUENCE yudao_demo02_category_seq
    START 8;

-- ----------------------------
-- Table structure for yudao_demo03_course
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_course;
CREATE TABLE yudao_demo03_course (
    id int8 NOT NULL,
  student_id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  score int2 NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE yudao_demo03_course ADD CONSTRAINT pk_yudao_demo03_course PRIMARY KEY (id);

COMMENT ON COLUMN yudao_demo03_course.id IS '缂傛牕褰?;
COMMENT ON COLUMN yudao_demo03_course.student_id IS '鐎涳妇鏁撶紓鏍у娇';
COMMENT ON COLUMN yudao_demo03_course.name IS '閸氬秴鐡?;
COMMENT ON COLUMN yudao_demo03_course.score IS '閸掑棙鏆?;
COMMENT ON COLUMN yudao_demo03_course.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN yudao_demo03_course.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_course.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN yudao_demo03_course.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_course.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN yudao_demo03_course.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE yudao_demo03_course IS '鐎涳妇鏁撶拠鍓р柤鐞?;

-- ----------------------------
-- Records of yudao_demo03_course
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, '鐠囶厽鏋?, 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 2, '閺佹澘顒?, 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (11, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (12, 2, '閻絻鍓?, 33, '1', '2023-11-17 00:20:42', '1', '2023-11-16 16:20:45', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (13, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:26', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:49', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (17, 2, '鐠囶厽鏋?, 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 2, '閺佹澘顒?, 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', '0', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (19, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2025-04-19 02:49:03', '1', 1);
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (20, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2025-04-19 10:49:04', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS yudao_demo03_course_seq;
CREATE SEQUENCE yudao_demo03_course_seq
    START 21;

-- ----------------------------
-- Table structure for yudao_demo03_grade
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_grade;
CREATE TABLE yudao_demo03_grade (
    id int8 NOT NULL,
  student_id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  teacher varchar(255) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE yudao_demo03_grade ADD CONSTRAINT pk_yudao_demo03_grade PRIMARY KEY (id);

COMMENT ON COLUMN yudao_demo03_grade.id IS '缂傛牕褰?;
COMMENT ON COLUMN yudao_demo03_grade.student_id IS '鐎涳妇鏁撶紓鏍у娇';
COMMENT ON COLUMN yudao_demo03_grade.name IS '閸氬秴鐡?;
COMMENT ON COLUMN yudao_demo03_grade.teacher IS '閻濐厺瀵屾禒?;
COMMENT ON COLUMN yudao_demo03_grade.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN yudao_demo03_grade.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_grade.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN yudao_demo03_grade.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_grade.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN yudao_demo03_grade.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE yudao_demo03_grade IS '鐎涳妇鏁撻悵顓犻獓鐞?;

-- ----------------------------
-- Records of yudao_demo03_grade
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 2, '娑撳鍕?2 閻?, '閸涖劍婢冩导?, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', '0', 1);
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, '閸楀簼璐?, '闁儵浠存０鍡楀帥', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', '0', 1);
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 9, '鐏忓繐娴?, '鐏忓繐鈻?11', '1', '2023-11-17 13:10:23', '1', '2025-04-19 10:49:04', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS yudao_demo03_grade_seq;
CREATE SEQUENCE yudao_demo03_grade_seq
    START 10;

-- ----------------------------
-- Table structure for yudao_demo03_student
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_student;
CREATE TABLE yudao_demo03_student (
    id int8 NOT NULL,
  name varchar(100) NULL DEFAULT '',
  sex int2 NOT NULL,
  birthday timestamp NOT NULL,
  description varchar(255) NOT NULL,
  creator varchar(64) NULL DEFAULT '',
  create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updater varchar(64) NULL DEFAULT '',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  deleted int2 NOT NULL DEFAULT 0,
  tenant_id int8 NOT NULL DEFAULT 0
);

ALTER TABLE yudao_demo03_student ADD CONSTRAINT pk_yudao_demo03_student PRIMARY KEY (id);

COMMENT ON COLUMN yudao_demo03_student.id IS '缂傛牕褰?;
COMMENT ON COLUMN yudao_demo03_student.name IS '閸氬秴鐡?;
COMMENT ON COLUMN yudao_demo03_student.sex IS '閹冨焼';
COMMENT ON COLUMN yudao_demo03_student.birthday IS '閸戣櫣鏁撻弮銉︽埂';
COMMENT ON COLUMN yudao_demo03_student.description IS '缁犫偓娴?;
COMMENT ON COLUMN yudao_demo03_student.creator IS '閸掓稑缂撻懓?;
COMMENT ON COLUMN yudao_demo03_student.create_time IS '閸掓稑缂撻弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_student.updater IS '閺囧瓨鏌婇懓?;
COMMENT ON COLUMN yudao_demo03_student.update_time IS '閺囧瓨鏌婇弮鍫曟？';
COMMENT ON COLUMN yudao_demo03_student.deleted IS '閺勵垰鎯侀崚鐘绘珟';
COMMENT ON COLUMN yudao_demo03_student.tenant_id IS '缁夌喐鍩涚紓鏍у娇';
COMMENT ON TABLE yudao_demo03_student IS '鐎涳妇鏁撶悰?;

-- ----------------------------
-- Records of yudao_demo03_student
-- ----------------------------
-- @formatter:off
BEGIN;
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, '鐏忓繒娅?, 1, '2023-11-16 00:00:00', '<p>閸樺顔?/p>', '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', '0', 1);
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, '婢堆囩拨', 2, '2023-11-13 00:00:00', '<p>娴ｇ姴婀弫娆愬灉閸嬫矮绨?</p>', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', '0', 1);
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, '鐏忓繗濮?, 1, '2023-11-07 00:00:00', '<p>閸濆牆鎼遍崫?/p>', '1', '2023-11-17 00:04:47', '1', '2025-04-19 10:49:04', '0', 1);
COMMIT;
-- @formatter:on

DROP SEQUENCE IF EXISTS yudao_demo03_student_seq;
CREATE SEQUENCE yudao_demo03_student_seq
    START 10;

-- ----------------------------
