/*
 Yudao Database Transfer Tool

 Source Server Type    : MySQL

 Target Server Type    : Microsoft SQL Server

 Date: 2026-05-03 09:41:52
*/


-- ----------------------------
-- Table structure for dual
-- ----------------------------
DROP TABLE IF EXISTS dual
GO
CREATE TABLE dual
(
  id int
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓佹惔鎾圭箾閹恒儳娈戠悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'dual'
GO

-- ----------------------------
-- Records of dual
-- ----------------------------
-- @formatter:off
INSERT INTO dual VALUES (1)
GO
-- @formatter:on

-- ----------------------------
-- Table structure for infra_api_access_log
-- ----------------------------
DROP TABLE IF EXISTS infra_api_access_log
GO
CREATE TABLE infra_api_access_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    trace_id nvarchar(64) DEFAULT '' NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    user_type tinyint DEFAULT 0 NOT NULL,
    application_name nvarchar(50)  NOT NULL,
    request_method nvarchar(16) DEFAULT '' NOT NULL,
    request_url nvarchar(255) DEFAULT '' NOT NULL,
    request_params nvarchar(max)  NULL,
    response_body nvarchar(max)  NULL,
    user_ip nvarchar(50)  NOT NULL,
    user_agent nvarchar(512)  NOT NULL,
    operate_module nvarchar(50) DEFAULT NULL NULL,
    operate_name nvarchar(50) DEFAULT NULL NULL,
    operate_type tinyint DEFAULT 0 NULL,
    begin_time datetime2  NOT NULL,
    end_time datetime2  NOT NULL,
    duration int  NOT NULL,
    result_code int DEFAULT 0 NOT NULL,
    result_msg nvarchar(512) DEFAULT '' NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_api_access_log_01 ON infra_api_access_log (create_time)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺冦儱绻旀稉濠氭暛',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'trace_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'application_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴弬瑙勭《閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'request_method'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴崷鏉挎絻',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'request_url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴崣鍌涙殶',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'request_params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸濆秴绨茬紒鎾寸亯',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'response_body'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'user_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濞村繗顫嶉崳?UA',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'user_agent'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍斿Ο鈥虫健',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'operate_module'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'operate_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈崚鍡欒',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'operate_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵偓婵顕Ч鍌涙闂?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'begin_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹挻娼拠閿嬬湴閺冨爼妫?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'end_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹笛嗩攽閺冨爼鏆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'duration'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹挻鐏夐惍?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'result_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹挻鐏夐幓鎰仛',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'result_msg'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'API 鐠佸潡妫堕弮銉ョ箶鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_access_log'
GO

-- ----------------------------
-- Table structure for infra_api_error_log
-- ----------------------------
DROP TABLE IF EXISTS infra_api_error_log
GO
CREATE TABLE infra_api_error_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    trace_id nvarchar(64)  NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    user_type tinyint DEFAULT 0 NOT NULL,
    application_name nvarchar(50)  NOT NULL,
    request_method nvarchar(16)  NOT NULL,
    request_url nvarchar(255)  NOT NULL,
    request_params nvarchar(4000)  NOT NULL,
    user_ip nvarchar(50)  NOT NULL,
    user_agent nvarchar(512)  NOT NULL,
    exception_time datetime2  NOT NULL,
    exception_name nvarchar(128) DEFAULT '' NOT NULL,
    exception_message nvarchar(max)  NOT NULL,
    exception_root_cause_message nvarchar(max)  NOT NULL,
    exception_stack_trace nvarchar(max)  NOT NULL,
    exception_class_name nvarchar(512)  NOT NULL,
    exception_file_name nvarchar(512)  NOT NULL,
    exception_method_name nvarchar(512)  NOT NULL,
    exception_line_number int  NOT NULL,
    process_status tinyint  NOT NULL,
    process_time datetime2 DEFAULT NULL NULL,
    process_user_id int DEFAULT 0 NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_api_error_log_01 ON infra_api_error_log (create_time)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'trace_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'application_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴弬瑙勭《閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'request_method'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴崷鏉挎絻',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'request_url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴崣鍌涙殶',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'request_params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'user_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濞村繗顫嶉崳?UA',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'user_agent'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崣鎴犳晸閺冨爼妫?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖剁€佃壈鍤ч惃鍕Х閹?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_message'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖剁€佃壈鍤ч惃鍕壌濞戝牊浼?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_root_cause_message'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕惃鍕垽鏉炪劏鎶?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_stack_trace'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚崗銊ユ倳',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_class_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崣鎴犳晸閻ㄥ嫮琚弬鍥︽',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_file_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇炴倳',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_method_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵倸鐖堕崣鎴犳晸閻ㄥ嫭鏌熷▔鏇熷閸︺劏顢?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'exception_line_number'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'process_status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'process_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇悽銊﹀煕缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'process_user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁崵绮哄鍌氱埗閺冦儱绻?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_api_error_log'
GO

-- ----------------------------
-- Table structure for infra_codegen_column
-- ----------------------------
DROP TABLE IF EXISTS infra_codegen_column
GO
CREATE TABLE infra_codegen_column (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    table_id bigint  NOT NULL,
    column_name nvarchar(200)  NOT NULL,
    data_type nvarchar(100)  NOT NULL,
    column_comment nvarchar(500)  NOT NULL,
    nullable varchar(1)  NOT NULL,
    primary_key varchar(1)  NOT NULL,
    ordinal_position int  NOT NULL,
    java_type nvarchar(32)  NOT NULL,
    java_field nvarchar(64)  NOT NULL,
    dict_type nvarchar(200) DEFAULT '' NULL,
    example nvarchar(64) DEFAULT NULL NULL,
    create_operation varchar(1)  NOT NULL,
    update_operation varchar(1)  NOT NULL,
    list_operation varchar(1)  NOT NULL,
    list_operation_condition nvarchar(32) DEFAULT '=' NOT NULL,
    list_operation_result varchar(1)  NOT NULL,
    html_type nvarchar(32)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_codegen_column_01 ON infra_codegen_column (table_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐞涖劎绱崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'table_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙顔岄崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'column_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙顔岀猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'data_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙顔岄幓蹇氬牚',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'column_comment'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崗浣筋啅娑撹櫣鈹?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'nullable'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉濠氭暛',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'primary_key'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹烘帒绨?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'ordinal_position'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'Java 鐏炵偞鈧呰閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'java_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'Java 鐏炵偞鈧冩倳',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'java_field'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€缁鐎?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'dict_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓佺粈杞扮伐',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'example'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉?Create 閸掓稑缂撻幙宥勭稊閻ㄥ嫬鐡у▓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'create_operation'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉?Update 閺囧瓨鏌婇幙宥勭稊閻ㄥ嫬鐡у▓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'update_operation'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫬鐡у▓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'list_operation'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'List 閺屻儴顕楅幙宥勭稊閻ㄥ嫭娼禒鍓佽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'list_operation_condition'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉?List 閺屻儴顕楅幙宥勭稊閻ㄥ嫯绻戦崶鐐茬摟濞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'list_operation_result'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勫墽銇氱猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'html_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴狅絿鐖滈悽鐔稿灇鐞涖劌鐡у▓闈涚暰娑?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_column'
GO

-- ----------------------------
-- Table structure for infra_codegen_table
-- ----------------------------
DROP TABLE IF EXISTS infra_codegen_table
GO
CREATE TABLE infra_codegen_table (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    data_source_config_id bigint  NOT NULL,
    scene tinyint DEFAULT 1 NOT NULL,
    table_name nvarchar(200) DEFAULT '' NOT NULL,
    table_comment nvarchar(500) DEFAULT '' NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    module_name nvarchar(30)  NOT NULL,
    business_name nvarchar(30)  NOT NULL,
    class_name nvarchar(100) DEFAULT '' NOT NULL,
    class_comment nvarchar(50)  NOT NULL,
    author nvarchar(50)  NOT NULL,
    template_type tinyint DEFAULT 1 NOT NULL,
    front_type tinyint  NOT NULL,
    parent_menu_id bigint DEFAULT NULL NULL,
    master_table_id bigint DEFAULT NULL NULL,
    sub_join_column_id bigint DEFAULT NULL NULL,
    sub_join_many varchar(1) DEFAULT NULL NULL,
    tree_parent_column_id bigint DEFAULT NULL NULL,
    tree_name_column_id bigint DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓佸┃鎰板帳缂冾喚娈戠紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'data_source_config_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻㈢喐鍨氶崷鐑樻珯',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'scene'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐞涖劌鎮曠粔?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'table_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐞涖劍寮挎潻?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'table_comment'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡€虫健閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'module_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撴艾濮熼崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'business_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁鎮曠粔?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'class_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁粯寮挎潻?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'class_comment'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴ｆ粏鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'author'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'template_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸撳秶顏猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'front_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻栨儼褰嶉崡鏇犵椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'parent_menu_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撴槒銆冮惃鍕椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'master_table_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙劘銆冮崗瀹犱粓娑撴槒銆冮惃鍕摟濞堢數绱崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'sub_join_column_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撴槒銆冩稉搴＄摍鐞涖劍妲搁崥锔跨鐎电懓顦?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'sub_join_many'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺嶆垼銆冮惃鍕煑鐎涙顔岀紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'tree_parent_column_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺嶆垼銆冮惃鍕倳鐎涙鐡у▓鐢电椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'tree_name_column_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴狅絿鐖滈悽鐔稿灇鐞涖劌鐣炬稊?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_codegen_table'
GO

-- ----------------------------
-- Table structure for infra_config
-- ----------------------------
DROP TABLE IF EXISTS infra_config
GO
CREATE TABLE infra_config (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    category nvarchar(50)  NOT NULL,
    type tinyint  NOT NULL,
    name nvarchar(100) DEFAULT '' NOT NULL,
    config_key nvarchar(100) DEFAULT '' NOT NULL,
    value nvarchar(500) DEFAULT '' NOT NULL,
    visible varchar(1)  NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_config_01 ON infra_config (config_key)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熸稉濠氭暛',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼崚鍡欑矋',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'category'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熺猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼柨顔兼倳',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'config_key'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼柨顔尖偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崣顖濐潌',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'visible'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼柊宥囩枂鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_config'
GO

-- ----------------------------
-- Records of infra_config
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT infra_config ON
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (2, N'biz', 1, N'閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, N'system.user.init-password', N'123456', N'0', N'閸掓繂顫愰崠鏍х槕閻?123456', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-07-20 17:22:47', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (7, N'url', 2, N'MySQL 閻╂垶甯堕惃鍕勾閸р偓', N'url.druid', N'', N'1', N'', N'1', N'2023-04-07 13:41:16', N'1', N'2023-04-07 14:33:38', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (8, N'url', 2, N'SkyWalking 閻╂垶甯堕惃鍕勾閸р偓', N'url.skywalking', N'', N'1', N'', N'1', N'2023-04-07 13:41:16', N'1', N'2023-04-07 14:57:03', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (9, N'url', 2, N'Spring Boot Admin 閻╂垶甯堕惃鍕勾閸р偓', N'url.spring-boot-admin', N'', N'1', N'', N'1', N'2023-04-07 13:41:16', N'1', N'2023-04-07 14:52:07', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (10, N'url', 2, N'Swagger 閹恒儱褰涢弬鍥ㄣ€傞惃鍕勾閸р偓', N'url.swagger', N'', N'1', N'', N'1', N'2023-04-07 13:41:16', N'1', N'2023-04-07 14:59:00', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (12, N'test2', 2, N'test3', N'test4', N'test5', N'1', N'test6', N'1', N'2023-12-03 09:55:16', N'1', N'2025-04-06 21:00:09', N'0')
GO
INSERT INTO infra_config (id, category, type, name, config_key, value, visible, remark, creator, create_time, updater, update_time, deleted) VALUES (13, N'閻劍鍩涚粻锛勬倞-鐠愶箑褰块崚婵嗩潗鐎靛棛鐖?, 2, N'閻劍鍩涚粻锛勬倞-濞夈劌鍞藉鈧崗?, N'system.user.register-enabled', N'true', N'0', N'', N'1', N'2025-04-26 17:23:41', N'1', N'2025-04-26 17:23:41', N'0')
GO
SET IDENTITY_INSERT infra_config OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for infra_data_source_config
-- ----------------------------
DROP TABLE IF EXISTS infra_data_source_config
GO
CREATE TABLE infra_data_source_config (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(100) DEFAULT '' NOT NULL,
    url nvarchar(1024)  NOT NULL,
    username nvarchar(255)  NOT NULL,
    password nvarchar(255) DEFAULT '' NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撳鏁紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓佸┃鎰箾閹?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎靛棛鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓佸┃鎰板帳缂冾喛銆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_data_source_config'
GO

-- ----------------------------
-- Table structure for infra_file
-- ----------------------------
DROP TABLE IF EXISTS infra_file
GO
CREATE TABLE infra_file (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    config_id bigint DEFAULT NULL NULL,
    name nvarchar(256) DEFAULT NULL NULL,
    path nvarchar(512)  NOT NULL,
    url nvarchar(1024)  NOT NULL,
    type nvarchar(128) DEFAULT NULL NULL,
    size int  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁板秶鐤嗙紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'config_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈤崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢捄顖氱窞',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'path'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆?URL',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈡径褍鐨?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'size'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file'
GO

-- ----------------------------
-- Table structure for infra_file_config
-- ----------------------------
DROP TABLE IF EXISTS infra_file_config
GO
CREATE TABLE infra_file_config (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(63)  NOT NULL,
    storage tinyint  NOT NULL,
    remark nvarchar(255) DEFAULT NULL NULL,
    master varchar(1)  NOT NULL,
    config nvarchar(4000)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁板秶鐤嗛崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙ê鍋嶉崳?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'storage'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹稉杞板瘜闁板秶鐤?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'master'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙ê鍋嶉柊宥囩枂',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'config'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈤柊宥囩枂鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_config'
GO

-- ----------------------------
-- Records of infra_file_config
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT infra_file_config ON
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (4, N'閺佺増宓佹惔鎿勭礄缁€杞扮伐閿?, 1, N'閹存垶妲搁弫鐗堝祦鎼?, N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.db.DBFileClientConfig","domain":"http://127.0.0.1:48080"}', N'1', N'2022-03-15 23:56:24', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (22, N'娑撳啰澧扮€涙ê鍋嶉崳顭掔礄缁€杞扮伐閿?, 20, N'鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', N'1', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"s3.cn-south-1.qiniucs.com","domain":"http://test.yudao.iocoder.cn","bucket":"ruoyi-vue-pro","accessKey":"demo-qiniu-access-key","accessSecret":"demo-qiniu-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-01-13 22:11:12', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (24, N'閼垫崘顔嗘禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, N'鐠囬攱宕查幋鎰稑閻ㄥ嫬鐦戦柦銉磼閿涗緤绱?, N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"https://cos.ap-shanghai.myqcloud.com","domain":"http://tengxun-oss.iocoder.cn","bucket":"aoteman-1255880240","accessKey":"demo-tencent-secret-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-11-09 16:03:22', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (25, N'闂冨潡鍣锋禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, N'', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"oss-cn-beijing.aliyuncs.com","domain":"http://ali-oss.iocoder.cn","bucket":"yunai-aoteman","accessKey":"demo-aliyun-access-key-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-11-09 16:47:08', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (26, N'閻忣偄鍖楁禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, N'', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"tos-s3-cn-beijing.volces.com","domain":null,"bucket":"yunai","accessKey":"demo-volcengine-access-key-id","accessSecret":"demo-volcengine-access-key-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-11-09 16:56:42', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (27, N'閸楀簼璐熸禍鎴濈摠閸岊煉绱欑粈杞扮伐閿?, 20, N'', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"obs.cn-east-3.myhuaweicloud.com","domain":"","bucket":"yudao","accessKey":"demo-huawei-access-key-id","accessSecret":"demo-access-secret","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-11-09 17:18:41', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (28, N'MinIO 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 20, N'', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"http://127.0.0.1:9000","domain":"http://127.0.0.1:9000/yudao","bucket":"yudao","accessKey":"admin","accessSecret":"password","enablePathStyleAccess":false,"enablePublicAccess":true}', N'1', N'2024-11-09 17:43:10', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (29, N'閺堫剙婀寸€涙ê鍋嶉敍鍫仛娓氬绱?, 10, N'mac/linux 娴ｈ法鏁?/閿涘瘍indows 娴ｈ法鏁?\\', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.local.LocalFileClientConfig","basePath":"/Users/yunai/tmp/file","domain":"http://127.0.0.1:48080"}', N'1', N'2025-05-02 11:25:45', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (30, N'SFTP 鐎涙ê鍋嶉敍鍫仛娓氬绱?, 12, N'', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.sftp.SftpFileClientConfig","basePath":"/upload","domain":"http://127.0.0.1:48080","host":"127.0.0.1","port":2222,"username":"foo","password":"pass"}', N'1', N'2025-05-02 16:34:10', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (34, N'娑撳啰澧版禍鎴濈摠閸屻劊鈧劗顫嗛張澶堚偓鎴礄缁€杞扮伐閿?, 20, N'鐠囬攱宕查幋鎰稑閼奉亜绻侀惃鍕槕闁姐儻绱掗敍渚婄磼', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"s3.cn-south-1.qiniucs.com","domain":"http://t151glocd.hn-bkt.clouddn.com","bucket":"ruoyi-vue-pro-private","accessKey":"demo-qiniu-access-key","accessSecret":"demo-qiniu-access-secret","enablePathStyleAccess":false,"enablePublicAccess":false}', N'1', N'2025-08-17 21:22:00', N'1', N'2025-11-24 20:57:14', N'0')
GO
INSERT INTO infra_file_config (id, name, storage, remark, master, config, creator, create_time, updater, update_time, deleted) VALUES (35, N'1', 20, N'1', N'0', N'{"@class":"cn.iocoder.yudao.module.infra.framework.file.core.client.s3.S3FileClientConfig","endpoint":"http://www.baidu.com","domain":"http://www.xxx.com","bucket":"1","accessKey":"2","accessSecret":"3","enablePathStyleAccess":false,"enablePublicAccess":false,"region":"1"}', N'1', N'2025-10-02 14:32:12', N'1', N'2025-11-29 15:59:39', N'0')
GO
SET IDENTITY_INSERT infra_file_config OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for infra_file_content
-- ----------------------------
DROP TABLE IF EXISTS infra_file_content
GO
CREATE TABLE infra_file_content (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    config_id bigint  NOT NULL,
    path nvarchar(512)  NOT NULL,
    content varbinary(max)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_file_content_01 ON infra_file_content (config_id, path)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁板秶鐤嗙紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'config_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢捄顖氱窞',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'path'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈤崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺傚洣娆㈢悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_file_content'
GO

-- ----------------------------
-- Table structure for infra_job
-- ----------------------------
DROP TABLE IF EXISTS infra_job
GO
CREATE TABLE infra_job (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(32)  NOT NULL,
    status tinyint  NOT NULL,
    handler_name nvarchar(64)  NOT NULL,
    handler_param nvarchar(255) DEFAULT NULL NULL,
    cron_expression nvarchar(32)  NOT NULL,
    retry_count int DEFAULT 0 NOT NULL,
    retry_interval int DEFAULT 0 NOT NULL,
    monitor_timeout int DEFAULT 0 NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犺濮熺紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犺濮熼崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犺濮熼悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'handler_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'handler_param'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'CRON 鐞涖劏鎻?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'cron_expression'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁插秷鐦▎鈩冩殶',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'retry_count'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁插秷鐦梻鎾',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'retry_interval'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻╂垶甯剁搾鍛閺冨爼妫?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'monitor_timeout'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎规碍妞傛禒璇插鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job'
GO

-- ----------------------------
-- Records of infra_job
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT infra_job ON
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (5, N'閺€顖欑帛闁氨鐓?Job', 2, N'payNotifyJob', NULL, N'* * * * * ?', 0, 0, 0, N'1', N'2021-10-27 08:34:42', N'1', N'2024-09-12 13:32:48', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (17, N'閺€顖欑帛鐠併垹宕熼崥灞绢劄 Job', 2, N'payOrderSyncJob', NULL, N'0 0/1 * * * ?', 0, 0, 0, N'1', N'2023-07-22 14:36:26', N'1', N'2023-07-22 15:39:08', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (18, N'閺€顖欑帛鐠併垹宕熸潻鍥ㄦ埂 Job', 2, N'payOrderExpireJob', NULL, N'0 0/1 * * * ?', 0, 0, 0, N'1', N'2023-07-22 15:36:23', N'1', N'2023-07-22 15:39:54', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (19, N'闁偓濞嗘崘顓归崡鏇犳畱閸氬本顒?Job', 2, N'payRefundSyncJob', NULL, N'0 0/1 * * * ?', 0, 0, 0, N'1', N'2023-07-23 21:03:44', N'1', N'2023-07-23 21:09:00', N'0')
GO
GO
GO
GO
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (25, N'鐠佸潡妫堕弮銉ョ箶濞撳懐鎮?Job', 2, N'accessLogCleanJob', N'', N'0 0 0 * * ?', 3, 0, 0, N'1', N'2023-10-03 10:59:41', N'1', N'2023-10-03 11:01:10', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (26, N'闁挎瑨顕ら弮銉ョ箶濞撳懐鎮?Job', 2, N'errorLogCleanJob', N'', N'0 0 0 * * ?', 3, 0, 0, N'1', N'2023-10-03 11:00:43', N'1', N'2023-10-03 11:01:12', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (27, N'娴犺濮熼弮銉ョ箶濞撳懐鎮?Job', 2, N'jobLogCleanJob', N'', N'0 0 0 * * ?', 3, 0, 0, N'1', N'2023-10-03 11:01:33', N'1', N'2024-09-12 13:40:34', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (33, N'demoJob', 2, N'demoJob', N'', N'0 * * * * ?', 1, 1, 0, N'1', N'2024-10-27 19:38:46', N'1', N'2025-05-10 18:13:54', N'0')
GO
INSERT INTO infra_job (id, name, status, handler_name, handler_param, cron_expression, retry_count, retry_interval, monitor_timeout, creator, create_time, updater, update_time, deleted) VALUES (35, N'鏉烆剝澶勭拋銏犲礋閻ㄥ嫬鎮撳?Job', 2, N'payTransferSyncJob', N'', N'0 * * * * ?', 0, 0, 0, N'1', N'2025-05-10 17:35:54', N'1', N'2025-05-10 18:13:52', N'0')
GO
GO
GO
GO
GO
GO
SET IDENTITY_INSERT infra_job OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for infra_job_log
-- ----------------------------
DROP TABLE IF EXISTS infra_job_log
GO
CREATE TABLE infra_job_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    job_id bigint  NOT NULL,
    handler_name nvarchar(64)  NOT NULL,
    handler_param nvarchar(255) DEFAULT NULL NULL,
    execute_index tinyint DEFAULT 1 NOT NULL,
    begin_time datetime2  NOT NULL,
    end_time datetime2 DEFAULT NULL NULL,
    duration int DEFAULT NULL NULL,
    status tinyint  NOT NULL,
    result nvarchar(4000) DEFAULT '' NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_infra_job_log_01 ON infra_job_log (job_id)
GO
CREATE INDEX idx_infra_job_log_02 ON infra_job_log (create_time)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺冦儱绻旂紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犺濮熺紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'job_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇崳銊ф畱閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'handler_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺嫮鎮婇崳銊ф畱閸欏倹鏆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'handler_param'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁楊剙鍤戝▎鈩冨⒔鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'execute_index'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵偓婵澧界悰灞炬闂?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'begin_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹挻娼幍褑顢戦弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'end_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹笛嗩攽閺冨爼鏆?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'duration'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犺濮熼悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹挻鐏夐弫鐗堝祦',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'result'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎规碍妞傛禒璇插閺冦儱绻旂悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'infra_job_log'
GO

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS system_dept
GO
CREATE TABLE system_dept (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(30) DEFAULT '' NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    sort int DEFAULT 0 NOT NULL,
    leader_user_id bigint DEFAULT NULL NULL,
    phone nvarchar(11) DEFAULT NULL NULL,
    email nvarchar(50) DEFAULT NULL NULL,
    status tinyint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁劑妫琲d',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁劑妫崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻栧爼鍎撮梻鈺',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勫墽銇氭い鍝勭碍',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠愮喕鐭楁禍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'leader_user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼辨梻閮撮悽浣冪樈',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'phone'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喚顔?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁劑妫悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁劑妫悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dept'
GO

-- ----------------------------
-- Records of system_dept
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_dept ON
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, N'閼哄浜惧┃鎰垳', 0, 0, 1, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2026-01-04 18:01:12', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (101, N'濞ｅ崬婀烽幀璇插彆閸?, 100, 1, 104, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2025-03-29 15:49:55', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (102, N'闂€鎸庣煓閸掑棗鍙曢崣?, 100, 2, NULL, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'', N'2021-12-15 05:01:40', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, N'閻柨褰傞柈銊╂，', 101, 1, 104, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2026-01-04 18:01:24', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, N'鐢倸婧€闁劑妫?, 101, 2, NULL, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'', N'2021-12-15 05:01:38', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (105, N'濞村鐦柈銊╂，', 101, 3, NULL, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2022-05-16 20:25:15', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (106, N'鐠愩垹濮熼柈銊╂，', 101, 4, 103, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'103', N'2022-01-15 21:32:22', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, N'鏉╂劗娣柈銊╂，', 101, 5, 1, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2023-12-02 09:28:22', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, N'鐢倸婧€闁劑妫?, 102, 1, NULL, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'1', N'2022-02-16 08:35:45', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, N'鐠愩垹濮熼柈銊╂，', 102, 2, NULL, N'15888888888', N'ry@qq.com', 0, N'admin', N'2021-01-05 17:03:47', N'', N'2021-12-15 05:01:29', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, N'閺備即鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, N'110', N'2022-02-23 20:46:30', N'110', N'2022-02-23 20:46:30', N'0', 121)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, N'妞ゅ墎楠囬柈銊╂，', 0, 1, NULL, NULL, NULL, 0, N'113', N'2022-03-07 21:44:50', N'113', N'2022-03-07 21:44:50', N'0', 122)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, N'娴溠冩惂闁劑妫?, 101, 100, 1, NULL, NULL, 1, N'1', N'2023-12-02 09:45:13', N'1', N'2023-12-02 09:45:31', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, N'閺€顖涘瘮闁劑妫?, 102, 3, 104, NULL, NULL, 1, N'1', N'2023-12-02 09:47:38', N'1', N'2025-03-29 15:00:56', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, N'閺屾劒閲滅€涙劙鍎撮梻?, 0, 1, NULL, NULL, NULL, 0, N'1', N'2025-12-08 14:51:12', N'1', N'2025-12-08 14:51:12', N'0', 1)
GO
INSERT INTO system_dept (id, name, parent_id, sort, leader_user_id, phone, email, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, N'閺屾劒閲滅€涙劙鍎撮梻?2', 0, 2, NULL, NULL, NULL, 0, N'1', N'2025-12-08 14:51:25', N'1', N'2025-12-08 14:51:25', N'0', 1)
GO
SET IDENTITY_INSERT system_dept OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_dict_data
-- ----------------------------
DROP TABLE IF EXISTS system_dict_data
GO
CREATE TABLE system_dict_data (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    sort int DEFAULT 0 NOT NULL,
    label nvarchar(100) DEFAULT '' NOT NULL,
    value nvarchar(100) DEFAULT '' NOT NULL,
    dict_type nvarchar(100) DEFAULT '' NOT NULL,
    status tinyint DEFAULT 0 NOT NULL,
    color_type nvarchar(100) DEFAULT '' NULL,
    css_class nvarchar(100) DEFAULT '' NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€缂傛牜鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€閹烘帒绨?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€閺嶅洨顒?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'label'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€闁款喖鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'value'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€缁鐎?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'dict_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'妫版粏澹婄猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'color_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'css 閺嶅嘲绱?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'css_class'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€閺佺増宓佺悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_data'
GO

-- ----------------------------
-- Records of system_dict_data
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_dict_data ON
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1, 1, N'閻?, N'1', N'system_user_sex', 0, N'primary', N'A', N'閹冨焼閻?, N'admin', N'2021-01-05 17:03:48', N'1', N'2025-12-10 13:19:26', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (2, 2, N'婵?, N'2', N'system_user_sex', 0, N'success', N'', N'閹冨焼婵?, N'admin', N'2021-01-05 17:03:48', N'1', N'2023-11-15 23:30:37', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (8, 1, N'濮濓絽鐖?, N'1', N'infra_job_status', 0, N'success', N'', N'濮濓絽鐖堕悩鑸碘偓?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 19:33:38', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (9, 2, N'閺嗗倸浠?, N'2', N'infra_job_status', 0, N'danger', N'', N'閸嬫粎鏁ら悩鑸碘偓?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 19:33:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (12, 1, N'缁崵绮洪崘鍛枂', N'1', N'infra_config_type', 0, N'danger', N'', N'閸欏倹鏆熺猾璇茬€?- 缁崵绮洪崘鍛枂', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 19:06:02', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (13, 2, N'閼奉亜鐣炬稊?, N'2', N'infra_config_type', 0, N'primary', N'', N'閸欏倹鏆熺猾璇茬€?- 閼奉亜鐣炬稊?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 19:06:07', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (14, 1, N'闁氨鐓?, N'1', N'system_notice_type', 0, N'success', N'', N'闁氨鐓?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 13:05:57', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (15, 2, N'閸忣剙鎲?, N'2', N'system_notice_type', 0, N'info', N'', N'閸忣剙鎲?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 13:06:01', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (16, 0, N'閸忚泛鐣?, N'0', N'infra_operate_type', 0, N'default', N'', N'閸忚泛鐣犻幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:19', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (17, 1, N'閺屻儴顕?, N'1', N'infra_operate_type', 0, N'info', N'', N'閺屻儴顕楅幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:20', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (18, 2, N'閺傛澘顤?, N'2', N'infra_operate_type', 0, N'primary', N'', N'閺傛澘顤冮幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:21', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (19, 3, N'娣囶喗鏁?, N'3', N'infra_operate_type', 0, N'warning', N'', N'娣囶喗鏁奸幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:22', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (20, 4, N'閸掔娀娅?, N'4', N'infra_operate_type', 0, N'danger', N'', N'閸掔娀娅庨幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:23', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (22, 5, N'鐎电厧鍤?, N'5', N'infra_operate_type', 0, N'default', N'', N'鐎电厧鍤幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:24', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (23, 6, N'鐎电厧鍙?, N'6', N'infra_operate_type', 0, N'default', N'', N'鐎电厧鍙嗛幙宥勭稊', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:25', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (27, 1, N'瀵偓閸?, N'0', N'common_status', 0, N'primary', N'', N'瀵偓閸氼垳濮搁幀?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 08:00:39', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (28, 2, N'閸忔娊妫?, N'1', N'common_status', 0, N'info', N'', N'閸忔娊妫撮悩鑸碘偓?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 08:00:44', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (29, 1, N'閻╊喖缍?, N'1', N'system_menu_type', 0, N'', N'', N'閻╊喖缍?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:43:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (30, 2, N'閼挎粌宕?, N'2', N'system_menu_type', 0, N'', N'', N'閼挎粌宕?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:43:41', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (31, 3, N'閹稿鎸?, N'3', N'system_menu_type', 0, N'', N'', N'閹稿鎸?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:43:39', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (32, 1, N'閸愬懐鐤?, N'1', N'system_role_type', 0, N'danger', N'', N'閸愬懐鐤嗙憴鎺曞', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 13:02:08', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (33, 2, N'閼奉亜鐣炬稊?, N'2', N'system_role_type', 0, N'primary', N'', N'閼奉亜鐣炬稊澶庮潡閼?, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-02-16 13:02:12', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (34, 1, N'閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, N'1', N'system_data_scope', 0, N'', N'', N'閸忋劑鍎撮弫鐗堝祦閺夊啴妾?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:47:17', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (35, 2, N'閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', N'2', N'system_data_scope', 0, N'', N'', N'閹稿洤鐣鹃柈銊╂，閺佺増宓侀弶鍐', N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:47:18', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (36, 3, N'閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, N'3', N'system_data_scope', 0, N'', N'', N'閺堫剟鍎撮梻銊︽殶閹诡喗娼堥梽?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:47:16', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (37, 4, N'閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, N'4', N'system_data_scope', 0, N'', N'', N'閺堫剟鍎撮梻銊ュ挤娴犮儰绗呴弫鐗堝祦閺夊啴妾?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:47:21', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (38, 5, N'娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, N'5', N'system_data_scope', 0, N'', N'', N'娴犲懏婀版禍鐑樻殶閹诡喗娼堥梽?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:47:23', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (39, 0, N'閹存劕濮?, N'0', N'system_login_result', 0, N'success', N'', N'閻у妾扮紒鎾寸亯 - 閹存劕濮?, N'', N'2021-01-18 06:17:36', N'1', N'2022-02-16 13:23:49', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (40, 10, N'鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, N'10', N'system_login_result', 0, N'primary', N'', N'閻у妾扮紒鎾寸亯 - 鐠愶箑褰块幋鏍х槕閻椒绗夊锝団€?, N'', N'2021-01-18 06:17:54', N'1', N'2022-02-16 13:24:27', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (41, 20, N'閻劍鍩涚悮顐ゎ洣閻?, N'20', N'system_login_result', 0, N'warning', N'', N'閻у妾扮紒鎾寸亯 - 閻劍鍩涚悮顐ゎ洣閻?, N'', N'2021-01-18 06:17:54', N'1', N'2022-02-16 13:23:57', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (42, 30, N'妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, N'30', N'system_login_result', 0, N'info', N'', N'閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝鐎涙ê婀?, N'', N'2021-01-18 06:17:54', N'1', N'2022-02-16 13:24:07', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (43, 31, N'妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, N'31', N'system_login_result', 0, N'info', N'', N'閻у妾扮紒鎾寸亯 - 妤犲矁鐦夐惍浣风瑝濮濓絿鈥?, N'', N'2021-01-18 06:17:54', N'1', N'2022-02-16 13:24:11', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (44, 100, N'閺堫亞鐓″鍌氱埗', N'100', N'system_login_result', 0, N'danger', N'', N'閻у妾扮紒鎾寸亯 - 閺堫亞鐓″鍌氱埗', N'', N'2021-01-18 06:17:54', N'1', N'2022-02-16 13:24:23', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (45, 1, N'閺?, N'true', N'infra_boolean_string', 0, N'danger', N'', N'Boolean 閺勵垰鎯佺猾璇茬€?- 閺?, N'', N'2021-01-19 03:20:55', N'1', N'2022-03-15 23:01:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (46, 1, N'閸?, N'false', N'infra_boolean_string', 0, N'info', N'', N'Boolean 閺勵垰鎯佺猾璇茬€?- 閸?, N'', N'2021-01-19 03:20:55', N'1', N'2022-03-15 23:09:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (50, 1, N'閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', N'1', N'infra_codegen_template_type', 0, N'', N'', NULL, N'', N'2021-02-05 07:09:06', N'', N'2022-03-10 16:33:15', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (51, 2, N'閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', N'2', N'infra_codegen_template_type', 0, N'', N'', NULL, N'', N'2021-02-05 07:14:46', N'', N'2022-03-10 16:33:19', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (53, 0, N'閸掓繂顫愰崠鏍﹁厬', N'0', N'infra_job_status', 0, N'primary', N'', NULL, N'', N'2021-02-07 07:46:49', N'1', N'2022-02-16 19:33:29', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (57, 0, N'鏉╂劘顢戞稉?, N'0', N'infra_job_log_status', 0, N'primary', N'', N'RUNNING', N'', N'2021-02-08 10:04:24', N'1', N'2022-02-16 19:07:48', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (58, 1, N'閹存劕濮?, N'1', N'infra_job_log_status', 0, N'success', N'', NULL, N'', N'2021-02-08 10:06:57', N'1', N'2022-02-16 19:07:52', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (59, 2, N'婢惰精瑙?, N'2', N'infra_job_log_status', 0, N'warning', N'', N'婢惰精瑙?, N'', N'2021-02-08 10:07:38', N'1', N'2022-02-16 19:07:56', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (60, 1, N'娴兼艾鎲?, N'1', N'user_type', 0, N'primary', N'', NULL, N'', N'2021-02-26 00:16:27', N'1', N'2022-02-16 10:22:19', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (61, 2, N'缁狅紕鎮婇崨?, N'2', N'user_type', 0, N'success', N'', NULL, N'', N'2021-02-26 00:16:34', N'1', N'2025-04-06 18:37:43', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (62, 0, N'閺堫亜顦╅悶?, N'0', N'infra_api_error_log_process_status', 0, N'primary', N'', NULL, N'', N'2021-02-26 07:07:19', N'1', N'2022-02-16 20:14:17', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (63, 1, N'瀹告彃顦╅悶?, N'1', N'infra_api_error_log_process_status', 0, N'success', N'', NULL, N'', N'2021-02-26 07:07:26', N'1', N'2022-02-16 20:14:08', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (64, 2, N'瀹告彃鎷烽悾?, N'2', N'infra_api_error_log_process_status', 0, N'danger', N'', NULL, N'', N'2021-02-26 07:07:34', N'1', N'2022-02-16 20:14:14', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (66, 1, N'闂冨潡鍣锋禍?, N'ALIYUN', N'system_sms_channel_code', 0, N'primary', N'', NULL, N'1', N'2021-04-05 01:05:26', N'1', N'2024-07-22 22:23:25', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (67, 1, N'妤犲矁鐦夐惍?, N'1', N'system_sms_template_type', 0, N'warning', N'', NULL, N'1', N'2021-04-05 21:50:57', N'1', N'2022-02-16 12:48:30', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (68, 2, N'闁氨鐓?, N'2', N'system_sms_template_type', 0, N'primary', N'', NULL, N'1', N'2021-04-05 21:51:08', N'1', N'2022-02-16 12:48:27', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (69, 0, N'閽€銉╂敘', N'3', N'system_sms_template_type', 0, N'danger', N'', NULL, N'1', N'2021-04-05 21:51:15', N'1', N'2022-02-16 12:48:22', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (70, 0, N'閸掓繂顫愰崠?, N'0', N'system_sms_send_status', 0, N'primary', N'', NULL, N'1', N'2021-04-11 20:18:33', N'1', N'2022-02-16 10:26:07', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (71, 1, N'閸欐垿鈧焦鍨氶崝?, N'10', N'system_sms_send_status', 0, N'success', N'', NULL, N'1', N'2021-04-11 20:18:43', N'1', N'2022-02-16 10:25:56', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (72, 2, N'閸欐垿鈧礁銇戠拹?, N'20', N'system_sms_send_status', 0, N'danger', N'', NULL, N'1', N'2021-04-11 20:18:49', N'1', N'2022-02-16 10:26:03', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (73, 3, N'娑撳秴褰傞柅?, N'30', N'system_sms_send_status', 0, N'info', N'', NULL, N'1', N'2021-04-11 20:19:44', N'1', N'2022-02-16 10:26:10', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (74, 0, N'缁涘绶熺紒鎾寸亯', N'0', N'system_sms_receive_status', 0, N'primary', N'', NULL, N'1', N'2021-04-11 20:27:43', N'1', N'2022-02-16 10:28:24', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (75, 1, N'閹恒儲鏁归幋鎰', N'10', N'system_sms_receive_status', 0, N'success', N'', NULL, N'1', N'2021-04-11 20:29:25', N'1', N'2022-02-16 10:28:28', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (76, 2, N'閹恒儲鏁规径杈Е', N'20', N'system_sms_receive_status', 0, N'danger', N'', NULL, N'1', N'2021-04-11 20:29:31', N'1', N'2022-02-16 10:28:32', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (77, 0, N'鐠嬪啳鐦?闁藉鎷?', N'DEBUG_DING_TALK', N'system_sms_channel_code', 0, N'info', N'', NULL, N'1', N'2021-04-13 00:20:37', N'1', N'2022-02-16 10:10:00', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (80, 100, N'鐠愶箑褰块惂璇茬秿', N'100', N'system_login_type', 0, N'primary', N'', N'鐠愶箑褰块惂璇茬秿', N'1', N'2021-10-06 00:52:02', N'1', N'2022-02-16 13:11:34', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (81, 101, N'缁€鍙ユ唉閻ц缍?, N'101', N'system_login_type', 0, N'info', N'', N'缁€鍙ユ唉閻ц缍?, N'1', N'2021-10-06 00:52:17', N'1', N'2022-02-16 13:11:40', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (83, 200, N'娑撹濮╅惂璇插毉', N'200', N'system_login_type', 0, N'primary', N'', N'娑撹濮╅惂璇插毉', N'1', N'2021-10-06 00:52:58', N'1', N'2022-02-16 13:11:49', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (85, 202, N'瀵搫鍩楅惂璇插毉', N'202', N'system_login_type', 0, N'danger', N'', N'瀵搫鍩楅柅鈧崙?, N'1', N'2021-10-06 00:53:41', N'1', N'2022-02-16 13:11:57', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1145, 1, N'缁狅紕鎮婇崥搴″酱', N'1', N'infra_codegen_scene', 0, N'', N'', N'娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 缁狅紕鎮婇崥搴″酱', N'1', N'2022-02-02 13:15:06', N'1', N'2022-03-10 16:32:59', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1146, 2, N'閻劍鍩?APP', N'2', N'infra_codegen_scene', 0, N'', N'', N'娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?- 閻劍鍩?APP', N'1', N'2022-02-02 13:15:19', N'1', N'2022-03-10 16:33:03', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1150, 1, N'閺佺増宓佹惔?, N'1', N'infra_file_storage', 0, N'default', N'', NULL, N'1', N'2022-03-15 00:25:28', N'1', N'2022-03-15 00:25:28', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1151, 10, N'閺堫剙婀寸壕浣烘磸', N'10', N'infra_file_storage', 0, N'default', N'', NULL, N'1', N'2022-03-15 00:25:41', N'1', N'2022-03-15 00:25:56', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1152, 11, N'FTP 閺堝秴濮熼崳?, N'11', N'infra_file_storage', 0, N'default', N'', NULL, N'1', N'2022-03-15 00:26:06', N'1', N'2022-03-15 00:26:10', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1153, 12, N'SFTP 閺堝秴濮熼崳?, N'12', N'infra_file_storage', 0, N'default', N'', NULL, N'1', N'2022-03-15 00:26:22', N'1', N'2022-03-15 00:26:22', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1154, 20, N'S3 鐎电钖勭€涙ê鍋?, N'20', N'infra_file_storage', 0, N'default', N'', NULL, N'1', N'2022-03-15 00:26:31', N'1', N'2022-03-15 00:26:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1155, 103, N'閻厺淇婇惂璇茬秿', N'103', N'system_login_type', 0, N'default', N'', NULL, N'1', N'2022-05-09 23:57:58', N'1', N'2022-05-09 23:58:09', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1156, 1, N'password', N'password', N'system_oauth2_grant_type', 0, N'default', N'', N'鐎靛棛鐖滃Ο鈥崇础', N'1', N'2022-05-12 00:22:05', N'1', N'2022-05-11 16:26:01', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1157, 2, N'authorization_code', N'authorization_code', N'system_oauth2_grant_type', 0, N'primary', N'', N'閹哄牊娼堥惍浣鼓佸?, N'1', N'2022-05-12 00:22:59', N'1', N'2022-05-11 16:26:02', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1158, 3, N'implicit', N'implicit', N'system_oauth2_grant_type', 0, N'success', N'', N'缁犫偓閸栨牗膩瀵?, N'1', N'2022-05-12 00:23:40', N'1', N'2022-05-11 16:26:05', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1159, 4, N'client_credentials', N'client_credentials', N'system_oauth2_grant_type', 0, N'default', N'', N'鐎广垺鍩涚粩顖浤佸?, N'1', N'2022-05-12 00:23:51', N'1', N'2022-05-11 16:26:08', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1160, 5, N'refresh_token', N'refresh_token', N'system_oauth2_grant_type', 0, N'info', N'', N'閸掗攱鏌婂Ο鈥崇础', N'1', N'2022-05-12 00:24:02', N'1', N'2022-05-11 16:26:11', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1194, 10, N'瀵邦喕淇婄亸蹇曗柤鎼?, N'10', N'terminal', 0, N'default', N'', N'缂佸牏顏?- 瀵邦喕淇婄亸蹇曗柤鎼?, N'1', N'2022-12-10 10:51:11', N'1', N'2022-12-10 10:51:57', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1195, 20, N'H5 缂冩垿銆?, N'20', N'terminal', 0, N'default', N'', N'缂佸牏顏?- H5 缂冩垿銆?, N'1', N'2022-12-10 10:51:30', N'1', N'2022-12-10 10:51:59', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1196, 11, N'瀵邦喕淇婇崗顑跨船閸?, N'11', N'terminal', 0, N'default', N'', N'缂佸牏顏?- 瀵邦喕淇婇崗顑跨船閸?, N'1', N'2022-12-10 10:54:16', N'1', N'2022-12-10 10:52:01', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1197, 31, N'閼昏鐏?App', N'31', N'terminal', 0, N'default', N'', N'缂佸牏顏?- 閼昏鐏?App', N'1', N'2022-12-10 10:54:42', N'1', N'2022-12-10 10:52:18', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1198, 32, N'鐎瑰宕?App', N'32', N'terminal', 0, N'default', N'', N'缂佸牏顏?- 鐎瑰宕?App', N'1', N'2022-12-10 10:55:02', N'1', N'2022-12-10 10:59:17', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1223, 0, N'閸掓繂顫愰崠?, N'0', N'system_mail_send_status', 0, N'primary', N'', N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸掓繂顫愰崠鏈秐', N'1', N'2023-01-26 09:53:49', N'1', N'2023-01-26 16:36:14', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1224, 10, N'閸欐垿鈧焦鍨氶崝?, N'10', N'system_mail_send_status', 0, N'success', N'', N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧焦鍨氶崝?, N'1', N'2023-01-26 09:54:28', N'1', N'2023-01-26 16:36:22', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1225, 20, N'閸欐垿鈧礁銇戠拹?, N'20', N'system_mail_send_status', 0, N'danger', N'', N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?- 閸欐垿鈧礁銇戠拹?, N'1', N'2023-01-26 09:54:50', N'1', N'2023-01-26 16:36:26', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1226, 30, N'娑撳秴褰傞柅?, N'30', N'system_mail_send_status', 0, N'info', N'', N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?-  娑撳秴褰傞柅?, N'1', N'2023-01-26 09:55:06', N'1', N'2023-01-26 16:36:36', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1227, 1, N'闁氨鐓￠崗顒€鎲?, N'1', N'system_notify_template_type', 0, N'primary', N'', N'缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 闁氨鐓￠崗顒€鎲?, N'1', N'2023-01-28 10:35:59', N'1', N'2023-01-28 10:35:59', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1228, 2, N'缁崵绮哄☉鍫熶紖', N'2', N'system_notify_template_type', 0, N'success', N'', N'缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?- 缁崵绮哄☉鍫熶紖', N'1', N'2023-01-28 10:36:20', N'1', N'2023-01-28 10:36:25', N'0')
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1231, 10, N'Vue2 Element UI 閺嶅洤鍣Ο锛勫', N'10', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2023-04-13 00:03:55', N'1', N'2023-04-13 00:03:55', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1232, 20, N'Vue3 Element Plus 閺嶅洤鍣Ο锛勫', N'20', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2023-04-13 00:04:08', N'1', N'2023-04-13 00:04:08', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1234, 30, N'Vben2.0 Ant Design Schema 濡紕澧?, N'30', N'infra_codegen_front_type', 1, N'', N'', N'', N'1', N'2023-04-13 00:04:26', N'1', N'2025-07-27 10:55:14', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1435, 10, N'Gitee', N'10', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:04:42', N'1', N'2023-11-04 13:04:42', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1436, 20, N'闁藉鎷?, N'20', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:04:54', N'1', N'2023-11-04 13:04:54', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1437, 30, N'娴间椒绗熷顔讳繆', N'30', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:05:09', N'1', N'2023-11-04 13:05:09', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1438, 31, N'瀵邦喕淇婇崗顑跨船楠炲啿褰?, N'31', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:05:18', N'1', N'2023-11-04 13:05:18', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1439, 32, N'瀵邦喕淇婂鈧弨鎯ч挬閸?, N'32', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:05:30', N'1', N'2023-11-04 13:05:30', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1440, 34, N'瀵邦喕淇婄亸蹇曗柤鎼?, N'34', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:05:38', N'1', N'2023-11-04 13:07:16', N'0')
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1443, 15, N'鐎涙劘銆?, N'15', N'infra_codegen_template_type', 0, N'default', N'', N'', N'1', N'2023-11-13 23:06:16', N'1', N'2023-11-13 23:06:16', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1444, 10, N'娑撴槒銆冮敍鍫熺垼閸戝棙膩瀵骏绱?, N'10', N'infra_codegen_template_type', 0, N'default', N'', N'', N'1', N'2023-11-14 12:32:49', N'1', N'2023-11-14 12:32:49', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1445, 11, N'娑撴槒銆冮敍鍦桼P 濡€崇础閿?, N'11', N'infra_codegen_template_type', 0, N'default', N'', N'', N'1', N'2023-11-14 12:33:05', N'1', N'2023-11-14 12:33:05', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1446, 12, N'娑撴槒銆冮敍鍫濆敶瀹撳本膩瀵骏绱?, N'12', N'infra_codegen_template_type', 0, N'', N'', N'', N'1', N'2023-11-14 12:33:31', N'1', N'2023-11-14 12:33:31', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1529, 1, N'婢?, N'1', N'date_interval', 0, N'', N'', N'', N'1', N'2024-03-29 22:50:26', N'1', N'2024-03-29 22:50:26', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1530, 2, N'閸?, N'2', N'date_interval', 0, N'', N'', N'', N'1', N'2024-03-29 22:50:36', N'1', N'2024-03-29 22:50:36', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1531, 3, N'閺?, N'3', N'date_interval', 0, N'', N'', N'', N'1', N'2024-03-29 22:50:46', N'1', N'2024-03-29 22:50:54', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1532, 4, N'鐎涳絽瀹?, N'4', N'date_interval', 0, N'', N'', N'', N'1', N'2024-03-29 22:51:01', N'1', N'2024-03-29 22:51:01', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1533, 5, N'楠?, N'5', N'date_interval', 0, N'', N'', N'', N'1', N'2024-03-29 22:51:07', N'1', N'2024-03-29 22:51:07', N'0')
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1537, 1, N'OpenAI', N'OpenAI', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-05-09 22:33:47', N'1', N'2024-05-09 22:58:46', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1538, 2, N'Ollama', N'Ollama', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-05-17 23:02:55', N'1', N'2024-05-17 23:02:55', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1539, 3, N'閺傚洤绺炬稉鈧懛鈧?, N'YiYan', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-05-18 09:24:20', N'1', N'2024-05-18 09:29:01', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1540, 4, N'鐠侇垶顥ｉ弰鐔轰紑', N'XingHuo', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-05-18 10:08:56', N'1', N'2024-05-18 10:08:56', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1541, 5, N'闁矮绠熼崡鍐６', N'TongYi', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-05-18 10:32:29', N'1', N'2024-07-06 15:42:29', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1542, 6, N'StableDiffusion', N'StableDiffusion', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-06-01 15:09:31', N'1', N'2024-06-01 15:10:25', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1543, 10, N'鏉╂稖顢戞稉?, N'10', N'ai_image_status', 0, N'primary', N'', N'', N'1', N'2024-06-26 20:51:41', N'1', N'2024-06-26 20:52:48', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1544, 20, N'瀹告彃鐣幋?, N'20', N'ai_image_status', 0, N'success', N'', N'', N'1', N'2024-06-26 20:52:07', N'1', N'2024-06-26 20:52:41', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1545, 30, N'瀹告彃銇戠拹?, N'30', N'ai_image_status', 0, N'warning', N'', N'', N'1', N'2024-06-26 20:52:25', N'1', N'2024-06-26 20:52:35', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1546, 7, N'Midjourney', N'Midjourney', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-06-26 22:14:46', N'1', N'2024-06-26 22:14:46', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1547, 10, N'鏉╂稖顢戞稉?, N'10', N'ai_music_status', 0, N'primary', N'', N'', N'1', N'2024-06-27 22:45:22', N'1', N'2024-06-28 00:56:17', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1548, 20, N'瀹告彃鐣幋?, N'20', N'ai_music_status', 0, N'success', N'', N'', N'1', N'2024-06-27 22:45:33', N'1', N'2024-06-28 00:56:18', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1549, 30, N'瀹告彃銇戠拹?, N'30', N'ai_music_status', 0, N'danger', N'', N'', N'1', N'2024-06-27 22:45:44', N'1', N'2024-06-28 00:56:19', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1550, 1, N'濮濆矁鐦濆Ο鈥崇础', N'1', N'ai_generate_mode', 0, N'', N'', N'', N'1', N'2024-06-27 22:46:31', N'1', N'2024-06-28 01:22:25', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1551, 2, N'閹诲繗鍫Ο鈥崇础', N'2', N'ai_generate_mode', 0, N'', N'', N'', N'1', N'2024-06-27 22:46:37', N'1', N'2024-06-28 01:22:24', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1552, 8, N'Suno', N'Suno', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-06-29 09:13:36', N'1', N'2024-06-29 09:13:41', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1553, 9, N'DeepSeek', N'DeepSeek', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-07-06 12:04:30', N'1', N'2024-07-06 12:05:20', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1554, 13, N'閺呴缚姘?, N'ZhiPu', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-07-06 18:00:35', N'1', N'2025-02-24 20:18:41', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1555, 4, N'闂€?, N'4', N'ai_write_length', 0, N'', N'', N'', N'1', N'2024-07-07 15:49:03', N'1', N'2024-07-07 15:49:03', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1556, 5, N'濞堜絻鎯?, N'5', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:49:54', N'1', N'2024-07-07 15:49:54', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1557, 6, N'閺傚洨鐝?, N'6', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:50:05', N'1', N'2024-07-07 15:50:05', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1558, 7, N'閸楁艾顓归弬鍥╃彿', N'7', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:50:23', N'1', N'2024-07-07 15:50:23', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1559, 8, N'閹櫕纭?, N'8', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:50:31', N'1', N'2024-07-07 15:50:31', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1560, 9, N'婢堆呯堪', N'9', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:50:37', N'1', N'2024-07-07 15:50:37', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1561, 1, N'閼奉亜濮?, N'1', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:51:06', N'1', N'2024-07-07 15:51:06', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1562, 2, N'閸欏鏉?, N'2', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:51:19', N'1', N'2024-07-07 15:51:19', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1563, 3, N'闂呭繑鍓?, N'3', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:51:27', N'1', N'2024-07-07 15:51:27', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1564, 4, N'閸欏銈?, N'4', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:51:37', N'1', N'2024-07-07 15:51:37', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1565, 5, N'娑撴挷绗?, N'5', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:51:49', N'1', N'2024-07-07 15:52:02', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1566, 6, N'鐠囨瑨鐨?, N'6', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:52:15', N'1', N'2024-07-07 15:52:15', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1567, 7, N'閺堝鍙?, N'7', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:52:24', N'1', N'2024-07-07 15:52:24', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1568, 8, N'濮濓絽绱?, N'8', N'ai_write_tone', 0, N'', N'', N'', N'1', N'2024-07-07 15:54:33', N'1', N'2024-07-07 15:54:33', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1570, 1, N'閼奉亜濮?, N'1', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:19:34', N'1', N'2024-07-07 15:19:34', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1571, 2, N'閻㈤潧鐡欓柇顔绘', N'2', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:19:50', N'1', N'2024-07-07 15:49:30', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1572, 3, N'濞戝牊浼?, N'3', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:20:01', N'1', N'2024-07-07 15:49:38', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1573, 4, N'鐠囧嫯顔?, N'4', N'ai_write_format', 0, N'', N'', N'', N'1', N'2024-07-07 15:20:13', N'1', N'2024-07-07 15:49:45', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1574, 1, N'閼奉亜濮?, N'1', N'ai_write_language', 0, N'', N'', N'', N'1', N'2024-07-07 15:44:18', N'1', N'2024-07-07 15:44:18', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1575, 2, N'娑擃厽鏋?, N'2', N'ai_write_language', 0, N'', N'', N'', N'1', N'2024-07-07 15:44:28', N'1', N'2024-07-07 15:44:28', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1576, 3, N'閼昏鲸鏋?, N'3', N'ai_write_language', 0, N'', N'', N'', N'1', N'2024-07-07 15:44:37', N'1', N'2024-07-07 15:44:37', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1577, 4, N'闂娾晞顕?, N'4', N'ai_write_language', 0, N'', N'', N'', N'1', N'2024-07-07 15:46:28', N'1', N'2024-07-07 15:46:28', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1578, 5, N'閺冦儴顕?, N'5', N'ai_write_language', 0, N'', N'', N'', N'1', N'2024-07-07 15:46:44', N'1', N'2024-07-07 15:46:44', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1579, 1, N'閼奉亜濮?, N'1', N'ai_write_length', 0, N'', N'', N'', N'1', N'2024-07-07 15:48:34', N'1', N'2024-07-07 15:48:34', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1580, 2, N'閻?, N'2', N'ai_write_length', 0, N'', N'', N'', N'1', N'2024-07-07 15:48:44', N'1', N'2024-07-07 15:48:44', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1581, 3, N'娑擃厾鐡?, N'3', N'ai_write_length', 0, N'', N'', N'', N'1', N'2024-07-07 15:48:52', N'1', N'2024-07-07 15:48:52', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1584, 1, N'閹炬澘鍟?, N'1', N'ai_write_type', 0, N'', N'', N'', N'1', N'2024-07-10 21:26:00', N'1', N'2024-07-10 21:26:00', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1585, 2, N'閸ョ偛顦?, N'2', N'ai_write_type', 0, N'', N'', N'', N'1', N'2024-07-10 21:26:06', N'1', N'2024-07-10 21:26:06', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1586, 2, N'閼垫崘顔嗘禍?, N'TENCENT', N'system_sms_channel_code', 0, N'', N'', N'', N'1', N'2024-07-22 22:23:16', N'1', N'2024-07-22 22:23:16', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1587, 3, N'閸楀簼璐熸禍?, N'HUAWEI', N'system_sms_channel_code', 0, N'', N'', N'', N'1', N'2024-07-22 22:23:46', N'1', N'2024-07-22 22:23:53', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1588, 1, N'OpenAI 瀵邦喛钂?, N'AzureOpenAI', N'ai_platform', 0, N'', N'', N'', N'1', N'2024-08-10 14:07:41', N'1', N'2024-08-10 14:07:41', N'0')
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1591, 4, N'娑撳啰澧版禍?, N'QINIU', N'system_sms_channel_code', 0, N'', N'', N'', N'1', N'2024-08-31 08:45:03', N'1', N'2024-08-31 08:45:24', N'0')
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1683, 10, N'鐎涙濡挒鍡楀瘶', N'DouBao', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-02-23 19:51:40', N'1', N'2025-02-23 19:52:02', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1684, 11, N'閼垫崘顔嗗ǎ宄板帗', N'HunYuan', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-02-23 20:58:04', N'1', N'2025-02-23 20:58:04', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1685, 12, N'绾懎鐔€濞翠礁濮?, N'SiliconFlow', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-02-24 20:19:09', N'1', N'2025-02-24 20:19:09', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1686, 1, N'閼卞﹤銇?, N'1', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:26:34', N'1', N'2025-03-03 12:26:34', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1687, 2, N'閸ユ儳鍎?, N'2', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:27:23', N'1', N'2025-03-03 12:27:23', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1688, 3, N'闂婃娊顣?, N'3', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:27:51', N'1', N'2025-03-03 12:27:51', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1689, 4, N'鐟欏棝顣?, N'4', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:28:03', N'1', N'2025-03-03 12:28:03', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1690, 5, N'閸氭垿鍣?, N'5', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:28:15', N'1', N'2025-03-03 12:28:15', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1691, 6, N'闁插秵甯?, N'6', N'ai_model_type', 0, N'', N'', N'', N'1', N'2025-03-03 12:28:26', N'1', N'2025-03-03 12:28:26', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1692, 14, N'MiniMax', N'MiniMax', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-03-11 20:04:51', N'1', N'2025-03-11 20:04:51', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (1693, 15, N'閺堝牅绠ｉ弳妤呮桨', N'Moonshot', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-03-11 20:05:08', N'1', N'2025-11-24 07:17:39', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3000, 16, N'閻ф儳绐涢弲楦垮厴', N'BaiChuan', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-03-23 12:15:46', N'1', N'2025-03-23 12:15:46', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3001, 40, N'Vben5.0 Ant Design Schema 濡紕澧?, N'40', N'infra_codegen_front_type', 0, N'', N'', NULL, N'1', N'2025-04-23 21:47:47', N'1', N'2025-09-04 23:25:12', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3028, 2, N'Anthropic', N'Anthropic', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-08-21 22:54:24', N'1', N'2025-08-21 22:57:58', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3029, 2, N'鐠嬮攱鐡?Gemini', N'Gemini', N'ai_platform', 0, N'', N'', N'', N'1', N'2025-08-22 22:39:35', N'1', N'2025-08-22 22:44:49', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3030, 1, N'閺傚洣娆㈢化鑽ょ埠', N'filesystem', N'ai_mcp_client_name', 0, N'', N'', N'', N'1', N'2025-08-28 13:58:43', N'1', N'2025-08-28 21:19:42', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3031, 41, N'Vben5.0 Ant Design 閺嶅洤鍣Ο锛勫', N'41', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2025-09-04 23:26:07', N'1', N'2025-09-04 23:26:07', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3032, 50, N'Vben5.0 Element Plus Schema 濡紕澧?, N'50', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2025-09-04 23:26:38', N'1', N'2025-09-04 23:26:38', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3033, 51, N'Vben5.0 Element Plus 閺嶅洤鍣Ο锛勫', N'51', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2025-09-04 23:26:49', N'1', N'2025-09-04 23:26:49', N'0')
GO
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3035, 40, N'閺€顖欑帛鐎规繂鐨粙瀣碍', N'40', N'system_social_type', 0, N'', N'', N'', N'1', N'2023-11-04 13:05:38', N'1', N'2023-11-04 13:07:16', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3036, 60, N'Admin Uniapp 缁夎濮╃粩?, N'60', N'infra_codegen_front_type', 0, N'', N'', NULL, N'1', N'2025-12-16 19:25:51', N'1', N'2025-12-17 09:46:15', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3037, 42, N'Vben5.0 Antdv Next Schema 濡紕澧?, N'42', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2026-05-16 00:00:00', N'1', N'2026-05-16 00:00:00', N'0')
GO
INSERT INTO system_dict_data (id, sort, label, value, dict_type, status, color_type, css_class, remark, creator, create_time, updater, update_time, deleted) VALUES (3038, 43, N'Vben5.0 Antdv Next 閺嶅洤鍣Ο锛勫', N'43', N'infra_codegen_front_type', 0, N'', N'', N'', N'1', N'2026-05-16 00:00:00', N'1', N'2026-05-16 00:00:00', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
SET IDENTITY_INSERT system_dict_data OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_dict_type
-- ----------------------------
DROP TABLE IF EXISTS system_dict_type
GO
CREATE TABLE system_dict_type (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(100) DEFAULT '' NOT NULL,
    type nvarchar(100) DEFAULT '' NOT NULL,
    status tinyint DEFAULT 0 NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    deleted_time datetime2 DEFAULT NULL NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€娑撳鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€閸氬秶袨',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€缁鐎?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掔娀娅庨弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type',
    'COLUMN', N'deleted_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涙鍚€缁鐎风悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_dict_type'
GO

-- ----------------------------
-- Records of system_dict_type
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_dict_type ON
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (1, N'閻劍鍩涢幀褍鍩?, N'system_user_sex', 0, NULL, N'admin', N'2021-01-05 17:03:48', N'1', N'2022-05-16 20:29:32', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (6, N'閸欏倹鏆熺猾璇茬€?, N'infra_config_type', 0, NULL, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:36:54', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (7, N'闁氨鐓＄猾璇茬€?, N'system_notice_type', 0, NULL, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:35:26', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (9, N'閹垮秳缍旂猾璇茬€?, N'infra_operate_type', 0, NULL, N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-14 12:44:01', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (10, N'缁崵绮洪悩鑸碘偓?, N'common_status', 0, NULL, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-01 16:21:28', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (11, N'Boolean 閺勵垰鎯佺猾璇茬€?, N'infra_boolean_string', 0, N'boolean 鏉烆剚妲搁崥?, N'', N'2021-01-19 03:20:08', N'', N'2022-02-01 16:37:10', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (104, N'閻у妾扮紒鎾寸亯', N'system_login_result', 0, N'閻у妾扮紒鎾寸亯', N'', N'2021-01-18 06:17:11', N'', N'2022-02-01 16:36:00', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (106, N'娴狅絿鐖滈悽鐔稿灇濡剝婢樼猾璇茬€?, N'infra_codegen_template_type', 0, NULL, N'', N'2021-02-05 07:08:06', N'1', N'2022-05-16 20:26:50', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (107, N'鐎规碍妞傛禒璇插閻樿埖鈧?, N'infra_job_status', 0, NULL, N'', N'2021-02-07 07:44:16', N'', N'2022-02-01 16:51:11', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (108, N'鐎规碍妞傛禒璇插閺冦儱绻旈悩鑸碘偓?, N'infra_job_log_status', 0, NULL, N'', N'2021-02-08 10:03:51', N'', N'2022-02-01 16:50:43', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (109, N'閻劍鍩涚猾璇茬€?, N'user_type', 0, NULL, N'', N'2021-02-26 00:15:51', N'', N'2021-02-26 00:15:51', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (110, N'API 瀵倸鐖堕弫鐗堝祦閻ㄥ嫬顦╅悶鍡欏Ц閹?, N'infra_api_error_log_process_status', 0, NULL, N'', N'2021-02-26 07:07:01', N'', N'2022-02-01 16:50:53', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (111, N'閻厺淇婂〒鐘讳壕缂傛牜鐖?, N'system_sms_channel_code', 0, NULL, N'1', N'2021-04-05 01:04:50', N'1', N'2022-02-16 02:09:08', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (112, N'閻厺淇婂Ο鈩冩緲閻ㄥ嫮琚崹?, N'system_sms_template_type', 0, NULL, N'1', N'2021-04-05 21:50:43', N'1', N'2022-02-01 16:35:06', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (113, N'閻厺淇婇崣鎴︹偓浣哄Ц閹?, N'system_sms_send_status', 0, NULL, N'1', N'2021-04-11 20:18:03', N'1', N'2022-02-01 16:35:09', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (114, N'閻厺淇婇幒銉︽暪閻樿埖鈧?, N'system_sms_receive_status', 0, NULL, N'1', N'2021-04-11 20:27:14', N'1', N'2022-02-01 16:35:14', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (116, N'閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, N'system_login_type', 0, N'閻у妾伴弮銉ョ箶閻ㄥ嫮琚崹?, N'1', N'2021-10-06 00:50:46', N'1', N'2022-02-01 16:35:56', N'0', NULL)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (144, N'娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, N'infra_codegen_scene', 0, N'娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬婧€閺咁垱鐏囨稉?, N'1', N'2022-02-02 13:14:45', N'1', N'2022-03-10 16:33:46', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (145, N'鐟欐帟澹婄猾璇茬€?, N'system_role_type', 0, N'鐟欐帟澹婄猾璇茬€?, N'1', N'2022-02-16 13:01:46', N'1', N'2022-02-16 13:01:46', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (146, N'閺傚洣娆㈢€涙ê鍋嶉崳?, N'infra_file_storage', 0, N'閺傚洣娆㈢€涙ê鍋嶉崳?, N'1', N'2022-03-15 00:24:38', N'1', N'2022-03-15 00:24:38', N'0', NULL)
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (147, N'OAuth 2.0 閹哄牊娼堢猾璇茬€?, N'system_oauth2_grant_type', 0, N'OAuth 2.0 閹哄牊娼堢猾璇茬€烽敍鍫熌佸蹇ョ礆', N'1', N'2022-05-12 00:20:52', N'1', N'2022-05-11 16:25:49', N'0', NULL)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (160, N'缂佸牏顏?, N'terminal', 0, N'缂佸牏顏?, N'1', N'2022-12-10 10:50:50', N'1', N'2022-12-10 10:53:11', N'0', NULL)
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (166, N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?, N'system_mail_send_status', 0, N'闁喕娆㈤崣鎴︹偓浣哄Ц閹?, N'1', N'2023-01-26 09:53:13', N'1', N'2023-01-26 09:53:13', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (167, N'缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, N'system_notify_template_type', 0, N'缁旀瑥鍞存穱鈩兡侀悧鍫㈡畱缁鐎?, N'1', N'2023-01-28 10:35:10', N'1', N'2023-01-28 10:35:10', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (168, N'娴狅絿鐖滈悽鐔稿灇閻ㄥ嫬澧犵粩顖滆閸?, N'infra_codegen_front_type', 0, N'', N'1', N'2023-04-12 23:57:52', N'1', N'2023-04-12 23:57:52', N'0', N'1970-01-01 00:00:00')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (601, N'缁€鍙ユ唉缁鐎?, N'system_social_type', 0, N'', N'1', N'2023-11-04 13:03:54', N'1', N'2023-11-04 13:03:54', N'0', N'1970-01-01 00:00:00')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (616, N'閺冨爼妫块梻鎾', N'date_interval', 0, N'', N'1', N'2024-03-29 22:50:09', N'1', N'2024-03-29 22:50:09', N'0', N'1970-01-01 00:00:00')
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (620, N'AI 濡€崇€烽獮鍐插酱', N'ai_platform', 0, N'', N'1', N'2024-05-09 22:27:38', N'1', N'2024-05-09 22:27:38', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (621, N'AI 缂佹鏁鹃悩鑸碘偓?, N'ai_image_status', 0, N'', N'1', N'2024-06-26 20:51:23', N'1', N'2024-06-26 20:51:23', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (622, N'AI 闂婂厖绠伴悩鑸碘偓?, N'ai_music_status', 0, N'', N'1', N'2024-06-27 22:45:07', N'1', N'2024-06-28 00:56:27', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (623, N'AI 闂婂厖绠伴悽鐔稿灇濡€崇础', N'ai_generate_mode', 0, N'', N'1', N'2024-06-27 22:46:21', N'1', N'2024-06-28 01:22:29', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (624, N'閸愭瑤缍旂拠顓熺毜', N'ai_write_tone', 0, N'', N'1', N'2024-07-07 15:19:02', N'1', N'2024-07-07 15:19:02', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (625, N'閸愭瑤缍旂拠顓♀枅', N'ai_write_language', 0, N'', N'1', N'2024-07-07 15:18:52', N'1', N'2024-07-07 15:18:52', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (626, N'閸愭瑤缍旈梹鍨', N'ai_write_length', 0, N'', N'1', N'2024-07-07 15:18:41', N'1', N'2024-07-07 15:18:41', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (627, N'閸愭瑤缍旈弽鐓庣础', N'ai_write_format', 0, N'', N'1', N'2024-07-07 15:14:34', N'1', N'2024-07-07 15:14:34', N'0', N'1970-01-01 00:00:00')
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (628, N'AI 閸愭瑤缍旂猾璇茬€?, N'ai_write_type', 0, N'', N'1', N'2024-07-10 21:25:29', N'1', N'2024-07-10 21:25:29', N'0', N'1970-01-01 00:00:00')
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (640, N'AI 濡€崇€风猾璇茬€?, N'ai_model_type', 0, N'', N'1', N'2025-03-03 12:24:07', N'1', N'2025-03-03 12:24:07', N'0', N'1970-01-01 00:00:00')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_dict_type (id, name, type, status, remark, creator, create_time, updater, update_time, deleted, deleted_time) VALUES (2007, N'AI MCP 鐎广垺鍩涚粩顖氭倳鐎?, N'ai_mcp_client_name', 0, N'', N'1', N'2025-08-28 13:57:40', N'1', N'2025-08-28 13:57:40', N'0', N'1970-01-01 00:00:00')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
SET IDENTITY_INSERT system_dict_type OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS system_login_log
GO
CREATE TABLE system_login_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    log_type bigint  NOT NULL,
    trace_id nvarchar(64) DEFAULT '' NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    user_type tinyint DEFAULT 0 NOT NULL,
    username nvarchar(50) DEFAULT '' NOT NULL,
    result tinyint  NOT NULL,
    user_ip nvarchar(50)  NOT NULL,
    user_agent nvarchar(512)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_login_log_01 ON system_login_log (username)
GO
CREATE INDEX idx_system_login_log_02 ON system_login_log (create_time)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠佸潡妫禝D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺冦儱绻旂猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'log_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'trace_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚拹锕€褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻у妾扮紒鎾寸亯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'result'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'user_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濞村繗顫嶉崳?UA',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'user_agent'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁崵绮虹拋鍧楁６鐠佹澘缍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_login_log'
GO

-- ----------------------------
-- Table structure for system_mail_account
-- ----------------------------
DROP TABLE IF EXISTS system_mail_account
GO
CREATE TABLE system_mail_account (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    mail nvarchar(255)  NOT NULL,
    username nvarchar(255)  NOT NULL,
    password nvarchar(255)  NOT NULL,
    host nvarchar(255)  NOT NULL,
    port int  NOT NULL,
    ssl_enable varchar(1) DEFAULT '0' NOT NULL,
    starttls_enable varchar(1) DEFAULT '0' NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撳鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喚顔?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'mail'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎靛棛鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'SMTP 閺堝秴濮熼崳銊ョ厵閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'host'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'SMTP 閺堝秴濮熼崳銊ь伂閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'port'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佸鈧崥?SSL',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'ssl_enable'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佸鈧崥?STARTTLS',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'starttls_enable'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喚顔堢拹锕€褰跨悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_account'
GO

-- ----------------------------
-- Records of system_mail_account
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_mail_account ON
GO
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (1, N'7684413@qq.com', N'7684413@qq.com', N'1234576', N'127.0.0.1', 8080, N'0', N'0', N'1', N'2023-01-25 17:39:52', N'1', N'2025-04-04 16:34:40', N'0')
GO
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (2, N'ydym_test@163.com', N'ydym_test@163.com', N'WBZTEINMIFVRYSOE', N'smtp.163.com', 465, N'1', N'0', N'1', N'2023-01-26 01:26:03', N'1', N'2025-12-20 18:09:32', N'0')
GO
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (3, N'76854114@qq.com', N'3335', N'11234', N'yunai1.cn', 466, N'0', N'0', N'1', N'2023-01-27 15:06:38', N'1', N'2023-01-27 07:08:36', N'1')
GO
INSERT INTO system_mail_account (id, mail, username, password, host, port, ssl_enable, starttls_enable, creator, create_time, updater, update_time, deleted) VALUES (4, N'7685413x@qq.com', N'2', N'3', N'4', 5, N'1', N'0', N'1', N'2023-04-12 23:05:06', N'1', N'2023-04-12 15:05:11', N'1')
GO
SET IDENTITY_INSERT system_mail_account OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_mail_log
-- ----------------------------
DROP TABLE IF EXISTS system_mail_log
GO
CREATE TABLE system_mail_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint DEFAULT NULL NULL,
    user_type tinyint DEFAULT NULL NULL,
    to_mails nvarchar(1024)  NOT NULL,
    cc_mails nvarchar(1024) DEFAULT NULL NULL,
    bcc_mails nvarchar(1024) DEFAULT NULL NULL,
    account_id bigint  NOT NULL,
    from_mail nvarchar(255)  NOT NULL,
    template_id bigint  NOT NULL,
    template_code nvarchar(63)  NOT NULL,
    template_nickname nvarchar(255) DEFAULT NULL NULL,
    template_title nvarchar(255)  NOT NULL,
    template_content nvarchar(max)  NOT NULL,
    template_params nvarchar(255)  NOT NULL,
    send_status tinyint DEFAULT 0 NOT NULL,
    send_time datetime2 DEFAULT NULL NULL,
    send_message_id nvarchar(255) DEFAULT NULL NULL,
    send_exception nvarchar(4000) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹恒儲鏁归柇顔绢唸閸︽澘娼?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'to_mails'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹跺嫰鈧線鍋栫粻鍗炴勾閸р偓',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'cc_mails'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎靛棝鈧線鍋栫粻鍗炴勾閸р偓',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'bcc_mails'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喚顔堢拹锕€褰跨紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'account_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧線鍋栫粻鍗炴勾閸р偓',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'from_mail'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喕娆㈤弽鍥暯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_title'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喕娆㈤崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喕娆㈤崣鍌涙殶',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'template_params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧胶濮搁幀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'send_status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧焦妞傞梻?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'send_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧浇绻戦崶鐐垫畱濞戝牊浼?ID',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'send_message_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧礁绱撶敮?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'send_exception'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喕娆㈤弮銉ョ箶鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_log'
GO

-- ----------------------------
-- Table structure for system_mail_template
-- ----------------------------
DROP TABLE IF EXISTS system_mail_template
GO
CREATE TABLE system_mail_template (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(63)  NOT NULL,
    code nvarchar(63)  NOT NULL,
    account_id bigint  NOT NULL,
    nickname nvarchar(255) DEFAULT NULL NULL,
    title nvarchar(255)  NOT NULL,
    content nvarchar(4000)  NOT NULL,
    params nvarchar(255)  NOT NULL,
    status tinyint  NOT NULL,
    remark nvarchar(255) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧胶娈戦柇顔绢唸鐠愶箑褰跨紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'account_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧椒姹夐崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀弽鍥暯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼弫鎵矋',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵偓閸氼垳濮搁幀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁喕娆㈠Ο锛勫鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_mail_template'
GO

-- ----------------------------
-- Records of system_mail_template
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_mail_template ON
GO
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (13, N'閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', N'admin-sms-login', 1, N'婵傘儳澹掗弴?, N'娴ｇ姷瀵介幋鎴犲', N'<p>閹劎娈戞宀冪槈閻焦妲竰code}閿涘苯鎮曠€涙妲竰name}</p>', N'["code","name"]', 0, N'3', N'1', N'2021-10-11 08:10:00', N'1', N'2023-12-02 19:51:14', N'0')
GO
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (14, N'濞村鐦Ο锛勫', N'test_01', 2, N'閼哄澹?, N'娑撯偓娑擃亝鐖ｆ０?, N'<p>娴ｇ姵妲?{key01} 閸氭绱?/p><p><br></p><p>閺勵垳娈戠拠婵撶礉鐠у墎鎻?{key02} 娑撯偓娑撳绱?/p>', N'["key01","key02"]', 0, NULL, N'1', N'2023-01-26 01:27:40', N'1', N'2025-07-26 21:48:45', N'0')
GO
INSERT INTO system_mail_template (id, name, code, account_id, nickname, title, content, params, status, remark, creator, create_time, updater, update_time, deleted) VALUES (15, N'3', N'2', 2, N'7', N'4', N'<p>45</p>', N'[]', 1, N'80', N'1', N'2023-01-27 15:50:35', N'1', N'2025-07-26 21:47:49', N'1')
GO
SET IDENTITY_INSERT system_mail_template OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS system_menu
GO
CREATE TABLE system_menu (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(50)  NOT NULL,
    permission nvarchar(100) DEFAULT '' NOT NULL,
    type tinyint  NOT NULL,
    sort int DEFAULT 0 NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    path nvarchar(200) DEFAULT '' NULL,
    icon nvarchar(100) DEFAULT '#' NULL,
    component nvarchar(255) DEFAULT NULL NULL,
    component_name nvarchar(255) DEFAULT NULL NULL,
    status tinyint DEFAULT 0 NOT NULL,
    visible varchar(1) DEFAULT '1' NOT NULL,
    keep_alive varchar(1) DEFAULT '1' NOT NULL,
    always_show varchar(1) DEFAULT '1' NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕烮D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕熼崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺夊啴妾洪弽鍥槕',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'permission'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕熺猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勫墽銇氭い鍝勭碍',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻栨儼褰嶉崡鏃綝',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠侯垳鏁遍崷鏉挎絻',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'path'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕熼崶鐐垼',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'icon'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佸嫪娆㈢捄顖氱窞',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'component'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佸嫪娆㈤崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'component_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕熼悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崣顖濐潌',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'visible'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佺紓鎾崇摠',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'keep_alive'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀幀缁樻Ц閺勫墽銇?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'always_show'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕熼弶鍐鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_menu'
GO

-- ----------------------------
-- Records of system_menu
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_menu ON
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1, N'缁崵绮虹粻锛勬倞', N'', 1, 10, 0, N'/system', N'ep:tools', NULL, NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2025-03-15 21:30:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2, N'閸╄櫣顢呯拋鐐煢', N'', 1, 20, 0, N'/infra', N'ep:monitor', NULL, NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-03-01 08:28:40', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5, N'OA 缁€杞扮伐', N'', 1, 40, 1185, N'oa', N'fa:road', NULL, NULL, 0, N'1', N'1', N'1', N'admin', N'2021-09-20 16:26:19', N'1', N'2024-02-29 12:38:13', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (100, N'閻劍鍩涚粻锛勬倞', N'system:user:list', 2, 1, 1, N'user', N'ep:avatar', N'system/user/index', N'SystemUser', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2026-01-01 18:43:01', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (101, N'鐟欐帟澹婄粻锛勬倞', N'', 2, 2, 1, N'role', N'ep:user', N'system/role/index', N'SystemRole', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2026-01-05 19:30:33', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (102, N'閼挎粌宕熺粻锛勬倞', N'', 2, 3, 1, N'menu', N'ep:menu', N'system/menu/index', N'SystemMenu', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:03:50', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (103, N'闁劑妫粻锛勬倞', N'', 2, 4, 1, N'dept', N'fa:address-card', N'system/dept/index', N'SystemDept', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:06:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (104, N'瀹€妞剧秴缁狅紕鎮?, N'', 2, 5, 1, N'post', N'fa:address-book-o', N'system/post/index', N'SystemPost', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:06:39', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (105, N'鐎涙鍚€缁狅紕鎮?, N'', 2, 6, 1, N'dict', N'ep:collection', N'system/dict/index', N'SystemDictType', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:07:12', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (106, N'闁板秶鐤嗙粻锛勬倞', N'', 2, 8, 2, N'config', N'fa:connectdevelop', N'infra/config/index', N'InfraConfig', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-23 00:02:45', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (107, N'闁氨鐓￠崗顒€鎲?, N'', 2, 4, 2739, N'notice', N'ep:takeaway-box', N'system/notice/index', N'SystemNotice', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-22 23:56:17', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (108, N'鐎孤ゎ吀閺冦儱绻?, N'', 1, 9, 1, N'log', N'ep:document-copy', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:08:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (109, N'娴犮倗澧濈粻锛勬倞', N'', 2, 2, 1261, N'token', N'fa:key', N'system/oauth2/token/index', N'SystemTokenClient', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:13:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (110, N'鐎规碍妞傛禒璇插', N'', 2, 7, 2, N'job', N'fa-solid:tasks', N'infra/job/index', N'InfraJob', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 08:57:36', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (111, N'MySQL 閻╂垶甯?, N'', 2, 1, 2740, N'druid', N'fa-solid:box', N'infra/druid/index', N'InfraDruid', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-23 00:05:58', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (112, N'Java 閻╂垶甯?, N'', 2, 3, 2740, N'admin-server', N'ep:coffee-cup', N'infra/server/index', N'InfraAdminServer', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-23 00:06:57', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (113, N'Redis 閻╂垶甯?, N'', 2, 2, 2740, N'redis', N'fa:reddit-square', N'infra/redis/index', N'InfraRedis', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-23 00:06:09', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (114, N'鐞涖劌宕熼弸鍕紦', N'infra:build:list', 2, 2, 2, N'build', N'fa:wpforms', N'infra/build/index', N'InfraBuild', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 08:51:35', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (115, N'娴狅絿鐖滈悽鐔稿灇', N'infra:codegen:query', 2, 1, 2, N'codegen', N'ep:document-copy', N'infra/codegen/index', N'InfraCodegen', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 08:51:06', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (116, N'API 閹恒儱褰?, N'infra:swagger:list', 2, 3, 2, N'swagger', N'fa:fighter-jet', N'infra/swagger/index', N'InfraSwagger', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-04-23 00:01:24', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (500, N'閹垮秳缍旈弮銉ョ箶', N'', 2, 1, 108, N'operate-log', N'ep:position', N'system/operatelog/index', N'SystemOperateLog', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:09:59', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (501, N'閻ц缍嶉弮銉ョ箶', N'', 2, 2, 108, N'login-log', N'ep:promotion', N'system/loginlog/index', N'SystemLoginLog', 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2024-02-29 01:10:29', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1001, N'閻劍鍩涢弻銉嚄', N'system:user:query', 3, 1, 100, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1002, N'閻劍鍩涢弬鏉款杻', N'system:user:create', 3, 2, 100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1003, N'閻劍鍩涙穱顔芥暭', N'system:user:update', 3, 3, 100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1004, N'閻劍鍩涢崚鐘绘珟', N'system:user:delete', 3, 4, 100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1005, N'閻劍鍩涚€电厧鍤?, N'system:user:export', 3, 5, 100, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1006, N'閻劍鍩涚€电厧鍙?, N'system:user:import', 3, 6, 100, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1007, N'闁插秶鐤嗙€靛棛鐖?, N'system:user:update-password', 3, 7, 100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1008, N'鐟欐帟澹婇弻銉嚄', N'system:role:query', 3, 1, 101, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1009, N'鐟欐帟澹婇弬鏉款杻', N'system:role:create', 3, 2, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1010, N'鐟欐帟澹婃穱顔芥暭', N'system:role:update', 3, 3, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1011, N'鐟欐帟澹婇崚鐘绘珟', N'system:role:delete', 3, 4, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1012, N'鐟欐帟澹婄€电厧鍤?, N'system:role:export', 3, 5, 101, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1013, N'閼挎粌宕熼弻銉嚄', N'system:menu:query', 3, 1, 102, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1014, N'閼挎粌宕熼弬鏉款杻', N'system:menu:create', 3, 2, 102, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1015, N'閼挎粌宕熸穱顔芥暭', N'system:menu:update', 3, 3, 102, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1016, N'閼挎粌宕熼崚鐘绘珟', N'system:menu:delete', 3, 4, 102, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1017, N'闁劑妫弻銉嚄', N'system:dept:query', 3, 1, 103, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1018, N'闁劑妫弬鏉款杻', N'system:dept:create', 3, 2, 103, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1019, N'闁劑妫穱顔芥暭', N'system:dept:update', 3, 3, 103, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1020, N'闁劑妫崚鐘绘珟', N'system:dept:delete', 3, 4, 103, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1021, N'瀹€妞剧秴閺屻儴顕?, N'system:post:query', 3, 1, 104, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1022, N'瀹€妞剧秴閺傛澘顤?, N'system:post:create', 3, 2, 104, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1023, N'瀹€妞剧秴娣囶喗鏁?, N'system:post:update', 3, 3, 104, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1024, N'瀹€妞剧秴閸掔娀娅?, N'system:post:delete', 3, 4, 104, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1025, N'瀹€妞剧秴鐎电厧鍤?, N'system:post:export', 3, 5, 104, N'', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1026, N'鐎涙鍚€閺屻儴顕?, N'system:dict:query', 3, 1, 105, N'#', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1027, N'鐎涙鍚€閺傛澘顤?, N'system:dict:create', 3, 2, 105, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1028, N'鐎涙鍚€娣囶喗鏁?, N'system:dict:update', 3, 3, 105, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1029, N'鐎涙鍚€閸掔娀娅?, N'system:dict:delete', 3, 4, 105, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1030, N'鐎涙鍚€鐎电厧鍤?, N'system:dict:export', 3, 5, 105, N'#', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1031, N'闁板秶鐤嗛弻銉嚄', N'infra:config:query', 3, 1, 106, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1032, N'闁板秶鐤嗛弬鏉款杻', N'infra:config:create', 3, 2, 106, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1033, N'闁板秶鐤嗘穱顔芥暭', N'infra:config:update', 3, 3, 106, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1034, N'闁板秶鐤嗛崚鐘绘珟', N'infra:config:delete', 3, 4, 106, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1035, N'闁板秶鐤嗙€电厧鍤?, N'infra:config:export', 3, 5, 106, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1036, N'閸忣剙鎲￠弻銉嚄', N'system:notice:query', 3, 1, 107, N'#', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1037, N'閸忣剙鎲￠弬鏉款杻', N'system:notice:create', 3, 2, 107, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1038, N'閸忣剙鎲℃穱顔芥暭', N'system:notice:update', 3, 3, 107, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1039, N'閸忣剙鎲￠崚鐘绘珟', N'system:notice:delete', 3, 4, 107, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1040, N'閹垮秳缍旈弻銉嚄', N'system:operate-log:query', 3, 1, 500, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1042, N'閺冦儱绻旂€电厧鍤?, N'system:operate-log:export', 3, 2, 500, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1043, N'閻ц缍嶉弻銉嚄', N'system:login-log:query', 3, 1, 501, N'#', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1045, N'閺冦儱绻旂€电厧鍤?, N'system:login-log:export', 3, 3, 501, N'#', N'#', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1046, N'娴犮倗澧濋崚妤勩€?, N'system:oauth2-token:page', 3, 1, 109, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-05-09 23:54:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1048, N'娴犮倗澧濋崚鐘绘珟', N'system:oauth2-token:delete', 3, 2, 109, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-05-09 23:54:53', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1050, N'娴犺濮熼弬鏉款杻', N'infra:job:create', 3, 2, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1051, N'娴犺濮熸穱顔芥暭', N'infra:job:update', 3, 3, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1052, N'娴犺濮熼崚鐘绘珟', N'infra:job:delete', 3, 4, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1053, N'閻樿埖鈧椒鎱ㄩ弨?, N'infra:job:update', 3, 5, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1054, N'娴犺濮熺€电厧鍤?, N'infra:job:export', 3, 7, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1056, N'閻㈢喐鍨氭穱顔芥暭', N'infra:codegen:update', 3, 2, 115, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1057, N'閻㈢喐鍨氶崚鐘绘珟', N'infra:codegen:delete', 3, 3, 115, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1058, N'鐎电厧鍙嗘禒锝囩垳', N'infra:codegen:create', 3, 2, 115, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1059, N'妫板嫯顫嶆禒锝囩垳', N'infra:codegen:preview', 3, 4, 115, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1060, N'閻㈢喐鍨氭禒锝囩垳', N'infra:codegen:download', 3, 5, 115, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'admin', N'2021-01-05 17:03:48', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1063, N'鐠佸墽鐤嗙憴鎺曞閼挎粌宕熼弶鍐', N'system:permission:assign-role-menu', 3, 6, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-01-06 17:53:44', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1064, N'鐠佸墽鐤嗙憴鎺曞閺佺増宓侀弶鍐', N'system:permission:assign-role-data-scope', 3, 7, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-01-06 17:56:31', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1065, N'鐠佸墽鐤嗛悽銊﹀煕鐟欐帟澹?, N'system:permission:assign-user-role', 3, 8, 101, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-01-07 10:23:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1066, N'閼惧嘲绶?Redis 閻╂垶甯舵穱鈩冧紖', N'infra:redis:get-monitor-info', 3, 1, 113, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-01-26 01:02:31', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1067, N'閼惧嘲绶?Redis Key 閸掓銆?, N'infra:redis:get-key-list', 3, 2, 113, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-01-26 01:02:52', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1070, N'娴狅絿鐖滈悽鐔稿灇濡楀牅绶?, N'', 1, 1, 2, N'demo', N'ep:aim', N'infra/testDemo/index', NULL, 0, N'1', N'1', N'1', N'', N'2021-02-06 12:42:49', N'1', N'2023-11-15 23:45:53', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1075, N'娴犺濮熺憴锕€褰?, N'infra:job:trigger', 3, 8, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-02-07 13:03:10', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1077, N'闁炬崘鐭炬潻鍊熼嚋', N'', 2, 4, 2740, N'skywalking', N'fa:eye', N'infra/skywalking/index', N'InfraSkyWalking', 0, N'1', N'1', N'1', N'', N'2021-02-08 20:41:31', N'1', N'2024-04-23 00:07:15', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1078, N'鐠佸潡妫堕弮銉ョ箶', N'', 2, 1, 1083, N'api-access-log', N'ep:place', N'infra/apiAccessLog/index', N'InfraApiAccessLog', 0, N'1', N'1', N'1', N'', N'2021-02-26 01:32:59', N'1', N'2024-02-29 08:54:57', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1082, N'閺冦儱绻旂€电厧鍤?, N'infra:api-access-log:export', 3, 2, 1078, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-02-26 01:32:59', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1083, N'API 閺冦儱绻?, N'', 2, 4, 2, N'log', N'fa:tasks', NULL, NULL, 0, N'1', N'1', N'1', N'', N'2021-02-26 02:18:24', N'1', N'2024-04-22 23:58:36', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1084, N'闁挎瑨顕ら弮銉ョ箶', N'infra:api-error-log:query', 2, 2, 1083, N'api-error-log', N'ep:warning-filled', N'infra/apiErrorLog/index', N'InfraApiErrorLog', 0, N'1', N'1', N'1', N'', N'2021-02-26 07:53:20', N'1', N'2024-02-29 08:55:17', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1085, N'閺冦儱绻旀径鍕倞', N'infra:api-error-log:update-status', 3, 2, 1084, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-02-26 07:53:20', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1086, N'閺冦儱绻旂€电厧鍤?, N'infra:api-error-log:export', 3, 3, 1084, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-02-26 07:53:20', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1087, N'娴犺濮熼弻銉嚄', N'infra:job:query', 3, 1, 110, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2021-03-10 01:26:19', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1088, N'閺冦儱绻旈弻銉嚄', N'infra:api-access-log:query', 3, 1, 1078, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2021-03-10 01:28:04', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1089, N'閺冦儱绻旈弻銉嚄', N'infra:api-error-log:query', 3, 1, 1084, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2021-03-10 01:29:09', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1090, N'閺傚洣娆㈤崚妤勩€?, N'', 2, 5, 1243, N'file', N'ep:upload-filled', N'infra/file/index', N'InfraFile', 0, N'1', N'1', N'1', N'', N'2021-03-12 20:16:20', N'1', N'2024-02-29 08:53:02', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1091, N'閺傚洣娆㈤弻銉嚄', N'infra:file:query', 3, 1, 1090, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-03-12 20:16:20', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1092, N'閺傚洣娆㈤崚鐘绘珟', N'infra:file:delete', 3, 4, 1090, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-03-12 20:16:20', N'', N'2022-04-20 17:03:10', N'0')
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1094, N'閻厺淇婂〒鐘讳壕', N'', 2, 0, 1093, N'sms-channel', N'fa:stack-exchange', N'system/sms/channel/index', N'SystemSmsChannel', 0, N'1', N'1', N'1', N'', N'2021-04-01 11:07:15', N'1', N'2024-02-29 01:15:54', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1095, N'閻厺淇婂〒鐘讳壕閺屻儴顕?, N'system:sms-channel:query', 3, 1, 1094, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 11:07:15', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1096, N'閻厺淇婂〒鐘讳壕閸掓稑缂?, N'system:sms-channel:create', 3, 2, 1094, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 11:07:15', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1097, N'閻厺淇婂〒鐘讳壕閺囧瓨鏌?, N'system:sms-channel:update', 3, 3, 1094, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 11:07:15', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1098, N'閻厺淇婂〒鐘讳壕閸掔娀娅?, N'system:sms-channel:delete', 3, 4, 1094, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 11:07:15', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1100, N'閻厺淇婂Ο鈩冩緲', N'', 2, 1, 1093, N'sms-template', N'ep:connection', N'system/sms/template/index', N'SystemSmsTemplate', 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'1', N'2024-02-29 01:16:18', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1101, N'閻厺淇婂Ο鈩冩緲閺屻儴顕?, N'system:sms-template:query', 3, 1, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1102, N'閻厺淇婂Ο鈩冩緲閸掓稑缂?, N'system:sms-template:create', 3, 2, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1103, N'閻厺淇婂Ο鈩冩緲閺囧瓨鏌?, N'system:sms-template:update', 3, 3, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1104, N'閻厺淇婂Ο鈩冩緲閸掔娀娅?, N'system:sms-template:delete', 3, 4, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1105, N'閻厺淇婂Ο鈩冩緲鐎电厧鍤?, N'system:sms-template:export', 3, 5, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-01 17:35:17', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1106, N'閸欐垿鈧焦绁寸拠鏇犵叚娣?, N'system:sms-template:send-sms', 3, 6, 1100, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2021-04-11 00:26:40', N'1', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1107, N'閻厺淇婇弮銉ョ箶', N'', 2, 2, 1093, N'sms-log', N'fa:edit', N'system/sms/log/index', N'SystemSmsLog', 0, N'1', N'1', N'1', N'', N'2021-04-11 08:37:05', N'1', N'2024-02-29 08:49:02', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1108, N'閻厺淇婇弮銉ョ箶閺屻儴顕?, N'system:sms-log:query', 3, 1, 1107, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-11 08:37:05', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1109, N'閻厺淇婇弮銉ョ箶鐎电厧鍤?, N'system:sms-log:export', 3, 5, 1107, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-04-11 08:37:05', N'', N'2022-04-20 17:03:10', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1138, N'缁夌喐鍩涢崚妤勩€?, N'', 2, 0, 1224, N'list', N'ep:house', N'system/tenant/index', N'SystemTenant', 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:43', N'1', N'2024-02-29 01:01:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1139, N'缁夌喐鍩涢弻銉嚄', N'system:tenant:query', 3, 1, 1138, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:44', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1140, N'缁夌喐鍩涢崚娑樼紦', N'system:tenant:create', 3, 2, 1138, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:44', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1141, N'缁夌喐鍩涢弴瀛樻煀', N'system:tenant:update', 3, 3, 1138, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:44', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1142, N'缁夌喐鍩涢崚鐘绘珟', N'system:tenant:delete', 3, 4, 1138, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:44', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1143, N'缁夌喐鍩涚€电厧鍤?, N'system:tenant:export', 3, 5, 1138, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2021-12-14 12:31:44', N'', N'2022-04-20 17:03:10', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1224, N'缁夌喐鍩涚粻锛勬倞', N'', 2, 0, 1, N'tenant', N'fa-solid:house-user', NULL, NULL, 0, N'1', N'1', N'1', N'1', N'2022-02-20 01:41:13', N'1', N'2024-02-29 00:59:29', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1225, N'缁夌喐鍩涙總妤咁樀', N'', 2, 0, 1224, N'package', N'fa:bars', N'system/tenantPackage/index', N'SystemTenantPackage', 0, N'1', N'1', N'1', N'', N'2022-02-19 17:44:06', N'1', N'2024-02-29 01:01:43', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1226, N'缁夌喐鍩涙總妤咁樀閺屻儴顕?, N'system:tenant-package:query', 3, 1, 1225, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-02-19 17:44:06', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1227, N'缁夌喐鍩涙總妤咁樀閸掓稑缂?, N'system:tenant-package:create', 3, 2, 1225, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-02-19 17:44:06', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1228, N'缁夌喐鍩涙總妤咁樀閺囧瓨鏌?, N'system:tenant-package:update', 3, 3, 1225, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-02-19 17:44:06', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1229, N'缁夌喐鍩涙總妤咁樀閸掔娀娅?, N'system:tenant-package:delete', 3, 4, 1225, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-02-19 17:44:06', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1237, N'閺傚洣娆㈤柊宥囩枂', N'', 2, 0, 1243, N'file-config', N'fa-solid:file-signature', N'infra/fileConfig/index', N'InfraFileConfig', 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'1', N'2024-02-29 08:52:54', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1238, N'閺傚洣娆㈤柊宥囩枂閺屻儴顕?, N'infra:file-config:query', 3, 1, 1237, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1239, N'閺傚洣娆㈤柊宥囩枂閸掓稑缂?, N'infra:file-config:create', 3, 2, 1237, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1240, N'閺傚洣娆㈤柊宥囩枂閺囧瓨鏌?, N'infra:file-config:update', 3, 3, 1237, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1241, N'閺傚洣娆㈤柊宥囩枂閸掔娀娅?, N'infra:file-config:delete', 3, 4, 1237, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1242, N'閺傚洣娆㈤柊宥囩枂鐎电厧鍤?, N'infra:file-config:export', 3, 5, 1237, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-03-15 14:35:28', N'', N'2022-04-20 17:03:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1243, N'閺傚洣娆㈢粻锛勬倞', N'', 2, 6, 2, N'file', N'ep:files', NULL, N'', 0, N'1', N'1', N'1', N'1', N'2022-03-16 23:47:40', N'1', N'2024-04-23 00:02:11', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1255, N'閺佺増宓佸┃鎰板帳缂?, N'', 2, 1, 2, N'data-source-config', N'ep:data-analysis', N'infra/dataSourceConfig/index', N'InfraDataSourceConfig', 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'1', N'2024-02-29 08:51:25', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1256, N'閺佺増宓佸┃鎰板帳缂冾喗鐓＄拠?, N'infra:data-source-config:query', 3, 1, 1255, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'', N'2022-04-27 14:37:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1257, N'閺佺増宓佸┃鎰板帳缂冾喖鍨卞?, N'infra:data-source-config:create', 3, 2, 1255, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'', N'2022-04-27 14:37:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1258, N'閺佺増宓佸┃鎰板帳缂冾喗娲块弬?, N'infra:data-source-config:update', 3, 3, 1255, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'', N'2022-04-27 14:37:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1259, N'閺佺増宓佸┃鎰板帳缂冾喖鍨归梽?, N'infra:data-source-config:delete', 3, 4, 1255, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'', N'2022-04-27 14:37:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1260, N'閺佺増宓佸┃鎰板帳缂冾喖顕遍崙?, N'infra:data-source-config:export', 3, 5, 1255, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-04-27 14:37:32', N'', N'2022-04-27 14:37:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1261, N'OAuth 2.0', N'', 2, 10, 1, N'oauth2', N'fa:dashcube', NULL, NULL, 0, N'1', N'1', N'1', N'1', N'2022-05-09 23:38:17', N'1', N'2024-02-29 01:12:08', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1263, N'鎼存梻鏁ょ粻锛勬倞', N'', 2, 0, 1261, N'oauth2/application', N'fa:hdd-o', N'system/oauth2/client/index', N'SystemOAuth2Client', 0, N'1', N'1', N'1', N'', N'2022-05-10 16:26:33', N'1', N'2024-02-29 01:13:14', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1264, N'鐎广垺鍩涚粩顖涚叀鐠?, N'system:oauth2-client:query', 3, 1, 1263, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-05-10 16:26:33', N'1', N'2022-05-11 00:31:06', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1265, N'鐎广垺鍩涚粩顖氬灡瀵?, N'system:oauth2-client:create', 3, 2, 1263, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-05-10 16:26:33', N'1', N'2022-05-11 00:31:23', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1266, N'鐎广垺鍩涚粩顖涙纯閺?, N'system:oauth2-client:update', 3, 3, 1263, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-05-10 16:26:33', N'1', N'2022-05-11 00:31:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (1267, N'鐎广垺鍩涚粩顖氬灩闂?, N'system:oauth2-client:delete', 3, 4, 1263, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2022-05-10 16:26:33', N'1', N'2022-05-11 00:31:33', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2083, N'閸︽澘灏粻锛勬倞', N'', 2, 14, 1, N'area', N'fa:map-marker', N'system/area/index', N'SystemArea', 0, N'1', N'1', N'1', N'1', N'2022-12-23 17:35:05', N'1', N'2024-02-29 08:50:28', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2130, N'闁喚顔堢粻锛勬倞', N'', 2, 2, 2739, N'mail', N'fa-solid:mail-bulk', NULL, NULL, 0, N'1', N'1', N'1', N'1', N'2023-01-25 17:27:44', N'1', N'2024-04-22 23:56:08', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2131, N'闁喚顔堢拹锕€褰?, N'', 2, 0, 2130, N'mail-account', N'fa:universal-access', N'system/mail/account/index', N'SystemMailAccount', 0, N'1', N'1', N'1', N'', N'2023-01-25 09:33:48', N'1', N'2024-02-29 08:48:16', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2132, N'鐠愶箑褰块弻銉嚄', N'system:mail-account:query', 3, 1, 2131, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 09:33:48', N'', N'2023-01-25 09:33:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2133, N'鐠愶箑褰块崚娑樼紦', N'system:mail-account:create', 3, 2, 2131, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 09:33:48', N'', N'2023-01-25 09:33:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2134, N'鐠愶箑褰块弴瀛樻煀', N'system:mail-account:update', 3, 3, 2131, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 09:33:48', N'', N'2023-01-25 09:33:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2135, N'鐠愶箑褰块崚鐘绘珟', N'system:mail-account:delete', 3, 4, 2131, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 09:33:48', N'', N'2023-01-25 09:33:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2136, N'闁喕娆㈠Ο锛勫', N'', 2, 0, 2130, N'mail-template', N'fa:tag', N'system/mail/template/index', N'SystemMailTemplate', 0, N'1', N'1', N'1', N'', N'2023-01-25 12:05:31', N'1', N'2024-02-29 08:48:41', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2137, N'濡紕澧楅弻銉嚄', N'system:mail-template:query', 3, 1, 2136, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 12:05:31', N'', N'2023-01-25 12:05:31', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2138, N'濡紕澧楅崚娑樼紦', N'system:mail-template:create', 3, 2, 2136, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 12:05:31', N'', N'2023-01-25 12:05:31', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2139, N'濡紕澧楅弴瀛樻煀', N'system:mail-template:update', 3, 3, 2136, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 12:05:31', N'', N'2023-01-25 12:05:31', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2140, N'濡紕澧楅崚鐘绘珟', N'system:mail-template:delete', 3, 4, 2136, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-25 12:05:31', N'', N'2023-01-25 12:05:31', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2141, N'闁喕娆㈢拋鏉跨秿', N'', 2, 0, 2130, N'mail-log', N'fa:edit', N'system/mail/log/index', N'SystemMailLog', 0, N'1', N'1', N'1', N'', N'2023-01-26 02:16:50', N'1', N'2024-02-29 08:48:51', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2142, N'閺冦儱绻旈弻銉嚄', N'system:mail-log:query', 3, 1, 2141, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-26 02:16:50', N'', N'2023-01-26 02:16:50', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2143, N'閸欐垿鈧焦绁寸拠鏇㈠仏娴?, N'system:mail-template:send-mail', 3, 5, 2136, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2023-01-26 23:29:15', N'1', N'2023-01-26 23:29:15', N'0')
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2145, N'濡剝婢樼粻锛勬倞', N'', 2, 0, 2144, N'notify-template', N'fa:archive', N'system/notify/template/index', N'SystemNotifyTemplate', 0, N'1', N'1', N'1', N'', N'2023-01-28 02:26:42', N'1', N'2024-02-29 08:49:14', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2146, N'缁旀瑥鍞存穱鈩兡侀弶鎸庣叀鐠?, N'system:notify-template:query', 3, 1, 2145, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-28 02:26:42', N'', N'2023-01-28 02:26:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2147, N'缁旀瑥鍞存穱鈩兡侀弶鍨灡瀵?, N'system:notify-template:create', 3, 2, 2145, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-28 02:26:42', N'', N'2023-01-28 02:26:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2148, N'缁旀瑥鍞存穱鈩兡侀弶鎸庢纯閺?, N'system:notify-template:update', 3, 3, 2145, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-28 02:26:42', N'', N'2023-01-28 02:26:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2149, N'缁旀瑥鍞存穱鈩兡侀弶鍨灩闂?, N'system:notify-template:delete', 3, 4, 2145, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-01-28 02:26:42', N'', N'2023-01-28 02:26:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2150, N'閸欐垿鈧焦绁寸拠鏇犵彲閸愬懍淇?, N'system:notify-template:send-notify', 3, 5, 2145, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'1', N'2023-01-28 10:54:43', N'1', N'2023-01-28 10:54:43', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2390, N'娴兼ɑ鍎ú璇插З', N'', 1, 99, 2030, N'youhui', N'ep:aim', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-10-21 19:23:49', N'1', N'2023-10-21 19:23:49', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2447, N'娑撳鏌熼惂璇茬秿', N'', 1, 10, 1, N'social', N'fa:rocket', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:12:01', N'1', N'2024-02-29 01:14:05', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2448, N'娑撳鏌熸惔鏃傛暏', N'', 2, 1, 2447, N'client', N'ep:set-up', N'system/social/client/index.vue', N'SocialClient', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:17:19', N'1', N'2024-05-04 19:09:54', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2449, N'娑撳鏌熸惔鏃傛暏閺屻儴顕?, N'system:social-client:query', 3, 1, 2448, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:43:12', N'1', N'2023-11-04 12:43:33', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2450, N'娑撳鏌熸惔鏃傛暏閸掓稑缂?, N'system:social-client:create', 3, 2, 2448, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:43:58', N'1', N'2023-11-04 12:43:58', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2451, N'娑撳鏌熸惔鏃傛暏閺囧瓨鏌?, N'system:social-client:update', 3, 3, 2448, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:44:27', N'1', N'2023-11-04 12:44:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2452, N'娑撳鏌熸惔鏃傛暏閸掔娀娅?, N'system:social-client:delete', 3, 4, 2448, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2023-11-04 12:44:43', N'1', N'2023-11-04 12:44:43', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2453, N'娑撳鏌熼悽銊﹀煕', N'system:social-user:query', 2, 2, 2447, N'user', N'ep:avatar', N'system/social/user/index.vue', N'SocialUser', 0, N'1', N'1', N'1', N'1', N'2023-11-04 14:01:05', N'1', N'2023-11-04 14:01:05', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2472, N'娑撹鐡欑悰顭掔礄閸愬懎绁甸敍?, N'', 2, 12, 1070, N'demo03-inner', N'fa:power-off', N'infra/demo/demo03/inner/index', N'Demo03StudentInner', 0, N'1', N'1', N'1', N'', N'2023-11-13 04:39:51', N'1', N'2023-11-16 23:53:46', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2478, N'閸楁洝銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', N'', 2, 1, 1070, N'demo01-contact', N'ep:bicycle', N'infra/demo/demo01/index', N'Demo01Contact', 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'1', N'2023-11-16 20:34:40', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2479, N'缁€杞扮伐閼辨梻閮存禍鐑樼叀鐠?, N'infra:demo01-contact:query', 3, 1, 2478, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'', N'2023-11-15 14:42:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2480, N'缁€杞扮伐閼辨梻閮存禍鍝勫灡瀵?, N'infra:demo01-contact:create', 3, 2, 2478, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'', N'2023-11-15 14:42:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2481, N'缁€杞扮伐閼辨梻閮存禍鐑樻纯閺?, N'infra:demo01-contact:update', 3, 3, 2478, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'', N'2023-11-15 14:42:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2482, N'缁€杞扮伐閼辨梻閮存禍鍝勫灩闂?, N'infra:demo01-contact:delete', 3, 4, 2478, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'', N'2023-11-15 14:42:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2483, N'缁€杞扮伐閼辨梻閮存禍鍝勵嚤閸?, N'infra:demo01-contact:export', 3, 5, 2478, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-15 14:42:30', N'', N'2023-11-15 14:42:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2484, N'閺嶆垼銆冮敍鍫濐杻閸掔姵鏁奸弻銉礆', N'', 2, 2, 1070, N'demo02-category', N'fa:tree', N'infra/demo/demo02/index', N'Demo02Category', 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'1', N'2023-11-16 20:35:01', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2485, N'缁€杞扮伐閸掑棛琚弻銉嚄', N'infra:demo02-category:query', 3, 1, 2484, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'', N'2023-11-16 12:18:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2486, N'缁€杞扮伐閸掑棛琚崚娑樼紦', N'infra:demo02-category:create', 3, 2, 2484, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'', N'2023-11-16 12:18:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2487, N'缁€杞扮伐閸掑棛琚弴瀛樻煀', N'infra:demo02-category:update', 3, 3, 2484, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'', N'2023-11-16 12:18:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2488, N'缁€杞扮伐閸掑棛琚崚鐘绘珟', N'infra:demo02-category:delete', 3, 4, 2484, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'', N'2023-11-16 12:18:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2489, N'缁€杞扮伐閸掑棛琚€电厧鍤?, N'infra:demo02-category:export', 3, 5, 2484, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:18:27', N'', N'2023-11-16 12:18:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2490, N'娑撹鐡欑悰顭掔礄閺嶅洤鍣敍?, N'', 2, 10, 1070, N'demo03-normal', N'fa:battery-3', N'infra/demo/demo03/normal/index', N'Demo03StudentNormal', 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'1', N'2023-11-16 23:10:03', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2491, N'鐎涳妇鏁撻弻銉嚄', N'infra:demo03-student:query', 3, 1, 2490, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'', N'2023-11-16 12:53:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2492, N'鐎涳妇鏁撻崚娑樼紦', N'infra:demo03-student:create', 3, 2, 2490, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'', N'2023-11-16 12:53:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2493, N'鐎涳妇鏁撻弴瀛樻煀', N'infra:demo03-student:update', 3, 3, 2490, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'', N'2023-11-16 12:53:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2494, N'鐎涳妇鏁撻崚鐘绘珟', N'infra:demo03-student:delete', 3, 4, 2490, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'', N'2023-11-16 12:53:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2495, N'鐎涳妇鏁撶€电厧鍤?, N'infra:demo03-student:export', 3, 5, 2490, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2023-11-16 12:53:37', N'', N'2023-11-16 12:53:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2497, N'娑撹鐡欑悰顭掔礄ERP閿?, N'', 2, 11, 1070, N'demo03-erp', N'ep:calendar', N'infra/demo/demo03/erp/index', N'Demo03StudentERP', 0, N'1', N'1', N'1', N'', N'2023-11-16 15:50:59', N'1', N'2023-11-17 13:19:56', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2525, N'WebSocket', N'', 2, 5, 2, N'websocket', N'ep:connection', N'infra/webSocket/index', N'InfraWebSocket', 0, N'1', N'1', N'1', N'1', N'2023-11-23 19:41:55', N'1', N'2024-04-23 00:02:00', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2740, N'閻╂垶甯舵稉顓炵妇', N'', 1, 10, 2, N'monitors', N'ep:monitor', N'', N'', 0, N'1', N'1', N'1', N'1', N'2024-04-23 00:04:44', N'1', N'2024-04-23 00:04:44', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2758, N'AI 婢堆勀侀崹?, N'', 1, 400, 0, N'/ai', N'tabler:ai', N'', N'', 0, N'1', N'1', N'1', N'1', N'2024-05-07 15:07:56', N'1', N'2025-04-19 18:57:05', N'0')
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2760, N'閹貉冨煑閸?, N'', 1, 100, 2758, N'console', N'ep:setting', N'', N'', 0, N'1', N'1', N'1', N'1', N'2024-05-09 22:39:09', N'1', N'2024-05-24 23:34:21', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2761, N'API 鐎靛棝鎸?, N'', 2, 0, 2760, N'api-key', N'ep:key', N'ai/model/apiKey/index.vue', N'AiApiKey', 0, N'1', N'1', N'1', N'', N'2024-05-09 14:52:56', N'1', N'2024-05-10 22:44:08', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2762, N'API 鐎靛棝鎸滈弻銉嚄', N'ai:api-key:query', 3, 1, 2761, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-09 14:52:56', N'1', N'2024-05-13 20:36:32', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2763, N'API 鐎靛棝鎸滈崚娑樼紦', N'ai:api-key:create', 3, 2, 2761, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-09 14:52:56', N'1', N'2024-05-13 20:36:26', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2764, N'API 鐎靛棝鎸滈弴瀛樻煀', N'ai:api-key:update', 3, 3, 2761, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-09 14:52:56', N'1', N'2024-05-13 20:36:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2765, N'API 鐎靛棝鎸滈崚鐘绘珟', N'ai:api-key:delete', 3, 4, 2761, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-09 14:52:56', N'1', N'2024-05-13 20:36:48', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2767, N'濡€崇€烽柊宥囩枂', N'', 2, 0, 2760, N'model', N'fa-solid:abacus', N'ai/model/model/index.vue', N'AiModel', 0, N'1', N'1', N'1', N'', N'2024-05-10 14:42:48', N'1', N'2025-03-03 09:57:41', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2768, N'閼卞﹤銇夊Ο鈥崇€烽弻銉嚄', N'ai:model:query', 3, 1, 2767, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-10 14:42:48', N'1', N'2025-03-03 09:19:46', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2769, N'閼卞﹤銇夊Ο鈥崇€烽崚娑樼紦', N'ai:model:create', 3, 2, 2767, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-10 14:42:48', N'1', N'2025-03-03 09:20:10', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2770, N'閼卞﹤銇夊Ο鈥崇€烽弴瀛樻煀', N'ai:model:update', 3, 3, 2767, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-10 14:42:48', N'1', N'2025-03-03 09:20:14', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2771, N'閼卞﹤銇夊Ο鈥崇€烽崚鐘绘珟', N'ai:model:delete', 3, 4, 2767, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-10 14:42:48', N'1', N'2025-03-03 09:20:27', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2773, N'閼卞﹤銇夌憴鎺曞', N'', 2, 0, 2760, N'chat-role', N'fa:user-secret', N'ai/model/chatRole/index.vue', N'AiChatRole', 0, N'1', N'1', N'1', N'', N'2024-05-13 12:39:28', N'1', N'2024-05-13 20:41:45', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2774, N'閼卞﹤銇夌憴鎺曞閺屻儴顕?, N'ai:chat-role:query', 3, 1, 2773, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-05-13 12:39:28', N'', N'2024-05-13 12:39:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2775, N'閼卞﹤銇夌憴鎺曞閸掓稑缂?, N'ai:chat-role:create', 3, 2, 2773, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-05-13 12:39:28', N'', N'2024-05-13 12:39:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2776, N'閼卞﹤銇夌憴鎺曞閺囧瓨鏌?, N'ai:chat-role:update', 3, 3, 2773, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-05-13 12:39:28', N'', N'2024-05-13 12:39:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2777, N'閼卞﹤銇夌憴鎺曞閸掔娀娅?, N'ai:chat-role:delete', 3, 4, 2773, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2024-05-13 21:43:38', N'1', N'2024-05-13 21:43:38', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2778, N'閼卞﹤銇夌粻锛勬倞', N'', 2, 10, 2760, N'chat-conversation', N'ep:chat-square', N'ai/chat/manager/index.vue', N'AiChatManager', 0, N'1', N'1', N'1', N'', N'2024-05-24 15:39:18', N'1', N'2024-06-26 21:36:56', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2779, N'娴兼俺鐦介弻銉嚄', N'ai:chat-conversation:query', 3, 1, 2778, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-24 15:39:18', N'1', N'2024-05-25 08:38:30', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2780, N'娴兼俺鐦介崚鐘绘珟', N'ai:chat-conversation:delete', 3, 2, 2778, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-05-24 15:39:18', N'1', N'2024-05-25 08:38:40', N'0')
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2783, N'AI 缂佹鏁?, N'', 2, 2, 2758, N'image', N'ep:picture-rounded', N'ai/image/index/index.vue', N'AiImage', 0, N'1', N'1', N'1', N'1', N'2024-05-26 11:45:17', N'1', N'2024-07-07 17:18:59', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2784, N'缂佹鏁剧粻锛勬倞', N'', 2, 11, 2760, N'image', N'fa:file-image-o', N'ai/image/manager/index.vue', N'AiImageManager', 0, N'1', N'1', N'1', N'', N'2024-06-26 13:32:31', N'1', N'2024-06-26 21:37:13', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2785, N'缂佹鏁鹃弻銉嚄', N'ai:image:query', 3, 1, 2784, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-06-26 13:32:31', N'1', N'2024-06-26 22:21:57', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2786, N'缂佹鏁鹃崚鐘绘珟', N'ai:image:delete', 3, 4, 2784, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'', N'2024-06-26 13:32:31', N'1', N'2024-06-26 22:22:08', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2787, N'缂佹ê娴橀弴瀛樻煀', N'ai:image:update', 3, 2, 2784, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2024-06-26 22:47:56', N'1', N'2024-08-31 09:21:35', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2788, N'闂婂厖绠扮粻锛勬倞', N'', 2, 12, 2760, N'music', N'fa:music', N'ai/music/manager/index.vue', N'AiMusicManager', 0, N'1', N'1', N'1', N'', N'2024-06-27 15:03:33', N'1', N'2024-06-27 23:04:19', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2789, N'闂婂厖绠伴弻銉嚄', N'ai:music:query', 3, 1, 2788, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-06-27 15:03:33', N'', N'2024-06-27 15:03:33', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2790, N'闂婂厖绠伴弴瀛樻煀', N'ai:music:update', 3, 3, 2788, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-06-27 15:03:33', N'', N'2024-06-27 15:03:33', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2791, N'闂婂厖绠伴崚鐘绘珟', N'ai:music:delete', 3, 4, 2788, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-06-27 15:03:33', N'', N'2024-06-27 15:03:33', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2792, N'AI 閸愭瑤缍?, N'', 2, 3, 2758, N'write', N'fa-solid:book-reader', N'ai/write/index/index.vue', N'AiWrite', 0, N'1', N'1', N'1', N'1', N'2024-07-08 09:26:44', N'1', N'2024-07-16 13:03:06', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2793, N'閸愭瑤缍旂粻锛勬倞', N'', 2, 13, 2760, N'write', N'fa:bookmark-o', N'ai/write/manager/index.vue', N'AiWriteManager', 0, N'1', N'1', N'1', N'', N'2024-07-10 13:24:34', N'1', N'2024-07-10 21:31:59', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2794, N'AI 閸愭瑤缍旈弻銉嚄', N'ai:write:query', 3, 1, 2793, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-07-10 13:24:34', N'', N'2024-07-10 13:24:34', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2795, N'AI 閸愭瑤缍旈崚鐘绘珟', N'ai:write:delete', 3, 4, 2793, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-07-10 13:24:34', N'', N'2024-07-10 13:24:34', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2796, N'AI 闂婂厖绠?, N'', 2, 4, 2758, N'music', N'fa:music', N'ai/music/index/index.vue', N'AiMusic', 0, N'1', N'1', N'1', N'1', N'2024-07-17 09:21:12', N'1', N'2024-07-29 21:11:52', N'0')
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2798, N'AI 閹繄娣€电厧娴?, N'', 2, 6, 2758, N'mind-map', N'fa:sitemap', N'ai/mindmap/index/index.vue', N'AiMindMap', 0, N'1', N'1', N'1', N'1', N'2024-07-29 21:31:59', N'1', N'2025-03-02 18:57:31', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2799, N'鐎电厧娴樼粻锛勬倞', N'', 2, 14, 2760, N'mind-map', N'fa:map', N'ai/mindmap/manager/index', N'AiMindMapManager', 0, N'1', N'1', N'1', N'', N'2024-08-10 09:15:09', N'1', N'2024-08-10 17:24:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2800, N'閹繄娣€电厧娴橀弻銉嚄', N'ai:mind-map:query', 3, 1, 2799, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-08-10 09:15:09', N'', N'2024-08-10 09:15:09', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2801, N'閹繄娣€电厧娴橀崚鐘绘珟', N'ai:mind-map:delete', 3, 4, 2799, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2024-08-10 09:15:09', N'', N'2024-08-10 09:15:09', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2915, N'AI 閻儴鐦戞惔?, N'', 2, 5, 2758, N'knowledge', N'ep:notebook', N'ai/knowledge/knowledge/index', N'AiKnowledge', 0, N'1', N'1', N'1', N'', N'2025-02-28 07:04:21', N'1', N'2025-03-02 18:58:37', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2916, N'AI 閻儴鐦戞惔鎾寸叀鐠?, N'ai:knowledge:query', 3, 1, 2915, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-02-28 07:04:21', N'', N'2025-02-28 07:04:21', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2917, N'AI 閻儴鐦戞惔鎾冲灡瀵?, N'ai:knowledge:create', 3, 2, 2915, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-02-28 07:04:21', N'', N'2025-02-28 07:04:21', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2918, N'AI 閻儴鐦戞惔鎾存纯閺?, N'ai:knowledge:update', 3, 3, 2915, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-02-28 07:04:21', N'', N'2025-02-28 07:04:21', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2919, N'AI 閻儴鐦戞惔鎾冲灩闂?, N'ai:knowledge:delete', 3, 4, 2915, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-02-28 07:04:21', N'', N'2025-02-28 07:04:21', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2920, N'瀹搞儱鍙跨粻锛勬倞', N'', 2, 0, 2760, N'tool', N'fa-solid:tools', N'ai/model/tool/index.vue', N'AiTool', 0, N'1', N'1', N'1', N'', N'2025-03-14 11:19:29', N'1', N'2025-03-14 19:20:18', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2921, N'瀹搞儱鍙块弻銉嚄', N'ai:tool:query', 3, 1, 2920, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-03-14 11:19:29', N'', N'2025-03-14 11:19:29', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2922, N'瀹搞儱鍙块崚娑樼紦', N'ai:tool:create', 3, 2, 2920, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-03-14 11:19:29', N'', N'2025-03-14 11:19:29', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2923, N'瀹搞儱鍙块弴瀛樻煀', N'ai:tool:update', 3, 3, 2920, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-03-14 11:19:29', N'', N'2025-03-14 11:19:29', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (2924, N'瀹搞儱鍙块崚鐘绘珟', N'ai:tool:delete', 3, 4, 2920, N'', N'', N'', NULL, 0, N'1', N'1', N'1', N'', N'2025-03-14 11:19:29', N'', N'2025-03-14 11:19:29', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5000, N'AI 瀹搞儰缍斿ù?, N'', 2, 5, 2758, N'workflow', N'fa:hand-grab-o', N'ai/workflow/index.vue', N'AiWorkflow', 0, N'1', N'1', N'1', N'1', N'2025-03-25 09:50:27', N'1', N'2025-05-03 18:55:12', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5001, N'AI 瀹搞儰缍斿ù浣圭叀鐠?, N'ai:workflow:query', 3, 1, 5000, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-03-25 09:51:11', N'1', N'2025-03-25 09:51:11', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5002, N'AI 瀹搞儰缍斿ù浣稿灡瀵?, N'ai:workflow:create', 3, 2, 5000, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-03-25 09:51:28', N'1', N'2025-03-25 09:51:28', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5003, N'AI 瀹搞儰缍斿ù浣规纯閺?, N'ai:workflow:update', 3, 3, 5000, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-03-25 09:51:42', N'1', N'2025-03-25 09:51:42', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5004, N'AI 瀹搞儰缍斿ù浣稿灩闂?, N'ai:workflow:delete', 3, 4, 5000, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-03-25 09:51:55', N'1', N'2025-03-25 09:52:03', N'0')
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5005, N'AI 瀹搞儰缍斿ù浣圭ゴ鐠?, N'ai:workflow:test', 3, 5, 5000, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-03-30 10:29:41', N'1', N'2025-03-30 10:29:41', N'0')
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5010, N'缁夌喐鍩涢崚鍥ㄥ床', N'system:tenant:visit', 3, 999, 1138, N'', N'', N'', N'', 0, N'1', N'1', N'1', N'1', N'2025-05-05 15:25:32', N'1', N'2025-05-05 15:25:32', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5101, N'閸╄櫣顢呴弫鐗堝祦', N'', 1, 10, 5100, N'md', N'ep:data-analysis', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-15 00:40:13', N'1', N'2026-02-15 00:40:13', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5200, N'閹烘帞褰粻锛勬倞', N'', 1, 70, 5100, N'cal', N'ep:calendar', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-16 07:35:50', N'1', N'2026-02-16 15:37:53', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5300, N'鐠佹儳顦粻锛勬倞', N'', 1, 30, 5100, N'dv', N'ep:cpu', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-17 00:59:58', N'1', N'2026-02-17 09:01:18', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5400, N'瀹搞儱鍙跨粻锛勬倞', N'', 1, 40, 5100, N'tm', N'ep:scissor', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-16 11:10:55', N'1', N'2026-03-21 14:20:41', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5500, N'鐠愩劑鍣虹粻锛勬倞', N'', 1, 60, 5100, N'qc', N'ep:check', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-17 02:18:18', N'1', N'2026-02-17 14:36:15', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5700, N'閻㈢喍楠囩粻锛勬倞', N'', 1, 50, 5100, N'pro', N'ep:management', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-17 11:39:58', N'1', N'2026-02-17 19:53:35', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5780, N'娴犳挸绨辩粻锛勬倞', N'', 1, 20, 5100, N'wm', N'ep:box', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-02-17 15:37:58', N'1', N'2026-02-17 23:38:18', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_menu (id, name, permission, type, sort, parent_id, path, icon, component, component_name, status, visible, keep_alive, always_show, creator, create_time, updater, update_time, deleted) VALUES (5950, N'鎼存挸鐡ㄩ惄妯煎仯', N'', 1, 13, 5780, N'stock-taking', N'ep:circle-check-filled', N'', N'', 0, N'1', N'1', N'1', N'1', N'2026-03-09 00:00:00', N'1', N'2026-03-09 21:19:09', N'0')
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
SET IDENTITY_INSERT system_menu OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_notice
-- ----------------------------
DROP TABLE IF EXISTS system_notice
GO
CREATE TABLE system_notice (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    title nvarchar(50)  NOT NULL,
    content nvarchar(max)  NOT NULL,
    type tinyint  NOT NULL,
    status tinyint DEFAULT 0 NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忣剙鎲D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忣剙鎲￠弽鍥暯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'title'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忣剙鎲￠崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忣剙鎲＄猾璇茬€烽敍?闁氨鐓?2閸忣剙鎲￠敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忣剙鎲￠悩鑸碘偓渚婄礄0濮濓絽鐖?1閸忔娊妫撮敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁氨鐓￠崗顒€鎲＄悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notice'
GO

-- ----------------------------
-- Records of system_notice
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_notice ON
GO
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'閼哄浜鹃惃鍕彆娴?, N'<p>閺傛壆澧楅張顒€鍞寸€?33222</p>', 1, 0, N'admin', N'2021-01-05 17:03:48', N'"1"', N'2025-08-31 09:38:22', N'0', 1)
GO
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'缂佸瓨濮㈤柅姘辩叀閿?018-07-01 缁崵绮洪崙灞炬珤缂佸瓨濮?, N'<p><img src="http://test.yudao.iocoder.cn/b7cb3cf49b4b3258bf7309a09dd2f4e5.jpg" alt="" data-href="">11112222<img src="http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png" alt="image" data-href="http://test.yudao.iocoder.cn/fe44fc7bdb82ca421184b2eebbaee9e2148d4a1827479a4eb4521e11d2a062ba.png">3333</p>', 2, 1, N'admin', N'2021-01-05 17:03:48', N'1', N'2025-04-18 23:56:40', N'0', 1)
GO
INSERT INTO system_notice (id, title, content, type, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, N'閹存垶妲稿ù瀣槸閺嶅洭顣?, N'<p>閸濆牆鎼遍崫鍫濇惐123</p>', 1, 0, N'110', N'2022-02-22 01:01:25', N'110', N'2022-02-22 01:01:46', N'0', 121)
GO
SET IDENTITY_INSERT system_notice OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_notify_message
-- ----------------------------
DROP TABLE IF EXISTS system_notify_message
GO
CREATE TABLE system_notify_message (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    user_type tinyint  NOT NULL,
    template_id bigint  NOT NULL,
    template_code nvarchar(64)  NOT NULL,
    template_nickname nvarchar(63)  NOT NULL,
    template_content nvarchar(1024)  NOT NULL,
    template_type int  NOT NULL,
    template_params nvarchar(255)  NOT NULL,
    read_status varchar(1)  NOT NULL,
    read_time datetime2 DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_notify_message_01 ON system_notify_message (user_id, user_type, read_status)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩汭D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩沬d',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楃紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楅崣鎴︹偓浣锋眽閸氬秶袨',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楅崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楃猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楅崣鍌涙殶',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'template_params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佸鑼额嚢',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'read_status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闂冨懓顕伴弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'read_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁旀瑥鍞存穱鈩冪Х閹垵銆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_message'
GO

-- ----------------------------
-- Records of system_notify_message
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_notify_message ON
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 1, 2, 1, N'test', N'123', N'閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, N'{"name":"1","what":"2"}', N'1', N'2025-12-15 21:24:36', N'1', N'2023-01-28 11:44:08', N'1', N'2025-12-15 21:24:36', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 1, 2, 1, N'test', N'123', N'閹存垶妲?1閿涘本鍨滃鈧慨?2 娴?, 1, N'{"name":"1","what":"2"}', N'1', N'2025-12-15 21:24:36', N'1', N'2023-01-28 11:45:04', N'1', N'2025-12-15 21:24:36', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, 103, 2, 2, N'register', N'缁崵绮哄☉鍫熶紖', N'娴ｇ姴銈介敍灞绢偨鏉?閸濆牆鎼?閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, N'{"name":"閸濆牆鎼?}', N'0', NULL, N'1', N'2023-01-28 21:02:20', N'1', N'2023-01-28 21:02:20', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 1, 2, 1, N'test', N'123', N'閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, N'{"name":"閼哄澹?,"what":"閸愭瑤鍞惍?}', N'1', N'2025-12-08 17:25:28', N'1', N'2023-01-28 22:21:42', N'1', N'2025-12-08 17:25:28', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 1, 2, 1, N'test', N'123', N'閹存垶妲?閼哄澹欓敍灞惧灉瀵偓婵?閸愭瑤鍞惍?娴?, 1, N'{"name":"閼哄澹?,"what":"閸愭瑤鍞惍?}', N'1', N'2025-12-08 17:25:30', N'1', N'2023-01-28 22:22:07', N'1', N'2025-12-08 17:25:30', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 1, 2, 1, N'test', N'123', N'閹存垶妲?2閿涘本鍨滃鈧慨?3 娴?, 1, N'{"name":"2","what":"3"}', N'1', N'2025-12-08 17:25:22', N'1', N'2023-01-28 23:45:21', N'1', N'2025-12-08 17:25:22', N'0', 1)
GO
INSERT INTO system_notify_message (id, user_id, user_type, template_id, template_code, template_nickname, template_content, template_type, template_params, read_status, read_time, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 1, 2, 2, N'register', N'缁崵绮哄☉鍫熶紖', N'娴ｇ姴銈介敍灞绢偨鏉?123 閸旂姴鍙嗘径褍顔嶆惔顓ㄧ磼', 2, N'{"name":"123"}', N'1', N'2025-12-08 16:46:01', N'1', N'2023-01-28 23:50:21', N'1', N'2025-12-08 16:46:01', N'0', 1)
GO
GO
GO
SET IDENTITY_INSERT system_notify_message OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_notify_template
-- ----------------------------
DROP TABLE IF EXISTS system_notify_template
GO
CREATE TABLE system_notify_template (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(63)  NOT NULL,
    code nvarchar(64)  NOT NULL,
    nickname nvarchar(255)  NOT NULL,
    content nvarchar(1024)  NOT NULL,
    type tinyint  NOT NULL,
    params nvarchar(255) DEFAULT NULL NULL,
    status tinyint  NOT NULL,
    remark nvarchar(255) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撳鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楃紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧椒姹夐崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡紕澧楅崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁鐎?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼弫鎵矋',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁旀瑥鍞存穱鈩兡侀弶鑳€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_notify_template'
GO

-- ----------------------------
-- Table structure for system_oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_access_token
GO
CREATE TABLE system_oauth2_access_token (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    user_type tinyint  NOT NULL,
    user_info nvarchar(512)  NOT NULL,
    access_token nvarchar(255)  NOT NULL,
    refresh_token nvarchar(32)  NOT NULL,
    client_id nvarchar(255)  NOT NULL,
    scopes nvarchar(255) DEFAULT NULL NULL,
    expires_time datetime2  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_oauth2_access_token_01 ON system_oauth2_access_token (access_token)
GO
CREATE INDEX idx_system_oauth2_access_token_02 ON system_oauth2_access_token (refresh_token)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涙穱鈩冧紖',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'user_info'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠佸潡妫舵禒銈囧',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'access_token'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掗攱鏌婃禒銈囧',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'refresh_token'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥懠鍐ㄦ纯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'scopes'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鏉╁洦婀￠弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'expires_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'OAuth2 鐠佸潡妫舵禒銈囧',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_access_token'
GO

-- ----------------------------
-- Table structure for system_oauth2_approve
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_approve
GO
CREATE TABLE system_oauth2_approve (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    user_type tinyint  NOT NULL,
    client_id nvarchar(255)  NOT NULL,
    scope nvarchar(255) DEFAULT '' NOT NULL,
    approved varchar(1) DEFAULT '0' NOT NULL,
    expires_time datetime2  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_oauth2_approve_01 ON system_oauth2_approve (user_id, user_type, client_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥懠鍐ㄦ纯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'scope'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀幒銉ュ綀',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'approved'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鏉╁洦婀￠弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'expires_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'OAuth2 閹电懓鍣悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_approve'
GO

-- ----------------------------
-- Table structure for system_oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_client
GO
CREATE TABLE system_oauth2_client (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    client_id nvarchar(255)  NOT NULL,
    secret nvarchar(255)  NOT NULL,
    name nvarchar(255)  NOT NULL,
    logo nvarchar(255)  NOT NULL,
    description nvarchar(255) DEFAULT NULL NULL,
    status tinyint  NOT NULL,
    access_token_validity_seconds int  NOT NULL,
    refresh_token_validity_seconds int  NOT NULL,
    redirect_uris nvarchar(255)  NOT NULL,
    authorized_grant_types nvarchar(255)  NOT NULL,
    scopes nvarchar(255) DEFAULT NULL NULL,
    auto_approve_scopes nvarchar(255) DEFAULT NULL NULL,
    authorities nvarchar(255) DEFAULT NULL NULL,
    resource_ids nvarchar(255) DEFAULT NULL NULL,
    additional_information nvarchar(4000) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_oauth2_client_01 ON system_oauth2_client (client_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖氱槕闁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'secret'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら崶鐐垼',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'logo'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら幓蹇氬牚',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠佸潡妫舵禒銈囧閻ㄥ嫭婀侀弫鍫熸埂',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'access_token_validity_seconds'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掗攱鏌婃禒銈囧閻ㄥ嫭婀侀弫鍫熸埂',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'refresh_token_validity_seconds'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'redirect_uris'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堢猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'authorized_grant_types'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥懠鍐ㄦ纯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'scopes'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼奉亜濮╅柅姘崇箖閻ㄥ嫭宸块弶鍐瘱閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'auto_approve_scopes'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺夊啴妾?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'authorities'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠у嫭绨?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'resource_ids'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闂勫嫬濮炴穱鈩冧紖',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'additional_information'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'OAuth2 鐎广垺鍩涚粩顖濄€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_client'
GO

-- ----------------------------
-- Records of system_oauth2_client
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_oauth2_client ON
GO
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (1, N'default', N'admin123', N'閼哄浜惧┃鎰垳', N'http://test.yudao.iocoder.cn/20250502/sort2_1746189740718.png', N'閹存垶妲搁幓蹇氬牚', 0, 1800, 2592000, N'["http://127.0.0.1:3000"]', N'["password","authorization_code","implicit","refresh_token","client_credentials"]', N'["user.read","user.write"]', N'[]', N'["user.read","user.write"]', N'[]', N'{}', N'1', N'2022-05-11 21:47:12', N'1', N'2025-12-07 20:07:09', N'0')
GO
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (40, N'test', N'test2', N'biubiu', N'http://test.yudao.iocoder.cn/20251227/javayuanma_1766829882970.jpg', N'閸燂箑鏆掗崯锕€鏆?, 0, 1800, 43200, N'["http://127.0.0.1:3000"]', N'["password","authorization_code","implicit"]', N'["user_info","projects"]', N'["user_info"]', N'[]', N'[]', N'{}', N'1', N'2022-05-12 00:28:20', N'1', N'2025-12-27 18:04:44', N'0')
GO
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (41, N'yudao-sso-demo-by-code', N'test', N'閸╄桨绨幒鍫熸綀閻焦膩瀵骏绱濇俊鍌欑秿鐎圭偟骞?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, N'http://test.yudao.iocoder.cn/it/20250502/sign_1746181948685.png', NULL, 0, 1800, 43200, N'["http://127.0.0.1:18080"]', N'["authorization_code","refresh_token"]', N'["user.read","user.write"]', N'[]', N'[]', N'[]', NULL, N'1', N'2022-09-29 13:28:31', N'1', N'2025-05-02 18:32:30', N'0')
GO
INSERT INTO system_oauth2_client (id, client_id, secret, name, logo, description, status, access_token_validity_seconds, refresh_token_validity_seconds, redirect_uris, authorized_grant_types, scopes, auto_approve_scopes, authorities, resource_ids, additional_information, creator, create_time, updater, update_time, deleted) VALUES (42, N'yudao-sso-demo-by-password', N'test', N'閸╄桨绨€靛棛鐖滃Ο鈥崇础閿涘苯顩ф担鏇炵杽閻?SSO 閸楁洜鍋ｉ惂璇茬秿閿?, N'http://test.yudao.iocoder.cn/20251025/images (3)_1761360515810.jpeg', NULL, 0, 1800, 43200, N'["http://127.0.0.1:18080"]', N'["password","refresh_token"]', N'["user.read","user.write"]', N'[]', N'[]', N'[]', NULL, N'1', N'2022-10-04 17:40:16', N'1', N'2025-10-25 10:49:40', N'0')
GO
SET IDENTITY_INSERT system_oauth2_client OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_oauth2_code
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_code
GO
CREATE TABLE system_oauth2_code (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    user_type tinyint  NOT NULL,
    code nvarchar(32)  NOT NULL,
    client_id nvarchar(255)  NOT NULL,
    scopes nvarchar(255) DEFAULT '' NULL,
    expires_time datetime2  NOT NULL,
    redirect_uri nvarchar(255) DEFAULT NULL NULL,
    state nvarchar(255) DEFAULT '' NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_oauth2_code_01 ON system_oauth2_code (code)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥惍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥懠鍐ㄦ纯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'scopes'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鏉╁洦婀￠弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'expires_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欘垶鍣哥€规艾鎮滈惃?URI 閸︽澘娼?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'redirect_uri'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'state'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'OAuth2 閹哄牊娼堥惍浣姐€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_code'
GO

-- ----------------------------
-- Table structure for system_oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS system_oauth2_refresh_token
GO
CREATE TABLE system_oauth2_refresh_token (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    refresh_token nvarchar(32)  NOT NULL,
    user_type tinyint  NOT NULL,
    client_id nvarchar(255)  NOT NULL,
    scopes nvarchar(255) DEFAULT NULL NULL,
    expires_time datetime2  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_oauth2_refresh_token_01 ON system_oauth2_refresh_token (refresh_token)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掗攱鏌婃禒銈囧',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'refresh_token'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹哄牊娼堥懠鍐ㄦ纯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'scopes'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鏉╁洦婀￠弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'expires_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'OAuth2 閸掗攱鏌婃禒銈囧',
    'SCHEMA', N'dbo',
    'TABLE', N'system_oauth2_refresh_token'
GO

-- ----------------------------
-- Table structure for system_operate_log
-- ----------------------------
DROP TABLE IF EXISTS system_operate_log
GO
CREATE TABLE system_operate_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    trace_id nvarchar(64) DEFAULT '' NOT NULL,
    user_id bigint  NOT NULL,
    user_type tinyint DEFAULT 0 NOT NULL,
    type nvarchar(50)  NOT NULL,
    sub_type nvarchar(50)  NOT NULL,
    biz_id bigint  NOT NULL,
    action nvarchar(2000) DEFAULT '' NOT NULL,
    success varchar(1) DEFAULT '1' NOT NULL,
    extra nvarchar(2000) DEFAULT '' NOT NULL,
    request_method nvarchar(16) DEFAULT '' NULL,
    request_url nvarchar(255) DEFAULT '' NULL,
    user_ip nvarchar(50) DEFAULT NULL NULL,
    user_agent nvarchar(512) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_operate_log_01 ON system_operate_log (user_id)
GO
CREATE INDEX idx_system_operate_log_02 ON system_operate_log (create_time)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺冦儱绻旀稉濠氭暛',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁炬崘鐭炬潻鍊熼嚋缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'trace_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍斿Ο鈥虫健缁鐎?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'sub_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈弫鐗堝祦濡€虫健缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'biz_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'action'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旂紒鎾寸亯',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'success'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹锋挸鐫嶇€涙顔?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'extra'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴弬瑙勭《閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'request_method'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠囬攱鐪伴崷鏉挎絻',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'request_url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'user_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濞村繗顫嶉崳?UA',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'user_agent'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹垮秳缍旈弮銉ョ箶鐠佹澘缍?V2 閻楀牊婀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_operate_log'
GO

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS system_post
GO
CREATE TABLE system_post (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    code nvarchar(64)  NOT NULL,
    name nvarchar(50)  NOT NULL,
    sort int  NOT NULL,
    status tinyint  NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴ID',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴缂傛牜鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴閸氬秶袨',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勫墽銇氭い鍝勭碍',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧緤绱?濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_post',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴娣団剝浼呯悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_post'
GO

-- ----------------------------
-- Records of system_post
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_post ON
GO
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'se', N'妞ゅ湱娲扮紒蹇曟倞', 2, 0, N'', N'admin', N'2021-01-05 17:03:48', N'1', N'2025-12-15 22:38:43', N'0', 1)
GO
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, N'user', N'閺咁噣鈧艾鎲冲?, 4, 0, N'111222', N'admin', N'2021-01-05 17:03:48', N'1', N'2025-03-24 21:32:40', N'0', 1)
GO
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, N'HR', N'娴滃搫濮忕挧鍕爱', 5, 0, N'`', N'1', N'2024-03-24 20:45:40', N'1', N'2025-03-29 19:08:10', N'0', 1)
GO
INSERT INTO system_post (id, code, name, sort, status, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, N'test', N'濞村鐦?, 10, 0, NULL, N'1', N'2025-09-02 08:45:57', N'1', N'2025-09-02 08:45:57', N'0', 1)
GO
SET IDENTITY_INSERT system_post OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS system_role
GO
CREATE TABLE system_role (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(30)  NOT NULL,
    code nvarchar(100)  NOT NULL,
    sort int  NOT NULL,
    data_scope tinyint DEFAULT 1 NOT NULL,
    data_scope_dept_ids nvarchar(500) DEFAULT '' NOT NULL,
    status tinyint  NOT NULL,
    type tinyint  NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹奍D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婇崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婇弶鍐鐎涙顑佹稉?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勫墽銇氭い鍝勭碍',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'sort'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓侀懠鍐ㄦ纯閿?閿涙艾鍙忛柈銊︽殶閹诡喗娼堥梽?2閿涙俺鍤滅€规碍鏆熼幑顔芥綀闂?3閿涙碍婀伴柈銊╂，閺佺増宓侀弶鍐 4閿涙碍婀伴柈銊╂，閸欏﹣浜掓稉瀣殶閹诡喗娼堥梽鎰剁礆',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'data_scope'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺佺増宓侀懠鍐ㄦ纯(閹稿洤鐣鹃柈銊╂，閺佹壆绮?',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'data_scope_dept_ids'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婇悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婄猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婃穱鈩冧紖鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role'
GO

-- ----------------------------
-- Records of system_role
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_role ON
GO
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'鐡掑懐楠囩粻锛勬倞閸?, N'super_admin', 1, 1, N'', 0, 1, N'鐡掑懐楠囩粻锛勬倞閸?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-22 05:08:21', N'0', 1)
GO
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'閺咁噣鈧俺顫楅懝?, N'common', 2, 2, N'', 0, 1, N'閺咁噣鈧俺顫楅懝?, N'admin', N'2021-01-05 17:03:48', N'', N'2022-02-22 05:08:20', N'0', 1)
GO
GO
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, N'缁夌喐鍩涚粻锛勬倞閸?, N'tenant_admin', 0, 1, N'', 0, 1, N'缁崵绮洪懛顏勫З閻㈢喐鍨?, N'1', N'2022-02-22 00:56:14', N'1', N'2022-02-22 00:56:14', N'0', 121)
GO
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, N'缁夌喐鍩涚粻锛勬倞閸?, N'tenant_admin', 0, 1, N'', 0, 1, N'缁崵绮洪懛顏勫З閻㈢喐鍨?, N'1', N'2022-03-07 21:37:58', N'1', N'2022-03-07 21:37:58', N'0', 122)
GO
INSERT INTO system_role (id, name, code, sort, data_scope, data_scope_dept_ids, status, type, remark, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (155, N'濞村鐦弫鐗堝祦閺夊啴妾?', N'test-dp', 4, 2, N'[112,100,102,103,104,105,107,108]', 0, 2, N'1111', N'1', N'2025-03-31 14:58:06', N'1', N'2025-12-04 23:29:40', N'0', 1)
GO
SET IDENTITY_INSERT system_role OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS system_role_menu
GO
CREATE TABLE system_role_menu (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    role_id bigint  NOT NULL,
    menu_id bigint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_role_menu_01 ON system_role_menu (role_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼奉亜顤冪紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹奍D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼挎粌宕烮D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'menu_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹婇崪宀冨綅閸楁洖鍙ч懕鏃囥€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_role_menu'
GO

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_role_menu ON
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (263, 109, 1, N'1', N'2022-02-22 00:56:14', N'1', N'2022-02-22 00:56:14', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (434, 2, 1, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (454, 2, 1093, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (455, 2, 1094, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (460, 2, 1100, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (467, 2, 1107, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (477, 2, 100, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (478, 2, 101, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (479, 2, 102, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (481, 2, 103, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (483, 2, 104, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (485, 2, 105, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (488, 2, 107, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (490, 2, 108, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (492, 2, 109, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (498, 2, 1138, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (523, 2, 1224, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (524, 2, 1225, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (541, 2, 500, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (543, 2, 501, N'1', N'2022-02-22 13:09:12', N'1', N'2022-02-22 13:09:12', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (675, 2, 2, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (689, 2, 1077, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (690, 2, 1078, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (692, 2, 1083, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (693, 2, 1084, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (699, 2, 1090, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (703, 2, 106, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (704, 2, 110, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (705, 2, 111, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (706, 2, 112, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (707, 2, 113, N'1', N'2022-02-22 13:16:57', N'1', N'2022-02-22 13:16:57', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1296, 110, 1, N'110', N'2022-02-23 00:23:55', N'110', N'2022-02-23 00:23:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1578, 111, 1, N'1', N'2022-03-07 21:37:58', N'1', N'2022-03-07 21:37:58', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1729, 109, 100, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1730, 109, 101, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1731, 109, 1063, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1732, 109, 1064, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1733, 109, 1001, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1734, 109, 1065, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1735, 109, 1002, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1736, 109, 1003, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1737, 109, 1004, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1738, 109, 1005, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1739, 109, 1006, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1740, 109, 1007, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1741, 109, 1008, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1742, 109, 1009, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1743, 109, 1010, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1744, 109, 1011, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1745, 109, 1012, N'1', N'2022-09-21 22:08:51', N'1', N'2022-09-21 22:08:51', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1746, 111, 100, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1747, 111, 101, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1748, 111, 1063, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1749, 111, 1064, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1750, 111, 1001, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1751, 111, 1065, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1752, 111, 1002, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1753, 111, 1003, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1754, 111, 1004, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1755, 111, 1005, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1756, 111, 1006, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1757, 111, 1007, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1758, 111, 1008, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1759, 111, 1009, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1760, 111, 1010, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1761, 111, 1011, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1762, 111, 1012, N'1', N'2022-09-21 22:08:52', N'1', N'2022-09-21 22:08:52', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1763, 109, 100, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1764, 109, 101, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1765, 109, 1063, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1766, 109, 1064, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1767, 109, 1001, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1768, 109, 1065, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1769, 109, 1002, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1770, 109, 1003, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1771, 109, 1004, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1772, 109, 1005, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1773, 109, 1006, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1774, 109, 1007, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1775, 109, 1008, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1776, 109, 1009, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1777, 109, 1010, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1778, 109, 1011, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1779, 109, 1012, N'1', N'2022-09-21 22:08:53', N'1', N'2022-09-21 22:08:53', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1780, 111, 100, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1781, 111, 101, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1782, 111, 1063, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1783, 111, 1064, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1784, 111, 1001, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1785, 111, 1065, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1786, 111, 1002, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1787, 111, 1003, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1788, 111, 1004, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1789, 111, 1005, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1790, 111, 1006, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1791, 111, 1007, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1792, 111, 1008, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1793, 111, 1009, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1794, 111, 1010, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1795, 111, 1011, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1796, 111, 1012, N'1', N'2022-09-21 22:08:54', N'1', N'2022-09-21 22:08:54', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1797, 109, 100, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1798, 109, 101, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1799, 109, 1063, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1800, 109, 1064, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1801, 109, 1001, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1802, 109, 1065, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1803, 109, 1002, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1804, 109, 1003, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1805, 109, 1004, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1806, 109, 1005, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1807, 109, 1006, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1808, 109, 1007, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1809, 109, 1008, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1810, 109, 1009, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1811, 109, 1010, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1812, 109, 1011, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1813, 109, 1012, N'1', N'2022-09-21 22:08:55', N'1', N'2022-09-21 22:08:55', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1814, 111, 100, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1815, 111, 101, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1816, 111, 1063, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1817, 111, 1064, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1818, 111, 1001, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1819, 111, 1065, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1820, 111, 1002, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1821, 111, 1003, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1822, 111, 1004, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1823, 111, 1005, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1824, 111, 1006, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1825, 111, 1007, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1826, 111, 1008, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1827, 111, 1009, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1828, 111, 1010, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1829, 111, 1011, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1830, 111, 1012, N'1', N'2022-09-21 22:08:56', N'1', N'2022-09-21 22:08:56', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1831, 109, 103, N'1', N'2022-09-21 22:43:23', N'1', N'2022-09-21 22:43:23', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1832, 109, 1017, N'1', N'2022-09-21 22:43:23', N'1', N'2022-09-21 22:43:23', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1833, 109, 1018, N'1', N'2022-09-21 22:43:23', N'1', N'2022-09-21 22:43:23', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1834, 109, 1019, N'1', N'2022-09-21 22:43:23', N'1', N'2022-09-21 22:43:23', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1835, 109, 1020, N'1', N'2022-09-21 22:43:23', N'1', N'2022-09-21 22:43:23', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1836, 111, 103, N'1', N'2022-09-21 22:43:24', N'1', N'2022-09-21 22:43:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1837, 111, 1017, N'1', N'2022-09-21 22:43:24', N'1', N'2022-09-21 22:43:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1838, 111, 1018, N'1', N'2022-09-21 22:43:24', N'1', N'2022-09-21 22:43:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1839, 111, 1019, N'1', N'2022-09-21 22:43:24', N'1', N'2022-09-21 22:43:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1840, 111, 1020, N'1', N'2022-09-21 22:43:24', N'1', N'2022-09-21 22:43:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1841, 109, 1036, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1842, 109, 1037, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1843, 109, 1038, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1844, 109, 1039, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1845, 109, 107, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1846, 111, 1036, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1847, 111, 1037, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1848, 111, 1038, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1849, 111, 1039, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1850, 111, 107, N'1', N'2022-09-21 22:48:13', N'1', N'2022-09-21 22:48:13', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1991, 2, 1024, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1992, 2, 1025, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1993, 2, 1026, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1994, 2, 1027, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1995, 2, 1028, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1996, 2, 1029, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1997, 2, 1030, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1998, 2, 1031, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1999, 2, 1032, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2000, 2, 1033, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2001, 2, 1034, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2002, 2, 1035, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2003, 2, 1036, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2004, 2, 1037, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2005, 2, 1038, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2006, 2, 1039, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2007, 2, 1040, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2008, 2, 1042, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2009, 2, 1043, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2010, 2, 1045, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2011, 2, 1046, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2012, 2, 1048, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2013, 2, 1050, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2014, 2, 1051, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2015, 2, 1052, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2016, 2, 1053, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2017, 2, 1054, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2018, 2, 1056, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2019, 2, 1057, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2020, 2, 1058, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2021, 2, 2083, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2022, 2, 1059, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2023, 2, 1060, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2024, 2, 1063, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2025, 2, 1064, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2026, 2, 1065, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2027, 2, 1066, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2028, 2, 1067, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2029, 2, 1070, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2034, 2, 1075, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2036, 2, 1082, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2037, 2, 1085, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2038, 2, 1086, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2039, 2, 1087, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2040, 2, 1088, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2041, 2, 1089, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2042, 2, 1091, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2043, 2, 1092, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2044, 2, 1095, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2045, 2, 1096, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2046, 2, 1097, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2047, 2, 1098, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2048, 2, 1101, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2049, 2, 1102, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2050, 2, 1103, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2051, 2, 1104, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2052, 2, 1105, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2053, 2, 1106, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2054, 2, 1108, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2055, 2, 1109, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2072, 2, 114, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2073, 2, 1139, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2074, 2, 115, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2075, 2, 1140, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2076, 2, 116, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2077, 2, 1141, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2078, 2, 1142, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2079, 2, 1143, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2099, 2, 1226, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2100, 2, 1227, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2101, 2, 1228, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2102, 2, 1229, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2103, 2, 1237, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2104, 2, 1238, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2105, 2, 1239, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2106, 2, 1240, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2107, 2, 1241, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2108, 2, 1242, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2109, 2, 1243, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2117, 2, 1255, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2118, 2, 1256, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2119, 2, 1257, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2120, 2, 1258, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2121, 2, 1259, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2122, 2, 1260, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2123, 2, 1261, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2124, 2, 1263, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2125, 2, 1264, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2126, 2, 1265, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2127, 2, 1266, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2128, 2, 1267, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2129, 2, 1001, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2130, 2, 1002, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2131, 2, 1003, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2132, 2, 1004, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2133, 2, 1005, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2134, 2, 1006, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2135, 2, 1007, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2136, 2, 1008, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2137, 2, 1009, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2138, 2, 1010, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2139, 2, 1011, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2140, 2, 1012, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2141, 2, 1013, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2143, 2, 1015, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2145, 2, 1017, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2146, 2, 1018, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2147, 2, 1019, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2148, 2, 1020, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2149, 2, 1021, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2150, 2, 1022, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2151, 2, 1023, N'1', N'2023-01-25 08:42:52', N'1', N'2023-01-25 08:42:52', N'0', 1)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2929, 109, 1224, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2930, 109, 1225, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2931, 109, 1226, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2932, 109, 1227, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2933, 109, 1228, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2934, 109, 1229, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2935, 109, 1138, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2936, 109, 1139, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2937, 109, 1140, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2938, 109, 1141, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2939, 109, 1142, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2940, 109, 1143, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2941, 111, 1224, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2942, 111, 1225, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2943, 111, 1226, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2944, 111, 1227, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2945, 111, 1228, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2946, 111, 1229, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2947, 111, 1138, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2948, 111, 1139, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2949, 111, 1140, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2950, 111, 1141, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2951, 111, 1142, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2952, 111, 1143, N'1', N'2023-12-02 23:19:40', N'1', N'2023-12-02 23:19:40', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2993, 109, 2, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2994, 109, 1031, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2995, 109, 1032, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2996, 109, 1033, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2997, 109, 1034, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2998, 109, 1035, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2999, 109, 1050, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3000, 109, 1051, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3001, 109, 1052, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3002, 109, 1053, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3003, 109, 1054, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3004, 109, 1056, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3005, 109, 1057, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3006, 109, 1058, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3007, 109, 1059, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3008, 109, 1060, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3009, 109, 1066, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3010, 109, 1067, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3011, 109, 1070, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3012, 109, 1075, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3014, 109, 1077, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3015, 109, 1078, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3016, 109, 1082, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3017, 109, 1083, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3018, 109, 1084, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3019, 109, 1085, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3020, 109, 1086, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3021, 109, 1087, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3022, 109, 1088, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3023, 109, 1089, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3024, 109, 1090, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3025, 109, 1091, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3026, 109, 1092, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3027, 109, 106, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3028, 109, 110, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3029, 109, 111, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3030, 109, 112, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3031, 109, 113, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3032, 109, 114, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3033, 109, 115, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3034, 109, 116, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3035, 109, 2472, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3036, 109, 2478, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3037, 109, 2479, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3038, 109, 2480, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3039, 109, 2481, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3040, 109, 2482, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3041, 109, 2483, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3042, 109, 2484, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3043, 109, 2485, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3044, 109, 2486, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3045, 109, 2487, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3046, 109, 2488, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3047, 109, 2489, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3048, 109, 2490, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3049, 109, 2491, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3050, 109, 2492, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3051, 109, 2493, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3052, 109, 2494, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3053, 109, 2495, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3054, 109, 2497, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3055, 109, 1237, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3056, 109, 1238, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3057, 109, 1239, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3058, 109, 1240, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3059, 109, 1241, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3060, 109, 1242, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3061, 109, 1243, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3062, 109, 2525, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3063, 109, 1255, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3064, 109, 1256, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3065, 109, 1257, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3066, 109, 1258, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3067, 109, 1259, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3068, 109, 1260, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3069, 111, 2, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3070, 111, 1031, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3071, 111, 1032, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3072, 111, 1033, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3073, 111, 1034, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3074, 111, 1035, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3075, 111, 1050, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3076, 111, 1051, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3077, 111, 1052, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3078, 111, 1053, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3079, 111, 1054, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3080, 111, 1056, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3081, 111, 1057, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3082, 111, 1058, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3083, 111, 1059, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3084, 111, 1060, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3085, 111, 1066, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3086, 111, 1067, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3087, 111, 1070, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3088, 111, 1075, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3090, 111, 1077, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3091, 111, 1078, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3092, 111, 1082, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3093, 111, 1083, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3094, 111, 1084, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3095, 111, 1085, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3096, 111, 1086, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3097, 111, 1087, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3098, 111, 1088, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3099, 111, 1089, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3100, 111, 1090, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3101, 111, 1091, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3102, 111, 1092, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3103, 111, 106, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3104, 111, 110, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3105, 111, 111, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3106, 111, 112, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3107, 111, 113, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3108, 111, 114, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3109, 111, 115, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3110, 111, 116, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3111, 111, 2472, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3112, 111, 2478, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3113, 111, 2479, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3114, 111, 2480, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3115, 111, 2481, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3116, 111, 2482, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3117, 111, 2483, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3118, 111, 2484, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3119, 111, 2485, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3120, 111, 2486, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3121, 111, 2487, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3122, 111, 2488, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3123, 111, 2489, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3124, 111, 2490, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3125, 111, 2491, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3126, 111, 2492, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3127, 111, 2493, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3128, 111, 2494, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3129, 111, 2495, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3130, 111, 2497, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3131, 111, 1237, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3132, 111, 1238, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3133, 111, 1239, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3134, 111, 1240, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3135, 111, 1241, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3136, 111, 1242, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3137, 111, 1243, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3138, 111, 2525, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3139, 111, 1255, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3140, 111, 1256, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3141, 111, 1257, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3142, 111, 1258, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3143, 111, 1259, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3144, 111, 1260, N'1', N'2023-12-02 23:41:02', N'1', N'2023-12-02 23:41:02', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3221, 109, 102, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3222, 109, 1013, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3223, 109, 1014, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3224, 109, 1015, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3225, 109, 1016, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3226, 111, 102, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3227, 111, 1013, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3228, 111, 1014, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3229, 111, 1015, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3230, 111, 1016, N'1', N'2023-12-30 11:42:36', N'1', N'2023-12-30 11:42:36', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4163, 109, 5, N'1', N'2024-03-30 17:53:17', N'1', N'2024-03-30 17:53:17', N'0', 121)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4222, 111, 5, N'1', N'2024-03-30 17:53:18', N'1', N'2024-03-30 17:53:18', N'0', 122)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5779, 2, 2739, N'1', N'2024-07-07 20:39:38', N'1', N'2024-07-07 20:39:38', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5780, 2, 2740, N'1', N'2024-07-07 20:39:38', N'1', N'2024-07-07 20:39:38', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5781, 2, 2758, N'1', N'2024-07-07 20:39:38', N'1', N'2024-07-07 20:39:38', N'0', 1)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5782, 2, 2759, N'1', N'2024-07-07 20:39:38', N'1', N'2024-07-07 20:39:38', N'0', 1)
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5789, 109, 2739, N'1', N'2024-07-13 22:37:24', N'1', N'2024-07-13 22:37:24', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5790, 109, 2740, N'1', N'2024-07-13 22:37:24', N'1', N'2024-07-13 22:37:24', N'0', 121)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5791, 111, 2739, N'1', N'2024-07-13 22:37:24', N'1', N'2024-07-13 22:37:24', N'0', 122)
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5792, 111, 2740, N'1', N'2024-07-13 22:37:24', N'1', N'2024-07-13 22:37:24', N'0', 122)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
INSERT INTO system_role_menu (id, role_id, menu_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6293, 2, 5, N'1', N'2026-01-04 18:09:41', N'1', N'2026-01-04 18:09:41', N'0', 1)
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
GO
SET IDENTITY_INSERT system_role_menu OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_sms_channel
-- ----------------------------
DROP TABLE IF EXISTS system_sms_channel
GO
CREATE TABLE system_sms_channel (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    signature nvarchar(12)  NOT NULL,
    code nvarchar(63)  NOT NULL,
    status tinyint  NOT NULL,
    remark nvarchar(255) DEFAULT NULL NULL,
    api_key nvarchar(128)  NOT NULL,
    api_secret nvarchar(128) DEFAULT NULL NULL,
    callback_url nvarchar(255) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婄粵鎯ф倳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'signature'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濞撶娀浜剧紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵偓閸氼垳濮搁幀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閻ㄥ嫯澶勯崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'api_key'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閻ㄥ嫮顫濋柦?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'api_secret'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婇崣鎴︹偓浣告礀鐠?URL',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'callback_url'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂〒鐘讳壕',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_channel'
GO

-- ----------------------------
-- Records of system_sms_channel
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_sms_channel ON
GO
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (2, N'Ballcat', N'ALIYUN', 0, N'娴ｇ姾顩﹂弨鐟版憹閿涘苯褰ч張澶嬪灉閸欘垯浜掗悽顭掔磼閿涗緤绱掗敍?, N'demo-aliyun-sms-api-key', N'demo-aliyun-sms-api-secret', NULL, N'', N'2021-03-31 11:53:10', N'1', N'2024-08-04 08:53:26', N'0')
GO
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (4, N'濞村鐦〒鐘讳壕', N'DEBUG_DING_TALK', 0, N'123', N'696b5d8ead48071237e4aa5861ff08dbadb2b4ded1c688a7b7c9afc615579859', N'SEC5c4e5ff888bc8a9923ae47f59e7ccd30af1f14d93c55b4e2c9cb094e35aeed67', NULL, N'1', N'2021-04-13 00:23:14', N'1', N'2022-03-27 20:29:49', N'0')
GO
INSERT INTO system_sms_channel (id, signature, code, status, remark, api_key, api_secret, callback_url, creator, create_time, updater, update_time, deleted) VALUES (7, N'mock閼垫崘顔嗘禍?, N'TENCENT', 0, N'123', N'1 2', N'2 3', N'', N'1', N'2024-09-30 08:53:45', N'1', N'2025-12-20 11:30:18', N'0')
GO
SET IDENTITY_INSERT system_sms_channel OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_sms_code
-- ----------------------------
DROP TABLE IF EXISTS system_sms_code
GO
CREATE TABLE system_sms_code (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    mobile nvarchar(11)  NOT NULL,
    code nvarchar(6)  NOT NULL,
    create_ip nvarchar(15)  NOT NULL,
    scene tinyint  NOT NULL,
    today_index tinyint  NOT NULL,
    used tinyint  NOT NULL,
    used_time datetime2 DEFAULT NULL NULL,
    used_ip nvarchar(255) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_sms_code_01 ON system_sms_code (mobile)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹靛婧€閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'mobile'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'妤犲矁鐦夐惍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'create_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧礁婧€閺?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'scene'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴犲﹥妫╅崣鎴︹偓浣烘畱缁楊剙鍤戦弶?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'today_index'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯佹担璺ㄦ暏',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'used'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴ｈ法鏁ら弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'used_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴ｈ法鏁?IP',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'used_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹靛婧€妤犲矁鐦夐惍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_code'
GO

-- ----------------------------
-- Table structure for system_sms_log
-- ----------------------------
DROP TABLE IF EXISTS system_sms_log
GO
CREATE TABLE system_sms_log (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    channel_id bigint  NOT NULL,
    channel_code nvarchar(63)  NOT NULL,
    template_id bigint  NOT NULL,
    template_code nvarchar(63)  NOT NULL,
    template_type tinyint  NOT NULL,
    template_content nvarchar(255)  NOT NULL,
    template_params nvarchar(255)  NOT NULL,
    api_template_id nvarchar(63)  NOT NULL,
    mobile nvarchar(11)  NOT NULL,
    user_id bigint DEFAULT NULL NULL,
    user_type tinyint DEFAULT NULL NULL,
    send_status tinyint DEFAULT 0 NOT NULL,
    send_time datetime2 DEFAULT NULL NULL,
    api_send_code nvarchar(63) DEFAULT NULL NULL,
    api_send_msg nvarchar(255) DEFAULT NULL NULL,
    api_request_id nvarchar(255) DEFAULT NULL NULL,
    api_serial_no nvarchar(255) DEFAULT NULL NULL,
    receive_status tinyint DEFAULT 0 NOT NULL,
    receive_time datetime2 DEFAULT NULL NULL,
    api_receive_code nvarchar(63) DEFAULT NULL NULL,
    api_receive_msg nvarchar(255) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂〒鐘讳壕缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'channel_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂〒鐘讳壕缂傛牜鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'channel_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'template_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'template_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婄猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'template_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婇崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'template_content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婇崣鍌涙殶',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'template_params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_template_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹靛婧€閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'mobile'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧胶濮搁幀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'send_status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欐垿鈧焦妞傞梻?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'send_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閸欐垿鈧胶绮ㄩ弸婊呮畱缂傛牜鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_send_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閸欐垿鈧礁銇戠拹銉ф畱閹绘劗銇?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_send_msg'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱閸烆垯绔寸拠閿嬬湴 ID',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_request_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閸欐垿鈧浇绻戦崶鐐垫畱鎼村繐褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_serial_no'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹恒儲鏁归悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'receive_status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹恒儲鏁归弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'receive_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫮绱惍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_receive_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'API 閹恒儲鏁圭紒鎾寸亯閻ㄥ嫯顕╅弰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'api_receive_msg'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婇弮銉ョ箶',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_log'
GO

-- ----------------------------
-- Table structure for system_sms_template
-- ----------------------------
DROP TABLE IF EXISTS system_sms_template
GO
CREATE TABLE system_sms_template (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    type tinyint  NOT NULL,
    status tinyint  NOT NULL,
    code nvarchar(63)  NOT NULL,
    name nvarchar(63)  NOT NULL,
    content nvarchar(255)  NOT NULL,
    params nvarchar(255)  NOT NULL,
    remark nvarchar(255) DEFAULT NULL NULL,
    api_template_id nvarchar(63)  NOT NULL,
    channel_id bigint  NOT NULL,
    channel_code nvarchar(63)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀵偓閸氼垳濮搁幀?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢樼紓鏍垳',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀崥宥囆?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'濡剝婢橀崘鍛啇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'content'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸欏倹鏆熼弫鎵矋',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'params'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇?API 閻ㄥ嫭膩閺夎法绱崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'api_template_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂〒鐘讳壕缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'channel_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂〒鐘讳壕缂傛牜鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'channel_code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻厺淇婂Ο鈩冩緲',
    'SCHEMA', N'dbo',
    'TABLE', N'system_sms_template'
GO

-- ----------------------------
-- Records of system_sms_template
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_sms_template ON
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (2, 1, 0, N'test_01', N'濞村鐦宀冪槈閻胶鐓穱?, N'濮濓絽婀潻娑滎攽閻ц缍嶉幙宥勭稊{operation}閿涘本鍋嶉惃鍕崣鐠囦胶鐖滈弰鐦俢ode}', N'["operation","code"]', N'濞村鐦径鍥ㄦ暈', N'4383920', 4, N'DEBUG_DING_TALK', N'', N'2021-03-31 10:49:38', N'1', N'2024-08-18 11:57:18', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (3, 1, 0, N'test_02', N'閸忣剙鎲￠柅姘辩叀', N'閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, N'["code"]', NULL, N'SMS_207945135', 2, N'ALIYUN', N'', N'2021-03-31 11:56:30', N'1', N'2021-04-10 01:22:02', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (6, 3, 0, N'test-01', N'濞村鐦Ο鈩冩緲', N'閸濆牆鎼遍崫?{name}', N'["name"]', N'f閸濆牆鎼遍崫?, N'4383920', 4, N'DEBUG_DING_TALK', N'1', N'2021-04-10 01:07:21', N'1', N'2024-08-18 11:57:07', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (7, 3, 0, N'test-04', N'濞村鐦稉?, N'閼颁線娴畕name}閿涘瞼澧伴柅绱峜ode}', N'["name","code"]', N'閸濆牆鎼遍崫鍫濇惐', N'suibian', 7, N'DEBUG_DING_TALK', N'1', N'2021-04-13 00:29:53', N'1', N'2024-09-30 00:56:24', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (8, 1, 0, N'user-sms-login', N'閸撳秴褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', N'閹劎娈戞宀冪槈閻焦妲竰code}', N'["code"]', NULL, N'4372216', 4, N'DEBUG_DING_TALK', N'1', N'2021-10-11 08:10:00', N'1', N'2024-08-18 11:57:06', N'0')
GO
GO
GO
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (12, 2, 0, N'demo', N'濠曟梻銇氬Ο鈩冩緲', N'閹存垵姘ㄩ弰顖涚ゴ鐠囨洑绔存稉瀣╃瑓', N'[]', NULL, N'biubiubiu', 4, N'DEBUG_DING_TALK', N'1', N'2022-04-10 23:22:49', N'1', N'2024-08-18 11:57:04', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (14, 1, 0, N'user-update-mobile', N'娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁奸幍瀣簚', N'閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, N'["code"]', N'', N'null', 4, N'DEBUG_DING_TALK', N'1', N'2023-08-19 18:58:01', N'1', N'2023-08-19 11:34:04', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (15, 1, 0, N'user-update-password', N'娴兼艾鎲抽悽銊﹀煕 - 娣囶喗鏁肩€靛棛鐖?, N'閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, N'["code"]', N'', N'null', 4, N'DEBUG_DING_TALK', N'1', N'2023-08-19 18:58:01', N'1', N'2023-08-19 11:34:18', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (16, 1, 0, N'user-reset-password', N'娴兼艾鎲抽悽銊﹀煕 - 闁插秶鐤嗙€靛棛鐖?, N'閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, N'["code"]', N'', N'null', 4, N'DEBUG_DING_TALK', N'1', N'2023-08-19 18:58:01', N'1', N'2023-12-02 22:35:27', N'0')
GO
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (18, 1, 0, N'admin-reset-password', N'閸氬骸褰撮悽銊﹀煕 - 韫囨顔囩€靛棛鐖?, N'閹劎娈戞宀冪槈閻簞code}閿涘矁顕氭宀冪槈閻?5 閸掑棝鎸撻崘鍛箒閺佸牞绱濈拠宄板瑏濞夊嫭绱℃禍搴濈铂娴滅尨绱?, N'["code"]', N'', N'null', 4, N'DEBUG_DING_TALK', N'1', N'2025-03-16 14:19:34', N'1', N'2025-03-16 14:19:45', N'0')
GO
INSERT INTO system_sms_template (id, type, status, code, name, content, params, remark, api_template_id, channel_id, channel_code, creator, create_time, updater, update_time, deleted) VALUES (19, 1, 0, N'admin-sms-login', N'閸氬骸褰撮悽銊﹀煕閻厺淇婇惂璇茬秿', N'閹劎娈戞宀冪槈閻焦妲竰code}', N'["code"]', N'', N'4372216', 4, N'DEBUG_DING_TALK', N'1', N'2025-04-08 09:36:03', N'1', N'2025-04-08 09:36:17', N'0')
GO
SET IDENTITY_INSERT system_sms_template OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_social_client
-- ----------------------------
DROP TABLE IF EXISTS system_social_client
GO
CREATE TABLE system_social_client (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(255)  NOT NULL,
    social_type tinyint  NOT NULL,
    user_type tinyint  NOT NULL,
    client_id nvarchar(255)  NOT NULL,
    client_secret nvarchar(255)  NOT NULL,
    agent_id nvarchar(255) DEFAULT NULL NULL,
    public_key nvarchar(2048) DEFAULT NULL NULL,
    status tinyint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鎼存梻鏁ら崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'social_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖滅椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'client_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎广垺鍩涚粩顖氱槕闁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'client_secret'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娴狅絿鎮婄紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'agent_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'publicKey 閸忣剟鎸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'public_key'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻樿埖鈧?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉鐎广垺鍩涚粩顖濄€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_client'
GO

-- ----------------------------
-- Records of system_social_client
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_social_client ON
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'闁藉鎷?, 20, 2, N'dingvrnreaje3yqvzhxg', N'i8E6iZyDvZj51JIb0tYsYfVQYOks9Cq1lgryEjFRqC79P3iJcrxEwT6Qk2QvLrLI', NULL, NULL, 0, N'', N'2023-10-18 11:21:18', N'1', N'2023-12-20 21:28:26', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'闁藉鎷ら敍鍫㈠竾閸︾喕鐪撮敍?, 20, 2, N'dingtsu9hpepjkbmthhw', N'FP_bnSq_HAHKCSncmJjw5hxhnzs6vaVDSZZn3egj6rdqTQ_hu5tQVJyLMpgCakdP', NULL, NULL, 0, N'', N'2023-10-18 11:21:18', N'', N'2023-12-20 21:28:26', N'1', 121)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, N'瀵邦喕淇婇崗顑跨船閸?, 31, 1, N'wx5b23ba7a5589ecbb', N'2a7b3b20c537e52e74afd395eb85f61f', NULL, NULL, 0, N'', N'2023-10-18 16:07:46', N'1', N'2023-12-20 21:28:23', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (43, N'瀵邦喕淇婄亸蹇曗柤鎼?, 34, 1, N'wx63c280fe3248a3e7', N'6f270509224a7ae1296bbf1c8cb97aed', NULL, NULL, 0, N'', N'2023-10-19 13:37:41', N'1', N'2023-12-20 21:28:25', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (44, N'1', 10, 1, N'2', N'3', NULL, NULL, 0, N'1', N'2025-04-06 20:36:28', N'1', N'2025-04-06 20:43:12', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (45, N'1', 10, 1, N'2', N'3', NULL, NULL, 1, N'1', N'2025-09-06 20:26:15', N'1', N'2025-09-06 20:27:55', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (46, N'1', 10, 1, N'2', N'3', NULL, NULL, 0, N'1', N'2025-11-29 16:04:23', N'1', N'2025-11-29 16:04:26', N'1', 1)
GO
INSERT INTO system_social_client (id, name, social_type, user_type, client_id, client_secret, agent_id, public_key, status, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (47, N'123', 10, 1, N'1', N'2', N'3', NULL, 0, N'1', N'2025-12-21 10:27:02', N'1', N'2025-12-21 10:27:20', N'1', 1)
GO
SET IDENTITY_INSERT system_social_client OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_social_user
-- ----------------------------
DROP TABLE IF EXISTS system_social_user
GO
CREATE TABLE system_social_user (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    type tinyint  NOT NULL,
    openid nvarchar(32)  NOT NULL,
    token nvarchar(256) DEFAULT NULL NULL,
    raw_token_info nvarchar(1024)  NOT NULL,
    nickname nvarchar(32)  NOT NULL,
    avatar nvarchar(255) DEFAULT NULL NULL,
    raw_user_info nvarchar(1024)  NOT NULL,
    code nvarchar(256)  NOT NULL,
    state nvarchar(256) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_social_user_01 ON system_social_user (type, openid)
GO
CREATE INDEX idx_system_social_user_02 ON system_social_user (type, code, state)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撳鏁?閼奉亜顤冪粵鏍殣)',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉 openid',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'openid'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉 token',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'token'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸樼喎顫?Token 閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'raw_token_info'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢弰鐢敌?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涙径鏉戝剼',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'avatar'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸樼喎顫愰悽銊﹀煕閺佺増宓侀敍灞肩閼割剚妲?JSON 閺嶇厧绱?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'raw_user_info'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?code',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'code'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺堚偓閸氬簼绔村▎锛勬畱鐠併倛鐦?state',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'state'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉閻劍鍩涚悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user'
GO

-- ----------------------------
-- Table structure for system_social_user_bind
-- ----------------------------
DROP TABLE IF EXISTS system_social_user_bind
GO
CREATE TABLE system_social_user_bind (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    user_type tinyint  NOT NULL,
    social_type tinyint  NOT NULL,
    social_user_id bigint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_social_user_bind_01 ON system_social_user_bind (user_type, social_user_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'娑撳鏁?閼奉亜顤冪粵鏍殣)',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚猾璇茬€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'user_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉楠炲啿褰撮惃鍕閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'social_type'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉閻劍鍩涢惃鍕椽閸?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'social_user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€鍙ユ唉缂佹垵鐣剧悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_social_user_bind'
GO

-- ----------------------------
-- Table structure for system_tenant
-- ----------------------------
DROP TABLE IF EXISTS system_tenant
GO
CREATE TABLE system_tenant (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(30)  NOT NULL,
    contact_user_id bigint DEFAULT NULL NULL,
    contact_name nvarchar(30)  NOT NULL,
    contact_mobile nvarchar(500) DEFAULT NULL NULL,
    status tinyint DEFAULT 0 NOT NULL,
    websites nvarchar(1024) DEFAULT '' NULL,
    package_id bigint  NOT NULL,
    expire_time datetime2  NOT NULL,
    account_count int  NOT NULL,
    creator nvarchar(64) DEFAULT '' NOT NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涢崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼辨梻閮存禍铏规畱閻劍鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'contact_user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼辨梻閮存禍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'contact_name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼辨梻閮撮幍瀣簚',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'contact_mobile'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涢悩鑸碘偓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂佹垵鐣鹃崺鐔锋倳閺佹壆绮?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'websites'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涙總妤咁樀缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'package_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鏉╁洦婀￠弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'expire_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐠愶箑褰块弫浼村櫤',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'account_count'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant'
GO

-- ----------------------------
-- Records of system_tenant
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_tenant ON
GO
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (1, N'閼哄浜惧┃鎰垳', NULL, N'閼哄澹?, N'17321315478', 0, N'127.0.0.1:3000,wxc4598c446f8a9cb3', 0, N'2099-02-19 17:14:16', 9999, N'1', N'2021-01-05 17:03:47', N'1', N'2025-08-19 05:18:41', N'0')
GO
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (121, N'鐏忓繒顫ら幋?, 110, N'鐏忓繒甯?', N'15601691300', 0, N'123321', 111, N'2026-07-10 00:00:00', 30, N'1', N'2022-02-22 00:56:14', N'1', N'2025-08-19 21:19:29', N'0')
GO
INSERT INTO system_tenant (id, name, contact_user_id, contact_name, contact_mobile, status, websites, package_id, expire_time, account_count, creator, create_time, updater, update_time, deleted) VALUES (122, N'濞村鐦粔鐔稿煕', 113, N'閼哄浜?, N'15601691300', 0, N'222,333', 111, N'2023-04-29 00:00:00', 50, N'1', N'2022-03-07 21:37:58', N'1', N'2025-12-21 09:50:00', N'0')
GO
SET IDENTITY_INSERT system_tenant OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_tenant_package
-- ----------------------------
DROP TABLE IF EXISTS system_tenant_package
GO
CREATE TABLE system_tenant_package (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(30)  NOT NULL,
    status tinyint DEFAULT 0 NOT NULL,
    remark nvarchar(256) DEFAULT '' NULL,
    menu_ids nvarchar(4000)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NOT NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婵傛顦电紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婵傛顦甸崥?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涢悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸忓疇浠堥惃鍕綅閸楁洜绱崣?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'menu_ids'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涙總妤咁樀鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_tenant_package'
GO

-- ----------------------------
-- Records of system_tenant_package
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_tenant_package ON
GO
INSERT INTO system_tenant_package (id, name, status, remark, menu_ids, creator, create_time, updater, update_time, deleted) VALUES (111, N'閺咁噣鈧艾顨滄?, 0, N'鐏忓繐濮涢懗?, N'[1,2,5,1031,1032,1033,1034,1035,1036,1037,1038,1039,1050,1051,1052,1053,1054,1056,1057,1058,1059,1060,1063,1064,1065,1066,1067,1070,1075,1077,1078,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,100,101,102,103,106,107,110,111,112,113,114,1138,1139,115,1140,116,1141,1142,1143,2739,2740,1224,1225,1226,1227,1228,1229,1237,1238,1239,1240,1241,1242,1243,1255,1256,1257,1258,1259,1260,2472,2478,2479,2480,2481,2482,2483,2484,2485,2486,2487,2488,2489,2490,2491,2492,2493,2494,2495,2497,2525,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020]', N'1', N'2022-02-22 00:54:00', N'1', N'2025-09-06 20:52:25', N'0')
GO
SET IDENTITY_INSERT system_tenant_package OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_user_post
-- ----------------------------
DROP TABLE IF EXISTS system_user_post
GO
CREATE TABLE system_user_post (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint DEFAULT 0 NOT NULL,
    post_id bigint DEFAULT 0 NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'id',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩汭D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴ID',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'post_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涘畝妞剧秴鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_post'
GO

-- ----------------------------
-- Records of system_user_post
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_user_post ON
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, 1, 1, N'admin', N'2022-05-02 07:25:24', N'admin', N'2022-05-02 07:25:24', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, 100, 1, N'admin', N'2022-05-02 07:25:24', N'admin', N'2022-05-02 07:25:24', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, 104, 1, N'1', N'2022-05-16 19:36:28', N'1', N'2022-05-16 19:36:28', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (116, 117, 2, N'1', N'2022-07-09 17:40:26', N'1', N'2022-07-09 17:40:26', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, 118, 1, N'1', N'2022-07-09 17:44:44', N'1', N'2022-07-09 17:44:44', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (119, 114, 5, N'1', N'2024-03-24 20:45:51', N'1', N'2024-03-24 20:45:51', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (123, 115, 1, N'1', N'2024-04-04 09:37:14', N'1', N'2024-04-04 09:37:14', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (124, 115, 2, N'1', N'2024-04-04 09:37:14', N'1', N'2024-04-04 09:37:14', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (125, 1, 2, N'1', N'2024-07-13 22:31:39', N'1', N'2024-07-13 22:31:39', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (128, 139, 2, N'1', N'2025-12-05 21:43:27', N'1', N'2025-12-05 21:43:27', N'0', 1)
GO
INSERT INTO system_user_post (id, user_id, post_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (129, 139, 4, N'1', N'2025-12-05 21:43:27', N'1', N'2025-12-05 21:43:27', N'0', 1)
GO
SET IDENTITY_INSERT system_user_post OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS system_user_role
GO
CREATE TABLE system_user_role (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    user_id bigint  NOT NULL,
    role_id bigint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_user_role_01 ON system_user_role (user_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閼奉亜顤冪紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩汭D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'user_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐟欐帟澹奍D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'role_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢崪宀冾潡閼规彃鍙ч懕鏃囥€?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_user_role'
GO

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_user_role ON
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, 1, 1, N'', N'2022-01-11 13:19:45', N'', N'2022-05-12 12:35:17', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, 2, N'', N'2022-01-11 13:19:45', N'', N'2022-05-12 12:35:13', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, 100, 1, N'', N'2022-01-11 13:19:45', N'', N'2022-05-12 12:35:12', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 100, 2, N'', N'2022-01-11 13:19:45', N'', N'2022-05-12 12:35:11', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 103, 1, N'1', N'2022-01-11 13:19:45', N'1', N'2022-01-11 13:19:45', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 110, 109, N'1', N'2022-02-22 00:56:14', N'1', N'2022-02-22 00:56:14', N'0', 121)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 111, 110, N'110', N'2022-02-23 13:14:38', N'110', N'2022-02-23 13:14:38', N'0', 121)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 113, 111, N'1', N'2022-03-07 21:37:58', N'1', N'2022-03-07 21:37:58', N'0', 122)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 1, 2, N'1', N'2022-05-12 20:39:29', N'1', N'2022-05-12 20:39:29', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (22, 115, 2, N'1', N'2022-07-21 22:08:30', N'1', N'2022-07-21 22:08:30', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (35, 112, 1, N'1', N'2024-03-15 20:00:24', N'1', N'2024-03-15 20:00:24', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (36, 118, 1, N'1', N'2024-03-17 09:12:08', N'1', N'2024-03-17 09:12:08', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (46, 117, 1, N'1', N'2024-10-02 10:16:11', N'1', N'2024-10-02 10:16:11', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (47, 104, 2, N'1', N'2025-01-04 10:40:33', N'1', N'2025-01-04 10:40:33', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (48, 100, 155, N'1', N'2025-04-04 10:41:14', N'1', N'2025-04-04 10:41:14', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (49, 142, 1, N'1', N'2025-07-23 09:11:42', N'1', N'2025-07-23 09:11:42', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (50, 142, 2, N'1', N'2025-10-07 20:50:37', N'1', N'2025-10-07 20:50:37', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (51, 139, 1, N'1', N'2025-12-05 22:36:57', N'1', N'2025-12-05 22:36:57', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (52, 139, 2, N'1', N'2025-12-05 22:37:00', N'1', N'2025-12-05 22:37:00', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (53, 114, 2, N'1', N'2026-01-04 18:15:40', N'1', N'2026-01-04 18:15:40', N'0', 1)
GO
INSERT INTO system_user_role (id, user_id, role_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (54, 114, 3, N'1', N'2026-01-04 18:16:19', N'1', N'2026-01-04 18:16:19', N'0', 1)
GO
SET IDENTITY_INSERT system_user_role OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS system_users
GO
CREATE TABLE system_users (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    username nvarchar(30)  NOT NULL,
    password nvarchar(100) DEFAULT '' NOT NULL,
    nickname nvarchar(30)  NOT NULL,
    remark nvarchar(500) DEFAULT NULL NULL,
    dept_id bigint DEFAULT NULL NULL,
    post_ids nvarchar(255) DEFAULT NULL NULL,
    email nvarchar(50) DEFAULT '' NULL,
    mobile nvarchar(11) DEFAULT '' NULL,
    sex tinyint DEFAULT 0 NULL,
    avatar nvarchar(512) DEFAULT '' NULL,
    status tinyint DEFAULT 0 NOT NULL,
    login_ip nvarchar(50) DEFAULT '' NULL,
    login_date datetime2 DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

CREATE INDEX idx_system_users_01 ON system_users (username)
GO
CREATE INDEX idx_system_users_02 ON system_users (mobile)
GO
CREATE INDEX idx_system_users_03 ON system_users (email)
GO
CREATE INDEX idx_system_users_04 ON system_users (dept_id)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩汭D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涚拹锕€褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'username'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎靛棛鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'password'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢弰鐢敌?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'nickname'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢跺洦鏁?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'remark'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'闁劑妫琁D',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'dept_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'瀹€妞剧秴缂傛牕褰块弫鎵矋',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'post_ids'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢柇顔绢唸',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'email'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹靛婧€閸欓鐖?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'mobile'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涢幀褍鍩?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'sex'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢舵潙鍎氶崷鏉挎絻',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'avatar'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐢劕褰块悩鑸碘偓渚婄礄0濮濓絽鐖?1閸嬫粎鏁ら敍?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'status'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺堚偓閸氬海娅ヨぐ鏃綪',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'login_ip'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺堚偓閸氬海娅ヨぐ鏇熸闂?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'login_date'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'system_users',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻劍鍩涙穱鈩冧紖鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'system_users'
GO

-- ----------------------------
-- Records of system_users
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT system_users ON
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'admin', N'$2a$04$.vd8nPeLwxt6hnSzmAoAyul8BOLX7Cib6QhcxRe30rfvrIPQHH1OG', N'閼哄浜惧┃鎰垳', N'缁狅紕鎮婇崨?, 103, N'[1,2]', N'13aoteman@126.com', N'18818260272', 1, N'http://test.yudao.iocoder.cn/user/avatar/20251220/blob_1766215463801.jpg', 0, N'0:0:0:0:0:0:0:1', N'2026-04-17 08:47:40', N'admin', N'2021-01-05 17:03:47', NULL, N'2026-04-17 08:47:40', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (100, N'yudao', N'$2a$04$h.aaPKgO.odHepnk5PCsWeEwKdojFWdTItxGKfx1r0e1CSeBzsTJ6', N'閼哄浜?, N'娑撳秷顩﹂崥鎾村灉', 104, N'[1]', N'yudao@iocoder.cn', N'15601691300', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2025-12-15 21:47:26', N'', N'2021-01-07 09:07:17', NULL, N'2025-12-15 21:47:26', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (103, N'yuanma', N'$2a$04$fUBSmjKCPYAUmnMzOb6qE.eZCGPhHi1JmAKclODbfS/O7fHOl2bH6', N'濠ф劗鐖?, NULL, 106, NULL, N'yuanma@iocoder.cn', N'15601701300', 0, NULL, 0, N'0:0:0:0:0:0:0:1', N'2024-08-11 17:48:12', N'', N'2021-01-13 23:50:35', N'1', N'2025-07-09 23:41:58', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (104, N'test', N'$2a$04$BrwaYn303hjA/6TnXqdGoOLhyHOAA0bVrAFu6.1dJKycqKUnIoRz2', N'濞村鐦崣?, NULL, 107, N'[1,2]', N'111@qq.com', N'15601691200', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2026-01-04 18:09:54', N'', N'2021-01-21 02:13:53', NULL, N'2026-01-04 18:09:54', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (107, N'admin107', N'$2a$10$dYOOBKMO93v/.ReCqzyFg.o67Tqk.bbc2bhrpyBGkIw9aypCtr2pm', N'閼哄澹?, NULL, NULL, NULL, N'', N'15601691300', 0, NULL, 0, N'', NULL, N'1', N'2022-02-20 22:59:33', N'1', N'2025-04-21 14:23:08', N'0', 118)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (108, N'admin108', N'$2a$10$y6mfvKoNYL1GXWak8nYwVOH.kCWqjactkzdoIDgiKl93WN3Ejg.Lu', N'閼哄澹?, NULL, NULL, NULL, N'', N'15601691300', 0, NULL, 0, N'', NULL, N'1', N'2022-02-20 23:00:50', N'1', N'2025-04-21 14:23:08', N'0', 119)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (109, N'admin109', N'$2a$10$JAqvH0tEc0I7dfDVBI7zyuB4E3j.uH6daIjV53.vUS6PknFkDJkuK', N'閼哄澹?, NULL, NULL, NULL, N'', N'15601691300', 0, NULL, 0, N'', NULL, N'1', N'2022-02-20 23:11:50', N'1', N'2025-04-21 14:23:08', N'0', 120)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (110, N'admin110', N'$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', N'鐏忓繒甯?, NULL, NULL, NULL, N'', N'15601691300', 0, NULL, 0, N'0:0:0:0:0:0:0:1', N'2024-07-20 22:23:17', N'1', N'2022-02-22 00:56:14', NULL, N'2025-04-21 14:23:08', N'0', 121)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (111, N'test', N'$2a$10$mRMIYLDtRHlf6.9ipiqH1.Z.bh/R9dO9d5iHiGYPigi6r5KOoR2Wm', N'濞村鐦悽銊﹀煕', NULL, NULL, N'[]', N'', N'', 0, NULL, 0, N'0:0:0:0:0:0:0:1', N'2023-12-30 11:42:17', N'110', N'2022-02-23 13:14:33', NULL, N'2025-04-21 14:23:08', N'0', 121)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (112, N'newobject', N'$2a$04$dB0z8Q819fJWz0hbaLe6B.VfHCjYgWx6LFfET5lyz3JwcqlyCkQ4C', N'閺傛澘顕挒?, NULL, 100, N'[]', N'', N'15601691235', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2024-03-16 23:11:38', N'1', N'2022-02-23 19:08:03', NULL, N'2025-04-21 14:23:08', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (113, N'aoteman', N'$2a$10$0acJOIk2D25/oC87nyclE..0lzeu9DtQ/n3geP4fkun/zIVRhHJIO', N'閼哄浜?', NULL, NULL, NULL, N'', N'15601691300', 0, NULL, 0, N'127.0.0.1', N'2022-03-19 18:38:51', N'1', N'2022-03-07 21:37:58', N'1', N'2025-05-05 15:30:53', N'0', 122)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (114, N'hrmgr', N'$2a$10$TR4eybBioGRhBmDBWkqWLO6NIh3mzYa8KBKDDB5woiGYFVlRAi.fu', N'hr 鐏忓繐顫曟慨?, NULL, NULL, N'[5]', N'', N'15601691236', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2026-01-04 18:16:01', N'1', N'2022-03-19 21:50:58', NULL, N'2026-01-04 18:16:01', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (115, N'aotemane', N'$2a$04$GcyP0Vyzb2F2Yni5PuIK9ueGxM0tkZGMtDwVRwrNbtMvorzbpNsV2', N'闂冨灝鎲?, N'11222', 102, N'[1,2]', N'7648@qq.com', N'15601691229', 2, NULL, 0, N'', NULL, N'1', N'2022-04-30 02:55:43', N'1', N'2025-04-21 14:23:08', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (117, N'admin123', N'$2a$04$sEtimsHu9YCkYY4/oqElHem2Ijc9ld20eYO6lN.g/21NfLUTDLB9W', N'濞村鐦崣?2', N'1111', 100, N'[2]', N'', N'15601691234', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2024-10-02 10:16:20', N'1', N'2022-07-09 17:40:26', N'1', N'2025-05-14 09:56:04', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (118, N'goudan', N'$2a$04$3suGZjnA6rM5bErf38u1felbgqbsPHGdRG3l9NkxPCEt2ah9Y6aJi', N'閻欐娉?, NULL, 103, N'[1]', N'', N'15601691239', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2025-11-23 15:28:25', N'1', N'2022-07-09 17:44:43', NULL, N'2025-11-23 15:28:25', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (139, N'wwbwwb', N'$2a$04$FJLIyg8lbPytP29pbZaiU.LesJvCsYfEaHqQfB0pGQhK3e9BeZmLy', N'鐏忓繒顫堟径?, N'123', 108, N'[2,4]', N'', N'', 1, NULL, 0, N'0:0:0:0:0:0:0:1', N'2024-09-10 21:03:58', NULL, N'2024-09-10 21:03:58', N'1', N'2025-12-15 22:38:15', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (141, N'admin1', N'$2a$04$oj6F6d7HrZ70kYVD3TNzEu.m3TPUzajOVuC66zdKna8KRerK1FmVa', N'閺傛壆鏁ら幋?, NULL, NULL, NULL, N'', N'', 0, N'', 0, N'0:0:0:0:0:0:0:1', N'2025-04-08 13:09:07', N'1', N'2025-04-08 13:09:07', N'1', N'2025-05-14 19:11:48', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (142, N'test01', N'$2a$04$4bCYWZkjxxOC4QE0LY2M9uEEKWeJbLfs489NFtQoyidL5I0FndRaO', N'test01', N'', NULL, N'[]', N'', N'19021719925', 1, N'', 0, N'0:0:0:0:0:0:0:1', N'2025-07-29 19:47:17', N'1', N'2025-07-09 21:07:10', NULL, N'2025-12-02 13:23:11', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (143, N'a00001', N'$2a$04$GhVHFviOw/SsTmiQtifHJesDYFlHMeGK7OWh7aGCCjGGVCmbHVAwa', N'a00001', NULL, 104, NULL, N'', N'', 0, N'', 0, N'0:0:0:0:0:0:0:1', N'2025-12-01 16:10:13', NULL, N'2025-12-01 16:10:13', N'1', N'2025-12-05 21:34:05', N'0', 1)
GO
INSERT INTO system_users (id, username, password, nickname, remark, dept_id, post_ids, email, mobile, sex, avatar, status, login_ip, login_date, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (144, N'aoteman001', N'$2a$04$omQOmhz8OyUFBKw77nr8KOtMp6xdvoQ1gWStjk9r8.OYT3Bv6oEYe', N'aoteman001', NULL, 116, NULL, N'', N'', 0, N'', 1, N'0:0:0:0:0:0:0:1', N'2025-12-01 17:05:27', N'1', N'2025-12-01 17:05:27', N'1', N'2025-12-15 15:55:54', N'0', 1)
GO
SET IDENTITY_INSERT system_users OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo01_contact
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo01_contact
GO
CREATE TABLE yudao_demo01_contact (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(100) DEFAULT '' NOT NULL,
    sex tinyint  NOT NULL,
    birthday datetime2  NOT NULL,
    description nvarchar(255)  NOT NULL,
    avatar nvarchar(512) DEFAULT NULL NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹冨焼',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'sex'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸戣櫣鏁撻獮?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'birthday'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁犫偓娴?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'婢舵潙鍎?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'avatar'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€杞扮伐閼辨梻閮存禍楦裤€?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo01_contact'
GO

-- ----------------------------
-- Records of yudao_demo01_contact
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT yudao_demo01_contact ON
GO
INSERT INTO yudao_demo01_contact (id, name, sex, birthday, description, avatar, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'閸︾喕鐪?, 2, N'2023-11-07 00:00:00', N'<p>婢垛晞娈ㄩ崷鐔荤湸閿涗礁鎲?/p>', N'http://127.0.0.1:48080/admin-api/infra/file/4/get/46f8fa1a37db3f3960d8910ff2fe3962ab3b2db87cf2f8ccb4dc8145b8bdf237.jpeg', N'1', N'2023-11-15 23:34:30', N'1', N'2023-11-15 23:47:39', N'0', 1)
GO
SET IDENTITY_INSERT yudao_demo01_contact OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo02_category
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo02_category
GO
CREATE TABLE yudao_demo02_category (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(100) DEFAULT '' NOT NULL,
    parent_id bigint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻栧墎楠囩紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'parent_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁€杞扮伐閸掑棛琚悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo02_category'
GO

-- ----------------------------
-- Records of yudao_demo02_category
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT yudao_demo02_category ON
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (1, N'閸︾喕鐪?, 0, N'1', N'2023-11-15 23:34:30', N'1', N'2023-11-16 20:24:23', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'閻ｎ亣瀵?, 0, N'1', N'2023-11-16 20:24:00', N'1', N'2023-11-16 20:24:15', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, N'閹亝鈧?, 0, N'1', N'2023-11-16 20:24:32', N'1', N'2023-11-16 20:24:32', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (4, N'鐏忓繒鏆橀懠?, 2, N'1', N'2023-11-16 20:24:39', N'1', N'2023-11-16 20:24:39', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, N'婢堆呮殬閼?, 2, N'1', N'2023-11-16 20:24:46', N'1', N'2023-11-16 20:24:46', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, N'11', 3, N'1', N'2023-11-24 19:29:34', N'1', N'2023-11-24 19:29:34', N'0', 1)
GO
INSERT INTO yudao_demo02_category (id, name, parent_id, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, N'1', 0, N'1', N'2025-10-01 09:19:20', N'1', N'2025-10-01 09:19:20', N'0', 1)
GO
SET IDENTITY_INSERT yudao_demo02_category OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_course
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_course
GO
CREATE TABLE yudao_demo03_course (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    student_id bigint  NOT NULL,
    name nvarchar(100) DEFAULT '' NOT NULL,
    score tinyint  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涳妇鏁撶紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'student_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掑棙鏆?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'score'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涳妇鏁撶拠鍓р柤鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_course'
GO

-- ----------------------------
-- Records of yudao_demo03_course
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT yudao_demo03_course ON
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, 2, N'鐠囶厽鏋?, 66, N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 10:55:30', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (3, 2, N'閺佹澘顒?, 22, N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 10:55:30', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (6, 5, N'娴ｆ捁鍋?, 23, N'1', N'2023-11-16 23:22:46', N'1', N'2023-11-16 15:44:40', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 5, N'鐠侊紕鐣婚張?, 11, N'1', N'2023-11-16 23:22:46', N'1', N'2023-11-16 15:44:40', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, N'娴ｆ捁鍋?, 23, N'1', N'2023-11-16 23:22:46', N'1', N'2023-11-16 15:47:09', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 5, N'鐠侊紕鐣婚張?, 11, N'1', N'2023-11-16 23:22:46', N'1', N'2023-11-16 15:47:09', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (10, 5, N'娴ｆ捁鍋?, 23, N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 10:55:28', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (11, 5, N'鐠侊紕鐣婚張?, 11, N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 10:55:28', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (12, 2, N'閻絻鍓?, 33, N'1', N'2023-11-17 00:20:42', N'1', N'2023-11-16 16:20:45', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (13, 9, N'濠婃垿娲?, 12, N'1', N'2023-11-17 13:13:20', N'1', N'2024-09-17 10:55:26', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (14, 9, N'濠婃垿娲?, 12, N'1', N'2023-11-17 13:13:20', N'1', N'2024-09-17 10:55:49', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (15, 5, N'娴ｆ捁鍋?, 23, N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 18:55:29', N'0', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (16, 5, N'鐠侊紕鐣婚張?, 11, N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 18:55:29', N'0', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (17, 2, N'鐠囶厽鏋?, 66, N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 18:55:31', N'0', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (18, 2, N'閺佹澘顒?, 22, N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 18:55:31', N'0', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (19, 9, N'濠婃垿娲?, 12, N'1', N'2023-11-17 13:13:20', N'1', N'2025-04-19 02:49:03', N'1', 1)
GO
INSERT INTO yudao_demo03_course (id, student_id, name, score, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (20, 9, N'濠婃垿娲?, 12, N'1', N'2023-11-17 13:13:20', N'1', N'2025-04-19 10:49:04', N'0', 1)
GO
SET IDENTITY_INSERT yudao_demo03_course OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_grade
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_grade
GO
CREATE TABLE yudao_demo03_grade (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    student_id bigint  NOT NULL,
    name nvarchar(100) DEFAULT '' NOT NULL,
    teacher nvarchar(255)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涳妇鏁撶紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'student_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閻濐厺瀵屾禒?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'teacher'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涳妇鏁撻悵顓犻獓鐞?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_grade'
GO

-- ----------------------------
-- Records of yudao_demo03_grade
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT yudao_demo03_grade ON
GO
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (7, 2, N'娑撳鍕?2 閻?, N'閸涖劍婢冩导?, N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 18:55:31', N'0', 1)
GO
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (8, 5, N'閸楀簼璐?, N'闁儵浠存０鍡楀帥', N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 18:55:29', N'0', 1)
GO
INSERT INTO yudao_demo03_grade (id, student_id, name, teacher, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, 9, N'鐏忓繐娴?, N'鐏忓繐鈻?11', N'1', N'2023-11-17 13:10:23', N'1', N'2025-04-19 10:49:04', N'0', 1)
GO
SET IDENTITY_INSERT yudao_demo03_grade OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
-- Table structure for yudao_demo03_student
-- ----------------------------
DROP TABLE IF EXISTS yudao_demo03_student
GO
CREATE TABLE yudao_demo03_student (
    id bigint NOT NULL PRIMARY KEY IDENTITY,
    name nvarchar(100) DEFAULT '' NOT NULL,
    sex tinyint  NOT NULL,
    birthday datetime2  NOT NULL,
    description nvarchar(255)  NOT NULL,
    creator nvarchar(64) DEFAULT '' NULL,
    create_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updater nvarchar(64) DEFAULT '' NULL,
    update_time datetime2 DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted bit DEFAULT 0 NOT NULL,
    tenant_id bigint DEFAULT 0 NOT NULL
)
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缂傛牕褰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸氬秴鐡?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'name'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閹冨焼',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'sex'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸戣櫣鏁撻弮銉︽埂',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'birthday'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁犫偓娴?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'description'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'creator'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閸掓稑缂撻弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'create_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇懓?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'updater'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺囧瓨鏌婇弮鍫曟？',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'update_time'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'閺勵垰鎯侀崚鐘绘珟',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'deleted'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'缁夌喐鍩涚紓鏍у娇',
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student',
    'COLUMN', N'tenant_id'
GO

EXEC sp_addextendedproperty
    'MS_Description', N'鐎涳妇鏁撶悰?,
    'SCHEMA', N'dbo',
    'TABLE', N'yudao_demo03_student'
GO

-- ----------------------------
-- Records of yudao_demo03_student
-- ----------------------------
-- @formatter:off
BEGIN TRANSACTION
GO
SET IDENTITY_INSERT yudao_demo03_student ON
GO
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (2, N'鐏忓繒娅?, 1, N'2023-11-16 00:00:00', N'<p>閸樺顔?/p>', N'1', N'2023-11-16 23:21:49', N'1', N'2024-09-17 18:55:31', N'0', 1)
GO
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (5, N'婢堆囩拨', 2, N'2023-11-13 00:00:00', N'<p>娴ｇ姴婀弫娆愬灉閸嬫矮绨?</p>', N'1', N'2023-11-16 23:22:46', N'1', N'2024-09-17 18:55:29', N'0', 1)
GO
INSERT INTO yudao_demo03_student (id, name, sex, birthday, description, creator, create_time, updater, update_time, deleted, tenant_id) VALUES (9, N'鐏忓繗濮?, 1, N'2023-11-07 00:00:00', N'<p>閸濆牆鎼遍崫?/p>', N'1', N'2023-11-17 00:04:47', N'1', N'2025-04-19 10:49:04', N'0', 1)
GO
SET IDENTITY_INSERT yudao_demo03_student OFF
GO
COMMIT
GO
-- @formatter:on

-- ----------------------------
