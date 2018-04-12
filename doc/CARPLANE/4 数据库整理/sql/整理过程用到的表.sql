-- ���ͷ����
create table sys_vitrual_type(
uuid varchar2(36),
type varchar2(20),--����
flag number, -- ���
delete_flag number -- ɾ�����
insert_time timestamp, -- ����ʱ��
insert_user varchar2(50), -- ������
update_time timestamp, -- ����ʱ��
update_user varchar2(50) --������
);

-- ������
create table sys_vitrual_tables(
uuid varchar2(36),
type_uuid varchar2(36), -- ���ͷ���id
user varchar2(50), -- �û���
table_name varchar2(50), -- ����
table_annotation varchar2(100), -- ����
flag number, -- ���
delete_flag number, -- ɾ�����
insert_time timestamp, -- ����ʱ��
insert_user varchar(50), -- ������
update_time timestamp, -- ����ʱ��
update_user varchar(50) --������
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
from_uuid varchar2(36), -- �ֶ�id
to_uuid varchar2(50), -- Ŀ���ֶ�id
sort varchar2(50), -- ����
flag number, -- ���
delete_flag number, -- ɾ�����
insert_time timestamp, -- ����ʱ��
insert_user varchar(50), -- ������
update_time timestamp, -- ����ʱ��
update_user varchar(50) --������
);


create table sys_vitrual_temp(
uuid varchar2(36), -- uuid
key_code varchar2(36), -- �ؼ������ʹ���
key_name varchar2(50), -- �ؼ�������
key_value varchar2(50), -- �ؼ���
insert_time timestamp, -- ����ʱ��
insert_user varchar(50), -- ������
update_time timestamp, -- ����ʱ��
update_user varchar(50) --������
);

create table sys_vitrual_tables(
uuid varchar2(36), -- uuid
start_time timestamp, -- ����ʱ��
class_name varchar2(250), -- ִ�е���
Method_name varchar2(250), -- ִ�е���
end_time timestamp, -- ����ʱ��
error_message varchar2(4000) -- ������Ϣ
);