-- 类型分类表
create table sys_vitrual_type(
uuid varchar2(36),
type varchar2(20),--类型
flag number, -- 标记
delete_flag number -- 删除标记
insert_time timestamp, -- 插入时间
insert_user varchar2(50), -- 插入人
update_time timestamp, -- 更新时间
update_user varchar2(50) --更新人
);

-- 表配置
create table sys_vitrual_tables(
uuid varchar2(36),
type_uuid varchar2(36), -- 类型分类id
user varchar2(50), -- 用户名
table_name varchar2(50), -- 表名
table_annotation varchar2(100), -- 表翻译
flag number, -- 标记
delete_flag number, -- 删除标记
insert_time timestamp, -- 插入时间
insert_user varchar(50), -- 插入人
update_time timestamp, -- 更新时间
update_user varchar(50) --更新人
);


create table SYS_ZHCX_TABS
(
  UUID        VARCHAR2(100) not null,
  TYPE_UUID   VARCHAR2(46),
  TABLE_NAME  VARCHAR2(80),
  TABLE_DESC  VARCHAR2(500),
  TABLE_ROWS  NUMBER,
  TABLE_SPACE NUMBER,
  TABLE_ORDER NUMBER,
  CREATE_USER VARCHAR2(46),
  CREATE_TIME DATE,
  UPDATE_USER VARCHAR2(46),
  UPDATE_TIME DATE,
  DELETE_FLAG VARCHAR2(1)
);


-- Create table
create table SYS_ZHCX_TYPE
(
  UUID        VARCHAR2(46) not null,
  TYPE_NAME   VARCHAR2(30),
  TYPE_CLASS  VARCHAR2(30),
  TYPE_ORDER  VARCHAR2(30),
  CREATE_USER VARCHAR2(46),
  CREATE_TIME DATE,
  UPDATE_USER VARCHAR2(46),
  UPDATE_TIME DATE,
  DELETE_FLAG CHAR(1)
)

;


-- Create table
create table SYS_ZHCX_COLS
(
  UUID            VARCHAR2(128) not null,
  TABLE_UUID      VARCHAR2(150),
  COLS_NAME       VARCHAR2(600) not null,
  COLS_DESC       VARCHAR2(1000),
  COLD_TYPE       VARCHAR2(212),
  COLD_LENGTH     NUMBER not null,
  COLS_ORDER      NUMBER,
  USER_INDEX      VARCHAR2(60),
  CREATE_USER     VARCHAR2(1000),
  CREATE_TIME     DATE,
  UPDATE_USER     VARCHAR2(92),
  UPDATE_TIME     DATE,
  DELETE_FLAG     CHAR(1),
  MD5_FLAG        VARCHAR2(2),
  ROW_NUM_PERCENT NUMBER(5,4),
  MAX_LENGTH      NUMBER
)





create table sys_vitrual_Corresponding(
uuid varchar2(36),
from_uuid varchar2(36), -- 字段id
to_uuid varchar2(50), -- 目标字段id
sort varchar2(50), -- 排序
flag number, -- 标记
delete_flag number, -- 删除标记
insert_time timestamp, -- 插入时间
insert_user varchar(50), -- 插入人
update_time timestamp, -- 更新时间
update_user varchar(50) --更新人
);


create table sys_vitrual_temp(
uuid varchar2(36), -- uuid
key_code varchar2(36), -- 关键字类型代码
key_name varchar2(50), -- 关键字类型
key_value varchar2(50), -- 关键字
insert_time timestamp, -- 插入时间
insert_user varchar(50), -- 插入人
update_time timestamp, -- 更新时间
update_user varchar(50) --更新人
);

create table sys_vitrual_tables(
uuid varchar2(36), -- uuid
start_time timestamp, -- 插入时间
class_name varchar2(250), -- 执行的类
Method_name varchar2(250), -- 执行的类
end_time timestamp, -- 结束时间
error_message varchar2(4000) -- 错误消息
);