-- =====================================================================
-- Ǩ��qq��������Ϣ
create table rxk.sys_qq_trance_base_info
as
	    	select qq,
				 nick_name as nick,
				 c7 as distence,
				 c9 as date1,
				 address as addr,
         c8 as date2
		 from ZHCX.TAB20161216_002V1@dblink_172_16_3_18
			 where  address is not null
			 and c9 is not null
       and address <>'[]';
-- ��֤
  select * from  rxk.sys_qq_trance_base_info;

-- ���������Ϣ
 create index IN_RXK_QQ_459 on SYS_QQ_TRANCE_BASE_INFO (QQ)  tablespace ;
 
-- =======================================================================
-- Ǩ�� ��ַ��poi���� 
create table amap_poi_20160706
as
select * from zhcx.amap_poi_20160706
;
--������� 
create index FDSHW on AMAP_POI_20160706 (SUB_LAT)  tablespace RXK_INDEX;
create index GFDSG on AMAP_POI_20160706 (SUB_LON2)  tablespace RXK_INDEX;
create index GFDSWQ on AMAP_POI_20160706 (LAT)  tablespace RXK_INDEX;
create index GFWEEWR on AMAP_POI_20160706 (SUB_LON)  tablespace RXK_INDEX;
create index HERRTWEREW on AMAP_POI_20160706 (LON)  tablespace RXK_INDEX;
create index HREWTRE on AMAP_POI_20160706 (PROVINCE)  tablespace RXK_INDEX;
-- drop table zhcx.amap_poi_20160706;
-- =======================================================================
-- Ǩ���豸��
create table ��������Ʒ��Ϣ_utf8 
as
select * from zhcx.��������Ʒ��Ϣ_utf8
;
--������� 
create index fbvdtgr on ZHCX.��������Ʒ��Ϣ_UTF8 (camera_model)  tablespace RXK_INDEX;
create index gfjhgetra on ZHCX.��������Ʒ��Ϣ_UTF8 (camera_brand)  tablespace RXK_INDEX ;

-- drop table zhcx.��������Ʒ��Ϣ_utf8;
-- drop table zhcx.������_��Ʒ��Ϣ ;
-- =======================================================================
-- Ǩ�Ʊ���Ƭ����ʱ�� 
create table qq_pic_2
as 
select * from zhcx.qq_pic_2;
-- �������� 
-- Create/Recreate indexes
create index RXK.DHTEWW on RXK.QQ_PIC_2 (CAMERA_BRAND) tablespace RXK_INDEX;
create index RXK.FDSA on RXK.QQ_PIC_2 (QQ)tablespace RXK_INDEX;
create index RXK.GFDSER on RXK.QQ_PIC_2 (NUM)tablespace RXK_INDEX;
create index RXK.GFDSWR on RXK.QQ_PIC_2 (PIC_MD5)tablespace RXK_INDEX;
create index RXK.GFHSSAF on RXK.QQ_PIC_2 (γ��)tablespace RXK_INDEX;
create index RXK.HGDF on RXK.QQ_PIC_2 (FLAG)tablespace RXK_INDEX;
create index RXK.QEWDFG on RXK.QQ_PIC_2 (����)tablespace RXK_INDEX;
create index RXK.QEWQASG on RXK.QQ_PIC_2 (CAMERA_MODEL)tablespace RXK_INDEX;
create index RXK.QGDSG on RXK.QQ_PIC_2 (UUID) tablespace RXK_INDEX;
-- ======================================================================= 
-- =======================================================================
-- Create table #
create table RXK.SYS_VIRTUAL_PERSION_BASE_INFO
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
)
tablespace RXK_DATA
;
-- Add comments to the table 
comment on table RXK.SYS_VIRTUAL_PERSION_BASE_INFO  is '����������ϱ�';
-- Add comments to the columns 
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.UUID  is '����id';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.ID  is '�˻�id qq��qq��.��������վ�˻�id';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.QQ  is 'qq';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.NICK  is '�ǳ�/�˻�����';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.REAL_NAME  is '��ʵ����';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.ADDRESS  is '��ַ/������סַ.ע���ַ.��¼��ַ.��ҵ��ַ';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.MOBILE  is '�ֻ�';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.EMAIL  is '����';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.ASTRO  is '����';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.SEX  is '�Ա�';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.BIRTHDAY  is '��������';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.BLOOD_TYPE  is 'Ѫ��';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.ID_CARD  is '���֤/�������֤����id';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.CORPORATION  is '��˾/��λ';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_USER  is '������';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.CREATE_TIME  is '����ʱ��';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_USER  is '������';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.UPDATE_TIME  is '����ʱ��';
comment on column RXK.SYS_VIRTUAL_PERSION_BASE_INFO.FLAG  is '����ֶ�1';
-- Create/Recreate indexes 
create unique index RXK.GGHJU on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (QQ)  tablespace RXK_INDEX;
create index RXK.SGFDWVX on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (NICK)  tablespace RXK_INDEX;
create index RXK.SGFDWVX1 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (REAL_NAME)  tablespace RXK_INDEX;
create index RXK.SGFDWVX2 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (ADDRESS)  tablespace RXK_INDEX;
create index RXK.SGFDWVX3 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (MOBILE)  tablespace RXK_INDEX;
create index RXK.SGFDWVX4 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (EMAIL)  tablespace RXK_INDEX;
create index RXK.SGFDWVX5 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (ID_CARD)  tablespace RXK_INDEX;
create index RXK.SGFDWVX6 on RXK.SYS_VIRTUAL_PERSION_BASE_INFO (CORPORATION)  tablespace RXK_INDEX;




-- ======================================================================= 
-- =======================================================================

-- Ψһqq
create table dis_pic_qq
as
select distinct qq from qq_pic_2;
-- 

-- ʡ�ݳ��б�
create table sys_virtual_addr_pro_city
as
select distinct province,city from amap_poi_20160706 t;


-- ��д�洢����

-- ���δ����qq����ȥ�ش���

insert into dis_pic_qq (qq)
select distinct qq from qq_pic_3@dblink_172_16_3_86 q
where  not exists (
select 1 from dis_pic_qq p where p.qq = q.qq
);
commit;


-- �ϼ��˲ŵĹ��������Ǩ��
create table sys_virtual_persion_exp_info
as
select * from wth.ganji_exp@dblink_172_16_3_18;

-- �ϼ��˲ŵĽ���������Ǩ��
create table sys_virtual_persion_education
as
select * from wth.ganji_education@dblink_172_16_3_18;


-- �������
create index SGFDWVX13 on SYS_VIRTUAL_PERSION_BASE_INFO (id)  tablespace RXK_INDEX;
-- Create/Recreate primary, unique and foreign key constraints 
alter table SYS_VIRTUAL_PERSION_BASE_INFO
  add constraint dagffdhrwrewafds primary key (UUID);
