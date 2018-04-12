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
  is '����������ϱ�';
-- Add comments to the columns 
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UUID
  is '����id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ID
  is '�˻�id qq��qq��.��������վ�˻�id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.QQ
  is 'qq';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.NICK
  is '�ǳ�/�˻�����';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.REAL_NAME
  is '��ʵ����';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ADDRESS
  is '��ַ/������סַ.ע���ַ.��¼��ַ.��ҵ��ַ';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.MOBILE
  is '�ֻ�';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.EMAIL
  is '����';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ASTRO
  is '����';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.SEX
  is '�Ա�';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.BIRTHDAY
  is '��������';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.BLOOD_TYPE
  is 'Ѫ��';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.ID_CARD
  is '���֤/�������֤����id';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CORPORATION
  is '��˾/��λ';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_USER
  is '������';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_TIME
  is '����ʱ��';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_USER
  is '������';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_TIME
  is '����ʱ��';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.FLAG
  is '����ֶ�1';
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
  is '�ֻ�';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.EMAIL
  is '����';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.SEX
  is '�Ա�';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_USER
  is '������';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_TIME
  is '����ʱ��';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_USER
  is '������';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_time
  is '����ʱ��';
comment on column SYS_VIRTUAL_PERSION_BASE_INFO.FLAG
  is '����ֶ�1';