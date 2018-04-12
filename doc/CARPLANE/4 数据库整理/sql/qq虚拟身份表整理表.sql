-- Create table
create table SYS_VIRTUAL_PERSION_BASE_INFO
(
  UUID        VARCHAR2(64),
  ID          VARCHAR2(64),
  QQ          VARCHAR2(12),
  NICK        VARCHAR2(100),
  REAL_NAME   VARCHAR2(50),
  ADDRESS     VARCHAR2(500),
  MOBILE      VARCHAR2(15),
  EMAIL       VARCHAR2(200),
  ASTRO       VARCHAR2(10),
  SEX         VARCHAR2(10),
  BIRTHDAY    VARCHAR2(20),
  BLOOD_TYPE  VARCHAR2(10),
  ID_CARD     VARCHAR2(18),
  CORPORATION VARCHAR2(500),
  CREATE_USER VARCHAR2(100) default 'system',
  CREATE_TIME TIMESTAMP(6) default sysdate,
  UPDATE_USER VARCHAR2(100) default 'system',
  UPDATE_TIME TIMESTAMP(6) default sysdate,
  FLAG        NUMBER default 0
);
-- Add comments to the table 
comment on table SYS_VIRTUAL_PERSION_BASE_INFO
  is '虚拟身份整合表';
-- Add comments to the columns 
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UUID
  is '数盟id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ID
  is '账户id qq是qq号.邮箱是网站账户id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.QQ
  is 'qq';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.NICK
  is '昵称/账户名称';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.REAL_NAME
  is '真实姓名';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ADDRESS
  is '地址/可能是住址.注册地址.登录地址.企业地址';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.MOBILE
  is '手机';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.EMAIL
  is '邮箱';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ASTRO
  is '星座';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.SEX
  is '性别';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.BIRTHDAY
  is '出生日期';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.BLOOD_TYPE
  is '血型';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ID_CARD
  is '身份证/其他身份证明的id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CORPORATION
  is '公司/单位';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_USER
  is '创建人';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_TIME
  is '创建时间';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_USER
  is '更新人';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_TIME
  is '更新时间';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.FLAG
  is '标记字段1';
;


alter table SYS_VIRTUAL_PERSION_BASE_INFO rename column UPDATE_TYPE to UPDATE_TIME;

-- Create/Recreate indexes
create unique index gghju on SYS_VIRTUAL_PERSION_BASE_INFO (qq);

-- Create/Recreate indexes
create index sgfdwvx on SYS_VIRTUAL_PERSION_BASE_INFO (nick);

-- Create/Recreate indexes
create index sgfdwvx1 on SYS_VIRTUAL_PERSION_BASE_INFO (real_name);

-- Create/Recreate indexes
create index sgfdwvx2 on SYS_VIRTUAL_PERSION_BASE_INFO (address);

-- Create/Recreate indexes
create index sgfdwvx3 on SYS_VIRTUAL_PERSION_BASE_INFO (mobile);

-- Create/Recreate indexes
create index sgfdwvx4 on SYS_VIRTUAL_PERSION_BASE_INFO (email);

-- Create/Recreate indexes
create index sgfdwvx5 on SYS_VIRTUAL_PERSION_BASE_INFO (id_card);

-- Create/Recreate indexes
create index sgfdwvx6 on SYS_VIRTUAL_PERSION_BASE_INFO (corporation);

-- Create/Recreate indexes
create index sgfdwvx6 on SYS_VIRTUAL_PERSION_BASE_INFO (corporation);

--gengxin id
update sys_virtual_persion_base_info t
set t.uuid = replace(sys_guid(),'-',''),
id=qq,
update_time=sysdate,
update_user='system';
commit;

-- Create/Recreate primary, unique and foreign key constraints
alter table SYS_VIRTUAL_PERSION_BASE_INFO
  add constraint vgvu primary key (UUID);


-- Add comments to the columns
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.MOBILE
  is '手机';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.EMAIL
  is '邮箱';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.SEX
  is '性别';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_USER
  is '创建人';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_TIME
  is '创建时间';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_USER
  is '更新人';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_time
  is '更新时间';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.FLAG
  is '标记字段1';