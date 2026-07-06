CREATE TABLE IF NOT EXISTS `system_message_push_user_config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint NOT NULL COMMENT '用户编号',
  `channel_code` varchar(32) NOT NULL COMMENT '渠道编码',
  `enabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否启用',
  `endpoint` varchar(255) NOT NULL DEFAULT '' COMMENT '推送地址',
  `secret_key` varchar(255) NOT NULL DEFAULT '' COMMENT '密钥或设备 Key',
  `config_json` varchar(2000) DEFAULT NULL COMMENT '扩展配置 JSON',
  `receive_system_message` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否接收系统消息',
  `receive_notification_message` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否接收通知消息',
  `receive_stock_alert` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否接收股票提醒',
  `creator` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updater` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否删除',
  `tenant_id` bigint NOT NULL DEFAULT '0' COMMENT '租户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_system_message_push_user_channel` (`user_id`, `channel_code`, `deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户消息推送配置表';

INSERT INTO `infra_config`
(`category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
SELECT 'biz', 2, '消息外推总开关', 'system.message-push.enabled', 'true', b'1', '是否启用系统消息外推', '1', NOW(), '1', NOW(), b'0'
WHERE NOT EXISTS (
  SELECT 1 FROM `infra_config` WHERE `config_key` = 'system.message-push.enabled' AND `deleted` = b'0'
);

INSERT INTO `infra_config`
(`category`, `type`, `name`, `config_key`, `value`, `visible`, `remark`, `creator`, `create_time`, `updater`, `update_time`, `deleted`)
SELECT 'biz', 2, '消息外推渠道', 'system.message-push.enabled-channels', 'BARK', b'1', '启用的系统消息外推渠道，多个用英文逗号分隔', '1', NOW(), '1', NOW(), b'0'
WHERE NOT EXISTS (
  SELECT 1 FROM `infra_config` WHERE `config_key` = 'system.message-push.enabled-channels' AND `deleted` = b'0'
);
