/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1 MySQL
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : 127.0.0.1:3306
 Source Schema         : ruoyi-vue-pro

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 29/06/2026 17:18:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_access_log`;
CREATE TABLE `infra_api_access_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閺冦儱绻旀稉濠氭暛',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚猾璇茬€?,
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎼存梻鏁ら崥?,
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐠囬攱鐪伴弬瑙勭《閸?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐠囬攱鐪伴崷鏉挎絻',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '鐠囬攱鐪伴崣鍌涙殶',
  `response_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '閸濆秴绨茬紒鎾寸亯',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩?IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濞村繗顫嶉崳?UA',
  `operate_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹垮秳缍斿Ο鈥虫健',
  `operate_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹垮秳缍旈崥?,
  `operate_type` tinyint NULL DEFAULT 0 COMMENT '閹垮秳缍旈崚鍡欒',
  `begin_time` datetime NOT NULL COMMENT '瀵偓婵顕Ч鍌涙闂?,
  `end_time` datetime NOT NULL COMMENT '缂佹挻娼拠閿嬬湴閺冨爼妫?,
  `duration` int NOT NULL COMMENT '閹笛嗩攽閺冨爼鏆?,
  `result_code` int NOT NULL DEFAULT 0 COMMENT '缂佹挻鐏夐惍?,
  `result_msg` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '缂佹挻鐏夐幓鎰仛',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36346 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'API 鐠佸潡妫堕弮銉ョ箶鐞?;

-- ----------------------------
-- Records of infra_api_access_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_api_error_log`;
CREATE TABLE `infra_api_error_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚猾璇茬€?,
  `application_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎼存梻鏁ら崥?,
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐠囬攱鐪伴弬瑙勭《閸?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐠囬攱鐪伴崷鏉挎絻',
  `request_params` varchar(8000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐠囬攱鐪伴崣鍌涙殶',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩?IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濞村繗顫嶉崳?UA',
  `exception_time` datetime NOT NULL COMMENT '瀵倸鐖堕崣鎴犳晸閺冨爼妫?,
  `exception_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '瀵倸鐖堕崥?,
  `exception_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖剁€佃壈鍤ч惃鍕Х閹?,
  `exception_root_cause_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖剁€佃壈鍤ч惃鍕壌濞戝牊浼?,
  `exception_stack_trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖堕惃鍕垽鏉炪劏鎶?,
  `exception_class_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚崗銊ユ倳',
  `exception_file_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚弬鍥︽',
  `exception_method_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇炴倳',
  `exception_line_number` int NOT NULL COMMENT '瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇熷閸︺劏顢?,
  `process_status` tinyint NOT NULL COMMENT '婢跺嫮鎮婇悩鑸碘偓?,
  `process_time` datetime NULL DEFAULT NULL COMMENT '婢跺嫮鎮婇弮鍫曟？',
  `process_user_id` int NULL DEFAULT 0 COMMENT '婢跺嫮鎮婇悽銊﹀煕缂傛牕褰?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24453 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁崵绮哄鍌氱埗閺冦儱绻?;

-- ----------------------------
-- Records of infra_api_error_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_column`;
CREATE TABLE `infra_codegen_column`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `table_id` bigint NOT NULL COMMENT '鐞涖劎绱崣?,
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎涙顔岄崥?,
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎涙顔岀猾璇茬€?,
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎涙顔岄幓蹇氬牚',
  `nullable` bit(1) NOT NULL COMMENT '閺勵垰鎯侀崗浣筋啅娑撹櫣鈹?,
  `primary_key` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉濠氭暛',
  `ordinal_position` int NOT NULL COMMENT '閹烘帒绨?,
  `java_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 鐏炵偞鈧呰閸?,
  `java_field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Java 鐏炵偞鈧冩倳',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '鐎涙鍚€缁鐎?,
  `example` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閺佺増宓佺粈杞扮伐',
  `create_operation` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉?Create 閸掓稑缂撻幙宥勭稊閻ㄥ嫬鐡у▓?,
  `update_operation` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉?Update 閺囧瓨鏌婇幙宥勭稊閻ㄥ嫬鐡у▓?,
  `list_operation` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫬鐡у▓?,
  `list_operation_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=' COMMENT 'List 閺屻儴顕楅幙宥勭稊閻ㄥ嫭娼禒鍓佽閸?,
  `list_operation_result` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫯绻戦崶鐐茬摟濞?,
  `html_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺勫墽銇氱猾璇茬€?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_table_id`(`table_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2880 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '娴狅絿鐖滈悽鐔稿灇鐞涖劌鐡у▓闈涚暰娑?;

-- ----------------------------
-- Records of infra_codegen_column
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
DROP TABLE IF EXISTS `infra_codegen_table`;
CREATE TABLE `infra_codegen_table`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `data_source_config_id` bigint NOT NULL COMMENT '閺佺増宓佸┃鎰板帳缂冾喚娈戠紓鏍у娇',
  `scene` tinyint NOT NULL DEFAULT 1 COMMENT '閻㈢喐鍨氶崷鐑樻珯',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐞涖劌鎮曠粔?,
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐞涖劍寮挎潻?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡€虫健閸?,
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娑撴艾濮熼崥?,
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '缁鎮曠粔?,
  `class_comment` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缁粯寮挎潻?,
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娴ｆ粏鈧?,
  `template_type` tinyint NOT NULL DEFAULT 1 COMMENT '濡剝婢樼猾璇茬€?,
  `front_type` tinyint NOT NULL COMMENT '閸撳秶顏猾璇茬€?,
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '閻栨儼褰嶉崡鏇犵椽閸?,
  `master_table_id` bigint NULL DEFAULT NULL COMMENT '娑撴槒銆冮惃鍕椽閸?,
  `sub_join_column_id` bigint NULL DEFAULT NULL COMMENT '鐎涙劘銆冮崗瀹犱粓娑撴槒銆冮惃鍕摟濞堢數绱崣?,
  `sub_join_many` bit(1) NULL DEFAULT NULL COMMENT '娑撴槒銆冩稉搴＄摍鐞涖劍妲搁崥锔跨鐎电懓顦?,
  `tree_parent_column_id` bigint NULL DEFAULT NULL COMMENT '閺嶆垼銆冮惃鍕煑鐎涙顔岀紓鏍у娇',
  `tree_name_column_id` bigint NULL DEFAULT NULL COMMENT '閺嶆垼銆冮惃鍕倳鐎涙鐡у▓鐢电椽閸?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 210 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '娴狅絿鐖滈悽鐔稿灇鐞涖劌鐣炬稊?;

-- ----------------------------
-- Records of infra_codegen_table
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_config`;
CREATE TABLE `infra_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閸欏倹鏆熸稉濠氭暛',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欏倹鏆熼崚鍡欑矋',
  `type` tinyint NOT NULL COMMENT '閸欏倹鏆熺猾璇茬€?,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸欏倹鏆熼崥宥囆?,
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸欏倹鏆熼柨顔兼倳',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸欏倹鏆熼柨顔尖偓?,
  `visible` bit(1) NOT NULL COMMENT '閺勵垰鎯侀崣顖濐潌',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_config_key`(`config_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閸欏倹鏆熼柊宥囩枂鐞?;

-- ----------------------------
-- Records of infra_config
-- ----------------------------
BEGIN;
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 'biz', 1, '閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, 'system.user.init-password', '123456', b'0', '閸掓繂顫愰崠鏍х槕閻?123456', 'admin', '2021-01-05 17:03:48', '1', '2024-07-20 17:22:47', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (7, 'url', 2, 'MySQL 閻╂垶甯堕惃鍕勾閸р偓', 'url.druid', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:33:38', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (8, 'url', 2, 'SkyWalking 閻╂垶甯堕惃鍕勾閸р偓', 'url.skywalking', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:57:03', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (9, 'url', 2, 'Spring Boot Admin 閻╂垶甯堕惃鍕勾閸р偓', 'url.spring-boot-admin', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:52:07', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (10, 'url', 2, 'Swagger 閹恒儱褰涢弬鍥ㄣ€傞惃鍕勾閸р偓', 'url.swagger', '', b'1', '', '1', '2023-04-07 13:41:16', '1', '2023-04-07 14:59:00', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (12, 'test2', 2, 'test3', 'test4', 'test5', b'1', 'test6', '1', '2023-12-03 09:55:16', '1', '2025-04-06 21:00:09', b'0');
INSERT INTO `infra_config` (`id`, `category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (13, '閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, 2, '閻劍鍩涚粻锛勬倞-濞夈劌鍞藉鈧崗?, 'system.user.register-enabled', 'true', b'0', '', '1', '2025-04-26 17:23:41', '1', '2025-04-26 17:23:41', b'0');
COMMIT;

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_data_source_config`;
CREATE TABLE `infra_data_source_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁紓鏍у娇',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸欏倹鏆熼崥宥囆?,
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺佺増宓佸┃鎰箾閹?,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涢崥?,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎靛棛鐖?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閺佺増宓佸┃鎰板帳缂冾喛銆?;

-- ----------------------------
-- Records of infra_data_source_config
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
DROP TABLE IF EXISTS `infra_file`;
CREATE TABLE `infra_file`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閺傚洣娆㈢紓鏍у娇',
  `config_id` bigint NULL DEFAULT NULL COMMENT '闁板秶鐤嗙紓鏍у娇',
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閺傚洣娆㈤崥?,
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺傚洣娆㈢捄顖氱窞',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺傚洣娆?URL',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閺傚洣娆㈢猾璇茬€?,
  `size` int NOT NULL COMMENT '閺傚洣娆㈡径褍鐨?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2260 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閺傚洣娆㈢悰?;

-- ----------------------------
-- Records of infra_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_config`;
CREATE TABLE `infra_file_config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁板秶鐤嗛崥?,
  `storage` tinyint NOT NULL COMMENT '鐎涙ê鍋嶉崳?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `master` bit(1) NOT NULL COMMENT '閺勵垰鎯佹稉杞板瘜闁板秶鐤?,
  `config` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎涙ê鍋嶉柊宥囩枂',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閺傚洣娆㈤柊宥囩枂鐞?;

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
BEGIN;
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (4, '閺佺増宓佹惔鎿勭礄缁€杞扮伐閿?, 1, '閹存垶妲搁弫鐗堝祦鎼?, b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.db.DBFileClientConfig\",\"domain\":\"http://127.0.0.1:48080\"}', '1', '2022-03-15 23:56:24', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (22, '娑撳啰澧扮€涙ê鍋嶉崳顭掔礄缁€杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3.cn-south-1.qiniucs.com\",\"domain\":\"http://test.yudao.iocoder.cn\",\"bucket\":\"ruoyi-vue-pro\",\"accessKey\":\"demo-qiniu-access-key\",\"accessSecret\":\"demo-qiniu-access-secret\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-01-13 22:11:12', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (24, '閼垫崘顔嗘禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閻ㄥ嫬鐦戦柦銉磼閿涗緤绱?, b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"https://cos.ap-shanghai.myqcloud.com\",\"domain\":\"http://tengxun-oss.iocoder.cn\",\"bucket\":\"aoteman-1255880240\",\"accessKey\":\"demo-tencent-secret-id\",\"accessSecret\":\"X\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-11-09 16:03:22', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (25, '闂冨潡鍣锋禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"oss-cn-beijing.aliyuncs.com\",\"domain\":\"http://ali-oss.iocoder.cn\",\"bucket\":\"yunai-aoteman\",\"accessKey\":\"demo-aliyun-access-key-id\",\"accessSecret\":\"X\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-11-09 16:47:08', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (26, '閻忣偄鍖楁禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"tos-s3-cn-beijing.volces.com\",\"domain\":null,\"bucket\":\"yunai\",\"accessKey\":\"demo-volcengine-access-key-id\",\"accessSecret\":\"X==\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-11-09 16:56:42', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (27, '閸楀簼璐熸禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, '', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"obs.cn-east-3.myhuaweicloud.com\",\"domain\":\"\",\"bucket\":\"yudao\",\"accessKey\":\"demo-huawei-access-key-id\",\"accessSecret\":\"X\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-11-09 17:18:41', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (28, 'MinIO 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 20, '', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"http://127.0.0.1:9000\",\"domain\":\"http://127.0.0.1:9000/yudao\",\"bucket\":\"yudao\",\"accessKey\":\"admin\",\"accessSecret\":\"password\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":true}', '1', '2024-11-09 17:43:10', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (29, '閺堫剙婀寸€涙ê鍋嶉敍鍫仛娓氬绱?, 10, 'mac/linux 娴ｈ法鏁?/閿涘瘍indows 娴ｈ法鏁?\\', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.local.LocalFileClientConfig\",\"basePath\":\"/Users/yunai/tmp/file\",\"domain\":\"http://127.0.0.1:48080\"}', '1', '2025-05-02 11:25:45', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (30, 'SFTP 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 12, '', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.sftp.SftpFileClientConfig\",\"basePath\":\"/upload\",\"domain\":\"http://127.0.0.1:48080\",\"host\":\"127.0.0.1\",\"port\":2222,\"username\":\"foo\",\"password\":\"pass\"}', '1', '2025-05-02 16:34:10', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (34, '娑撳啰澧版禍鎴濈摠閸屻劊鈧劗顫嗛張澶堚偓鎴礄缁€杞扮伐閿?, 20, '鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', b'0', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"s3.cn-south-1.qiniucs.com\",\"domain\":\"http://t151glocd.hn-bkt.clouddn.com\",\"bucket\":\"ruoyi-vue-pro-private\",\"accessKey\":\"demo-qiniu-access-key\",\"accessSecret\":\"demo-qiniu-access-secret\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":false}', '1', '2025-08-17 21:22:00', '1', '2026-06-26 12:23:25', b'0');
INSERT INTO `infra_file_config` (`id`, `name`, `storage`, `remark`, `master`, `config`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (35, '1', 20, '1', b'1', '{\"@class\":\"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig\",\"endpoint\":\"http://www.baidu.com\",\"domain\":\"http://www.xxx.com\",\"bucket\":\"1\",\"accessKey\":\"2\",\"accessSecret\":\"3\",\"enablePathStyleAccess\":false,\"enablePublicAccess\":false,\"region\":\"1\"}', '1', '2025-10-02 14:32:12', '1', '2026-06-26 12:23:25', b'0');
COMMIT;

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
DROP TABLE IF EXISTS `infra_file_content`;
CREATE TABLE `infra_file_content`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `config_id` bigint NOT NULL COMMENT '闁板秶鐤嗙紓鏍у娇',
  `path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺傚洣娆㈢捄顖氱窞',
  `content` mediumblob NOT NULL COMMENT '閺傚洣娆㈤崘鍛啇',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_config_id_path`(`config_id` ASC, `path` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閺傚洣娆㈢悰?;

-- ----------------------------
-- Records of infra_file_content
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
DROP TABLE IF EXISTS `infra_job`;
CREATE TABLE `infra_job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娴犺濮熺紓鏍у娇',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '娴犺濮熼崥宥囆?,
  `status` tinyint NOT NULL COMMENT '娴犺濮熼悩鑸碘偓?,
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?,
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?,
  `cron_expression` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'CRON 鐞涖劏鎻?,
  `retry_count` int NOT NULL DEFAULT 0 COMMENT '闁插秷鐦▎鈩冩殶',
  `retry_interval` int NOT NULL DEFAULT 0 COMMENT '闁插秷鐦梻鎾',
  `monitor_timeout` int NOT NULL DEFAULT 0 COMMENT '閻╂垶甯剁搾鍛閺冨爼妫?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎规碍妞傛禒璇插鐞?;

-- ----------------------------
-- Records of infra_job
-- ----------------------------
BEGIN;
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5, '閺€顖欑帛闁氨鐓?Job', 2, 'payNotifyJob', NULL, '* * * * * ?', 0, 0, 0, '1', '2021-10-27 08:34:42', '1', '2024-09-12 13:32:48', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (17, '閺€顖欑帛鐠併垹宕熼崥灞绢劄 Job', 2, 'payOrderSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 14:36:26', '1', '2023-07-22 15:39:08', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (18, '閺€顖欑帛鐠併垹宕熸潻鍥ㄦ埂 Job', 2, 'payOrderExpireJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-22 15:36:23', '1', '2023-07-22 15:39:54', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (19, '闁偓濞嗘崘顓归崡鏇犳畱閸氬本顒?Job', 2, 'payRefundSyncJob', NULL, '0 0/1 * * * ?', 0, 0, 0, '1', '2023-07-23 21:03:44', '1', '2023-07-23 21:09:00', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (25, '鐠佸潡妫堕弮銉ョ箶濞撳懐鎮?Job', 2, 'accessLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 10:59:41', '1', '2023-10-03 11:01:10', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (26, '闁挎瑨顕ら弮銉ョ箶濞撳懐鎮?Job', 2, 'errorLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:00:43', '1', '2023-10-03 11:01:12', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (27, '娴犺濮熼弮銉ョ箶濞撳懐鎮?Job', 2, 'jobLogCleanJob', '', '0 0 0 * * ?', 3, 0, 0, '1', '2023-10-03 11:01:33', '1', '2024-09-12 13:40:34', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (33, 'demoJob', 2, 'demoJob', '', '0 * * * * ?', 1, 1, 0, '1', '2024-10-27 19:38:46', '1', '2025-05-10 18:13:54', b'0');
INSERT INTO `infra_job` (`id`, `name`, `status`, `handler_name`, `handler_param`, `cron_expression`, `retry_count`, `retry_interval`, `monitor_timeout`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (35, '鏉烆剝澶勭拋銏犲礋閻ㄥ嫬鎮撳?Job', 2, 'payTransferSyncJob', '', '0 * * * * ?', 0, 0, 0, '1', '2025-05-10 17:35:54', '1', '2025-05-10 18:13:52', b'0');
COMMIT;

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
DROP TABLE IF EXISTS `infra_job_log`;
CREATE TABLE `infra_job_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閺冦儱绻旂紓鏍у娇',
  `job_id` bigint NOT NULL COMMENT '娴犺濮熺紓鏍у娇',
  `handler_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?,
  `handler_param` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?,
  `execute_index` tinyint NOT NULL DEFAULT 1 COMMENT '缁楊剙鍤戝▎鈩冨⒔鐞?,
  `begin_time` datetime NOT NULL COMMENT '瀵偓婵澧界悰灞炬闂?,
  `end_time` datetime NULL DEFAULT NULL COMMENT '缂佹挻娼幍褑顢戦弮鍫曟？',
  `duration` int NULL DEFAULT NULL COMMENT '閹笛嗩攽閺冨爼鏆?,
  `status` tinyint NOT NULL COMMENT '娴犺濮熼悩鑸碘偓?,
  `result` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '缂佹挻鐏夐弫鐗堝祦',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job_id`(`job_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 987 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎规碍妞傛禒璇插閺冦儱绻旂悰?;

-- ----------------------------
-- Records of infra_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '闁劑妫琲d',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '闁劑妫崥宥囆?,
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '閻栧爼鍎撮梻鈺',
  `sort` int NOT NULL DEFAULT 0 COMMENT '閺勫墽銇氭い鍝勭碍',
  `leader_user_id` bigint NULL DEFAULT NULL COMMENT '鐠愮喕鐭楁禍?,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閼辨梻閮撮悽浣冪樈',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '闁喚顔?,
  `status` tinyint NOT NULL COMMENT '闁劑妫悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '闁劑妫悰?;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
BEGIN;
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (100, '閼哄浜惧┃鎰垳', 0, 0, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2026-01-04 18:01:12', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (101, '濞ｅ崬婀烽幀璇插彆閸?, 100, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2025-03-29 15:49:55', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (102, '闂€鎸庣煓閸掑棗鍙曢崣?, 100, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:40', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (103, '閻柨褰傞柈銊╂，', 101, 1, 104, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2026-01-04 18:01:24', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (104, '鐢倸婧€闁劑妫?, 101, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:38', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (105, '濞村鐦柈銊╂，', 101, 3, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-05-16 20:25:15', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (106, '鐠愩垹濮熼柈銊╂，', 101, 4, 103, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '103', '2022-01-15 21:32:22', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (107, '鏉╂劗娣柈銊╂，', 101, 5, 1, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2023-12-02 09:28:22', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (108, '鐢倸婧€闁劑妫?, 102, 1, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '1', '2022-02-16 08:35:45', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (109, '鐠愩垹濮熼柈銊╂，', 102, 2, NULL, '15888888888', 'ry@qq.com', 0, 'admin', '2021-01-05 17:03:47', '', '2021-12-15 05:01:29', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (110, '閺備即鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, '110', '2022-02-23 20:46:30', '110', '2022-02-23 20:46:30', b'0', 121);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (111, '妞ゅ墎楠囬柈銊╂，', 0, 1, NULL, NULL, NULL, 0, '113', '2022-03-07 21:44:50', '113', '2022-03-07 21:44:50', b'0', 122);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (112, '娴溠冩惂闁劑妫?, 101, 100, 1, NULL, NULL, 1, '1', '2023-12-02 09:45:13', '1', '2023-12-02 09:45:31', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (113, '閺€顖涘瘮闁劑妫?, 102, 3, 104, NULL, NULL, 1, '1', '2023-12-02 09:47:38', '1', '2025-03-29 15:00:56', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (116, '閺屾劒閲滅€涙劙鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, '1', '2025-12-08 14:51:12', '1', '2025-12-08 14:51:12', b'0', 1);
INSERT INTO `system_dept` (`id`, `name`, `parent_id`, `sort`, `leader_user_id`, `phone`, `email`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (117, '閺屾劒閲滅€涙劙鍎撮梻?2', 0, 2, NULL, NULL, NULL, 0, '1', '2025-12-08 14:51:25', '1', '2025-12-08 14:51:25', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_data`;
CREATE TABLE `system_dict_data`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐎涙鍚€缂傛牜鐖?,
  `sort` int NOT NULL DEFAULT 0 COMMENT '鐎涙鍚€閹烘帒绨?,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎涙鍚€閺嶅洨顒?,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎涙鍚€闁款喖鈧?,
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎涙鍚€缁鐎?,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `color_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '妫版粏澹婄猾璇茬€?,
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'css 閺嶅嘲绱?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎涙鍚€閺佺増宓佺悰?;

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, 1, '閻?, '1', 'system_user_sex', 0, 'primary', 'A', '閹冨焼閻?, 'admin', '2021-01-05 17:03:48', '1', '2025-12-10 13:19:26', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 2, '婵?, '2', 'system_user_sex', 0, 'success', '', '閹冨焼婵?, 'admin', '2021-01-05 17:03:48', '1', '2023-11-15 23:30:37', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (8, 1, '濮濓絽鐖?, '1', 'infra_job_status', 0, 'success', '', '濮濓絽鐖堕悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:38', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (9, 2, '閺嗗倸浠?, '2', 'infra_job_status', 0, 'danger', '', '閸嬫粎鏁ら悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:33:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (12, 1, '缁崵绮洪崘鍛枂', '1', 'infra_config_type', 0, 'danger', '', '閸欏倹鏆熺猾璇茬€?- 缁崵绮洪崘鍛枂', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:02', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (13, 2, '閼奉亜鐣炬稊?, '2', 'infra_config_type', 0, 'primary', '', '閸欏倹鏆熺猾璇茬€?- 閼奉亜鐣炬稊?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 19:06:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (14, 1, '闁氨鐓?, '1', 'system_notice_type', 0, 'success', '', '闁氨鐓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:05:57', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (15, 2, '閸忣剙鎲?, '2', 'system_notice_type', 0, 'info', '', '閸忣剙鎲?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:06:01', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (16, 0, '閸忚泛鐣?, '0', 'infra_operate_type', 0, 'default', '', '閸忚泛鐣犻幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:19', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (17, 1, '閺屻儴顕?, '1', 'infra_operate_type', 0, 'info', '', '閺屻儴顕楅幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:20', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (18, 2, '閺傛澘顤?, '2', 'infra_operate_type', 0, 'primary', '', '閺傛澘顤冮幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:21', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (19, 3, '娣囶喗鏁?, '3', 'infra_operate_type', 0, 'warning', '', '娣囶喗鏁奸幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:22', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (20, 4, '閸掔娀娅?, '4', 'infra_operate_type', 0, 'danger', '', '閸掔娀娅庨幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:23', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (22, 5, '鐎电厧鍤?, '5', 'infra_operate_type', 0, 'default', '', '鐎电厧鍤幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (23, 6, '鐎电厧鍙?, '6', 'infra_operate_type', 0, 'default', '', '鐎电厧鍙嗛幙宥勭稊', 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (27, 1, '瀵偓閸?, '0', 'common_status', 0, 'primary', '', '瀵偓閸氼垳濮搁幀?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:39', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (28, 2, '閸忔娊妫?, '1', 'common_status', 0, 'info', '', '閸忔娊妫撮悩鑸碘偓?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 08:00:44', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (29, 1, '閻╊喖缍?, '1', 'system_menu_type', 0, '', '', '閻╊喖缍?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (30, 2, '閼挎粌宕?, '2', 'system_menu_type', 0, '', '', '閼挎粌宕?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (31, 3, '閹稿鎸?, '3', 'system_menu_type', 0, '', '', '閹稿鎸?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:43:39', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (32, 1, '閸愬懐鐤?, '1', 'system_role_type', 0, 'danger', '', '閸愬懐鐤嗙憴鎺曞', 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:08', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (33, 2, '閼奉亜鐣炬稊?, '2', 'system_role_type', 0, 'primary', '', '閼奉亜鐣炬稊澶庮潡閼?, 'admin', '2021-01-05 17:03:48', '1', '2022-02-16 13:02:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (34, 1, '閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, '1', 'system_data_scope', 0, '', '', '閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:17', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (35, 2, '閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', '2', 'system_data_scope', 0, '', '', '閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:18', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (36, 3, '閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, '3', 'system_data_scope', 0, '', '', '閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (37, 4, '閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, '4', 'system_data_scope', 0, '', '', '閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:21', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (38, 5, '娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, '5', 'system_data_scope', 0, '', '', '娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:47:23', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (39, 0, '閹存劕濮?, '0', 'system_login_result', 0, 'success', '', '閻у妾扮紒鎾寸亯 - 閹存劕濮?, '', '2021-01-18 06:17:36', '1', '2022-02-16 13:23:49', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (40, 10, '鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, '10', 'system_login_result', 0, 'primary', '', '閻у妾扮紒鎾寸亯 - 鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:27', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (41, 20, '閻劍鍩涚悮顐ゎ洣閻?, '20', 'system_login_result', 0, 'warning', '', '閻у妾扮紒鎾寸亯 - 閻劍鍩涚悮顐ゎ洣閻?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:23:57', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (42, 30, '妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, '30', 'system_login_result', 0, 'info', '', '閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (43, 31, '妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, '31', 'system_login_result', 0, 'info', '', '閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:11', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (44, 100, '閺堫亞鐓″鍌氱埗', '100', 'system_login_result', 0, 'danger', '', '閻у妾扮紒鎾寸亯 - 閺堫亞鐓″鍌氱埗', '', '2021-01-18 06:17:54', '1', '2022-02-16 13:24:23', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (45, 1, '閺?, 'true', 'infra_boolean_string', 0, 'danger', '', 'Boolean 閺勵垰鎯佺猾璇茬€?- 閺?, '', '2021-01-19 03:20:55', '1', '2022-03-15 23:01:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (46, 1, '閸?, 'false', 'infra_boolean_string', 0, 'info', '', 'Boolean 閺勵垰鎯佺猾璇茬€?- 閸?, '', '2021-01-19 03:20:55', '1', '2022-03-15 23:09:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (50, 1, '閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '1', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:09:06', '', '2022-03-10 16:33:15', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (51, 2, '閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '2', 'infra_codegen_template_type', 0, '', '', NULL, '', '2021-02-05 07:14:46', '', '2022-03-10 16:33:19', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (53, 0, '閸掓繂顫愰崠鏍﹁厬', '0', 'infra_job_status', 0, 'primary', '', NULL, '', '2021-02-07 07:46:49', '1', '2022-02-16 19:33:29', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (57, 0, '鏉╂劘顢戞稉?, '0', 'infra_job_log_status', 0, 'primary', '', 'RUNNING', '', '2021-02-08 10:04:24', '1', '2022-02-16 19:07:48', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (58, 1, '閹存劕濮?, '1', 'infra_job_log_status', 0, 'success', '', NULL, '', '2021-02-08 10:06:57', '1', '2022-02-16 19:07:52', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (59, 2, '婢惰精瑙?, '2', 'infra_job_log_status', 0, 'warning', '', '婢惰精瑙?, '', '2021-02-08 10:07:38', '1', '2022-02-16 19:07:56', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (60, 1, '娴兼艾鎲?, '1', 'user_type', 0, 'primary', '', NULL, '', '2021-02-26 00:16:27', '1', '2022-02-16 10:22:19', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (61, 2, '缁狅紕鎮婇崨?, '2', 'user_type', 0, 'success', '', NULL, '', '2021-02-26 00:16:34', '1', '2025-04-06 18:37:43', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (62, 0, '閺堫亜顦╅悶?, '0', 'infra_api_error_log_process_status', 0, 'primary', '', NULL, '', '2021-02-26 07:07:19', '1', '2022-02-16 20:14:17', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (63, 1, '瀹告彃顦╅悶?, '1', 'infra_api_error_log_process_status', 0, 'success', '', NULL, '', '2021-02-26 07:07:26', '1', '2022-02-16 20:14:08', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (64, 2, '瀹告彃鎷烽悾?, '2', 'infra_api_error_log_process_status', 0, 'danger', '', NULL, '', '2021-02-26 07:07:34', '1', '2022-02-16 20:14:14', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (66, 1, '闂冨潡鍣锋禍?, 'ALIYUN', 'system_sms_channel_code', 0, 'primary', '', NULL, '1', '2021-04-05 01:05:26', '1', '2024-07-22 22:23:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (67, 1, '妤犲矁鐦夐惍?, '1', 'system_sms_template_type', 0, 'warning', '', NULL, '1', '2021-04-05 21:50:57', '1', '2022-02-16 12:48:30', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (68, 2, '闁氨鐓?, '2', 'system_sms_template_type', 0, 'primary', '', NULL, '1', '2021-04-05 21:51:08', '1', '2022-02-16 12:48:27', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (69, 0, '閽€銉╂敘', '3', 'system_sms_template_type', 0, 'danger', '', NULL, '1', '2021-04-05 21:51:15', '1', '2022-02-16 12:48:22', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (70, 0, '閸掓繂顫愰崠?, '0', 'system_sms_send_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:18:33', '1', '2022-02-16 10:26:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (71, 1, '閸欐垿鈧焦鍨氶崝?, '10', 'system_sms_send_status', 0, 'success', '', NULL, '1', '2021-04-11 20:18:43', '1', '2022-02-16 10:25:56', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (72, 2, '閸欐垿鈧礁銇戠拹?, '20', 'system_sms_send_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:18:49', '1', '2022-02-16 10:26:03', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (73, 3, '娑撳秴褰傞柅?, '30', 'system_sms_send_status', 0, 'info', '', NULL, '1', '2021-04-11 20:19:44', '1', '2022-02-16 10:26:10', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (74, 0, '缁涘绶熺紒鎾寸亯', '0', 'system_sms_receive_status', 0, 'primary', '', NULL, '1', '2021-04-11 20:27:43', '1', '2022-02-16 10:28:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (75, 1, '閹恒儲鏁归幋鎰', '10', 'system_sms_receive_status', 0, 'success', '', NULL, '1', '2021-04-11 20:29:25', '1', '2022-02-16 10:28:28', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (76, 2, '閹恒儲鏁规径杈Е', '20', 'system_sms_receive_status', 0, 'danger', '', NULL, '1', '2021-04-11 20:29:31', '1', '2022-02-16 10:28:32', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (77, 0, '鐠嬪啳鐦?闁藉鎷?', 'DEBUG_DING_TALK', 'system_sms_channel_code', 0, 'info', '', NULL, '1', '2021-04-13 00:20:37', '1', '2022-02-16 10:10:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (80, 100, '鐠愶箑褰块惂璇茬秿', '100', 'system_login_type', 0, 'primary', '', '鐠愶箑褰块惂璇茬秿', '1', '2021-10-06 00:52:02', '1', '2022-02-16 13:11:34', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (81, 101, '缁€鍙ユ唉閻ц缍?, '101', 'system_login_type', 0, 'info', '', '缁€鍙ユ唉閻ц缍?, '1', '2021-10-06 00:52:17', '1', '2022-02-16 13:11:40', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (83, 200, '娑撹濮╅惂璇插毉', '200', 'system_login_type', 0, 'primary', '', '娑撹濮╅惂璇插毉', '1', '2021-10-06 00:52:58', '1', '2022-02-16 13:11:49', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (85, 202, '瀵搫鍩楅惂璇插毉', '202', 'system_login_type', 0, 'danger', '', '瀵搫鍩楅柅鈧崙?, '1', '2021-10-06 00:53:41', '1', '2022-02-16 13:11:57', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1145, 1, '缁狅紕鎮婇崥搴″酱', '1', 'infra_codegen_scene', 0, '', '', '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 缁狅紕鎮婇崥搴″酱', '1', '2022-02-02 13:15:06', '1', '2022-03-10 16:32:59', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1146, 2, '閻劍鍩?APP', '2', 'infra_codegen_scene', 0, '', '', '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 閻劍鍩?APP', '1', '2022-02-02 13:15:19', '1', '2022-03-10 16:33:03', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1150, 1, '閺佺増宓佹惔?, '1', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:28', '1', '2022-03-15 00:25:28', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1151, 10, '閺堫剙婀寸壕浣烘磸', '10', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:25:41', '1', '2022-03-15 00:25:56', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1152, 11, 'FTP 閺堝秴濮熼崳?, '11', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:06', '1', '2022-03-15 00:26:10', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1153, 12, 'SFTP 閺堝秴濮熼崳?, '12', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:22', '1', '2022-03-15 00:26:22', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1154, 20, 'S3 鐎电钖勭€涙ê鍋?, '20', 'infra_file_storage', 0, 'default', '', NULL, '1', '2022-03-15 00:26:31', '1', '2022-03-15 00:26:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1155, 103, '閻厺淇婇惂璇茬秿', '103', 'system_login_type', 0, 'default', '', NULL, '1', '2022-05-09 23:57:58', '1', '2022-05-09 23:58:09', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1156, 1, 'password', 'password', 'system_oauth2_grant_type', 0, 'default', '', '鐎靛棛鐖滃Ο鈥崇础', '1', '2022-05-12 00:22:05', '1', '2022-05-11 16:26:01', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1157, 2, 'authorization_code', 'authorization_code', 'system_oauth2_grant_type', 0, 'primary', '', '閹哄牊娼堥惍浣鼓佸?, '1', '2022-05-12 00:22:59', '1', '2022-05-11 16:26:02', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1158, 3, 'implicit', 'implicit', 'system_oauth2_grant_type', 0, 'success', '', '缁犫偓閸栨牗膩瀵?, '1', '2022-05-12 00:23:40', '1', '2022-05-11 16:26:05', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1159, 4, 'client_credentials', 'client_credentials', 'system_oauth2_grant_type', 0, 'default', '', '鐎广垺鍩涚粩顖浤佸?, '1', '2022-05-12 00:23:51', '1', '2022-05-11 16:26:08', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1160, 5, 'refresh_token', 'refresh_token', 'system_oauth2_grant_type', 0, 'info', '', '閸掗攱鏌婂Ο鈥崇础', '1', '2022-05-12 00:24:02', '1', '2022-05-11 16:26:11', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1194, 10, '瀵邦喕淇婄亸蹇曗柤鎼?, '10', 'terminal', 0, 'default', '', '缂佸牏顏?- 瀵邦喕淇婄亸蹇曗柤鎼?, '1', '2022-12-10 10:51:11', '1', '2022-12-10 10:51:57', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1195, 20, 'H5 缂冩垿銆?, '20', 'terminal', 0, 'default', '', '缂佸牏顏?- H5 缂冩垿銆?, '1', '2022-12-10 10:51:30', '1', '2022-12-10 10:51:59', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1196, 11, '瀵邦喕淇婇崗顑跨船閸?, '11', 'terminal', 0, 'default', '', '缂佸牏顏?- 瀵邦喕淇婇崗顑跨船閸?, '1', '2022-12-10 10:54:16', '1', '2022-12-10 10:52:01', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1197, 31, '閼昏鐏?App', '31', 'terminal', 0, 'default', '', '缂佸牏顏?- 閼昏鐏?App', '1', '2022-12-10 10:54:42', '1', '2022-12-10 10:52:18', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1198, 32, '鐎瑰宕?App', '32', 'terminal', 0, 'default', '', '缂佸牏顏?- 鐎瑰宕?App', '1', '2022-12-10 10:55:02', '1', '2022-12-10 10:59:17', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1223, 0, '閸掓繂顫愰崠?, '0', 'system_mail_send_status', 0, 'primary', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸掓繂顫愰崠鏈秐', '1', '2023-01-26 09:53:49', '1', '2023-01-26 16:36:14', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1224, 10, '閸欐垿鈧焦鍨氶崝?, '10', 'system_mail_send_status', 0, 'success', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧焦鍨氶崝?, '1', '2023-01-26 09:54:28', '1', '2023-01-26 16:36:22', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1225, 20, '閸欐垿鈧礁銇戠拹?, '20', 'system_mail_send_status', 0, 'danger', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧礁銇戠拹?, '1', '2023-01-26 09:54:50', '1', '2023-01-26 16:36:26', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1226, 30, '娑撳秴褰傞柅?, '30', 'system_mail_send_status', 0, 'info', '', '闁喕娆㈤崣鎴︹偓浣哄Ц閹?-  娑撳秴褰傞柅?, '1', '2023-01-26 09:55:06', '1', '2023-01-26 16:36:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1227, 1, '闁氨鐓￠崗顒€鎲?, '1', 'system_notify_template_type', 0, 'primary', '', '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 闁氨鐓￠崗顒€鎲?, '1', '2023-01-28 10:35:59', '1', '2023-01-28 10:35:59', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1228, 2, '缁崵绮哄☉鍫熶紖', '2', 'system_notify_template_type', 0, 'success', '', '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 缁崵绮哄☉鍫熶紖', '1', '2023-01-28 10:36:20', '1', '2023-01-28 10:36:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1231, 10, 'Vue2 Element UI 閺嶅洤鍣Ο锛勫', '10', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:03:55', '1', '2023-04-13 00:03:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1232, 20, 'Vue3 Element Plus 閺嶅洤鍣Ο锛勫', '20', 'infra_codegen_front_type', 0, '', '', '', '1', '2023-04-13 00:04:08', '1', '2023-04-13 00:04:08', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1234, 30, 'Vben2.0 Ant Design Schema 濡紕澧?, '30', 'infra_codegen_front_type', 1, '', '', '', '1', '2023-04-13 00:04:26', '1', '2025-07-27 10:55:14', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1435, 10, 'Gitee', '10', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:42', '1', '2023-11-04 13:04:42', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1436, 20, '闁藉鎷?, '20', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:04:54', '1', '2023-11-04 13:04:54', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1437, 30, '娴间椒绗熷顔讳繆', '30', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:09', '1', '2023-11-04 13:05:09', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1438, 31, '瀵邦喕淇婇崗顑跨船楠炲啿褰?, '31', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:18', '1', '2023-11-04 13:05:18', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1439, 32, '瀵邦喕淇婂鈧弨鎯ч挬閸?, '32', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:30', '1', '2023-11-04 13:05:30', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1440, 34, '瀵邦喕淇婄亸蹇曗柤鎼?, '34', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1443, 15, '鐎涙劘銆?, '15', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-13 23:06:16', '1', '2023-11-13 23:06:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1444, 10, '娑撴槒銆冮敍鍫熺垼閸戝棙膩瀵骏绱?, '10', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:32:49', '1', '2023-11-14 12:32:49', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1445, 11, '娑撴槒銆冮敍鍦桼P 濡€崇础閿?, '11', 'infra_codegen_template_type', 0, 'default', '', '', '1', '2023-11-14 12:33:05', '1', '2023-11-14 12:33:05', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1446, 12, '娑撴槒銆冮敍鍫濆敶瀹撳本膩瀵骏绱?, '12', 'infra_codegen_template_type', 0, '', '', '', '1', '2023-11-14 12:33:31', '1', '2023-11-14 12:33:31', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1529, 1, '婢?, '1', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:26', '1', '2024-03-29 22:50:26', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1530, 2, '閸?, '2', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:36', '1', '2024-03-29 22:50:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1531, 3, '閺?, '3', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:50:46', '1', '2024-03-29 22:50:54', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1532, 4, '鐎涳絽瀹?, '4', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:01', '1', '2024-03-29 22:51:01', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1533, 5, '楠?, '5', 'date_interval', 0, '', '', '', '1', '2024-03-29 22:51:07', '1', '2024-03-29 22:51:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1537, 1, 'OpenAI', 'OpenAI', 'ai_platform', 0, '', '', '', '1', '2024-05-09 22:33:47', '1', '2024-05-09 22:58:46', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1538, 2, 'Ollama', 'Ollama', 'ai_platform', 0, '', '', '', '1', '2024-05-17 23:02:55', '1', '2024-05-17 23:02:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1539, 3, '閺傚洤绺炬稉鈧懛鈧?, 'YiYan', 'ai_platform', 0, '', '', '', '1', '2024-05-18 09:24:20', '1', '2024-05-18 09:29:01', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1540, 4, '鐠侇垶顥ｉ弰鐔轰紑', 'XingHuo', 'ai_platform', 0, '', '', '', '1', '2024-05-18 10:08:56', '1', '2024-05-18 10:08:56', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1541, 5, '闁矮绠熼崡鍐６', 'TongYi', 'ai_platform', 0, '', '', '', '1', '2024-05-18 10:32:29', '1', '2024-07-06 15:42:29', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1542, 6, 'StableDiffusion', 'StableDiffusion', 'ai_platform', 0, '', '', '', '1', '2024-06-01 15:09:31', '1', '2024-06-01 15:10:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1543, 10, '鏉╂稖顢戞稉?, '10', 'ai_image_status', 0, 'primary', '', '', '1', '2024-06-26 20:51:41', '1', '2024-06-26 20:52:48', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1544, 20, '瀹告彃鐣幋?, '20', 'ai_image_status', 0, 'success', '', '', '1', '2024-06-26 20:52:07', '1', '2024-06-26 20:52:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1545, 30, '瀹告彃銇戠拹?, '30', 'ai_image_status', 0, 'warning', '', '', '1', '2024-06-26 20:52:25', '1', '2024-06-26 20:52:35', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1546, 7, 'Midjourney', 'Midjourney', 'ai_platform', 0, '', '', '', '1', '2024-06-26 22:14:46', '1', '2024-06-26 22:14:46', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1547, 10, '鏉╂稖顢戞稉?, '10', 'ai_music_status', 0, 'primary', '', '', '1', '2024-06-27 22:45:22', '1', '2024-06-28 00:56:17', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1548, 20, '瀹告彃鐣幋?, '20', 'ai_music_status', 0, 'success', '', '', '1', '2024-06-27 22:45:33', '1', '2024-06-28 00:56:18', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1549, 30, '瀹告彃銇戠拹?, '30', 'ai_music_status', 0, 'danger', '', '', '1', '2024-06-27 22:45:44', '1', '2024-06-28 00:56:19', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1550, 1, '濮濆矁鐦濆Ο鈥崇础', '1', 'ai_generate_mode', 0, '', '', '', '1', '2024-06-27 22:46:31', '1', '2024-06-28 01:22:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1551, 2, '閹诲繗鍫Ο鈥崇础', '2', 'ai_generate_mode', 0, '', '', '', '1', '2024-06-27 22:46:37', '1', '2024-06-28 01:22:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1552, 8, 'Suno', 'Suno', 'ai_platform', 0, '', '', '', '1', '2024-06-29 09:13:36', '1', '2024-06-29 09:13:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1553, 9, 'DeepSeek', 'DeepSeek', 'ai_platform', 0, '', '', '', '1', '2024-07-06 12:04:30', '1', '2024-07-06 12:05:20', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1554, 13, '閺呴缚姘?, 'ZhiPu', 'ai_platform', 0, '', '', '', '1', '2024-07-06 18:00:35', '1', '2025-02-24 20:18:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1555, 4, '闂€?, '4', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:49:03', '1', '2024-07-07 15:49:03', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1556, 5, '濞堜絻鎯?, '5', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:49:54', '1', '2024-07-07 15:49:54', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1557, 6, '閺傚洨鐝?, '6', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:05', '1', '2024-07-07 15:50:05', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1558, 7, '閸楁艾顓归弬鍥╃彿', '7', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:23', '1', '2024-07-07 15:50:23', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1559, 8, '閹櫕纭?, '8', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:31', '1', '2024-07-07 15:50:31', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1560, 9, '婢堆呯堪', '9', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:50:37', '1', '2024-07-07 15:50:37', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1561, 1, '閼奉亜濮?, '1', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:06', '1', '2024-07-07 15:51:06', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1562, 2, '閸欏鏉?, '2', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:19', '1', '2024-07-07 15:51:19', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1563, 3, '闂呭繑鍓?, '3', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:27', '1', '2024-07-07 15:51:27', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1564, 4, '閸欏銈?, '4', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:37', '1', '2024-07-07 15:51:37', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1565, 5, '娑撴挷绗?, '5', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:51:49', '1', '2024-07-07 15:52:02', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1566, 6, '鐠囨瑨鐨?, '6', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:52:15', '1', '2024-07-07 15:52:15', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1567, 7, '閺堝鍙?, '7', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:52:24', '1', '2024-07-07 15:52:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1568, 8, '濮濓絽绱?, '8', 'ai_write_tone', 0, '', '', '', '1', '2024-07-07 15:54:33', '1', '2024-07-07 15:54:33', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1570, 1, '閼奉亜濮?, '1', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:19:34', '1', '2024-07-07 15:19:34', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1571, 2, '閻㈤潧鐡欓柇顔绘', '2', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:19:50', '1', '2024-07-07 15:49:30', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1572, 3, '濞戝牊浼?, '3', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:20:01', '1', '2024-07-07 15:49:38', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1573, 4, '鐠囧嫯顔?, '4', 'ai_write_format', 0, '', '', '', '1', '2024-07-07 15:20:13', '1', '2024-07-07 15:49:45', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1574, 1, '閼奉亜濮?, '1', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:18', '1', '2024-07-07 15:44:18', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1575, 2, '娑擃厽鏋?, '2', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:28', '1', '2024-07-07 15:44:28', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1576, 3, '閼昏鲸鏋?, '3', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:44:37', '1', '2024-07-07 15:44:37', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1577, 4, '闂娾晞顕?, '4', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:46:28', '1', '2024-07-07 15:46:28', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1578, 5, '閺冦儴顕?, '5', 'ai_write_language', 0, '', '', '', '1', '2024-07-07 15:46:44', '1', '2024-07-07 15:46:44', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1579, 1, '閼奉亜濮?, '1', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:34', '1', '2024-07-07 15:48:34', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1580, 2, '閻?, '2', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:44', '1', '2024-07-07 15:48:44', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1581, 3, '娑擃厾鐡?, '3', 'ai_write_length', 0, '', '', '', '1', '2024-07-07 15:48:52', '1', '2024-07-07 15:48:52', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1584, 1, '閹炬澘鍟?, '1', 'ai_write_type', 0, '', '', '', '1', '2024-07-10 21:26:00', '1', '2024-07-10 21:26:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1585, 2, '閸ョ偛顦?, '2', 'ai_write_type', 0, '', '', '', '1', '2024-07-10 21:26:06', '1', '2024-07-10 21:26:06', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1586, 2, '閼垫崘顔嗘禍?, 'TENCENT', 'system_sms_channel_code', 0, '', '', '', '1', '2024-07-22 22:23:16', '1', '2024-07-22 22:23:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1587, 3, '閸楀簼璐熸禍?, 'HUAWEI', 'system_sms_channel_code', 0, '', '', '', '1', '2024-07-22 22:23:46', '1', '2024-07-22 22:23:53', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1588, 1, 'OpenAI 瀵邦喛钂?, 'AzureOpenAI', 'ai_platform', 0, '', '', '', '1', '2024-08-10 14:07:41', '1', '2024-08-10 14:07:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1591, 4, '娑撳啰澧版禍?, 'QINIU', 'system_sms_channel_code', 0, '', '', '', '1', '2024-08-31 08:45:03', '1', '2024-08-31 08:45:24', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1683, 10, '鐎涙濡挒鍡楀瘶', 'DouBao', 'ai_platform', 0, '', '', '', '1', '2025-02-23 19:51:40', '1', '2025-02-23 19:52:02', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1684, 11, '閼垫崘顔嗗ǎ宄板帗', 'HunYuan', 'ai_platform', 0, '', '', '', '1', '2025-02-23 20:58:04', '1', '2025-02-23 20:58:04', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1685, 12, '绾懎鐔€濞翠礁濮?, 'SiliconFlow', 'ai_platform', 0, '', '', '', '1', '2025-02-24 20:19:09', '1', '2025-02-24 20:19:09', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1686, 1, '閼卞﹤銇?, '1', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:26:34', '1', '2025-03-03 12:26:34', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1687, 2, '閸ユ儳鍎?, '2', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:27:23', '1', '2025-03-03 12:27:23', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1688, 3, '闂婃娊顣?, '3', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:27:51', '1', '2025-03-03 12:27:51', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1689, 4, '鐟欏棝顣?, '4', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:03', '1', '2025-03-03 12:28:03', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1690, 5, '閸氭垿鍣?, '5', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:15', '1', '2025-03-03 12:28:15', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1691, 6, '闁插秵甯?, '6', 'ai_model_type', 0, '', '', '', '1', '2025-03-03 12:28:26', '1', '2025-03-03 12:28:26', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1692, 14, 'MiniMax', 'MiniMax', 'ai_platform', 0, '', '', '', '1', '2025-03-11 20:04:51', '1', '2025-03-11 20:04:51', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1693, 15, '閺堝牅绠ｉ弳妤呮桨', 'Moonshot', 'ai_platform', 0, '', '', '', '1', '2025-03-11 20:05:08', '1', '2025-11-24 07:17:39', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3000, 16, '閻ф儳绐涢弲楦垮厴', 'BaiChuan', 'ai_platform', 0, '', '', '', '1', '2025-03-23 12:15:46', '1', '2025-03-23 12:15:46', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3001, 40, 'Vben5.0 Ant Design Schema 濡紕澧?, '40', 'infra_codegen_front_type', 0, '', '', NULL, '1', '2025-04-23 21:47:47', '1', '2025-09-04 23:25:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3028, 2, 'Anthropic', 'Anthropic', 'ai_platform', 0, '', '', '', '1', '2025-08-21 22:54:24', '1', '2025-08-21 22:57:58', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3029, 2, '鐠嬮攱鐡?Gemini', 'Gemini', 'ai_platform', 0, '', '', '', '1', '2025-08-22 22:39:35', '1', '2025-08-22 22:44:49', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3030, 1, '閺傚洣娆㈢化鑽ょ埠', 'filesystem', 'ai_mcp_client_name', 0, '', '', '', '1', '2025-08-28 13:58:43', '1', '2025-08-28 21:19:42', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3031, 41, 'Vben5.0 Ant Design 閺嶅洤鍣Ο锛勫', '41', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:07', '1', '2025-09-04 23:26:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3032, 50, 'Vben5.0 Element Plus Schema 濡紕澧?, '50', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:38', '1', '2025-09-04 23:26:38', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3033, 51, 'Vben5.0 Element Plus 閺嶅洤鍣Ο锛勫', '51', 'infra_codegen_front_type', 0, '', '', '', '1', '2025-09-04 23:26:49', '1', '2025-09-04 23:26:49', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3035, 40, '閺€顖欑帛鐎规繂鐨粙瀣碍', '40', 'system_social_type', 0, '', '', '', '1', '2023-11-04 13:05:38', '1', '2023-11-04 13:07:16', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3036, 60, 'Admin Uniapp 缁夎濮╃粩?, '60', 'infra_codegen_front_type', 0, '', '', NULL, '1', '2025-12-16 19:25:51', '1', '2025-12-17 09:46:15', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3037, 42, 'Vben5.0 Antdv Next Schema 濡紕澧?, '42', 'infra_codegen_front_type', 0, '', '', '', '1', '2026-05-23 13:52:25', '1', '2026-05-23 13:52:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3038, 43, 'Vben5.0 Antdv Next 閺嶅洤鍣Ο锛勫', '43', 'infra_codegen_front_type', 0, '', '', '', '1', '2026-05-23 13:52:25', '1', '2026-05-23 13:52:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3525, 1, '濮濓絽鐖?, '0', 'im_message_status', 0, 'success', '', '濮濓絽鐖堕敍鍫濆灥婵濮搁幀渚婄礆', 'admin', '2026-04-30 15:14:36', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3526, 2, '瀹稿弶鎸欓崶?, '2', 'im_message_status', 0, 'danger', '', '瀹稿弶鎸欓崶?, 'admin', '2026-04-30 15:14:36', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3530, 1, '娑撳秹娓剁憰浣告礀閹?, '0', 'im_message_receipt_status', 0, 'info', '', 'NO_RECEIPT', 'admin', '2026-04-30 11:35:07', 'admin', '2026-06-14 00:32:47', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3531, 2, '瀵板懎鐣幋?, '1', 'im_message_receipt_status', 0, 'warning', '', 'PENDING', 'admin', '2026-04-30 11:35:07', 'admin', '2026-06-14 00:32:47', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3532, 3, '瀹告彃鐣幋?, '2', 'im_message_receipt_status', 0, 'success', '', 'DONE', 'admin', '2026-04-30 11:35:07', 'admin', '2026-06-14 00:32:47', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3540, 1, '濮濓絽鐖?, '0', 'im_friend_status', 0, 'success', '', '濮濓絽鐖舵總钘夊几閸忓磭閮?, 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3541, 2, '瀹告彃鍨归梽?, '1', 'im_friend_status', 0, 'danger', '', '瀹告彃鍨归梽銈呫偨閸欏鍙х化?, 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3550, 1, '濮濓絽鐖?, '0', 'im_group_status', 0, 'success', '', '缂囥倖顒滅敮?, 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3551, 2, '瀹歌尪袙閺?, '1', 'im_group_status', 0, 'info', '', '缂囥倕鍑＄憴锝嗘殠', 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3552, 1, '缂囥倓瀵?, '1', 'im_group_member_role', 0, 'primary', '', NULL, '1', '2026-05-02 02:14:12', '1', '2026-05-02 02:14:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3553, 2, '缁狅紕鎮婇崨?, '2', 'im_group_member_role', 0, 'warning', '', NULL, '1', '2026-05-02 02:14:12', '1', '2026-05-02 02:14:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3554, 3, '閺咁噣鈧碍鍨氶崨?, '3', 'im_group_member_role', 0, 'info', '', NULL, '1', '2026-05-02 02:14:12', '1', '2026-05-02 02:14:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3555, 1, '閹兼粎鍌?, '1', 'im_friend_add_source', 0, 'default', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-05 11:46:57', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3556, 2, '缂囥倛浜?, '2', 'im_friend_add_source', 0, 'default', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-05 11:46:53', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3557, 3, '閹殿偆鐖?, '3', 'im_friend_add_source', 0, 'default', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-05 11:46:50', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3558, 4, '閸氬秶澧?, '4', 'im_friend_add_source', 0, 'default', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-05 11:46:48', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3559, 1, '缁涘绶熸宀冪槈', '0', 'im_friend_request_handle_result', 0, 'warning', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-04 02:43:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3560, 2, '瀹稿弶鍧婇崝?, '1', 'im_friend_request_handle_result', 0, 'success', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-04 02:43:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3561, 3, '瀹稿弶瀚嗙紒?, '2', 'im_friend_request_handle_result', 0, 'info', '', NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-04 02:43:41', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3562, 101, '閺傚洦婀?, '101', 'im_content_type', 0, '', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3563, 102, '閸ュ墽澧?, '102', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3564, 103, '鐠囶參鐓?, '103', 'im_content_type', 0, 'warning', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3565, 104, '鐟欏棝顣?, '104', 'im_content_type', 0, 'warning', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3566, 105, '閺傚洣娆?, '105', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3568, 2101, '閹俱倕娲?, '2101', 'im_content_type', 0, 'danger', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3569, 2200, '閸ョ偞澧?, '2200', 'im_content_type', 0, 'warning', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3570, 2201, '瀹歌尪顕?, '2201', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3571, 1501, '缂囥倕鍨卞?, '1501', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3572, 1502, '缂囥倓淇婇幁顖氬綁閺?, '1502', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3573, 1503, '閺€璺哄煂閺傛壆娈戦崗銉у參閻㈠疇顕?, '1503', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3574, 1504, '閹存劕鎲抽柅鈧紘?, '1504', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3575, 1505, '閸忋儳鍏㈤悽瀹狀嚞鐞氼偄鎮撻幇?, '1505', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3576, 1506, '閸忋儳鍏㈤悽瀹狀嚞鐞氼偅瀚嗙紒?, '1506', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3577, 1507, '缂囥倓瀵屾潪顒冾唨', '1507', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3578, 1508, '閹存劕鎲崇悮顐ば╅崙?, '1508', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3579, 1509, '閹存劕鎲抽崝鐘插弳', '1509', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3580, 1510, '閼奉亞鏁辨潻娑氬參', '1510', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3581, 1511, '缂囥倛袙閺?, '1511', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3582, 1512, '閹存劕鎲崇粋浣解枅', '1512', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3583, 1513, '閹存劕鎲抽崣鏍ㄧХ缁備浇鈻?, '1513', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3584, 1514, '閸忋劎鍏㈢粋浣解枅', '1514', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3585, 1515, '閸忋劎鍏㈤崣鏍ㄧХ缁備浇鈻?, '1515', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3586, 1516, '閹存劕鎲抽弰鐢敌為崣妯绘纯', '1516', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3587, 1517, '濞ｈ濮炵粻锛勬倞閸?, '1517', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3588, 1518, '閹俱倝鏀㈢粻锛勬倞閸?, '1518', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3589, 1519, '缂囥倕鍙曢崨濠傚綁閺?, '1519', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3590, 1520, '缂囥倕鎮曢崣妯绘纯', '1520', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3591, 1531, '缂囥倖绉烽幁顖滅枂妞?, '1531', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3592, 1532, '缂囥倖绉烽幁顖氬絿濞戝牏鐤嗘い?, '1532', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3593, 1533, '缂囥倕鐨濈粋浣稿綁閺?, '1533', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 11:52:30', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3594, 1204, '閺傛澘顤冩總钘夊几', '1204', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-05-05 13:26:53', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3595, 1205, '婵傝棄寮哥悮顐㈠灩闂?, '1205', 'im_content_type', 0, 'warning', '', NULL, 'admin', '2026-05-05 13:26:53', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3596, 1, '閹兼粎鍌?, '1', 'im_group_add_source', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3597, 2, '闁偓鐠?, '2', 'im_group_add_source', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3598, 3, '閹殿偆鐖?, '3', 'im_group_add_source', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3599, 4, '閸掑棔闊╅柧鐐复', '4', 'im_group_add_source', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3600, 1, '閺堫亜顦╅悶?, '0', 'im_group_request_handle_result', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3601, 2, '閸氬本鍓?, '1', 'im_group_request_handle_result', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3602, 3, '閹锋帞绮?, '2', 'im_group_request_handle_result', 0, '', '', NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061096, 1, '鐠囶參鐓?, '1', 'im_rtc_call_media_type', 0, '', '', '鐠囶參鐓堕柅姘崇樈', 'admin', '2026-05-16 11:34:50', 'admin', '2026-05-16 11:34:50', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061097, 2, '鐟欏棝顣?, '2', 'im_rtc_call_media_type', 0, '', '', '鐟欏棝顣堕柅姘崇樈', 'admin', '2026-05-16 11:34:50', 'admin', '2026-05-16 11:34:50', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061098, 1, '缁変浇浜?, '1', 'im_rtc_call_conversation_type', 0, 'primary', '', '娑撯偓鐎甸€涚缁変浇浜伴柅姘崇樈', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061099, 2, '缂囥倛浜?, '2', 'im_rtc_call_conversation_type', 0, 'success', '', '缂囥倕鍞存径姘眽闁俺鐦?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061100, 1, '閸掓稑缂?, '10', 'im_rtc_call_status', 0, 'info', '', '闁俺鐦藉鎻掑灡瀵ょ尨绱濈粵澶婄窡閹恒儵鈧?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061101, 2, '鏉╂稖顢戞稉?, '20', 'im_rtc_call_status', 0, 'primary', '', '瀹稿弶婀佹禍鐑樺复闁熬绱濋柅姘崇樈娑?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061102, 3, '瀹歌尙绮ㄩ弶?, '30', 'im_rtc_call_status', 0, 'success', '', '闁俺鐦界紒鎾存将', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061103, 1, '闁俺鐦界紒鎾存将', '1', 'im_rtc_call_end_reason', 0, 'success', '', '閹恒儵鈧艾鎮楁禒璁崇閺傞€涘瘜閸斻劍瀵曢弬?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061104, 2, '瀹稿弶瀚嗙紒?, '2', 'im_rtc_call_end_reason', 0, 'warning', '', '鐞氼偄褰ㄩ幒銉┾偓姘閻愯瀚嗛幒?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061105, 3, '瀹告彃褰囧☉?, '3', 'im_rtc_call_end_reason', 0, 'info', '', '娑撹褰ㄩ幒銉┾偓姘娑撹濮╅崣鏍ㄧХ', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061106, 4, '閺冪姳姹夐幒銉ユ儔', '4', 'im_rtc_call_end_reason', 0, 'info', '', '閹割垶鎼╃搾鍛閺堫亝甯撮柅?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061107, 5, '鐎佃鏌熷锝呯箹', '5', 'im_rtc_call_end_reason', 0, 'warning', '', '鐎佃鏌熼崷銊ュ綗娑撯偓闁俺鐦芥稉?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061108, 6, '闁俺鐦藉鍌氱埗', '9', 'im_rtc_call_end_reason', 0, 'danger', '', '缂冩垹绮舵稉顓熸焽閵嗕浇顔曟径鍥с亼鐠愩儳鐡?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061109, 1, '閸欐垼鎹ｆ禍?, '1', 'im_rtc_participant_role', 0, 'primary', '', '闁俺鐦介崣鎴ｆ崳閼?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061110, 2, '鐞氼偊鍊嬬拠鐤偓?, '2', 'im_rtc_participant_role', 0, 'info', '', '鐞氼偊鍊嬬拠宄板閸?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061111, 3, '娑撹濮╅崝鐘插弳閼?, '3', 'im_rtc_participant_role', 0, 'success', '', '缂囥倝鈧俺鐦介崷鐑樻珯閿涘本姊虹憴鍌濃偓鍛瘜閸斻劌濮為崗?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061112, 1, '闁偓鐠囪渹鑵?, '10', 'im_rtc_participant_status', 0, 'info', '', '瀹告彃褰傞崙?invite閿涘瞼鐡戝鍛惙鎼?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061113, 2, '瀹告彃濮為崗?, '20', 'im_rtc_participant_status', 0, 'primary', '', '瀹稿弶甯撮柅姘嫙鏉╂稑鍙嗛幋鍧楁？', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061114, 3, '瀹稿弶瀚嗙紒?, '30', 'im_rtc_participant_status', 0, 'warning', '', '閹恒儵鈧艾澧犻悙瑙勫珕閹?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061115, 4, '閺堫亜绨茬粵?, '40', 'im_rtc_participant_status', 0, 'info', '', '闁俺鐦藉鑼波閺夌喍绮涢張顏勭安缁?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061116, 5, '瀹歌尙顬囧鈧?, '50', 'im_rtc_participant_status', 0, 'success', '', '閹恒儵鈧艾鎮楅幐鍌涙焽 / 缁傝绱?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061117, 1610, '闁俺鐦藉鈧慨?, '1610', 'im_content_type', 0, 'info', '', '閸忋儲绉烽幁顖涚ウ閿涙稓顫嗛懕濠傜暰閸氭垿鈧氨鐓￠敍宀€鍏㈤懕濠傚弿閸涙ê绠嶉幘?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061118, 1611, '闁俺鐦界紒鎾存将', '1611', 'im_content_type', 0, 'info', '', '閸忋儲绉烽幁顖涚ウ閿涙稓顫嗛懕濠傚櫙濮樻梹鍦洪敍宀€鍏㈤懕濠勯兇缂?tip', 'admin', '2026-05-18 03:36:12', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061119, 125, '缁辩姵娼?, '125', 'im_content_type', 0, 'success', '', '妫版垿浜炬潻鎰儉閹恒劑鈧胶娈戦崶鐐瀮閸楋紕澧栧☉鍫熶紖', '1', '2026-05-18 13:14:34', 'admin', '2026-06-16 03:41:55', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061120, 1, '鐎靛本鏋冮張?, '1', 'im_channel_material_type', 0, 'primary', '', '', '1', '2026-05-19 14:09:25', '1', '2026-05-19 14:09:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061121, 2, '婢舵牠鎽?, '2', 'im_channel_material_type', 0, 'info', '', '', '1', '2026-05-19 14:09:25', '1', '2026-05-19 14:09:25', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061123, 107, '閸氬牆鑻熸潪顒€褰?, '107', 'im_content_type', 0, '', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061124, 108, '閸氬秶澧?, '108', 'im_content_type', 0, '', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061125, 115, '鐞涖劍鍎?, '115', 'im_content_type', 0, '', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061126, 1201, '婵傝棄寮搁悽瀹狀嚞鐞氼偄鎮撻幇?, '1201', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061127, 1202, '婵傝棄寮搁悽瀹狀嚞鐞氼偅瀚嗙紒?, '1202', 'im_content_type', 0, 'warning', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061128, 1203, '閺€璺哄煂閺傛壆娈戞總钘夊几閻㈠疇顕?, '1203', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061129, 1207, '閸旂姴鍙嗘鎴濇倳閸?, '1207', 'im_content_type', 0, 'danger', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061130, 1208, '缁夎鍤鎴濇倳閸?, '1208', 'im_content_type', 0, 'success', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061131, 1209, '婵傝棄寮哥挧鍕灐閸欐ɑ娲?, '1209', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061132, 1210, '婵傝棄寮告穱鈩冧紖閹靛綊鍣洪弴瀛樻煀', '1210', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061133, 1530, '缂囥倖鍨氶崨妯归嚋娴滈缚顔曠純顔煎綁閺?, '1530', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061134, 1601, '闁俺鐦芥穱鈥叉姢', '1601', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061135, 1602, '闁俺鐦介崣鍌欑瑢閼板懎濮為崗?, '1602', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
INSERT INTO `system_dict_data` (`id`, `sort`, `label`, `value`, `dict_type`, `status`, `color_type`, `css_class`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1061136, 1603, '闁俺鐦介崣鍌欑瑢閼板懐顬囧鈧?, '1603', 'im_content_type', 0, 'info', '', NULL, 'admin', '2026-06-16 03:47:00', 'admin', '2026-06-16 03:47:00', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_type`;
CREATE TABLE `system_dict_type`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐎涙鍚€娑撳鏁?,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎涙鍚€閸氬秶袨',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎涙鍚€缁鐎?,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '閸掔娀娅庨弮鍫曟？',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061099 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎涙鍚€缁鐎风悰?;

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1, '閻劍鍩涢幀褍鍩?, 'system_user_sex', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2022-05-16 20:29:32', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (6, '閸欏倹鏆熺猾璇茬€?, 'infra_config_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:36:54', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (7, '闁氨鐓＄猾璇茬€?, 'system_notice_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:35:26', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (9, '閹垮秳缍旂猾璇茬€?, 'infra_operate_type', 0, NULL, 'admin', '2021-01-05 17:03:48', '1', '2024-03-14 12:44:01', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (10, '缁崵绮洪悩鑸碘偓?, 'common_status', 0, NULL, 'admin', '2021-01-05 17:03:48', '', '2022-02-01 16:21:28', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (11, 'Boolean 閺勵垰鎯佺猾璇茬€?, 'infra_boolean_string', 0, 'boolean 鏉烆剚妲搁崥?, '', '2021-01-19 03:20:08', '', '2022-02-01 16:37:10', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (104, '閻у妾扮紒鎾寸亯', 'system_login_result', 0, '閻у妾扮紒鎾寸亯', '', '2021-01-18 06:17:11', '', '2022-02-01 16:36:00', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (106, '娴狅絿鐖滈悽鐔稿灇濡剝婢樼猾璇茬€?, 'infra_codegen_template_type', 0, NULL, '', '2021-02-05 07:08:06', '1', '2022-05-16 20:26:50', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (107, '鐎规碍妞傛禒璇插閻樿埖鈧?, 'infra_job_status', 0, NULL, '', '2021-02-07 07:44:16', '', '2022-02-01 16:51:11', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (108, '鐎规碍妞傛禒璇插閺冦儱绻旈悩鑸碘偓?, 'infra_job_log_status', 0, NULL, '', '2021-02-08 10:03:51', '', '2022-02-01 16:50:43', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (109, '閻劍鍩涚猾璇茬€?, 'user_type', 0, NULL, '', '2021-02-26 00:15:51', '', '2021-02-26 00:15:51', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (110, 'API 瀵倸鐖堕弫鐗堝祦閻ㄥ嫬顦╅悶鍡欏Ц閹?, 'infra_api_error_log_process_status', 0, NULL, '', '2021-02-26 07:07:01', '', '2022-02-01 16:50:53', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (111, '閻厺淇婂〒鐘讳壕缂傛牜鐖?, 'system_sms_channel_code', 0, NULL, '1', '2021-04-05 01:04:50', '1', '2022-02-16 02:09:08', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (112, '閻厺淇婂Ο鈩冩緲閻ㄥ嫮琚崹?, 'system_sms_template_type', 0, NULL, '1', '2021-04-05 21:50:43', '1', '2022-02-01 16:35:06', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (113, '閻厺淇婇崣鎴︹偓浣哄Ц閹?, 'system_sms_send_status', 0, NULL, '1', '2021-04-11 20:18:03', '1', '2022-02-01 16:35:09', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (114, '閻厺淇婇幒銉︽暪閻樿埖鈧?, 'system_sms_receive_status', 0, NULL, '1', '2021-04-11 20:27:14', '1', '2022-02-01 16:35:14', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (116, '閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, 'system_login_type', 0, '閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, '1', '2021-10-06 00:50:46', '1', '2022-02-01 16:35:56', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (144, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, 'infra_codegen_scene', 0, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, '1', '2022-02-02 13:14:45', '1', '2022-03-10 16:33:46', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (145, '鐟欐帟澹婄猾璇茬€?, 'system_role_type', 0, '鐟欐帟澹婄猾璇茬€?, '1', '2022-02-16 13:01:46', '1', '2022-02-16 13:01:46', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (146, '閺傚洣娆㈢€涙ê鍋嶉崳?, 'infra_file_storage', 0, '閺傚洣娆㈢€涙ê鍋嶉崳?, '1', '2022-03-15 00:24:38', '1', '2022-03-15 00:24:38', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (147, 'OAuth 2.0 閹哄牊娼堢猾璇茬€?, 'system_oauth2_grant_type', 0, 'OAuth 2.0 閹哄牊娼堢猾璇茬€烽敍鍫熌佸蹇ョ礆', '1', '2022-05-12 00:20:52', '1', '2022-05-11 16:25:49', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (160, '缂佸牏顏?, 'terminal', 0, '缂佸牏顏?, '1', '2022-12-10 10:50:50', '1', '2022-12-10 10:53:11', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (166, '闁喕娆㈤崣鎴︹偓浣哄Ц閹?, 'system_mail_send_status', 0, '闁喕娆㈤崣鎴︹偓浣哄Ц閹?, '1', '2023-01-26 09:53:13', '1', '2023-01-26 09:53:13', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (167, '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, 'system_notify_template_type', 0, '缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, '1', '2023-01-28 10:35:10', '1', '2023-01-28 10:35:10', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (168, '娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬澧犵粩顖滆閸?, 'infra_codegen_front_type', 0, '', '1', '2023-04-12 23:57:52', '1', '2023-04-12 23:57:52', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (601, '缁€鍙ユ唉缁鐎?, 'system_social_type', 0, '', '1', '2023-11-04 13:03:54', '1', '2023-11-04 13:03:54', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (616, '閺冨爼妫块梻鎾', 'date_interval', 0, '', '1', '2024-03-29 22:50:09', '1', '2024-03-29 22:50:09', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (620, 'AI 濡€崇€烽獮鍐插酱', 'ai_platform', 0, '', '1', '2024-05-09 22:27:38', '1', '2024-05-09 22:27:38', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (621, 'AI 缂佹鏁鹃悩鑸碘偓?, 'ai_image_status', 0, '', '1', '2024-06-26 20:51:23', '1', '2024-06-26 20:51:23', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (622, 'AI 闂婂厖绠伴悩鑸碘偓?, 'ai_music_status', 0, '', '1', '2024-06-27 22:45:07', '1', '2024-06-28 00:56:27', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (623, 'AI 闂婂厖绠伴悽鐔稿灇濡€崇础', 'ai_generate_mode', 0, '', '1', '2024-06-27 22:46:21', '1', '2024-06-28 01:22:29', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (624, '閸愭瑤缍旂拠顓熺毜', 'ai_write_tone', 0, '', '1', '2024-07-07 15:19:02', '1', '2024-07-07 15:19:02', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (625, '閸愭瑤缍旂拠顓♀枅', 'ai_write_language', 0, '', '1', '2024-07-07 15:18:52', '1', '2024-07-07 15:18:52', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (626, '閸愭瑤缍旈梹鍨', 'ai_write_length', 0, '', '1', '2024-07-07 15:18:41', '1', '2024-07-07 15:18:41', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (627, '閸愭瑤缍旈弽鐓庣础', 'ai_write_format', 0, '', '1', '2024-07-07 15:14:34', '1', '2024-07-07 15:14:34', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (628, 'AI 閸愭瑤缍旂猾璇茬€?, 'ai_write_type', 0, '', '1', '2024-07-10 21:25:29', '1', '2024-07-10 21:25:29', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (640, 'AI 濡€崇€风猾璇茬€?, 'ai_model_type', 0, '', '1', '2025-03-03 12:24:07', '1', '2025-03-03 12:24:07', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2007, 'AI MCP 鐎广垺鍩涚粩顖氭倳鐎?, 'ai_mcp_client_name', 0, '', '1', '2025-08-28 13:57:40', '1', '2025-08-28 13:57:40', b'0', '1970-01-01 00:00:00');
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2200, 'IM 閸愬懎顔愮猾璇茬€?, 'im_content_type', 0, '鐎电懓绨?ImContentTypeEnum', 'admin', '2026-04-30 11:35:07', 'admin', '2026-06-16 03:41:55', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2202, 'IM 濞戝牊浼呴崶鐐村⒔閻樿埖鈧?, 'im_message_receipt_status', 0, '鐎电懓绨?ImMessageReceiptStatusEnum', 'admin', '2026-04-30 11:35:07', 'admin', '2026-06-16 03:41:55', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2203, 'IM 婵傝棄寮搁悩鑸碘偓?, 'im_friend_status', 0, '0=濮濓絽鐖?/ 1=瀹告彃鍨归梽?, 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2204, 'IM 缂囥倗濮搁幀?, 'im_group_status', 0, '0=濮濓絽鐖?/ 1=瀹歌尪袙閺?, 'admin', '2026-04-30 11:35:07', 'admin', '2026-04-30 11:35:07', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2205, 'IM 濞戝牊浼呴悩鑸碘偓?, 'im_message_status', 0, '鐎电懓绨?ImMessageStatusEnum閿?=濮濓絽鐖?/ 2=瀹稿弶鎸欓崶鐑囩礄缁変浇浜?/ 缂囥倛浜伴崗杈╂暏閿?, 'admin', '2026-04-30 15:14:36', 'admin', '2026-06-16 03:41:55', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2206, 'IM 缂囥倖鍨氶崨妯款潡閼?, 'im_group_member_role', 0, NULL, '1', '2026-05-02 02:14:12', '1', '2026-05-02 02:14:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2207, 'IM 婵傝棄寮稿ǎ璇插閺夈儲绨?, 'im_friend_add_source', 0, NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-04 02:43:41', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2208, 'IM 婵傝棄寮搁悽瀹狀嚞婢跺嫮鎮婄紒鎾寸亯', 'im_friend_request_handle_result', 0, NULL, '1', '2026-05-04 02:43:41', '1', '2026-05-04 02:43:41', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2209, 'IM 閸旂姷鍏㈤弶銉︾爱', 'im_group_add_source', 0, NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (2210, 'IM 閸旂姷鍏㈤悽瀹狀嚞婢跺嫮鎮婄紒鎾寸亯', 'im_group_request_handle_result', 0, NULL, '', '2026-05-06 09:26:36', '', '2026-05-06 09:26:36', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061092, 'IM 闁俺鐦芥刊鎺嶇秼缁鐎?, 'im_rtc_call_media_type', 0, NULL, 'admin', '2026-05-16 11:34:50', 'admin', '2026-05-16 11:34:50', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061093, 'IM 闁俺鐦芥导姘崇樈缁鐎?, 'im_rtc_call_conversation_type', 0, '1=缁変浇浜伴敍?=缂囥倛浜?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061094, 'IM 闁俺鐦介悩鑸碘偓?, 'im_rtc_call_status', 0, '10=閸掓稑缂撻敍?0=鏉╂稖顢戞稉顓ㄧ幢30=瀹歌尙绮ㄩ弶?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061095, 'IM 闁俺鐦界紒鎾存将閸樼喎娲?, 'im_rtc_call_end_reason', 0, '1=闁俺鐦界紒鎾存将閿?=瀹稿弶瀚嗙紒婵撶幢3=瀹告彃褰囧☉鍫幢4=閺冪姳姹夐幒銉ユ儔閿?=鐎佃鏌熷锝呯箹閿?=闁俺鐦藉鍌氱埗', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061096, 'IM 闁俺鐦介崣鍌欑瑢鐟欐帟澹?, 'im_rtc_participant_role', 0, '1=閸欐垼鎹ｆ禍鐚寸幢2=鐞氼偊鍊嬬拠鐤偓鍜冪幢3=娑撹濮╅崝鐘插弳閼?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061097, 'IM 闁俺鐦介崣鍌欑瑢閻樿埖鈧?, 'im_rtc_participant_status', 0, '10=闁偓鐠囪渹鑵戦敍?0=瀹告彃濮為崗銉幢30=瀹稿弶瀚嗙紒婵撶幢40=閺堫亜绨茬粵鏃撶幢50=瀹歌尙顬囧鈧?, 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0', NULL);
INSERT INTO `system_dict_type` (`id`, `name`, `type`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `deleted_time`) VALUES (1061098, 'IM 妫版垿浜剧槐鐘虫綏閸愬懎顔愮猾璇茬€?, 'im_channel_material_type', 0, '1=缁旀瑥鍞寸€靛本鏋冮張?/ 2=婢舵牠鎽?, '1', '2026-05-19 14:09:25', '1', '2026-05-19 14:09:25', b'0', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐠佸潡妫禝D',
  `log_type` bigint NOT NULL COMMENT '閺冦儱绻旂猾璇茬€?,
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚猾璇茬€?,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閻劍鍩涚拹锕€褰?,
  `result` tinyint NOT NULL COMMENT '閻у妾扮紒鎾寸亯',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩?IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濞村繗顫嶉崳?UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5367 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁崵绮虹拋鍧楁６鐠佹澘缍?;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_account`;
CREATE TABLE `system_mail_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁喚顔?,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涢崥?,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎靛棛鐖?,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SMTP 閺堝秴濮熼崳銊ョ厵閸?,
  `port` int NOT NULL COMMENT 'SMTP 閺堝秴濮熼崳銊ь伂閸?,
  `ssl_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯佸鈧崥?SSL',
  `starttls_enable` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯佸鈧崥?STARTTLS',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '闁喚顔堢拹锕€褰跨悰?;

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
BEGIN;
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, '7684413@qq.com', '7684413@qq.com', '1234576', '127.0.0.1', 8080, b'0', b'0', '1', '2023-01-25 17:39:52', '1', '2025-04-04 16:34:40', b'0');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 'ydym_test@163.com', 'ydym_test@163.com', 'WBZTEINMIFVRYSOE', 'smtp.163.com', 465, b'1', b'0', '1', '2023-01-26 01:26:03', '1', '2025-12-20 18:09:32', b'0');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3, '76854114@qq.com', '3335', '11234', 'yunai1.cn', 466, b'0', b'0', '1', '2023-01-27 15:06:38', '1', '2023-01-27 07:08:36', b'1');
INSERT INTO `system_mail_account` (`id`, `mail`, `username`, `password`, `host`, `port`, `ssl_enable`, `starttls_enable`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (4, '7685413x@qq.com', '2', '3', '4', 5, b'1', b'0', '1', '2023-04-12 23:05:06', '1', '2023-04-12 15:05:11', b'1');
COMMIT;

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_log`;
CREATE TABLE `system_mail_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `user_id` bigint NULL DEFAULT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `to_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹恒儲鏁归柇顔绢唸閸︽澘娼?,
  `cc_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹跺嫰鈧線鍋栫粻鍗炴勾閸р偓',
  `bcc_mails` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鐎靛棝鈧線鍋栫粻鍗炴勾閸р偓',
  `account_id` bigint NOT NULL COMMENT '闁喚顔堢拹锕€褰跨紓鏍у娇',
  `from_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欐垿鈧線鍋栫粻鍗炴勾閸р偓',
  `template_id` bigint NOT NULL COMMENT '濡剝婢樼紓鏍у娇',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢樼紓鏍垳',
  `template_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨',
  `template_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁喕娆㈤弽鍥暯',
  `template_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁喕娆㈤崘鍛啇',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闁喕娆㈤崣鍌涙殶',
  `send_status` tinyint NOT NULL DEFAULT 0 COMMENT '閸欐垿鈧胶濮搁幀?,
  `send_time` datetime NULL DEFAULT NULL COMMENT '閸欐垿鈧焦妞傞梻?,
  `send_message_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閸欐垿鈧浇绻戦崶鐐垫畱濞戝牊浼?ID',
  `send_exception` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閸欐垿鈧礁绱撶敮?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 368 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '闁喕娆㈤弮銉ョ箶鐞?;

-- ----------------------------
-- Records of system_mail_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
DROP TABLE IF EXISTS `system_mail_template`;
CREATE TABLE `system_mail_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀崥宥囆?,
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢樼紓鏍垳',
  `account_id` bigint NOT NULL COMMENT '閸欐垿鈧胶娈戦柇顔绢唸鐠愶箑褰跨紓鏍у娇',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閸欐垿鈧椒姹夐崥宥囆?,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀弽鍥暯',
  `content` varchar(10240) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀崘鍛啇',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欏倹鏆熼弫鎵矋',
  `status` tinyint NOT NULL COMMENT '瀵偓閸氼垳濮搁幀?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '闁喕娆㈠Ο锛勫鐞?;

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
BEGIN;
INSERT INTO `system_mail_template` (`id`, `name`, `code`, `account_id`, `nickname`, `title`, `content`, `params`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (13, '閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', 'admin-sms-login', 1, '婵傘儳澹掗弴?, '娴ｇ姷瀵介幋鎴犲', '<p>閹劎娈戞宀冪槈閻焦妲竰code}閿涘苯鎮曠€涙妲竰name}</p>', '[\"code\",\"name\"]', 0, '3', '1', '2021-10-11 08:10:00', '1', '2023-12-02 19:51:14', b'0');
INSERT INTO `system_mail_template` (`id`, `name`, `code`, `account_id`, `nickname`, `title`, `content`, `params`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (14, '濞村鐦Ο锛勫', 'test_01', 2, '閼哄澹?, '娑撯偓娑擃亝鐖ｆ０?, '<p>娴ｇ姵妲?{key01} 閸氭绱?/p><p><br></p><p>閺勵垳娈戠拠婵撶礉鐠у墎鎻?{key02} 娑撯偓娑撳绱?/p>', '[\"key01\",\"key02\"]', 0, NULL, '1', '2023-01-26 01:27:40', '1', '2025-07-26 21:48:45', b'0');
INSERT INTO `system_mail_template` (`id`, `name`, `code`, `account_id`, `nickname`, `title`, `content`, `params`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (15, '3', '2', 2, '7', '4', '<p>45</p>', '[]', 1, '80', '1', '2023-01-27 15:50:35', '1', '2025-07-26 21:47:49', b'1');
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閼挎粌宕烮D',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閼挎粌宕熼崥宥囆?,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閺夊啴妾洪弽鍥槕',
  `type` tinyint NOT NULL COMMENT '閼挎粌宕熺猾璇茬€?,
  `sort` int NOT NULL DEFAULT 0 COMMENT '閺勫墽銇氭い鍝勭碍',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '閻栨儼褰嶉崡鏃綝',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '鐠侯垳鏁遍崷鏉挎絻',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '閼挎粌宕熼崶鐐垼',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缂佸嫪娆㈢捄顖氱窞',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缂佸嫪娆㈤崥?,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '閼挎粌宕熼悩鑸碘偓?,
  `visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '閺勵垰鎯侀崣顖濐潌',
  `keep_alive` bit(1) NOT NULL DEFAULT b'1' COMMENT '閺勵垰鎯佺紓鎾崇摠',
  `always_show` bit(1) NOT NULL DEFAULT b'1' COMMENT '閺勵垰鎯侀幀缁樻Ц閺勫墽銇?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6735 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閼挎粌宕熼弶鍐鐞?;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, '缁崵绮虹粻锛勬倞', '', 1, 10, 0, '/system', 'ep:tools', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2025-03-15 21:30:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, '閸╄櫣顢呯拋鐐煢', '', 1, 20, 0, '/infra', 'ep:monitor', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-03-01 08:28:40', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5, 'OA 缁€杞扮伐', '', 1, 40, 1185, 'oa', 'fa:road', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2021-09-20 16:26:19', '1', '2024-02-29 12:38:13', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (100, '閻劍鍩涚粻锛勬倞', 'system:user:list', 2, 1, 1, 'user', 'ep:avatar', 'system/user/index', 'SystemUser', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2026-01-01 18:43:01', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (101, '鐟欐帟澹婄粻锛勬倞', '', 2, 2, 1, 'role', 'ep:user', 'system/role/index', 'SystemRole', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2026-01-05 19:30:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (102, '閼挎粌宕熺粻锛勬倞', '', 2, 3, 1, 'menu', 'ep:menu', 'system/menu/index', 'SystemMenu', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:03:50', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (103, '闁劑妫粻锛勬倞', '', 2, 4, 1, 'dept', 'fa:address-card', 'system/dept/index', 'SystemDept', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (104, '瀹€妞剧秴缁狅紕鎮?, '', 2, 5, 1, 'post', 'fa:address-book-o', 'system/post/index', 'SystemPost', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:06:39', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (105, '鐎涙鍚€缁狅紕鎮?, '', 2, 6, 1, 'dict', 'ep:collection', 'system/dict/index', 'SystemDictType', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:07:12', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (106, '闁板秶鐤嗙粻锛勬倞', '', 2, 8, 2, 'config', 'fa:connectdevelop', 'infra/config/index', 'InfraConfig', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:02:45', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (107, '闁氨鐓￠崗顒€鎲?, '', 2, 4, 2739, 'notice', 'ep:takeaway-box', 'system/notice/index', 'SystemNotice', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-22 23:56:17', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (108, '鐎孤ゎ吀閺冦儱绻?, '', 1, 9, 1, 'log', 'ep:document-copy', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:08:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (109, '娴犮倗澧濈粻锛勬倞', '', 2, 2, 1261, 'token', 'fa:key', 'system/oauth2/token/index', 'SystemTokenClient', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:13:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (110, '鐎规碍妞傛禒璇插', '', 2, 7, 2, 'job', 'fa-solid:tasks', 'infra/job/index', 'InfraJob', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:57:36', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (111, 'MySQL 閻╂垶甯?, '', 2, 1, 2740, 'druid', 'fa-solid:box', 'infra/druid/index', 'InfraDruid', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:05:58', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (112, 'Java 閻╂垶甯?, '', 2, 3, 2740, 'admin-server', 'ep:coffee-cup', 'infra/server/index', 'InfraAdminServer', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:57', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (113, 'Redis 閻╂垶甯?, '', 2, 2, 2740, 'redis', 'fa:reddit-square', 'infra/redis/index', 'InfraRedis', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:06:09', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (114, '鐞涖劌宕熼弸鍕紦', 'infra:build:list', 2, 2, 2, 'build', 'fa:wpforms', 'infra/build/index', 'InfraBuild', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (115, '娴狅絿鐖滈悽鐔稿灇', 'infra:codegen:query', 2, 1, 2, 'codegen', 'ep:document-copy', 'infra/codegen/index', 'InfraCodegen', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 08:51:06', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (116, 'API 閹恒儱褰?, 'infra:swagger:list', 2, 3, 2, 'swagger', 'fa:fighter-jet', 'infra/swagger/index', 'InfraSwagger', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-04-23 00:01:24', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (500, '閹垮秳缍旈弮銉ョ箶', '', 2, 1, 108, 'operate-log', 'ep:position', 'system/operatelog/index', 'SystemOperateLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:09:59', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (501, '閻ц缍嶉弮銉ョ箶', '', 2, 2, 108, 'login-log', 'ep:promotion', 'system/loginlog/index', 'SystemLoginLog', 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2024-02-29 01:10:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1001, '閻劍鍩涢弻銉嚄', 'system:user:query', 3, 1, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1002, '閻劍鍩涢弬鏉款杻', 'system:user:create', 3, 2, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1003, '閻劍鍩涙穱顔芥暭', 'system:user:update', 3, 3, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1004, '閻劍鍩涢崚鐘绘珟', 'system:user:delete', 3, 4, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1005, '閻劍鍩涚€电厧鍤?, 'system:user:export', 3, 5, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1006, '閻劍鍩涚€电厧鍙?, 'system:user:import', 3, 6, 100, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1007, '闁插秶鐤嗙€靛棛鐖?, 'system:user:update-password', 3, 7, 100, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1008, '鐟欐帟澹婇弻銉嚄', 'system:role:query', 3, 1, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1009, '鐟欐帟澹婇弬鏉款杻', 'system:role:create', 3, 2, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1010, '鐟欐帟澹婃穱顔芥暭', 'system:role:update', 3, 3, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1011, '鐟欐帟澹婇崚鐘绘珟', 'system:role:delete', 3, 4, 101, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1012, '鐟欐帟澹婄€电厧鍤?, 'system:role:export', 3, 5, 101, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1013, '閼挎粌宕熼弻銉嚄', 'system:menu:query', 3, 1, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1014, '閼挎粌宕熼弬鏉款杻', 'system:menu:create', 3, 2, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1015, '閼挎粌宕熸穱顔芥暭', 'system:menu:update', 3, 3, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1016, '閼挎粌宕熼崚鐘绘珟', 'system:menu:delete', 3, 4, 102, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1017, '闁劑妫弻銉嚄', 'system:dept:query', 3, 1, 103, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1018, '闁劑妫弬鏉款杻', 'system:dept:create', 3, 2, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1019, '闁劑妫穱顔芥暭', 'system:dept:update', 3, 3, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1020, '闁劑妫崚鐘绘珟', 'system:dept:delete', 3, 4, 103, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1021, '瀹€妞剧秴閺屻儴顕?, 'system:post:query', 3, 1, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1022, '瀹€妞剧秴閺傛澘顤?, 'system:post:create', 3, 2, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1023, '瀹€妞剧秴娣囶喗鏁?, 'system:post:update', 3, 3, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1024, '瀹€妞剧秴閸掔娀娅?, 'system:post:delete', 3, 4, 104, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1025, '瀹€妞剧秴鐎电厧鍤?, 'system:post:export', 3, 5, 104, '', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1026, '鐎涙鍚€閺屻儴顕?, 'system:dict:query', 3, 1, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1027, '鐎涙鍚€閺傛澘顤?, 'system:dict:create', 3, 2, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1028, '鐎涙鍚€娣囶喗鏁?, 'system:dict:update', 3, 3, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1029, '鐎涙鍚€閸掔娀娅?, 'system:dict:delete', 3, 4, 105, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1030, '鐎涙鍚€鐎电厧鍤?, 'system:dict:export', 3, 5, 105, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1031, '闁板秶鐤嗛弻銉嚄', 'infra:config:query', 3, 1, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1032, '闁板秶鐤嗛弬鏉款杻', 'infra:config:create', 3, 2, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1033, '闁板秶鐤嗘穱顔芥暭', 'infra:config:update', 3, 3, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1034, '闁板秶鐤嗛崚鐘绘珟', 'infra:config:delete', 3, 4, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1035, '闁板秶鐤嗙€电厧鍤?, 'infra:config:export', 3, 5, 106, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1036, '閸忣剙鎲￠弻銉嚄', 'system:notice:query', 3, 1, 107, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1037, '閸忣剙鎲￠弬鏉款杻', 'system:notice:create', 3, 2, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1038, '閸忣剙鎲℃穱顔芥暭', 'system:notice:update', 3, 3, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1039, '閸忣剙鎲￠崚鐘绘珟', 'system:notice:delete', 3, 4, 107, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1040, '閹垮秳缍旈弻銉嚄', 'system:operate-log:query', 3, 1, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1042, '閺冦儱绻旂€电厧鍤?, 'system:operate-log:export', 3, 2, 500, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1043, '閻ц缍嶉弻銉嚄', 'system:login-log:query', 3, 1, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1045, '閺冦儱绻旂€电厧鍤?, 'system:login-log:export', 3, 3, 501, '#', '#', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1046, '娴犮倗澧濋崚妤勩€?, 'system:oauth2-token:page', 3, 1, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1048, '娴犮倗澧濋崚鐘绘珟', 'system:oauth2-token:delete', 3, 2, 109, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-05-09 23:54:53', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1050, '娴犺濮熼弬鏉款杻', 'infra:job:create', 3, 2, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1051, '娴犺濮熸穱顔芥暭', 'infra:job:update', 3, 3, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1052, '娴犺濮熼崚鐘绘珟', 'infra:job:delete', 3, 4, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1053, '閻樿埖鈧椒鎱ㄩ弨?, 'infra:job:update', 3, 5, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1054, '娴犺濮熺€电厧鍤?, 'infra:job:export', 3, 7, 110, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1056, '閻㈢喐鍨氭穱顔芥暭', 'infra:codegen:update', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1057, '閻㈢喐鍨氶崚鐘绘珟', 'infra:codegen:delete', 3, 3, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1058, '鐎电厧鍙嗘禒锝囩垳', 'infra:codegen:create', 3, 2, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1059, '妫板嫯顫嶆禒锝囩垳', 'infra:codegen:preview', 3, 4, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1060, '閻㈢喐鍨氭禒锝囩垳', 'infra:codegen:download', 3, 5, 115, '', '', '', NULL, 0, b'1', b'1', b'1', 'admin', '2021-01-05 17:03:48', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1063, '鐠佸墽鐤嗙憴鎺曞閼挎粌宕熼弶鍐', 'system:permission:assign-role-menu', 3, 6, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:53:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1064, '鐠佸墽鐤嗙憴鎺曞閺佺増宓侀弶鍐', 'system:permission:assign-role-data-scope', 3, 7, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-06 17:56:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1065, '鐠佸墽鐤嗛悽銊﹀煕鐟欐帟澹?, 'system:permission:assign-user-role', 3, 8, 101, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-07 10:23:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1066, '閼惧嘲绶?Redis 閻╂垶甯舵穱鈩冧紖', 'infra:redis:get-monitor-info', 3, 1, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:31', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1067, '閼惧嘲绶?Redis Key 閸掓銆?, 'infra:redis:get-key-list', 3, 2, 113, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-01-26 01:02:52', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1070, '娴狅絿鐖滈悽鐔稿灇濡楀牅绶?, '', 1, 1, 2, 'demo', 'ep:aim', 'infra/testDemo/index', NULL, 0, b'1', b'1', b'1', '', '2021-02-06 12:42:49', '1', '2023-11-15 23:45:53', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1075, '娴犺濮熺憴锕€褰?, 'infra:job:trigger', 3, 8, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-07 13:03:10', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1077, '闁炬崘鐭炬潻鍊熼嚋', '', 2, 4, 2740, 'skywalking', 'fa:eye', 'infra/skywalking/index', 'InfraSkyWalking', 0, b'1', b'1', b'1', '', '2021-02-08 20:41:31', '1', '2024-04-23 00:07:15', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1078, '鐠佸潡妫堕弮銉ョ箶', '', 2, 1, 1083, 'api-access-log', 'ep:place', 'infra/apiAccessLog/index', 'InfraApiAccessLog', 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2024-02-29 08:54:57', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1082, '閺冦儱绻旂€电厧鍤?, 'infra:api-access-log:export', 3, 2, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 01:32:59', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1083, 'API 閺冦儱绻?, '', 2, 4, 2, 'log', 'fa:tasks', NULL, NULL, 0, b'1', b'1', b'1', '', '2021-02-26 02:18:24', '1', '2024-04-22 23:58:36', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1084, '闁挎瑨顕ら弮銉ョ箶', 'infra:api-error-log:query', 2, 2, 1083, 'api-error-log', 'ep:warning-filled', 'infra/apiErrorLog/index', 'InfraApiErrorLog', 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2024-02-29 08:55:17', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1085, '閺冦儱绻旀径鍕倞', 'infra:api-error-log:update-status', 3, 2, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1086, '閺冦儱绻旂€电厧鍤?, 'infra:api-error-log:export', 3, 3, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-02-26 07:53:20', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1087, '娴犺濮熼弻銉嚄', 'infra:job:query', 3, 1, 110, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:26:19', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1088, '閺冦儱绻旈弻銉嚄', 'infra:api-access-log:query', 3, 1, 1078, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:28:04', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1089, '閺冦儱绻旈弻銉嚄', 'infra:api-error-log:query', 3, 1, 1084, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-03-10 01:29:09', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1090, '閺傚洣娆㈤崚妤勩€?, '', 2, 5, 1243, 'file', 'ep:upload-filled', 'infra/file/index', 'InfraFile', 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '1', '2024-02-29 08:53:02', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1091, '閺傚洣娆㈤弻銉嚄', 'infra:file:query', 3, 1, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1092, '閺傚洣娆㈤崚鐘绘珟', 'infra:file:delete', 3, 4, 1090, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-03-12 20:16:20', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1094, '閻厺淇婂〒鐘讳壕', '', 2, 0, 1093, 'sms-channel', 'fa:stack-exchange', 'system/sms/channel/index', 'SystemSmsChannel', 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '1', '2024-02-29 01:15:54', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1095, '閻厺淇婂〒鐘讳壕閺屻儴顕?, 'system:sms-channel:query', 3, 1, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1096, '閻厺淇婂〒鐘讳壕閸掓稑缂?, 'system:sms-channel:create', 3, 2, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1097, '閻厺淇婂〒鐘讳壕閺囧瓨鏌?, 'system:sms-channel:update', 3, 3, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1098, '閻厺淇婂〒鐘讳壕閸掔娀娅?, 'system:sms-channel:delete', 3, 4, 1094, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 11:07:15', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1100, '閻厺淇婂Ο鈩冩緲', '', 2, 1, 1093, 'sms-template', 'ep:connection', 'system/sms/template/index', 'SystemSmsTemplate', 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '1', '2024-02-29 01:16:18', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1101, '閻厺淇婂Ο鈩冩緲閺屻儴顕?, 'system:sms-template:query', 3, 1, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1102, '閻厺淇婂Ο鈩冩緲閸掓稑缂?, 'system:sms-template:create', 3, 2, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1103, '閻厺淇婂Ο鈩冩緲閺囧瓨鏌?, 'system:sms-template:update', 3, 3, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1104, '閻厺淇婂Ο鈩冩緲閸掔娀娅?, 'system:sms-template:delete', 3, 4, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1105, '閻厺淇婂Ο鈩冩緲鐎电厧鍤?, 'system:sms-template:export', 3, 5, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-01 17:35:17', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1106, '閸欐垿鈧焦绁寸拠鏇犵叚娣?, 'system:sms-template:send-sms', 3, 6, 1100, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2021-04-11 00:26:40', '1', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1107, '閻厺淇婇弮銉ョ箶', '', 2, 2, 1093, 'sms-log', 'fa:edit', 'system/sms/log/index', 'SystemSmsLog', 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '1', '2024-02-29 08:49:02', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1108, '閻厺淇婇弮銉ョ箶閺屻儴顕?, 'system:sms-log:query', 3, 1, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1109, '閻厺淇婇弮銉ョ箶鐎电厧鍤?, 'system:sms-log:export', 3, 5, 1107, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-04-11 08:37:05', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1138, '缁夌喐鍩涢崚妤勩€?, '', 2, 0, 1224, 'list', 'ep:house', 'system/tenant/index', 'SystemTenant', 0, b'1', b'1', b'1', '', '2021-12-14 12:31:43', '1', '2024-02-29 01:01:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1139, '缁夌喐鍩涢弻銉嚄', 'system:tenant:query', 3, 1, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1140, '缁夌喐鍩涢崚娑樼紦', 'system:tenant:create', 3, 2, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1141, '缁夌喐鍩涢弴瀛樻煀', 'system:tenant:update', 3, 3, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1142, '缁夌喐鍩涢崚鐘绘珟', 'system:tenant:delete', 3, 4, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1143, '缁夌喐鍩涚€电厧鍤?, 'system:tenant:export', 3, 5, 1138, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2021-12-14 12:31:44', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1224, '缁夌喐鍩涚粻锛勬倞', '', 2, 0, 1, 'tenant', 'fa-solid:house-user', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-02-20 01:41:13', '1', '2024-02-29 00:59:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1225, '缁夌喐鍩涙總妤咁樀', '', 2, 0, 1224, 'package', 'fa:bars', 'system/tenantPackage/index', 'SystemTenantPackage', 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '1', '2024-02-29 01:01:43', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1226, '缁夌喐鍩涙總妤咁樀閺屻儴顕?, 'system:tenant-package:query', 3, 1, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1227, '缁夌喐鍩涙總妤咁樀閸掓稑缂?, 'system:tenant-package:create', 3, 2, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1228, '缁夌喐鍩涙總妤咁樀閺囧瓨鏌?, 'system:tenant-package:update', 3, 3, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1229, '缁夌喐鍩涙總妤咁樀閸掔娀娅?, 'system:tenant-package:delete', 3, 4, 1225, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-02-19 17:44:06', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1237, '閺傚洣娆㈤柊宥囩枂', '', 2, 0, 1243, 'file-config', 'fa-solid:file-signature', 'infra/fileConfig/index', 'InfraFileConfig', 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '1', '2024-02-29 08:52:54', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1238, '閺傚洣娆㈤柊宥囩枂閺屻儴顕?, 'infra:file-config:query', 3, 1, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1239, '閺傚洣娆㈤柊宥囩枂閸掓稑缂?, 'infra:file-config:create', 3, 2, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1240, '閺傚洣娆㈤柊宥囩枂閺囧瓨鏌?, 'infra:file-config:update', 3, 3, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1241, '閺傚洣娆㈤柊宥囩枂閸掔娀娅?, 'infra:file-config:delete', 3, 4, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1242, '閺傚洣娆㈤柊宥囩枂鐎电厧鍤?, 'infra:file-config:export', 3, 5, 1237, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-03-15 14:35:28', '', '2022-04-20 17:03:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1243, '閺傚洣娆㈢粻锛勬倞', '', 2, 6, 2, 'file', 'ep:files', NULL, '', 0, b'1', b'1', b'1', '1', '2022-03-16 23:47:40', '1', '2024-04-23 00:02:11', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1255, '閺佺増宓佸┃鎰板帳缂?, '', 2, 1, 2, 'data-source-config', 'ep:data-analysis', 'infra/dataSourceConfig/index', 'InfraDataSourceConfig', 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '1', '2024-02-29 08:51:25', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1256, '閺佺増宓佸┃鎰板帳缂冾喗鐓＄拠?, 'infra:data-source-config:query', 3, 1, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1257, '閺佺増宓佸┃鎰板帳缂冾喖鍨卞?, 'infra:data-source-config:create', 3, 2, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1258, '閺佺増宓佸┃鎰板帳缂冾喗娲块弬?, 'infra:data-source-config:update', 3, 3, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1259, '閺佺増宓佸┃鎰板帳缂冾喖鍨归梽?, 'infra:data-source-config:delete', 3, 4, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1260, '閺佺増宓佸┃鎰板帳缂冾喖顕遍崙?, 'infra:data-source-config:export', 3, 5, 1255, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-04-27 14:37:32', '', '2022-04-27 14:37:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1261, 'OAuth 2.0', '', 2, 10, 1, 'oauth2', 'fa:dashcube', NULL, NULL, 0, b'1', b'1', b'1', '1', '2022-05-09 23:38:17', '1', '2024-02-29 01:12:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1263, '鎼存梻鏁ょ粻锛勬倞', '', 2, 0, 1261, 'oauth2/application', 'fa:hdd-o', 'system/oauth2/client/index', 'SystemOAuth2Client', 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2024-02-29 01:13:14', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1264, '鐎广垺鍩涚粩顖涚叀鐠?, 'system:oauth2-client:query', 3, 1, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:06', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1265, '鐎广垺鍩涚粩顖氬灡瀵?, 'system:oauth2-client:create', 3, 2, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:23', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1266, '鐎广垺鍩涚粩顖涙纯閺?, 'system:oauth2-client:update', 3, 3, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1267, '鐎广垺鍩涚粩顖氬灩闂?, 'system:oauth2-client:delete', 3, 4, 1263, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2022-05-10 16:26:33', '1', '2022-05-11 00:31:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2083, '閸︽澘灏粻锛勬倞', '', 2, 14, 1, 'area', 'fa:map-marker', 'system/area/index', 'SystemArea', 0, b'1', b'1', b'1', '1', '2022-12-23 17:35:05', '1', '2024-02-29 08:50:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2130, '闁喚顔堢粻锛勬倞', '', 2, 2, 2739, 'mail', 'fa-solid:mail-bulk', NULL, NULL, 0, b'1', b'1', b'1', '1', '2023-01-25 17:27:44', '1', '2024-04-22 23:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2131, '闁喚顔堢拹锕€褰?, '', 2, 0, 2130, 'mail-account', 'fa:universal-access', 'system/mail/account/index', 'SystemMailAccount', 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '1', '2024-02-29 08:48:16', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2132, '鐠愶箑褰块弻銉嚄', 'system:mail-account:query', 3, 1, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2133, '鐠愶箑褰块崚娑樼紦', 'system:mail-account:create', 3, 2, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2134, '鐠愶箑褰块弴瀛樻煀', 'system:mail-account:update', 3, 3, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2135, '鐠愶箑褰块崚鐘绘珟', 'system:mail-account:delete', 3, 4, 2131, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 09:33:48', '', '2023-01-25 09:33:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2136, '闁喕娆㈠Ο锛勫', '', 2, 0, 2130, 'mail-template', 'fa:tag', 'system/mail/template/index', 'SystemMailTemplate', 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '1', '2024-02-29 08:48:41', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2137, '濡紕澧楅弻銉嚄', 'system:mail-template:query', 3, 1, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2138, '濡紕澧楅崚娑樼紦', 'system:mail-template:create', 3, 2, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2139, '濡紕澧楅弴瀛樻煀', 'system:mail-template:update', 3, 3, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2140, '濡紕澧楅崚鐘绘珟', 'system:mail-template:delete', 3, 4, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-25 12:05:31', '', '2023-01-25 12:05:31', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2141, '闁喕娆㈢拋鏉跨秿', '', 2, 0, 2130, 'mail-log', 'fa:edit', 'system/mail/log/index', 'SystemMailLog', 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '1', '2024-02-29 08:48:51', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2142, '閺冦儱绻旈弻銉嚄', 'system:mail-log:query', 3, 1, 2141, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-26 02:16:50', '', '2023-01-26 02:16:50', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2143, '閸欐垿鈧焦绁寸拠鏇㈠仏娴?, 'system:mail-template:send-mail', 3, 5, 2136, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-26 23:29:15', '1', '2023-01-26 23:29:15', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2145, '濡剝婢樼粻锛勬倞', '', 2, 0, 2144, 'notify-template', 'fa:archive', 'system/notify/template/index', 'SystemNotifyTemplate', 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '1', '2024-02-29 08:49:14', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2146, '缁旀瑥鍞存穱鈩兡侀弶鎸庣叀鐠?, 'system:notify-template:query', 3, 1, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2147, '缁旀瑥鍞存穱鈩兡侀弶鍨灡瀵?, 'system:notify-template:create', 3, 2, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2148, '缁旀瑥鍞存穱鈩兡侀弶鎸庢纯閺?, 'system:notify-template:update', 3, 3, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2149, '缁旀瑥鍞存穱鈩兡侀弶鍨灩闂?, 'system:notify-template:delete', 3, 4, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-01-28 02:26:42', '', '2023-01-28 02:26:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2150, '閸欐垿鈧焦绁寸拠鏇犵彲閸愬懍淇?, 'system:notify-template:send-notify', 3, 5, 2145, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2023-01-28 10:54:43', '1', '2023-01-28 10:54:43', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2390, '娴兼ɑ鍎ú璇插З', '', 1, 99, 2030, 'youhui', 'ep:aim', '', '', 0, b'1', b'1', b'1', '1', '2023-10-21 19:23:49', '1', '2023-10-21 19:23:49', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2447, '娑撳鏌熼惂璇茬秿', '', 1, 10, 1, 'social', 'fa:rocket', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:12:01', '1', '2024-02-29 01:14:05', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2448, '娑撳鏌熸惔鏃傛暏', '', 2, 1, 2447, 'client', 'ep:set-up', 'system/social/client/index.vue', 'SocialClient', 0, b'1', b'1', b'1', '1', '2023-11-04 12:17:19', '1', '2024-05-04 19:09:54', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2449, '娑撳鏌熸惔鏃傛暏閺屻儴顕?, 'system:social-client:query', 3, 1, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:43:12', '1', '2023-11-04 12:43:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2450, '娑撳鏌熸惔鏃傛暏閸掓稑缂?, 'system:social-client:create', 3, 2, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:43:58', '1', '2023-11-04 12:43:58', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2451, '娑撳鏌熸惔鏃傛暏閺囧瓨鏌?, 'system:social-client:update', 3, 3, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:44:27', '1', '2023-11-04 12:44:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2452, '娑撳鏌熸惔鏃傛暏閸掔娀娅?, 'system:social-client:delete', 3, 4, 2448, '', '', '', '', 0, b'1', b'1', b'1', '1', '2023-11-04 12:44:43', '1', '2023-11-04 12:44:43', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2453, '娑撳鏌熼悽銊﹀煕', 'system:social-user:query', 2, 2, 2447, 'user', 'ep:avatar', 'system/social/user/index.vue', 'SocialUser', 0, b'1', b'1', b'1', '1', '2023-11-04 14:01:05', '1', '2023-11-04 14:01:05', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2472, '娑撹鐡欑悰顭掔礄閸愬懎绁甸敍?, '', 2, 12, 1070, 'demo03-inner', 'fa:power-off', 'infra/demo/demo03/inner/index', 'Demo03StudentInner', 0, b'1', b'1', b'1', '', '2023-11-13 04:39:51', '1', '2023-11-16 23:53:46', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2478, '閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '', 2, 1, 1070, 'demo01-contact', 'ep:bicycle', 'infra/demo/demo01/index', 'Demo01Contact', 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '1', '2023-11-16 20:34:40', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2479, '缁€杞扮伐閼辨梻閮存禍鐑樼叀鐠?, 'infra:demo01-contact:query', 3, 1, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2480, '缁€杞扮伐閼辨梻閮存禍鍝勫灡瀵?, 'infra:demo01-contact:create', 3, 2, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2481, '缁€杞扮伐閼辨梻閮存禍鐑樻纯閺?, 'infra:demo01-contact:update', 3, 3, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2482, '缁€杞扮伐閼辨梻閮存禍鍝勫灩闂?, 'infra:demo01-contact:delete', 3, 4, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2483, '缁€杞扮伐閼辨梻閮存禍鍝勵嚤閸?, 'infra:demo01-contact:export', 3, 5, 2478, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-15 14:42:30', '', '2023-11-15 14:42:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2484, '閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', '', 2, 2, 1070, 'demo02-category', 'fa:tree', 'infra/demo/demo02/index', 'Demo02Category', 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '1', '2023-11-16 20:35:01', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2485, '缁€杞扮伐閸掑棛琚弻銉嚄', 'infra:demo02-category:query', 3, 1, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2486, '缁€杞扮伐閸掑棛琚崚娑樼紦', 'infra:demo02-category:create', 3, 2, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2487, '缁€杞扮伐閸掑棛琚弴瀛樻煀', 'infra:demo02-category:update', 3, 3, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2488, '缁€杞扮伐閸掑棛琚崚鐘绘珟', 'infra:demo02-category:delete', 3, 4, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2489, '缁€杞扮伐閸掑棛琚€电厧鍤?, 'infra:demo02-category:export', 3, 5, 2484, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:18:27', '', '2023-11-16 12:18:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2490, '娑撹鐡欑悰顭掔礄閺嶅洤鍣敍?, '', 2, 10, 1070, 'demo03-normal', 'fa:battery-3', 'infra/demo/demo03/normal/index', 'Demo03StudentNormal', 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '1', '2023-11-16 23:10:03', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2491, '鐎涳妇鏁撻弻銉嚄', 'infra:demo03-student:query', 3, 1, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2492, '鐎涳妇鏁撻崚娑樼紦', 'infra:demo03-student:create', 3, 2, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2493, '鐎涳妇鏁撻弴瀛樻煀', 'infra:demo03-student:update', 3, 3, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2494, '鐎涳妇鏁撻崚鐘绘珟', 'infra:demo03-student:delete', 3, 4, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2495, '鐎涳妇鏁撶€电厧鍤?, 'infra:demo03-student:export', 3, 5, 2490, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2023-11-16 12:53:37', '', '2023-11-16 12:53:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2497, '娑撹鐡欑悰顭掔礄ERP閿?, '', 2, 11, 1070, 'demo03-erp', 'ep:calendar', 'infra/demo/demo03/erp/index', 'Demo03StudentERP', 0, b'1', b'1', b'1', '', '2023-11-16 15:50:59', '1', '2023-11-17 13:19:56', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2525, 'WebSocket', '', 2, 5, 2, 'websocket', 'ep:connection', 'infra/webSocket/index', 'InfraWebSocket', 0, b'1', b'1', b'1', '1', '2023-11-23 19:41:55', '1', '2024-04-23 00:02:00', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2740, '閻╂垶甯舵稉顓炵妇', '', 1, 10, 2, 'monitors', 'ep:monitor', '', '', 0, b'1', b'1', b'1', '1', '2024-04-23 00:04:44', '1', '2024-04-23 00:04:44', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2758, 'AI 婢堆勀侀崹?, '', 1, 400, 0, '/ai', 'tabler:ai', '', '', 0, b'1', b'1', b'1', '1', '2024-05-07 15:07:56', '1', '2025-04-19 18:57:05', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2760, '閹貉冨煑閸?, '', 1, 100, 2758, 'console', 'ep:setting', '', '', 0, b'1', b'1', b'1', '1', '2024-05-09 22:39:09', '1', '2024-05-24 23:34:21', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2761, 'API 鐎靛棝鎸?, '', 2, 0, 2760, 'api-key', 'ep:key', 'ai/model/apiKey/index.vue', 'AiApiKey', 0, b'1', b'1', b'1', '', '2024-05-09 14:52:56', '1', '2024-05-10 22:44:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2762, 'API 鐎靛棝鎸滈弻銉嚄', 'ai:api-key:query', 3, 1, 2761, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2763, 'API 鐎靛棝鎸滈崚娑樼紦', 'ai:api-key:create', 3, 2, 2761, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:26', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2764, 'API 鐎靛棝鎸滈弴瀛樻煀', 'ai:api-key:update', 3, 3, 2761, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2765, 'API 鐎靛棝鎸滈崚鐘绘珟', 'ai:api-key:delete', 3, 4, 2761, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-09 14:52:56', '1', '2024-05-13 20:36:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2767, '濡€崇€烽柊宥囩枂', '', 2, 0, 2760, 'model', 'fa-solid:abacus', 'ai/model/model/index.vue', 'AiModel', 0, b'1', b'1', b'1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:57:41', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2768, '閼卞﹤銇夊Ο鈥崇€烽弻銉嚄', 'ai:model:query', 3, 1, 2767, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:19:46', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2769, '閼卞﹤銇夊Ο鈥崇€烽崚娑樼紦', 'ai:model:create', 3, 2, 2767, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:10', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2770, '閼卞﹤銇夊Ο鈥崇€烽弴瀛樻煀', 'ai:model:update', 3, 3, 2767, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:14', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2771, '閼卞﹤銇夊Ο鈥崇€烽崚鐘绘珟', 'ai:model:delete', 3, 4, 2767, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-10 14:42:48', '1', '2025-03-03 09:20:27', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2773, '閼卞﹤銇夌憴鎺曞', '', 2, 0, 2760, 'chat-role', 'fa:user-secret', 'ai/model/chatRole/index.vue', 'AiChatRole', 0, b'1', b'1', b'1', '', '2024-05-13 12:39:28', '1', '2024-05-13 20:41:45', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2774, '閼卞﹤銇夌憴鎺曞閺屻儴顕?, 'ai:chat-role:query', 3, 1, 2773, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2775, '閼卞﹤銇夌憴鎺曞閸掓稑缂?, 'ai:chat-role:create', 3, 2, 2773, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2776, '閼卞﹤銇夌憴鎺曞閺囧瓨鏌?, 'ai:chat-role:update', 3, 3, 2773, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-05-13 12:39:28', '', '2024-05-13 12:39:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2777, '閼卞﹤銇夌憴鎺曞閸掔娀娅?, 'ai:chat-role:delete', 3, 4, 2773, '', '', '', '', 0, b'1', b'1', b'1', '1', '2024-05-13 21:43:38', '1', '2024-05-13 21:43:38', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2778, '閼卞﹤銇夌粻锛勬倞', '', 2, 10, 2760, 'chat-conversation', 'ep:chat-square', 'ai/chat/manager/index.vue', 'AiChatManager', 0, b'1', b'1', b'1', '', '2024-05-24 15:39:18', '1', '2024-06-26 21:36:56', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2779, '娴兼俺鐦介弻銉嚄', 'ai:chat-conversation:query', 3, 1, 2778, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-24 15:39:18', '1', '2024-05-25 08:38:30', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2780, '娴兼俺鐦介崚鐘绘珟', 'ai:chat-conversation:delete', 3, 2, 2778, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-05-24 15:39:18', '1', '2024-05-25 08:38:40', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2783, 'AI 缂佹鏁?, '', 2, 2, 2758, 'image', 'ep:picture-rounded', 'ai/image/index/index.vue', 'AiImage', 0, b'1', b'1', b'1', '1', '2024-05-26 11:45:17', '1', '2024-07-07 17:18:59', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2784, '缂佹鏁剧粻锛勬倞', '', 2, 11, 2760, 'image', 'fa:file-image-o', 'ai/image/manager/index.vue', 'AiImageManager', 0, b'1', b'1', b'1', '', '2024-06-26 13:32:31', '1', '2024-06-26 21:37:13', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2785, '缂佹鏁鹃弻銉嚄', 'ai:image:query', 3, 1, 2784, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-06-26 13:32:31', '1', '2024-06-26 22:21:57', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2786, '缂佹鏁鹃崚鐘绘珟', 'ai:image:delete', 3, 4, 2784, '', '', '', '', 0, b'1', b'1', b'1', '', '2024-06-26 13:32:31', '1', '2024-06-26 22:22:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2787, '缂佹ê娴橀弴瀛樻煀', 'ai:image:update', 3, 2, 2784, '', '', '', '', 0, b'1', b'1', b'1', '1', '2024-06-26 22:47:56', '1', '2024-08-31 09:21:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2788, '闂婂厖绠扮粻锛勬倞', '', 2, 12, 2760, 'music', 'fa:music', 'ai/music/manager/index.vue', 'AiMusicManager', 0, b'1', b'1', b'1', '', '2024-06-27 15:03:33', '1', '2024-06-27 23:04:19', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2789, '闂婂厖绠伴弻銉嚄', 'ai:music:query', 3, 1, 2788, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2790, '闂婂厖绠伴弴瀛樻煀', 'ai:music:update', 3, 3, 2788, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2791, '闂婂厖绠伴崚鐘绘珟', 'ai:music:delete', 3, 4, 2788, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-06-27 15:03:33', '', '2024-06-27 15:03:33', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2792, 'AI 閸愭瑤缍?, '', 2, 3, 2758, 'write', 'fa-solid:book-reader', 'ai/write/index/index.vue', 'AiWrite', 0, b'1', b'1', b'1', '1', '2024-07-08 09:26:44', '1', '2024-07-16 13:03:06', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2793, '閸愭瑤缍旂粻锛勬倞', '', 2, 13, 2760, 'write', 'fa:bookmark-o', 'ai/write/manager/index.vue', 'AiWriteManager', 0, b'1', b'1', b'1', '', '2024-07-10 13:24:34', '1', '2024-07-10 21:31:59', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2794, 'AI 閸愭瑤缍旈弻銉嚄', 'ai:write:query', 3, 1, 2793, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-07-10 13:24:34', '', '2024-07-10 13:24:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2795, 'AI 閸愭瑤缍旈崚鐘绘珟', 'ai:write:delete', 3, 4, 2793, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-07-10 13:24:34', '', '2024-07-10 13:24:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2796, 'AI 闂婂厖绠?, '', 2, 4, 2758, 'music', 'fa:music', 'ai/music/index/index.vue', 'AiMusic', 0, b'1', b'1', b'1', '1', '2024-07-17 09:21:12', '1', '2024-07-29 21:11:52', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2798, 'AI 閹繄娣€电厧娴?, '', 2, 6, 2758, 'mind-map', 'fa:sitemap', 'ai/mindmap/index/index.vue', 'AiMindMap', 0, b'1', b'1', b'1', '1', '2024-07-29 21:31:59', '1', '2025-03-02 18:57:31', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2799, '鐎电厧娴樼粻锛勬倞', '', 2, 14, 2760, 'mind-map', 'fa:map', 'ai/mindmap/manager/index', 'AiMindMapManager', 0, b'1', b'1', b'1', '', '2024-08-10 09:15:09', '1', '2024-08-10 17:24:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2800, '閹繄娣€电厧娴橀弻銉嚄', 'ai:mind-map:query', 3, 1, 2799, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-08-10 09:15:09', '', '2024-08-10 09:15:09', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2801, '閹繄娣€电厧娴橀崚鐘绘珟', 'ai:mind-map:delete', 3, 4, 2799, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2024-08-10 09:15:09', '', '2024-08-10 09:15:09', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2915, 'AI 閻儴鐦戞惔?, '', 2, 5, 2758, 'knowledge', 'ep:notebook', 'ai/knowledge/knowledge/index', 'AiKnowledge', 0, b'1', b'1', b'1', '', '2025-02-28 07:04:21', '1', '2025-03-02 18:58:37', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2916, 'AI 閻儴鐦戞惔鎾寸叀鐠?, 'ai:knowledge:query', 3, 1, 2915, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2917, 'AI 閻儴鐦戞惔鎾冲灡瀵?, 'ai:knowledge:create', 3, 2, 2915, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2918, 'AI 閻儴鐦戞惔鎾存纯閺?, 'ai:knowledge:update', 3, 3, 2915, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2919, 'AI 閻儴鐦戞惔鎾冲灩闂?, 'ai:knowledge:delete', 3, 4, 2915, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-02-28 07:04:21', '', '2025-02-28 07:04:21', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2920, '瀹搞儱鍙跨粻锛勬倞', '', 2, 0, 2760, 'tool', 'fa-solid:tools', 'ai/model/tool/index.vue', 'AiTool', 0, b'1', b'1', b'1', '', '2025-03-14 11:19:29', '1', '2025-03-14 19:20:18', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2921, '瀹搞儱鍙块弻銉嚄', 'ai:tool:query', 3, 1, 2920, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2922, '瀹搞儱鍙块崚娑樼紦', 'ai:tool:create', 3, 2, 2920, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2923, '瀹搞儱鍙块弴瀛樻煀', 'ai:tool:update', 3, 3, 2920, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2924, '瀹搞儱鍙块崚鐘绘珟', 'ai:tool:delete', 3, 4, 2920, '', '', '', NULL, 0, b'1', b'1', b'1', '', '2025-03-14 11:19:29', '', '2025-03-14 11:19:29', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5000, 'AI 瀹搞儰缍斿ù?, '', 2, 5, 2758, 'workflow', 'fa:hand-grab-o', 'ai/workflow/index.vue', 'AiWorkflow', 0, b'1', b'1', b'1', '1', '2025-03-25 09:50:27', '1', '2025-05-03 18:55:12', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5001, 'AI 瀹搞儰缍斿ù浣圭叀鐠?, 'ai:workflow:query', 3, 1, 5000, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-03-25 09:51:11', '1', '2025-03-25 09:51:11', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5002, 'AI 瀹搞儰缍斿ù浣稿灡瀵?, 'ai:workflow:create', 3, 2, 5000, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-03-25 09:51:28', '1', '2025-03-25 09:51:28', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5003, 'AI 瀹搞儰缍斿ù浣规纯閺?, 'ai:workflow:update', 3, 3, 5000, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-03-25 09:51:42', '1', '2025-03-25 09:51:42', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5004, 'AI 瀹搞儰缍斿ù浣稿灩闂?, 'ai:workflow:delete', 3, 4, 5000, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-03-25 09:51:55', '1', '2025-03-25 09:52:03', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5005, 'AI 瀹搞儰缍斿ù浣圭ゴ鐠?, 'ai:workflow:test', 3, 5, 5000, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-03-30 10:29:41', '1', '2025-03-30 10:29:41', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5010, '缁夌喐鍩涢崚鍥ㄥ床', 'system:tenant:visit', 3, 999, 1138, '', '', '', '', 0, b'1', b'1', b'1', '1', '2025-05-05 15:25:32', '1', '2025-05-05 15:25:32', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5101, '閸╄櫣顢呴弫鐗堝祦', '', 1, 10, 5100, 'md', 'ep:data-analysis', '', '', 0, b'1', b'1', b'1', '1', '2026-02-15 00:40:13', '1', '2026-02-15 00:40:13', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5200, '閹烘帞褰粻锛勬倞', '', 1, 70, 5100, 'cal', 'ep:calendar', '', '', 0, b'1', b'1', b'1', '1', '2026-02-16 07:35:50', '1', '2026-02-16 15:37:53', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5300, '鐠佹儳顦粻锛勬倞', '', 1, 30, 5100, 'dv', 'ep:cpu', '', '', 0, b'1', b'1', b'1', '1', '2026-02-17 00:59:58', '1', '2026-02-17 09:01:18', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5400, '瀹搞儱鍙跨粻锛勬倞', '', 1, 40, 5100, 'tm', 'ep:scissor', '', '', 0, b'1', b'1', b'1', '1', '2026-02-16 11:10:55', '1', '2026-03-21 14:20:41', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5500, '鐠愩劑鍣虹粻锛勬倞', '', 1, 60, 5100, 'qc', 'ep:check', '', '', 0, b'1', b'1', b'1', '1', '2026-02-17 02:18:18', '1', '2026-02-17 14:36:15', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5700, '閻㈢喍楠囩粻锛勬倞', '', 1, 50, 5100, 'pro', 'ep:management', '', '', 0, b'1', b'1', b'1', '1', '2026-02-17 11:39:58', '1', '2026-02-17 19:53:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5780, '娴犳挸绨辩粻锛勬倞', '', 1, 20, 5100, 'wm', 'ep:box', '', '', 0, b'1', b'1', b'1', '1', '2026-02-17 15:37:58', '1', '2026-02-17 23:38:18', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (5950, '鎼存挸鐡ㄩ惄妯煎仯', '', 1, 13, 5780, 'stock-taking', 'ep:circle-check-filled', '', '', 0, b'1', b'1', b'1', '1', '2026-03-09 00:00:00', '1', '2026-03-09 21:19:09', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6500, 'IM 閸楄櫕妞傞柅姘愁唵', '', 1, 501, 0, '/im', 'ep:chat-dot-round', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', '1', '2026-05-09 16:19:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6510, '閺佺増宓佺紒鐔活吀', 'im:manager:statistics:query', 2, 10, 6500, 'statistics', 'ep:trend-charts', 'im/manager/statistics/index', 'ImStatistics', 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', '1', '2026-04-30 19:35:54', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6515, '婵傝棄寮搁悽瀹狀嚞', 'im:manager:friend-request:query', 2, 20, 6600, 'friend-request', 'ep:document', 'im/manager/friend/request/index', 'ImFriendRequest', 0, b'1', b'1', b'1', '1', '2026-05-05 11:15:48', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6520, '婵傝棄寮搁崚妤勩€?, 'im:manager:friend:list', 2, 10, 6600, 'friend', 'ep:user', 'im/manager/friend/index', 'ImFriend', 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6521, '婵傝棄寮搁弻銉嚄', 'im:manager:friend:query', 3, 10, 6520, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6540, '缂囥倛浜伴崚妤勩€?, 'im:manager:group:list', 2, 10, 6610, 'list', 'ep:user-filled', 'im/manager/group/index', 'ImGroup', 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6541, '缂囥倗绮嶉弻銉嚄', 'im:manager:group:query', 3, 10, 6540, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6542, '缂囥倗绮嶇亸浣侯洣/鐟欙絽鐨?, 'im:manager:group:ban', 3, 20, 6540, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6545, '缂囥倛浜伴悽瀹狀嚞', 'im:manager:group-request:query', 2, 20, 6610, 'request', 'ep:document', 'im/manager/group/request/index', 'ImGroupRequest', 0, b'1', b'1', b'1', '1', '2026-05-07 00:31:35', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6560, '閺佸繑鍔呯拠宥囶吀閻?, 'im:manager:sensitive-word:list', 2, 60, 6500, 'sensitive-word', 'ep:warning', 'im/manager/sensitiveword/index', 'ImSensitiveWord', 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', '1', '2026-04-30 22:25:48', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6561, '閺佸繑鍔呯拠宥嗙叀鐠?, 'im:manager:sensitive-word:query', 3, 10, 6560, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6562, '閺佸繑鍔呯拠宥嗘煀婢?, 'im:manager:sensitive-word:create', 3, 20, 6560, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6563, '閺佸繑鍔呯拠宥勬叏閺€?, 'im:manager:sensitive-word:update', 3, 30, 6560, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6564, '閺佸繑鍔呯拠宥呭灩闂?, 'im:manager:sensitive-word:delete', 3, 40, 6560, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-04-30 09:11:20', 'admin', '2026-04-30 09:11:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6570, '鐞涖劍鍎忕粻锛勬倞', '', 1, 70, 6500, 'face', 'ep:magic-stick', NULL, NULL, 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6571, '缁崵绮虹悰銊﹀剰', 'im:manager:face-pack:list', 2, 10, 6570, 'pack', 'ep:picture', 'im/manager/face/pack/index', 'ImManagerFacePack', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6572, '鐞涖劍鍎忛崠鍛叀鐠?, 'im:manager:face-pack:query', 3, 10, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6573, '鐞涖劍鍎忛崠鍛灡瀵?, 'im:manager:face-pack:create', 3, 20, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6574, '鐞涖劍鍎忛崠鍛叏閺€?, 'im:manager:face-pack:update', 3, 30, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6575, '鐞涖劍鍎忛崠鍛灩闂?, 'im:manager:face-pack:delete', 3, 40, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6576, '鐞涖劍鍎忛崶鐐叀鐠?, 'im:manager:face-pack-item:query', 3, 50, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6577, '鐞涖劍鍎忛崶鎯у灡瀵?, 'im:manager:face-pack-item:create', 3, 60, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6578, '鐞涖劍鍎忛崶鍙ユ叏閺€?, 'im:manager:face-pack-item:update', 3, 70, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6579, '鐞涖劍鍎忛崶鎯у灩闂?, 'im:manager:face-pack-item:delete', 3, 80, 6571, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6580, '閻劍鍩涚悰銊﹀剰', 'im:manager:face-user-item:list', 2, 20, 6570, 'user-item', 'ep:user', 'im/manager/face/userItem/index', 'ImManagerFaceUserItem', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 14:24:20', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6581, '閻劍鍩涚悰銊﹀剰閺屻儴顕?, 'im:manager:face-user-item:query', 3, 10, 6580, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6582, '閻劍鍩涚悰銊﹀剰閸掔娀娅?, 'im:manager:face-user-item:delete', 3, 20, 6580, '', '', '', '', 0, b'1', b'1', b'1', '', '2026-05-06 13:56:08', '', '2026-05-06 13:56:08', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6600, '缁変浇浜扮粻锛勬倞', '', 1, 20, 6500, 'private', 'ep:chat-round', NULL, NULL, 0, b'1', b'1', b'1', '1', '2026-05-07 00:40:35', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6610, '缂囥倛浜扮粻锛勬倞', '', 1, 30, 6500, 'group', 'ep:chat-line-round', NULL, NULL, 0, b'1', b'1', b'1', '1', '2026-05-07 00:40:35', '1', '2026-05-07 00:40:35', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6611, '闁俺鐦界拋鏉跨秿', '', 2, 40, 6500, 'rtc', 'ep:phone', 'im/manager/rtc/index', 'ImRtcCall', 0, b'1', b'1', b'1', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6612, '闁俺鐦界拋鏉跨秿閺屻儴顕?, 'im:manager:rtc:query', 3, 1, 6611, '', '', NULL, NULL, 0, b'1', b'1', b'1', 'admin', '2026-05-18 03:36:12', 'admin', '2026-05-18 03:36:12', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6700, '妫版垿浜剧粻锛勬倞', '', 1, 90, 6500, 'channel', 'ep:promotion', NULL, NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6710, '妫版垿浜鹃崚妤勩€?, '', 2, 1, 6700, 'list', 'ep:promotion', 'im/manager/channel/list/index', 'ImChannel', 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-19 09:44:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6711, '妫版垿浜鹃弻銉嚄', 'im:manager:channel:query', 3, 1, 6710, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6712, '妫版垿浜鹃崚娑樼紦', 'im:manager:channel:create', 3, 2, 6710, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6713, '妫版垿浜炬穱顔芥暭', 'im:manager:channel:update', 3, 3, 6710, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6714, '妫版垿浜鹃崚鐘绘珟', 'im:manager:channel:delete', 3, 4, 6710, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6720, '妫版垿浜剧槐鐘虫綏', '', 2, 2, 6700, 'material', 'ep:document', 'im/manager/channel/material/index', 'ImChannelMaterial', 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-19 09:44:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6721, '缁辩姵娼楅弻銉嚄', 'im:manager:channel-material:query', 3, 1, 6720, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6722, '缁辩姵娼楅崚娑樼紦', 'im:manager:channel-material:create', 3, 2, 6720, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6723, '缁辩姵娼楁穱顔芥暭', 'im:manager:channel-material:update', 3, 3, 6720, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6724, '缁辩姵娼楅崚鐘绘珟', 'im:manager:channel-material:delete', 3, 4, 6720, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-18 13:14:34', '1', '2026-05-18 13:14:34', b'0');
INSERT INTO `system_menu` (`id`, `name`, `permission`, `type`, `sort`, `parent_id`, `path`, `icon`, `component`, `component_name`, `status`, `visible`, `keep_alive`, `always_show`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6734, '鐟欙絾鏆庣紘?, 'im:manager:group:dissolve', 3, 21, 6540, '', '', '', NULL, 0, b'1', b'1', b'1', '1', '2026-05-24 12:02:38', '1', '2026-05-24 12:02:38', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS `system_notice`;
CREATE TABLE `system_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閸忣剙鎲D',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸忣剙鎲￠弽鍥暯',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸忣剙鎲￠崘鍛啇',
  `type` tinyint NOT NULL COMMENT '閸忣剙鎲＄猾璇茬€烽敍?闁氨鐓?2閸忣剙鎲￠敍?,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '閸忣剙鎲￠悩鑸碘偓渚婄礄0濮濓絽鐖?1閸忔娊妫撮敍?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '闁氨鐓￠崗顒€鎲＄悰?;

-- ----------------------------
-- Records of system_notice
-- ----------------------------
BEGIN;
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '閼哄浜鹃惃鍕彆娴?, '<p>閺傛壆澧楅張顒€鍞寸€?33222</p>', 1, 0, 'admin', '2021-01-05 17:03:48', '\"1\"', '2025-08-31 09:38:22', b'0', 1);
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '缂佸瓨濮㈤柅姘辩叀閿?018-07-01 缁崵绮洪崙灞炬珤缂佸瓨濮?, '<p><img src=\"http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg\" alt=\"\" data-href=\"\">11112222<img src=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\" alt=\"image\" data-href=\"http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png\">3333</p>\n<p><img src=\"http://test.yudao.iocoder.cn/20260503/婢跺洣鍞?jpg\" alt=\"\" width=\"258\" height=\"258\"><img src=\"http://test.yudao.iocoder.cn/20260503/閽€宀冩倱閻ㄥ嫮姣婇崡鈥茬瑴.png\"></p>', 2, 1, 'admin', '2021-01-05 17:03:48', '1', '2026-05-03 23:07:48', b'0', 1);
INSERT INTO `system_notice` (`id`, `title`, `content`, `type`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '閹存垶妲稿ù瀣槸閺嶅洭顣?, '<p>閸濆牆鎼遍崫鍫濇惐123</p>', 1, 0, '110', '2022-02-22 01:01:25', '110', '2022-02-22 01:01:46', b'0', 121);
COMMIT;

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_message`;
CREATE TABLE `system_notify_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閻劍鍩汭D',
  `user_id` bigint NOT NULL COMMENT '閻劍鍩沬d',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `template_id` bigint NOT NULL COMMENT '濡紕澧楃紓鏍у娇',
  `template_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢樼紓鏍垳',
  `template_nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨',
  `template_content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡紕澧楅崘鍛啇',
  `template_type` int NOT NULL COMMENT '濡紕澧楃猾璇茬€?,
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡紕澧楅崣鍌涙殶',
  `read_status` bit(1) NOT NULL COMMENT '閺勵垰鎯佸鑼额嚢',
  `read_time` datetime NULL DEFAULT NULL COMMENT '闂冨懓顕伴弮鍫曟？',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id_user_type_read_status`(`user_id` ASC, `user_type` ASC, `read_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁旀瑥鍞存穱鈩冪Х閹垵銆?;

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
BEGIN;
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 1, 2, 1, 'test', '123', '閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2025-12-15 21:24:36', '1', '2023-01-28 11:44:08', '1', '2025-12-15 21:24:36', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, 1, 2, 1, 'test', '123', '閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, '{\"name\":\"1\",\"what\":\"2\"}', b'1', '2025-12-15 21:24:36', '1', '2023-01-28 11:45:04', '1', '2025-12-15 21:24:36', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, 103, 2, 2, 'register', '缁崵绮哄☉鍫熶紖', '娴ｇ姴銈介敍灞绢偨鏉?閸濆牆鎼?閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, '{\"name\":\"閸濆牆鎼盶"}', b'0', NULL, '1', '2023-01-28 21:02:20', '1', '2023-01-28 21:02:20', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 1, 2, 1, 'test', '123', '閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, '{\"name\":\"閼哄澹橽",\"what\":\"閸愭瑤鍞惍涔?}', b'1', '2025-12-08 17:25:28', '1', '2023-01-28 22:21:42', '1', '2025-12-08 17:25:28', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, 1, 2, 1, 'test', '123', '閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, '{\"name\":\"閼哄澹橽",\"what\":\"閸愭瑤鍞惍涔?}', b'1', '2025-12-08 17:25:30', '1', '2023-01-28 22:22:07', '1', '2025-12-08 17:25:30', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 1, 2, 1, 'test', '123', '閹存垶妲?2閿涘本鍨滃鈧慨?3 娴?, 1, '{\"name\":\"2\",\"what\":\"3\"}', b'1', '2025-12-08 17:25:22', '1', '2023-01-28 23:45:21', '1', '2025-12-08 17:25:22', b'0', 1);
INSERT INTO `system_notify_message` (`id`, `user_id`, `user_type`, `template_id`, `template_code`, `template_nickname`, `template_content`, `template_type`, `template_params`, `read_status`, `read_time`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (8, 1, 2, 2, 'register', '缁崵绮哄☉鍫熶紖', '娴ｇ姴銈介敍灞绢偨鏉?123 閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, '{\"name\":\"123\"}', b'1', '2025-12-08 16:46:01', '1', '2023-01-28 23:50:21', '1', '2025-12-08 16:46:01', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
DROP TABLE IF EXISTS `system_notify_template`;
CREATE TABLE `system_notify_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀崥宥囆?,
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡紕澧楃紓鏍垳',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欐垿鈧椒姹夐崥宥囆?,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡紕澧楅崘鍛啇',
  `type` tinyint NOT NULL COMMENT '缁鐎?,
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閸欏倹鏆熼弫鎵矋',
  `status` tinyint NOT NULL COMMENT '閻樿埖鈧?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁旀瑥鍞存穱鈩兡侀弶鑳€?;

-- ----------------------------
-- Records of system_notify_template
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_access_token`;
CREATE TABLE `system_oauth2_access_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `user_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涙穱鈩冧紖',
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐠佸潡妫舵禒銈囧',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸掗攱鏌婃禒銈囧',
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹哄牊娼堥懠鍐ㄦ纯',
  `expires_time` datetime NOT NULL COMMENT '鏉╁洦婀￠弮鍫曟？',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_access_token`(`access_token` ASC) USING BTREE,
  INDEX `idx_refresh_token`(`refresh_token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108473 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 鐠佸潡妫舵禒銈囧';

-- ----------------------------
-- Records of system_oauth2_access_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_approve`;
CREATE TABLE `system_oauth2_approve`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閹哄牊娼堥懠鍐ㄦ纯',
  `approved` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀幒銉ュ綀',
  `expires_time` datetime NOT NULL COMMENT '鏉╁洦婀￠弮鍫曟？',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id_user_type_client_id`(`user_id` ASC, `user_type` ASC, `client_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 閹电懓鍣悰?;

-- ----------------------------
-- Records of system_oauth2_approve
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_client`;
CREATE TABLE `system_oauth2_client`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖氱槕闁?,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎼存梻鏁ら崥?,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎼存梻鏁ら崶鐐垼',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鎼存梻鏁ら幓蹇氬牚',
  `status` tinyint NOT NULL COMMENT '閻樿埖鈧?,
  `access_token_validity_seconds` int NOT NULL COMMENT '鐠佸潡妫舵禒銈囧閻ㄥ嫭婀侀弫鍫熸埂',
  `refresh_token_validity_seconds` int NOT NULL COMMENT '閸掗攱鏌婃禒銈囧閻ㄥ嫭婀侀弫鍫熸埂',
  `redirect_uris` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?,
  `authorized_grant_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹哄牊娼堢猾璇茬€?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹哄牊娼堥懠鍐ㄦ纯',
  `auto_approve_scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閼奉亜濮╅柅姘崇箖閻ㄥ嫭宸块弶鍐瘱閸?,
  `authorities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閺夊啴妾?,
  `resource_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '鐠у嫭绨?,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '闂勫嫬濮炴穱鈩冧紖',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_client_id`(`client_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 鐎广垺鍩涚粩顖濄€?;

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
BEGIN;
INSERT INTO `system_oauth2_client` (`id`, `client_id`, `secret`, `name`, `logo`, `description`, `status`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `redirect_uris`, `authorized_grant_types`, `scopes`, `auto_approve_scopes`, `authorities`, `resource_ids`, `additional_information`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, 'default', 'admin123', '閼哄浜惧┃鎰垳', 'http://test.yudao.iocoder.cn/20250502/sort2_1746189740718.png', '閹存垶妲搁幓蹇氬牚', 0, 1800, 2592000, '[\"http://127.0.0.1:3000\"]', '[\"password\",\"authorization_code\",\"implicit\",\"refresh_token\",\"client_credentials\"]', '[\"user.read\",\"user.write\"]', '[]', '[\"user.read\",\"user.write\"]', '[]', '{}', '1', '2022-05-11 21:47:12', '1', '2025-12-07 20:07:09', b'0');
INSERT INTO `system_oauth2_client` (`id`, `client_id`, `secret`, `name`, `logo`, `description`, `status`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `redirect_uris`, `authorized_grant_types`, `scopes`, `auto_approve_scopes`, `authorities`, `resource_ids`, `additional_information`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (40, 'test', 'test2', 'biubiu', 'http://test.yudao.iocoder.cn/20251227/javayuanma_1766829882970.jpg', '閸燂箑鏆掗崯锕€鏆?, 0, 1800, 43200, '[\"http://127.0.0.1:3000\"]', '[\"password\",\"authorization_code\",\"implicit\"]', '[\"user_info\",\"projects\"]', '[\"user_info\"]', '[]', '[]', '{}', '1', '2022-05-12 00:28:20', '1', '2025-12-27 18:04:44', b'0');
INSERT INTO `system_oauth2_client` (`id`, `client_id`, `secret`, `name`, `logo`, `description`, `status`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `redirect_uris`, `authorized_grant_types`, `scopes`, `auto_approve_scopes`, `authorities`, `resource_ids`, `additional_information`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (41, 'yudao-sso-demo-by-code', 'test', '閸╄桨绨幒鍫熸綀閻焦膩瀵骏绱濇俊鍌欑秿鐎圭偟骞?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, 'http://test.yudao.iocoder.cn/it/20250502/sign_1746181948685.png', NULL, 0, 1800, 43200, '[\"http://127.0.0.1:18080\"]', '[\"authorization_code\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[]', '[]', NULL, '1', '2022-09-29 13:28:31', '1', '2025-05-02 18:32:30', b'0');
INSERT INTO `system_oauth2_client` (`id`, `client_id`, `secret`, `name`, `logo`, `description`, `status`, `access_token_validity_seconds`, `refresh_token_validity_seconds`, `redirect_uris`, `authorized_grant_types`, `scopes`, `auto_approve_scopes`, `authorities`, `resource_ids`, `additional_information`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (42, 'yudao-sso-demo-by-password', 'test', '閸╄桨绨€靛棛鐖滃Ο鈥崇础閿涘苯顩ф担鏇炵杽閻?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, 'http://test.yudao.iocoder.cn/oauth2/20260615/iShot_2026-05-31_23.18.10.png', NULL, 0, 1800, 43200, '[\"http://127.0.0.1:18080\"]', '[\"password\",\"refresh_token\"]', '[\"user.read\",\"user.write\"]', '[]', '[]', '[]', NULL, '1', '2022-10-04 17:40:16', '1', '2026-06-15 18:58:30', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_code`;
CREATE TABLE `system_oauth2_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹哄牊娼堥惍?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閹哄牊娼堥懠鍐ㄦ纯',
  `expires_time` datetime NOT NULL COMMENT '鏉╁洦婀￠弮鍫曟？',
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閻樿埖鈧?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 閹哄牊娼堥惍浣姐€?;

-- ----------------------------
-- Records of system_oauth2_code
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `system_oauth2_refresh_token`;
CREATE TABLE `system_oauth2_refresh_token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `refresh_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸掗攱鏌婃禒銈囧',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閹哄牊娼堥懠鍐ㄦ纯',
  `expires_time` datetime NOT NULL COMMENT '鏉╁洦婀￠弮鍫曟？',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_refresh_token`(`refresh_token` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3382 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'OAuth2 閸掗攱鏌婃禒銈囧';

-- ----------------------------
-- Records of system_oauth2_refresh_token
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operate_log`;
CREATE TABLE `system_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閺冦儱绻旀稉濠氭暛',
  `trace_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL DEFAULT 0 COMMENT '閻劍鍩涚猾璇茬€?,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹垮秳缍斿Ο鈥虫健缁鐎?,
  `sub_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹垮秳缍旈崥?,
  `biz_id` bigint NOT NULL COMMENT '閹垮秳缍旈弫鐗堝祦濡€虫健缂傛牕褰?,
  `action` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閹垮秳缍旈崘鍛啇',
  `success` bit(1) NOT NULL DEFAULT b'1' COMMENT '閹垮秳缍旂紒鎾寸亯',
  `extra` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閹锋挸鐫嶇€涙顔?,
  `request_method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '鐠囬攱鐪伴弬瑙勭《閸?,
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '鐠囬攱鐪伴崷鏉挎絻',
  `user_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻劍鍩?IP',
  `user_agent` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '濞村繗顫嶉崳?UA',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閹垮秳缍旈弮銉ョ箶鐠佹澘缍?V2 閻楀牊婀?;

-- ----------------------------
-- Records of system_operate_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '瀹€妞剧秴ID',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹€妞剧秴缂傛牜鐖?,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '瀹€妞剧秴閸氬秶袨',
  `sort` int NOT NULL COMMENT '閺勫墽銇氭い鍝勭碍',
  `status` tinyint NOT NULL COMMENT '閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '瀹€妞剧秴娣団剝浼呯悰?;

-- ----------------------------
-- Records of system_post
-- ----------------------------
BEGIN;
INSERT INTO `system_post` (`id`, `code`, `name`, `sort`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 'se', '妞ゅ湱娲扮紒蹇曟倞', 2, 0, '', 'admin', '2021-01-05 17:03:48', '1', '2025-12-15 22:38:43', b'0', 1);
INSERT INTO `system_post` (`id`, `code`, `name`, `sort`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, 'user', '閺咁噣鈧艾鎲冲?, 4, 0, '111222', 'admin', '2021-01-05 17:03:48', '1', '2025-03-24 21:32:40', b'0', 1);
INSERT INTO `system_post` (`id`, `code`, `name`, `sort`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 'HR', '娴滃搫濮忕挧鍕爱', 5, 0, '`', '1', '2024-03-24 20:45:40', '1', '2025-03-29 19:08:10', b'0', 1);
INSERT INTO `system_post` (`id`, `code`, `name`, `sort`, `status`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 'test', '濞村鐦?, 10, 0, NULL, '1', '2025-09-02 08:45:57', '1', '2025-09-02 08:45:57', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '鐟欐帟澹奍D',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐟欐帟澹婇崥宥囆?,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐟欐帟澹婇弶鍐鐎涙顑佹稉?,
  `sort` int NOT NULL COMMENT '閺勫墽銇氭い鍝勭碍',
  `data_scope` tinyint NOT NULL DEFAULT 1 COMMENT '閺佺増宓侀懠鍐ㄦ纯閿?閿涙艾鍙忛柈銊︽殶閹诡喗娼堥梽?2閿涙俺鍤滅€规碍鏆熼幑顔芥綀闂?3閿涙碍婀伴柈銊╂，閺佺増宓侀弶鍐 4閿涙碍婀伴柈銊╂，閸欏﹣浜掓稉瀣殶閹诡喗娼堥梽鎰剁礆',
  `data_scope_dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閺佺増宓侀懠鍐ㄦ纯(閹稿洤鐣鹃柈銊╂，閺佹壆绮?',
  `status` tinyint NOT NULL COMMENT '鐟欐帟澹婇悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `type` tinyint NOT NULL COMMENT '鐟欐帟澹婄猾璇茬€?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐟欐帟澹婃穱鈩冧紖鐞?;

-- ----------------------------
-- Records of system_role
-- ----------------------------
BEGIN;
INSERT INTO `system_role` (`id`, `name`, `code`, `sort`, `data_scope`, `data_scope_dept_ids`, `status`, `type`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '鐡掑懐楠囩粻锛勬倞閸?, 'super_admin', 1, 1, '', 0, 1, '鐡掑懐楠囩粻锛勬倞閸?, 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:21', b'0', 1);
INSERT INTO `system_role` (`id`, `name`, `code`, `sort`, `data_scope`, `data_scope_dept_ids`, `status`, `type`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '閺咁噣鈧俺顫楅懝?, 'common', 2, 2, '', 0, 1, '閺咁噣鈧俺顫楅懝?, 'admin', '2021-01-05 17:03:48', '', '2022-02-22 05:08:20', b'0', 1);
INSERT INTO `system_role` (`id`, `name`, `code`, `sort`, `data_scope`, `data_scope_dept_ids`, `status`, `type`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (109, '缁夌喐鍩涚粻锛勬倞閸?, 'tenant_admin', 0, 1, '', 0, 1, '缁崵绮洪懛顏勫З閻㈢喐鍨?, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role` (`id`, `name`, `code`, `sort`, `data_scope`, `data_scope_dept_ids`, `status`, `type`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (111, '缁夌喐鍩涚粻锛勬倞閸?, 'tenant_admin', 0, 1, '', 0, 1, '缁崵绮洪懛顏勫З閻㈢喐鍨?, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_role` (`id`, `name`, `code`, `sort`, `data_scope`, `data_scope_dept_ids`, `status`, `type`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (155, '濞村鐦弫鐗堝祦閺夊啴妾?2', 'test-dp', 4, 2, '[112,100,102,103,104,105,107,108]', 0, 2, '1111', '1', '2025-03-31 14:58:06', '1', '2026-06-26 10:42:44', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閼奉亜顤冪紓鏍у娇',
  `role_id` bigint NOT NULL COMMENT '鐟欐帟澹奍D',
  `menu_id` bigint NOT NULL COMMENT '閼挎粌宕烮D',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6692 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐟欐帟澹婇崪宀冨綅閸楁洖鍙ч懕鏃囥€?;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (263, 109, 1, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (434, 2, 1, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (454, 2, 1093, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (455, 2, 1094, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (460, 2, 1100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (467, 2, 1107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (477, 2, 100, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (478, 2, 101, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (479, 2, 102, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (481, 2, 103, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (483, 2, 104, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (485, 2, 105, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (488, 2, 107, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (490, 2, 108, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (492, 2, 109, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (498, 2, 1138, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (523, 2, 1224, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (524, 2, 1225, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (541, 2, 500, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (543, 2, 501, '1', '2022-02-22 13:09:12', '1', '2022-02-22 13:09:12', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (675, 2, 2, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (689, 2, 1077, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (690, 2, 1078, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (692, 2, 1083, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (693, 2, 1084, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (699, 2, 1090, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (703, 2, 106, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (704, 2, 110, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (705, 2, 111, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (706, 2, 112, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (707, 2, 113, '1', '2022-02-22 13:16:57', '1', '2022-02-22 13:16:57', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1296, 110, 1, '110', '2022-02-23 00:23:55', '110', '2022-02-23 00:23:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1729, 109, 100, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1730, 109, 101, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1731, 109, 1063, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1732, 109, 1064, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1733, 109, 1001, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1734, 109, 1065, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1735, 109, 1002, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1736, 109, 1003, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1737, 109, 1004, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1738, 109, 1005, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1739, 109, 1006, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1740, 109, 1007, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1741, 109, 1008, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1742, 109, 1009, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1743, 109, 1010, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1744, 109, 1011, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1745, 109, 1012, '1', '2022-09-21 22:08:51', '1', '2022-09-21 22:08:51', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1763, 109, 100, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1764, 109, 101, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1765, 109, 1063, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1766, 109, 1064, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1767, 109, 1001, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1768, 109, 1065, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1769, 109, 1002, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1770, 109, 1003, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1771, 109, 1004, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1772, 109, 1005, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1773, 109, 1006, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1774, 109, 1007, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1775, 109, 1008, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1776, 109, 1009, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1777, 109, 1010, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1778, 109, 1011, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1779, 109, 1012, '1', '2022-09-21 22:08:53', '1', '2022-09-21 22:08:53', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1797, 109, 100, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1798, 109, 101, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1799, 109, 1063, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1800, 109, 1064, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1801, 109, 1001, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1802, 109, 1065, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1803, 109, 1002, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1804, 109, 1003, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1805, 109, 1004, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1806, 109, 1005, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1807, 109, 1006, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1808, 109, 1007, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1809, 109, 1008, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1810, 109, 1009, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1811, 109, 1010, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1812, 109, 1011, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1813, 109, 1012, '1', '2022-09-21 22:08:55', '1', '2022-09-21 22:08:55', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1831, 109, 103, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1832, 109, 1017, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1833, 109, 1018, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1834, 109, 1019, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1835, 109, 1020, '1', '2022-09-21 22:43:23', '1', '2022-09-21 22:43:23', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1841, 109, 1036, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1842, 109, 1037, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1843, 109, 1038, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1844, 109, 1039, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1845, 109, 107, '1', '2022-09-21 22:48:13', '1', '2022-09-21 22:48:13', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1991, 2, 1024, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1992, 2, 1025, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1993, 2, 1026, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1994, 2, 1027, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1995, 2, 1028, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1996, 2, 1029, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1997, 2, 1030, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1998, 2, 1031, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1999, 2, 1032, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2000, 2, 1033, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2001, 2, 1034, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2002, 2, 1035, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2003, 2, 1036, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2004, 2, 1037, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2005, 2, 1038, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2006, 2, 1039, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2007, 2, 1040, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2008, 2, 1042, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2009, 2, 1043, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2010, 2, 1045, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2011, 2, 1046, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2012, 2, 1048, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2013, 2, 1050, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2014, 2, 1051, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2015, 2, 1052, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2016, 2, 1053, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2017, 2, 1054, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2018, 2, 1056, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2019, 2, 1057, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2020, 2, 1058, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2021, 2, 2083, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2022, 2, 1059, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2023, 2, 1060, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2024, 2, 1063, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2025, 2, 1064, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2026, 2, 1065, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2027, 2, 1066, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2028, 2, 1067, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2029, 2, 1070, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2034, 2, 1075, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2036, 2, 1082, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2037, 2, 1085, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2038, 2, 1086, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2039, 2, 1087, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2040, 2, 1088, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2041, 2, 1089, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2042, 2, 1091, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2043, 2, 1092, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2044, 2, 1095, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2045, 2, 1096, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2046, 2, 1097, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2047, 2, 1098, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2048, 2, 1101, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2049, 2, 1102, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2050, 2, 1103, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2051, 2, 1104, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2052, 2, 1105, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2053, 2, 1106, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2054, 2, 1108, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2055, 2, 1109, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2072, 2, 114, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2073, 2, 1139, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2074, 2, 115, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2075, 2, 1140, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2076, 2, 116, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2077, 2, 1141, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2078, 2, 1142, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2079, 2, 1143, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2099, 2, 1226, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2100, 2, 1227, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2101, 2, 1228, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2102, 2, 1229, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2103, 2, 1237, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2104, 2, 1238, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2105, 2, 1239, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2106, 2, 1240, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2107, 2, 1241, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2108, 2, 1242, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2109, 2, 1243, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2117, 2, 1255, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2118, 2, 1256, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2119, 2, 1257, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2120, 2, 1258, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2121, 2, 1259, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2122, 2, 1260, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2123, 2, 1261, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2124, 2, 1263, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2125, 2, 1264, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2126, 2, 1265, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2127, 2, 1266, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2128, 2, 1267, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2129, 2, 1001, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2130, 2, 1002, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2131, 2, 1003, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2132, 2, 1004, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2133, 2, 1005, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2134, 2, 1006, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2135, 2, 1007, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2136, 2, 1008, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2137, 2, 1009, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2138, 2, 1010, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2139, 2, 1011, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2140, 2, 1012, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2141, 2, 1013, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2143, 2, 1015, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2145, 2, 1017, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2146, 2, 1018, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2147, 2, 1019, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2148, 2, 1020, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2149, 2, 1021, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2150, 2, 1022, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2151, 2, 1023, '1', '2023-01-25 08:42:52', '1', '2023-01-25 08:42:52', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2929, 109, 1224, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2930, 109, 1225, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2931, 109, 1226, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2932, 109, 1227, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2933, 109, 1228, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2934, 109, 1229, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2935, 109, 1138, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2936, 109, 1139, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2937, 109, 1140, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2938, 109, 1141, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2939, 109, 1142, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2940, 109, 1143, '1', '2023-12-02 23:19:40', '1', '2023-12-02 23:19:40', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2993, 109, 2, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2994, 109, 1031, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2995, 109, 1032, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2996, 109, 1033, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2997, 109, 1034, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2998, 109, 1035, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2999, 109, 1050, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3000, 109, 1051, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3001, 109, 1052, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3002, 109, 1053, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3003, 109, 1054, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3004, 109, 1056, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3005, 109, 1057, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3006, 109, 1058, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3007, 109, 1059, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3008, 109, 1060, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3009, 109, 1066, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3010, 109, 1067, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3011, 109, 1070, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3012, 109, 1075, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3014, 109, 1077, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3015, 109, 1078, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3016, 109, 1082, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3017, 109, 1083, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3018, 109, 1084, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3019, 109, 1085, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3020, 109, 1086, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3021, 109, 1087, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3022, 109, 1088, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3023, 109, 1089, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3024, 109, 1090, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3025, 109, 1091, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3026, 109, 1092, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3027, 109, 106, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3028, 109, 110, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3029, 109, 111, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3030, 109, 112, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3031, 109, 113, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3032, 109, 114, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3033, 109, 115, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3034, 109, 116, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3035, 109, 2472, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3036, 109, 2478, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3037, 109, 2479, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3038, 109, 2480, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3039, 109, 2481, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3040, 109, 2482, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3041, 109, 2483, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3042, 109, 2484, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3043, 109, 2485, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3044, 109, 2486, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3045, 109, 2487, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3046, 109, 2488, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3047, 109, 2489, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3048, 109, 2490, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3049, 109, 2491, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3050, 109, 2492, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3051, 109, 2493, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3052, 109, 2494, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3053, 109, 2495, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3054, 109, 2497, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3055, 109, 1237, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3056, 109, 1238, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3057, 109, 1239, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3058, 109, 1240, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3059, 109, 1241, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3060, 109, 1242, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3061, 109, 1243, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3062, 109, 2525, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3063, 109, 1255, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3064, 109, 1256, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3065, 109, 1257, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3066, 109, 1258, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3067, 109, 1259, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3068, 109, 1260, '1', '2023-12-02 23:41:02', '1', '2023-12-02 23:41:02', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3221, 109, 102, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3222, 109, 1013, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3223, 109, 1014, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3224, 109, 1015, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3225, 109, 1016, '1', '2023-12-30 11:42:36', '1', '2023-12-30 11:42:36', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4163, 109, 5, '1', '2024-03-30 17:53:17', '1', '2024-03-30 17:53:17', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5779, 2, 2739, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5780, 2, 2740, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5781, 2, 2758, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5782, 2, 2759, '1', '2024-07-07 20:39:38', '1', '2024-07-07 20:39:38', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5789, 109, 2739, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5790, 109, 2740, '1', '2024-07-13 22:37:24', '1', '2024-07-13 22:37:24', b'0', 121);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6293, 2, 5, '1', '2026-01-04 18:09:41', '1', '2026-01-04 18:09:41', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6366, 2, 6401, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6367, 2, 6402, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6368, 2, 6403, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6369, 2, 6404, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6370, 2, 6405, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6371, 2, 6406, '1', '2026-05-09 16:11:01', '1', '2026-05-09 16:11:01', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6381, 111, 1, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6382, 111, 2, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6383, 111, 5, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6384, 111, 1031, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6385, 111, 1032, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6386, 111, 1033, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6387, 111, 1034, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6388, 111, 1035, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6389, 111, 1036, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6390, 111, 1037, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6391, 111, 1038, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6392, 111, 1039, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6393, 111, 1050, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6394, 111, 1051, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6395, 111, 1052, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6396, 111, 1053, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6397, 111, 1054, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6398, 111, 1056, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6399, 111, 1057, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6400, 111, 1058, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6401, 111, 1059, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6402, 111, 1060, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6403, 111, 1063, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6404, 111, 1064, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6405, 111, 1065, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6406, 111, 1066, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6407, 111, 1067, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6408, 111, 1070, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6409, 111, 1075, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6410, 111, 1077, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6411, 111, 1078, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6412, 111, 1082, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6413, 111, 1083, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6414, 111, 1084, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6415, 111, 1085, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6416, 111, 1086, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6417, 111, 1087, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6418, 111, 1088, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6419, 111, 1089, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6420, 111, 1090, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6421, 111, 1091, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6422, 111, 1092, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6427, 111, 100, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6428, 111, 101, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6429, 111, 102, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6431, 111, 103, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6435, 111, 106, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6437, 111, 107, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6440, 111, 110, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6442, 111, 111, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6444, 111, 112, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6446, 111, 113, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6449, 111, 114, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6450, 111, 1138, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6451, 111, 1139, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6452, 111, 115, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6453, 111, 1140, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6454, 111, 116, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6455, 111, 1141, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6456, 111, 1142, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6457, 111, 1143, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6504, 111, 2739, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6505, 111, 2740, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6527, 111, 1224, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6528, 111, 1225, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6529, 111, 1226, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6530, 111, 1227, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6531, 111, 1228, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6532, 111, 1229, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6533, 111, 1237, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6534, 111, 1238, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6536, 111, 1239, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6537, 111, 1240, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6538, 111, 1241, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6539, 111, 1242, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6540, 111, 1243, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6544, 111, 1255, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6545, 111, 1256, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6546, 111, 1257, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6548, 111, 1258, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6550, 111, 1259, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6552, 111, 1260, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6586, 111, 2472, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6587, 111, 2478, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6588, 111, 2479, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6589, 111, 2480, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6590, 111, 2481, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6591, 111, 2482, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6592, 111, 2483, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6593, 111, 2484, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6594, 111, 2485, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6595, 111, 2486, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6596, 111, 2487, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6597, 111, 2488, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6598, 111, 2489, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6599, 111, 2490, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6600, 111, 2491, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6601, 111, 2492, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6602, 111, 2493, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6603, 111, 2494, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6604, 111, 2495, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6605, 111, 2497, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6606, 111, 2525, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6607, 111, 1001, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6608, 111, 1002, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6609, 111, 1003, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6610, 111, 1004, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6611, 111, 1005, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6612, 111, 1006, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6613, 111, 1007, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6614, 111, 1008, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6615, 111, 1009, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6616, 111, 1010, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6617, 111, 1011, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6618, 111, 1012, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6619, 111, 1013, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6621, 111, 1014, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6623, 111, 1015, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6625, 111, 1016, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6627, 111, 1017, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6629, 111, 1018, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6631, 111, 1019, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6633, 111, 1020, '1', '2026-06-01 23:29:35', '1', '2026-06-01 23:29:35', b'0', 122);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6655, 155, 5042, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6657, 155, 5043, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6659, 155, 5044, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6661, 155, 5045, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6663, 155, 5046, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6689, 155, 2128, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
INSERT INTO `system_role_menu` (`id`, `role_id`, `menu_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6690, 155, 2129, '1', '2026-06-10 09:04:18', '1', '2026-06-10 09:04:18', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_channel`;
CREATE TABLE `system_sms_channel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `signature` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇婄粵鎯ф倳',
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濞撶娀浜剧紓鏍垳',
  `status` tinyint NOT NULL COMMENT '瀵偓閸氼垳濮搁幀?,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `api_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇?API 閻ㄥ嫯澶勯崣?,
  `api_secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇?API 閻ㄥ嫮顫濋柦?,
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇婇崣鎴︹偓浣告礀鐠?URL',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻厺淇婂〒鐘讳壕';

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
BEGIN;
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 'Ballcat', 'ALIYUN', 0, '娴ｇ姾顩﹂弨鐟版憹閿涘苯褰ч張澶嬪灉閸欘垯浜掗悽顭掔磼閿涗緤绱掗敍?, 'demo-aliyun-sms-api-key', 'demo-aliyun-sms-api-secret', NULL, '', '2021-03-31 11:53:10', '1', '2024-08-04 08:53:26', b'0');
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (4, '濞村鐦〒鐘讳壕', 'DEBUG_DING_TALK', 0, '123', '696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', 'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, '1', '2021-04-13 00:23:14', '1', '2022-03-27 20:29:49', b'0');
INSERT INTO `system_sms_channel` (`id`, `signature`, `code`, `status`, `remark`, `api_key`, `api_secret`, `callback_url`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (7, 'mock閼垫崘顔嗘禍?, 'TENCENT', 0, '123', '1 2', '2 3', '', '1', '2024-09-30 08:53:45', '1', '2025-12-20 11:30:18', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_code`;
CREATE TABLE `system_sms_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹靛婧€閸?,
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '妤犲矁鐦夐惍?,
  `create_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸掓稑缂?IP',
  `scene` tinyint NOT NULL COMMENT '閸欐垿鈧礁婧€閺?,
  `today_index` tinyint NOT NULL COMMENT '娴犲﹥妫╅崣鎴︹偓浣烘畱缁楊剙鍤戦弶?,
  `used` tinyint NOT NULL COMMENT '閺勵垰鎯佹担璺ㄦ暏',
  `used_time` datetime NULL DEFAULT NULL COMMENT '娴ｈ法鏁ら弮鍫曟？',
  `used_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '娴ｈ法鏁?IP',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile` ASC) USING BTREE COMMENT '閹靛婧€閸?
) ENGINE = InnoDB AUTO_INCREMENT = 694 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閹靛婧€妤犲矁鐦夐惍?;

-- ----------------------------
-- Records of system_sms_code
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_log`;
CREATE TABLE `system_sms_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `channel_id` bigint NOT NULL COMMENT '閻厺淇婂〒鐘讳壕缂傛牕褰?,
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇婂〒鐘讳壕缂傛牜鐖?,
  `template_id` bigint NOT NULL COMMENT '濡剝婢樼紓鏍у娇',
  `template_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢樼紓鏍垳',
  `template_type` tinyint NOT NULL COMMENT '閻厺淇婄猾璇茬€?,
  `template_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇婇崘鍛啇',
  `template_params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇婇崣鍌涙殶',
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閹靛婧€閸?,
  `user_id` bigint NULL DEFAULT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NULL DEFAULT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `send_status` tinyint NOT NULL DEFAULT 0 COMMENT '閸欐垿鈧胶濮搁幀?,
  `send_time` datetime NULL DEFAULT NULL COMMENT '閸欐垿鈧焦妞傞梻?,
  `api_send_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇?API 閸欐垿鈧胶绮ㄩ弸婊呮畱缂傛牜鐖?,
  `api_send_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇?API 閸欐垿鈧礁銇戠拹銉ф畱閹绘劗銇?,
  `api_request_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱閸烆垯绔寸拠閿嬬湴 ID',
  `api_serial_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱鎼村繐褰?,
  `receive_status` tinyint NOT NULL DEFAULT 0 COMMENT '閹恒儲鏁归悩鑸碘偓?,
  `receive_time` datetime NULL DEFAULT NULL COMMENT '閹恒儲鏁归弮鍫曟？',
  `api_receive_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫮绱惍?,
  `api_receive_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫯顕╅弰?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1568 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻厺淇婇弮銉ョ箶';

-- ----------------------------
-- Records of system_sms_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `system_sms_template`;
CREATE TABLE `system_sms_template`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `type` tinyint NOT NULL COMMENT '濡剝婢樼猾璇茬€?,
  `status` tinyint NOT NULL COMMENT '瀵偓閸氼垳濮搁幀?,
  `code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢樼紓鏍垳',
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀崥宥囆?,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '濡剝婢橀崘鍛啇',
  `params` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸欏倹鏆熼弫鎵矋',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `api_template_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?,
  `channel_id` bigint NOT NULL COMMENT '閻厺淇婂〒鐘讳壕缂傛牕褰?,
  `channel_code` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻厺淇婂〒鐘讳壕缂傛牜鐖?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻厺淇婂Ο鈩冩緲';

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
BEGIN;
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (2, 1, 0, 'test_01', '濞村鐦宀冪槈閻胶鐓穱?, '濮濓絽婀潻娑滎攽閻ц缍嶉幙宥勭稊{operation}閿涘本鍋嶉惃鍕崣鐠囦胶鐖滈弰鐦俢ode}', '[\"operation\",\"code\"]', '濞村鐦径鍥ㄦ暈', '4383920', 4, 'DEBUG_DING_TALK', '', '2021-03-31 10:49:38', '1', '2024-08-18 11:57:18', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (3, 1, 0, 'test_02', '閸忣剙鎲￠柅姘辩叀', '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '[\"code\"]', NULL, 'SMS_207945135', 2, 'ALIYUN', '', '2021-03-31 11:56:30', '1', '2021-04-10 01:22:02', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (6, 3, 0, 'test-01', '濞村鐦Ο鈩冩緲', '閸濆牆鎼遍崫?{name}', '[\"name\"]', 'f閸濆牆鎼遍崫?, '4383920', 4, 'DEBUG_DING_TALK', '1', '2021-04-10 01:07:21', '1', '2024-08-18 11:57:07', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (7, 3, 0, 'test-04', '濞村鐦稉?, '閼颁線娴畕name}閿涘瞼澧伴柅绱峜ode}', '[\"name\",\"code\"]', '閸濆牆鎼遍崫鍫濇惐', 'suibian', 7, 'DEBUG_DING_TALK', '1', '2021-04-13 00:29:53', '1', '2024-09-30 00:56:24', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (8, 1, 0, 'user-sms-login', '閸撳秴褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', '閹劎娈戞宀冪槈閻焦妲竰code}', '[\"code\"]', NULL, '4372216', 4, 'DEBUG_DING_TALK', '1', '2021-10-11 08:10:00', '1', '2024-08-18 11:57:06', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (12, 2, 0, 'demo', '濠曟梻銇氬Ο鈩冩緲', '閹存垵姘ㄩ弰顖涚ゴ鐠囨洑绔存稉瀣╃瑓', '[]', NULL, 'biubiubiu', 4, 'DEBUG_DING_TALK', '1', '2022-04-10 23:22:49', '1', '2024-08-18 11:57:04', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (14, 1, 0, 'user-update-mobile', '娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁奸幍瀣簚', '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:04', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (15, 1, 0, 'user-update-password', '娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁肩€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-08-19 11:34:18', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (16, 1, 0, 'user-reset-password', '娴兼艾鎲抽悽銊﹀煕 - 闁插秶鐤嗙€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2023-08-19 18:58:01', '1', '2023-12-02 22:35:27', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (18, 1, 0, 'admin-reset-password', '閸氬骸褰撮悽銊﹀煕 - 韫囨顔囩€靛棛鐖?, '閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, '[\"code\"]', '', 'null', 4, 'DEBUG_DING_TALK', '1', '2025-03-16 14:19:34', '1', '2025-03-16 14:19:45', b'0');
INSERT INTO `system_sms_template` (`id`, `type`, `status`, `code`, `name`, `content`, `params`, `remark`, `api_template_id`, `channel_id`, `channel_code`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (19, 1, 0, 'admin-sms-login', '閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', '閹劎娈戞宀冪槈閻焦妲竰code}', '[\"code\"]', '', '4372216', 4, 'DEBUG_DING_TALK', '1', '2025-04-08 09:36:03', '1', '2025-04-08 09:36:17', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
DROP TABLE IF EXISTS `system_social_client`;
CREATE TABLE `system_social_client`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鎼存梻鏁ら崥?,
  `social_type` tinyint NOT NULL COMMENT '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖滅椽閸?,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '鐎广垺鍩涚粩顖氱槕闁?,
  `agent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '娴狅絿鎮婄紓鏍у娇',
  `public_key` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'publicKey 閸忣剟鎸?,
  `status` tinyint NOT NULL COMMENT '閻樿埖鈧?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁€鍙ユ唉鐎广垺鍩涚粩顖濄€?;

-- ----------------------------
-- Records of system_social_client
-- ----------------------------
BEGIN;
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '闁藉鎷?, 20, 2, 'dingvrnreaje3yqvzhxg', 'i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI', NULL, NULL, 0, '', '2023-10-18 11:21:18', '1', '2023-12-20 21:28:26', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '闁藉鎷ら敍鍫㈠竾閸︾喕鐪撮敍?, 20, 2, 'dingtsu9hpepjkbmthhw', 'FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP', NULL, NULL, 0, '', '2023-10-18 11:21:18', '', '2023-12-20 21:28:26', b'1', 121);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, '瀵邦喕淇婇崗顑跨船閸?, 31, 1, 'wx5b23ba7a5589ecbb', '2a7b3b20c537e52e74afd395eb85f61f', NULL, NULL, 0, '', '2023-10-18 16:07:46', '1', '2023-12-20 21:28:23', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (43, '瀵邦喕淇婄亸蹇曗柤鎼?, 34, 1, 'wx63c280fe3248a3e7', '6f270509224a7ae1296bbf1c8cb97aed', NULL, NULL, 0, '', '2023-10-19 13:37:41', '1', '2023-12-20 21:28:25', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (44, '1', 10, 1, '2', '3', NULL, NULL, 0, '1', '2025-04-06 20:36:28', '1', '2025-04-06 20:43:12', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (45, '1', 10, 1, '2', '3', NULL, NULL, 1, '1', '2025-09-06 20:26:15', '1', '2025-09-06 20:27:55', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (46, '1', 10, 1, '2', '3', NULL, NULL, 0, '1', '2025-11-29 16:04:23', '1', '2025-11-29 16:04:26', b'1', 1);
INSERT INTO `system_social_client` (`id`, `name`, `social_type`, `user_type`, `client_id`, `client_secret`, `agent_id`, `public_key`, `status`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (47, '123', 10, 1, '1', '2', '3', NULL, 0, '1', '2025-12-21 10:27:02', '1', '2025-12-21 10:27:20', b'1', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user`;
CREATE TABLE `system_social_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?閼奉亜顤冪粵鏍殣)',
  `type` tinyint NOT NULL COMMENT '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
  `openid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缁€鍙ユ唉 openid',
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '缁€鍙ユ唉 token',
  `raw_token_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸樼喎顫?Token 閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?,
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涢弰鐢敌?,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閻劍鍩涙径鏉戝剼',
  `raw_user_info` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸樼喎顫愰悽銊﹀煕閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?,
  `code` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?code',
  `state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?state',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type_openid`(`type` ASC, `openid` ASC) USING BTREE,
  INDEX `idx_type_code_state`(`type` ASC, `code` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁€鍙ユ唉閻劍鍩涚悰?;

-- ----------------------------
-- Records of system_social_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS `system_social_user_bind`;
CREATE TABLE `system_social_user_bind`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '娑撳鏁?閼奉亜顤冪粵鏍殣)',
  `user_id` bigint NOT NULL COMMENT '閻劍鍩涚紓鏍у娇',
  `user_type` tinyint NOT NULL COMMENT '閻劍鍩涚猾璇茬€?,
  `social_type` tinyint NOT NULL COMMENT '缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
  `social_user_id` bigint NOT NULL COMMENT '缁€鍙ユ唉閻劍鍩涢惃鍕椽閸?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_type_social_user_id`(`user_type` ASC, `social_user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁€鍙ユ唉缂佹垵鐣剧悰?;

-- ----------------------------
-- Records of system_social_user_bind
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant`;
CREATE TABLE `system_tenant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缁夌喐鍩涚紓鏍у娇',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缁夌喐鍩涢崥?,
  `contact_user_id` bigint NULL DEFAULT NULL COMMENT '閼辨梻閮存禍铏规畱閻劍鍩涚紓鏍у娇',
  `contact_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閼辨梻閮存禍?,
  `contact_mobile` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '閼辨梻閮撮幍瀣簚',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涢悩鑸碘偓?,
  `websites` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '缂佹垵鐣鹃崺鐔锋倳閺佹壆绮?,
  `package_id` bigint NOT NULL COMMENT '缁夌喐鍩涙總妤咁樀缂傛牕褰?,
  `expire_time` datetime NOT NULL COMMENT '鏉╁洦婀￠弮鍫曟？',
  `account_count` int NOT NULL COMMENT '鐠愶箑褰块弫浼村櫤',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁夌喐鍩涚悰?;

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
BEGIN;
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (1, '閼哄浜惧┃鎰垳', NULL, '閼哄澹?, '17321315478', 0, '127.0.0.1:3000,wxc4598c446f8a9cb3', 0, '2099-02-19 17:14:16', 9999, '1', '2021-01-05 17:03:47', '1', '2025-08-19 05:18:41', b'0');
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (121, '鐏忓繒顫ら幋?, 110, '鐏忓繒甯?', '15601691300', 0, '123321', 111, '2026-07-10 00:00:00', 30, '1', '2022-02-22 00:56:14', '1', '2025-08-19 21:19:29', b'0');
INSERT INTO `system_tenant` (`id`, `name`, `contact_user_id`, `contact_name`, `contact_mobile`, `status`, `websites`, `package_id`, `expire_time`, `account_count`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (122, '濞村鐦粔鐔稿煕', 113, '閼哄浜?, '15601691300', 0, '222,333', 111, '2023-04-29 00:00:00', 50, '1', '2022-03-07 21:37:58', '1', '2026-06-01 23:29:35', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS `system_tenant_package`;
CREATE TABLE `system_tenant_package`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '婵傛顦电紓鏍у娇',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '婵傛顦甸崥?,
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涢悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '婢跺洦鏁?,
  `menu_ids` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閸忓疇浠堥惃鍕綅閸楁洜绱崣?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁夌喐鍩涙總妤咁樀鐞?;

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
BEGIN;
INSERT INTO `system_tenant_package` (`id`, `name`, `status`, `remark`, `menu_ids`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (111, '閺咁噣鈧艾顨滄?, 0, '鐏忓繐濮涢懗?, '[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,100,101,102,103,106,107,110,111,112,113,114,1138,1139,115,1140,116,1141,1142,1143,2739,2740,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,1255,1256,1257,1258,1259,1260,2472,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491,2492,2493,2494,2495,2497,2525,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]', '1', '2022-02-22 00:54:00', '1', '2025-09-06 20:52:25', b'0');
INSERT INTO `system_tenant_package` (`id`, `name`, `status`, `remark`, `menu_ids`, `creator`, `create_time`, `updater`, `update_time`, `deleted`) VALUES (113, '濞村鐦總妤咁樀閿涘牆鏆愰柈鑺ョ梾閺堝绱?, 0, '', '[]', '1', '2026-06-01 23:22:39', '1', '2026-06-09 14:44:00', b'0');
COMMIT;

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS `system_user_post`;
CREATE TABLE `system_user_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '閻劍鍩汭D',
  `post_id` bigint NOT NULL DEFAULT 0 COMMENT '瀹€妞剧秴ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻劍鍩涘畝妞剧秴鐞?;

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
BEGIN;
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (112, 1, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (113, 100, 1, 'admin', '2022-05-02 07:25:24', 'admin', '2022-05-02 07:25:24', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (115, 104, 1, '1', '2022-05-16 19:36:28', '1', '2022-05-16 19:36:28', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (116, 117, 2, '1', '2022-07-09 17:40:26', '1', '2022-07-09 17:40:26', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (117, 118, 1, '1', '2022-07-09 17:44:44', '1', '2022-07-09 17:44:44', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (119, 114, 5, '1', '2024-03-24 20:45:51', '1', '2024-03-24 20:45:51', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (123, 115, 1, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (124, 115, 2, '1', '2024-04-04 09:37:14', '1', '2024-04-04 09:37:14', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (125, 1, 2, '1', '2024-07-13 22:31:39', '1', '2024-07-13 22:31:39', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (128, 139, 2, '1', '2025-12-05 21:43:27', '1', '2025-12-05 21:43:27', b'0', 1);
INSERT INTO `system_user_post` (`id`, `user_id`, `post_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (129, 139, 4, '1', '2025-12-05 21:43:27', '1', '2025-12-05 21:43:27', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閼奉亜顤冪紓鏍у娇',
  `user_id` bigint NOT NULL COMMENT '閻劍鍩汭D',
  `role_id` bigint NOT NULL COMMENT '鐟欐帟澹奍D',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻劍鍩涢崪宀冾潡閼规彃鍙ч懕鏃囥€?;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
BEGIN;
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 1, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:17', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 2, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:13', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, 100, 1, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:12', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, 100, 2, '', '2022-01-11 13:19:45', '', '2022-05-12 12:35:11', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (10, 103, 1, '1', '2022-01-11 13:19:45', '1', '2022-01-11 13:19:45', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (14, 110, 109, '1', '2022-02-22 00:56:14', '1', '2022-02-22 00:56:14', b'0', 121);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 111, 110, '110', '2022-02-23 13:14:38', '110', '2022-02-23 13:14:38', b'0', 121);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (16, 113, 111, '1', '2022-03-07 21:37:58', '1', '2022-03-07 21:37:58', b'0', 122);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (18, 1, 2, '1', '2022-05-12 20:39:29', '1', '2022-05-12 20:39:29', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (22, 115, 2, '1', '2022-07-21 22:08:30', '1', '2022-07-21 22:08:30', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (35, 112, 1, '1', '2024-03-15 20:00:24', '1', '2024-03-15 20:00:24', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (36, 118, 1, '1', '2024-03-17 09:12:08', '1', '2024-03-17 09:12:08', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (46, 117, 1, '1', '2024-10-02 10:16:11', '1', '2024-10-02 10:16:11', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (47, 104, 2, '1', '2025-01-04 10:40:33', '1', '2025-01-04 10:40:33', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (48, 100, 155, '1', '2025-04-04 10:41:14', '1', '2025-04-04 10:41:14', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (49, 142, 1, '1', '2025-07-23 09:11:42', '1', '2025-07-23 09:11:42', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (50, 142, 2, '1', '2025-10-07 20:50:37', '1', '2025-10-07 20:50:37', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (51, 139, 1, '1', '2025-12-05 22:36:57', '1', '2025-12-05 22:36:57', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (52, 139, 2, '1', '2025-12-05 22:37:00', '1', '2025-12-05 22:37:00', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (53, 114, 2, '1', '2026-01-04 18:15:40', '1', '2026-01-04 18:15:40', b'0', 1);
INSERT INTO `system_user_role` (`id`, `user_id`, `role_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (54, 114, 3, '1', '2026-01-04 18:16:19', '1', '2026-01-04 18:16:19', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '閻劍鍩汭D',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涚拹锕€褰?,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '鐎靛棛鐖?,
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻劍鍩涢弰鐢敌?,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢跺洦鏁?,
  `dept_id` bigint NULL DEFAULT NULL COMMENT '闁劑妫琁D',
  `post_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '瀹€妞剧秴缂傛牕褰块弫鎵矋',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閻劍鍩涢柇顔绢唸',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閹靛婧€閸欓鐖?,
  `sex` tinyint NULL DEFAULT 0 COMMENT '閻劍鍩涢幀褍鍩?,
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '婢舵潙鍎氶崷鏉挎絻',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '鐢劕褰块悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺堚偓閸氬海娅ヨぐ鏃綪',
  `login_date` datetime NULL DEFAULT NULL COMMENT '閺堚偓閸氬海娅ヨぐ鏇熸闂?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_mobile`(`mobile` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_dept_id`(`dept_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '閻劍鍩涙穱鈩冧紖鐞?;

-- ----------------------------
-- Records of system_users
-- ----------------------------
BEGIN;
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, 'admin', '$2a$04$.vd8nPeLwxt6hnSzmAoAyul8BOLX7Cib6QhcxRe30rfvrIPQHH1OG', '閼哄浜惧┃鎰垳', '缁狅紕鎮婇崨?, 103, '[1,2]', '13aoteman@126.com', '18818260272', 1, 'http://test.yudao.iocoder.cn/20260517/blob_1778998103688.png', 0, '0:0:0:0:0:0:0:1', '2026-06-28 03:39:52', 'admin', '2021-01-05 17:03:47', NULL, '2026-06-28 03:39:52', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (100, 'yudao', '$2a$04$.vd8nPeLwxt6hnSzmAoAyul8BOLX7Cib6QhcxRe30rfvrIPQHH1OG', '閼哄浜?, '娑撳秷顩﹂崥鎾村灉', 104, '[1]', 'yudao@iocoder.cn', '15601691300', 1, NULL, 0, '127.0.0.1', '2026-06-17 09:37:17', '', '2021-01-07 09:07:17', NULL, '2026-06-17 09:37:17', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (103, 'yuanma', '$2a$04$k/d6mc0nySN0i2udwcI8Ee8V5aM5OHixBRbQfXmPuFTUl3Zf/DBs.', '濠ф劗鐖?, NULL, 106, NULL, 'yuanma@iocoder.cn', '15601701300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2026-04-27 13:19:27', '', '2021-01-13 23:50:35', NULL, '2026-04-27 13:19:27', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (104, 'test', '$2a$04$BrwaYn303hjA/6TnXqdGoOLhyHOAA0bVrAFu6.1dJKycqKUnIoRz2', '濞村鐦崣?, NULL, 107, '[1,2]', '111@qq.com', '15601691200', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2026-06-16 11:37:56', '', '2021-01-21 02:13:53', NULL, '2026-06-16 11:37:56', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (107, 'admin107', '$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 22:59:33', '1', '2025-04-21 14:23:08', b'0', 118);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (108, 'admin108', '$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:00:50', '1', '2025-04-21 14:23:08', b'0', 119);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (109, 'admin109', '$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', '閼哄澹?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '', NULL, '1', '2022-02-20 23:11:50', '1', '2025-04-21 14:23:08', b'0', 120);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (110, 'admin110', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '鐏忓繒甯?, NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2024-07-20 22:23:17', '1', '2022-02-22 00:56:14', NULL, '2025-04-21 14:23:08', b'0', 121);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (111, 'test', '$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', '濞村鐦悽銊﹀煕', NULL, NULL, '[]', '', '', 0, NULL, 0, '0:0:0:0:0:0:0:1', '2023-12-30 11:42:17', '110', '2022-02-23 13:14:33', NULL, '2025-04-21 14:23:08', b'0', 121);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (112, 'newobject', '$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', '閺傛澘顕挒?, NULL, 100, '[]', '', '15601691235', 1, NULL, 0, '127.0.0.1', '2026-06-17 09:07:20', '1', '2022-02-23 19:08:03', NULL, '2026-06-17 09:07:20', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (113, 'aoteman', '$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', '閼哄浜?', NULL, NULL, NULL, '', '15601691300', 0, NULL, 0, '127.0.0.1', '2022-03-19 18:38:51', '1', '2022-03-07 21:37:58', '1', '2025-05-05 15:30:53', b'0', 122);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (114, 'hrmgr', '$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', 'hr 鐏忓繐顫曟慨?, NULL, NULL, '[5]', '', '15601691236', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2026-01-04 18:16:01', '1', '2022-03-19 21:50:58', NULL, '2026-01-04 18:16:01', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (115, 'aotemane', '$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', '闂冨灝鎲?, '11222', 102, '[1,2]', '7648@qq.com', '15601691229', 2, NULL, 0, '', NULL, '1', '2022-04-30 02:55:43', '1', '2025-04-21 14:23:08', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (117, 'admin123', '$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W', '濞村鐦崣?2', '1111', 100, '[2]', '', '15601691234', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-10-02 10:16:20', '1', '2022-07-09 17:40:26', '1', '2025-05-14 09:56:04', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (118, 'goudan', '$2a$04$3suGZjnA6rM5bErf38u1felbgqbsPHGdRG3l9NkxPCEt2ah9Y6aJi', '閻欐娉?, NULL, 103, '[1]', '', '15601691239', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2025-11-23 15:28:25', '1', '2022-07-09 17:44:43', NULL, '2025-11-23 15:28:25', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (139, 'wwbwwb', '$2a$04$FJLIyg8lbPytP29pbZaiU.LesJvCsYfEaHqQfB0pGQhK3e9BeZmLy', '鐏忓繒顫堟径?, '123', 108, '[2,4]', '', '', 1, NULL, 0, '0:0:0:0:0:0:0:1', '2024-09-10 21:03:58', NULL, '2024-09-10 21:03:58', '1', '2025-12-15 22:38:15', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (141, 'admin1', '$2a$04$oj6F6d7HrZ70kYVD3TNzEu.m3TPUzajOVuC66zdKna8KRerK1FmVa', '閺傛壆鏁ら幋?, NULL, NULL, NULL, '', '', 0, '', 0, '127.0.0.1', '2026-06-17 09:37:18', '1', '2025-04-08 13:09:07', NULL, '2026-06-17 09:37:18', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (142, 'test01', '$2a$04$4bCYWZkjxxOC4QE0LY2M9uEEKWeJbLfs489NFtQoyidL5I0FndRaO', 'test01', '', NULL, '[]', '', '19021719925', 1, '', 0, '0:0:0:0:0:0:0:1', '2026-06-17 10:44:58', '1', '2025-07-09 21:07:10', NULL, '2026-06-17 10:44:58', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (143, 'a00001', '$2a$04$GhVHFviOw/SsTmiQtifHJesDYFlHMeGK7OWh7aGCCjGGVCmbHVAwa', 'a00001', NULL, 104, NULL, '', '', 0, '', 0, '0:0:0:0:0:0:0:1', '2025-12-01 16:10:13', NULL, '2025-12-01 16:10:13', '1', '2025-12-05 21:34:05', b'0', 1);
INSERT INTO `system_users` (`id`, `username`, `password`, `nickname`, `remark`, `dept_id`, `post_ids`, `email`, `mobile`, `sex`, `avatar`, `status`, `login_ip`, `login_date`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (144, 'aoteman001', '$2a$04$omQOmhz8OyUFBKw77nr8KOtMp6xdvoQ1gWStjk9r8.OYT3Bv6oEYe', 'aoteman00112', NULL, 104, NULL, '', '', 0, '', 1, '0:0:0:0:0:0:0:1', '2025-12-01 17:05:27', '1', '2025-12-01 17:05:27', '1', '2026-06-15 18:58:56', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo01_contact
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo01_contact`;
CREATE TABLE `yudao_demo01_contact`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸氬秴鐡?,
  `sex` tinyint(1) NOT NULL COMMENT '閹冨焼',
  `birthday` datetime NOT NULL COMMENT '閸戣櫣鏁撻獮?,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缁犫偓娴?,
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '婢舵潙鍎?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁€杞扮伐閼辨梻閮存禍楦裤€?;

-- ----------------------------
-- Records of yudao_demo01_contact
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo01_contact` (`id`, `name`, `sex`, `birthday`, `description`, `avatar`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '閸︾喕鐪?, 2, '2023-11-07 00:00:00', '<p>婢垛晞娈ㄩ崷鐔荤湸閿涗礁鎲?/p>', 'http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', '1', '2023-11-15 23:34:30', '1', '2023-11-15 23:47:39', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo02_category
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo02_category`;
CREATE TABLE `yudao_demo02_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸氬秴鐡?,
  `parent_id` bigint NOT NULL COMMENT '閻栧墎楠囩紓鏍у娇',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '缁€杞扮伐閸掑棛琚悰?;

-- ----------------------------
-- Records of yudao_demo02_category
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (1, '閸︾喕鐪?, 0, '1', '2023-11-15 23:34:30', '1', '2023-11-16 20:24:23', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '閻ｎ亣瀵?, 0, '1', '2023-11-16 20:24:00', '1', '2023-11-16 20:24:15', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, '閹亝鈧?, 0, '1', '2023-11-16 20:24:32', '1', '2023-11-16 20:24:32', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (4, '鐏忓繒鏆橀懠?, 2, '1', '2023-11-16 20:24:39', '1', '2023-11-16 20:24:39', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, '婢堆呮殬閼?, 2, '1', '2023-11-16 20:24:46', '1', '2023-11-16 20:24:46', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, '11', 3, '1', '2023-11-24 19:29:34', '1', '2023-11-24 19:29:34', b'0', 1);
INSERT INTO `yudao_demo02_category` (`id`, `name`, `parent_id`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, '1', 0, '1', '2025-10-01 09:19:20', '1', '2025-10-01 09:19:20', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_course
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_course`;
CREATE TABLE `yudao_demo03_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `student_id` bigint NOT NULL COMMENT '鐎涳妇鏁撶紓鏍у娇',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸氬秴鐡?,
  `score` tinyint NOT NULL COMMENT '閸掑棙鏆?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎涳妇鏁撶拠鍓р柤鐞?;

-- ----------------------------
-- Records of yudao_demo03_course
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, 2, '鐠囶厽鏋?, 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (3, 2, '閺佹澘顒?, 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 10:55:30', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (6, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:44:40', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (8, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2023-11-16 15:47:09', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (10, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (11, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 10:55:28', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (12, 2, '閻絻鍓?, 33, '1', '2023-11-17 00:20:42', '1', '2023-11-16 16:20:45', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (13, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:26', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (14, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2024-09-17 10:55:49', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (15, 5, '娴ｆ捁鍋?, 23, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (16, 5, '鐠侊紕鐣婚張?, 11, '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (17, 2, '鐠囶厽鏋?, 66, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (18, 2, '閺佹澘顒?, 22, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (19, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2025-04-19 02:49:03', b'1', 1);
INSERT INTO `yudao_demo03_course` (`id`, `student_id`, `name`, `score`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (20, 9, '濠婃垿娲?, 12, '1', '2023-11-17 13:13:20', '1', '2026-06-27 08:42:44', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_grade
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_grade`;
CREATE TABLE `yudao_demo03_grade`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `student_id` bigint NOT NULL COMMENT '鐎涳妇鏁撶紓鏍у娇',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸氬秴鐡?,
  `teacher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '閻濐厺瀵屾禒?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎涳妇鏁撻悵顓犻獓鐞?;

-- ----------------------------
-- Records of yudao_demo03_grade
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (7, 2, '娑撳鍕?2 閻?, '閸涖劍婢冩导?, '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (8, 5, '閸楀簼璐?, '闁儵浠存０鍡楀帥', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_grade` (`id`, `student_id`, `name`, `teacher`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, 9, '鐏忓繐娴?, '鐏忓繐鈻?11', '1', '2023-11-17 13:10:23', '1', '2026-06-27 08:42:44', b'0', 1);
COMMIT;

-- ----------------------------
-- Table structure for yudao_demo03_student
-- ----------------------------
DROP TABLE IF EXISTS `yudao_demo03_student`;
CREATE TABLE `yudao_demo03_student`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '缂傛牕褰?,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '閸氬秴鐡?,
  `sex` tinyint NOT NULL COMMENT '閹冨焼',
  `birthday` datetime NOT NULL COMMENT '閸戣櫣鏁撻弮銉︽埂',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '缁犫偓娴?,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閸掓稑缂撻懓?,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '閸掓稑缂撻弮鍫曟？',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '閺囧瓨鏌婇懓?,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '閺囧瓨鏌婇弮鍫曟？',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '閺勵垰鎯侀崚鐘绘珟',
  `tenant_id` bigint NOT NULL DEFAULT 0 COMMENT '缁夌喐鍩涚紓鏍у娇',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '鐎涳妇鏁撶悰?;

-- ----------------------------
-- Records of yudao_demo03_student
-- ----------------------------
BEGIN;
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (2, '鐏忓繒娅?, 1, '2023-11-16 00:00:00', '<p>閸樺顔?/p>', '1', '2023-11-16 23:21:49', '1', '2024-09-17 18:55:31', b'0', 1);
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (5, '婢堆囩拨', 2, '2023-11-13 00:00:00', '<p>娴ｇ姴婀弫娆愬灉閸嬫矮绨?</p>', '1', '2023-11-16 23:22:46', '1', '2024-09-17 18:55:29', b'0', 1);
INSERT INTO `yudao_demo03_student` (`id`, `name`, `sex`, `birthday`, `description`, `creator`, `create_time`, `updater`, `update_time`, `deleted`, `tenant_id`) VALUES (9, '鐏忓繗濮?, 1, '2023-11-07 00:00:00', '<p>閸濆牆鎼遍崫?/p>', '1', '2023-11-17 00:04:47', '1', '2026-06-27 08:42:44', b'0', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
