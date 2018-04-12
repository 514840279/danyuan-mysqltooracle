-- === ================================= 企业信息合并 ========================================
--- 表创建_删除
drop table company_2016822_union;
-- 表创建
create table company_2016822_union(
uuid varchar(32) primary key,
企业信用代码 varchar2（18）,
注册号	varchar2(4000),
公司名称	varchar2(4000),
公司简称	varchar2(4000),
曾用名	varchar2(4000),
公司英文名	varchar2(4000),
法人代表	varchar2(4000),
法人电话	varchar2(4000),
电子邮箱	varchar2(4000),
QQ号码	varchar2(4000),
身份证号	varchar2(4000),
办公地址	varchar2(4000),
地址经度 varchar2(4000),
地址纬度 varchar2(4000),
公司简介	varchar2(4000),
公司网址	varchar2(4000),
经营范围	varchar2(4000),
经营状况 varchar2(4000),
企业类型 varchar2(4000),
登记机关  varchar2(4000),
省份 varchar2(4000),
城市  varchar2(4000),
邮政编码 varchar2(4000),
员工数 varchar2(4000),
主要产品 varchar2(4000),
注册地址 varchar2(4000),
注册类型 varchar2(4000),
注册日期 varchar2(4000),
注册资金 varchar2(4000),
发照日期 varchar2(4000),
企业证书链接地址 varchar2(4000),
注销时间 varchar2(4000),
采集时间	varchar2(4000),
营业期限至	varchar2(4000),
营业期限自	varchar2(4000)
);

-- 合并表 =======================================================

--- 产业单位
insert into company_2016822_union
  (uuid,
   注册号,
   公司名称,
   法人代表,
   法人电话,
   QQ号码,
   办公地址,
   登记机关,
   公司网址,
   经营范围,
   经营状况,
   企业类型,
   营业期限自,
 员工数,
   主要产品,
   注册地址,
   注册日期,
   注册资金)
  select replace(sys_guid(), '-', '') as uuid,
         t.注册号,
         t.公司名称,
         t.负责人 as 法人代表,
         nvl(t.电话, t.手机号) as 法人电话,
         t.QQ as QQ号码,
         t.办公地址,
         t.登记机关,
         t.公司网址,
         t.经营范围,
         t.经营模式,
         t.企业类型,
         t.营业期限,
         t.员工人数,
         t.主营产品,
         t.注册地址,
         t.成立时间,
         t.注册资金
    from GYYXG_GYS_公司信息 t;
    
drop table     GYYXG_GYS_公司信息;

--- 企业名录信息
insert into company_2016822_union
  (uuid,
   --注册号,
   公司名称,
   法人代表,
   法人电话,
 --  QQ号码,
   办公地址,
   地址经度,
   地址纬度,
  -- 登记机关,
 --  公司网址,
   经营范围,
   省份,
   城市,
  -- 经营状况,
  -- 企业类型,
 --  营业期限自,
-- 员工数,
 --  主要产品,
 --  注册地址,
   注册日期,
   注册资金)
  select replace(sys_guid(), '-', '') as uuid,
         t.company as 公司名称,
      --   t.,
         t.contact as 法人代表,
         nvl(t.PHONE, t.MODEL) as 法人电话,
      --   t.QQ as QQ号码,
         t.ADDRESS_STD as 办公地址,
          t.ADDR_LNG as 地址经度,
         t.ADDR_LAT	as 地址纬度,
        -- t.登记机关,
         --t.公司网址,
         t.SCOPE as 经营范围,
         t.PROVINCE as 省份,
         t.CITY as 城市,
       --  t.经营模式,
         --t.企业类型,
        -- t.营业期限,
       --  t.员工人数,
      --   t.主营产品,
      --   t.注册地址,
         t.REGIST_DATE as 注册日期,
         t.CAPITAL as 注册资金
    from COMPANY_INFO_TXT_1 t;
    
    
    drop table     COMPANY_INFO_TXT_1;
 --    
 --   中国军工网  =======================================================
   
    
 
insert into company_2016822_union
  (uuid,
   公司名称,
   法人代表,
   法人电话,
   电子邮箱,
   QQ号码,
   地址经度,
   地址纬度,
   公司网址,
   办公地址,
   邮政编码,
   主要产品)

  select replace(sys_guid(), '-', '') as uuid,
         DWMC as 公司名称,
         LXR as 法人代表,
         DHHM as 法人电话,
         EMAIL as 电子邮箱,
         QQ as QQ号码,
         JD as 地址经度,
         WD as 地址纬度,
         URL as 公司网址,
         DZ as 办公地址,
         YB as 邮政编码,
         SPMC as 主要产品
    from HADOOP.JUGONG_81TECH@dblink_172_16_3_18

      drop table   JUGONG_81TECH;  
      
      
---- 企业基本信息
insert into  company_2016822_union(
UUID,
--企业信用代码,注册号,
公司名称,
--公司简称,曾用名,公司英文名,
法人代表,法人电话,
--电子邮箱,QQ号码,身份证号,
发照日期,
--地址经度,地址纬度,公司简介,
--公司网址,
经营范围,
--经营状况,企业类型,登记机关,
省份,城市,办公地址,
邮政编码,
员工数,
--主要产品,注册地址,注册类型,
注册日期,注册资金

--企业证书链接地址,注销时间,采集时间,营业期限至,营业期限自
)
select 
replace(sys_guid(), '-', '') as uuid,
ENT_NAME as	公司名称,	
DELEGATE_LAW as	法人代表,	
ENT_PHONE as	法人电话,	
AWARD_CT_DATE as	发照日期,	
WORK_ITEM as	经营范围,	
DIVISION	as 省份,
ENT_AREA as	城市,	
ENT_ADDRESS as 	办公地址,	
ZIPCODE	as 邮政编码,
TOTAL_NUM	as 员工数,	
REG_TIME as	注册日期,
FUND	 as 注册资金
 from ent
   drop table   ent;  
      
      
      
 -----  供应商公司信息
 
 insert into  company_2016822_union(
UUID,
--企业信用代码,
注册号,公司名称,
--公司简称,曾用名,公司英文名,
法人代表,法人电话,
--电子邮箱,
QQ号码,
办公地址,
--身份证号,
发照日期,
登记机关,
--地址经度,地址纬度,公司简介,
公司网址,
经营范围,
经营状况,
企业类型,
营业期限自,
--省份,城市,
--邮政编码,
员工数,
主要产品,
注册地址,
--注册类型,
--注册日期,
注册资金

--企业证书链接地址,注销时间,采集时间,营业期限至,
)
select 
replace(sys_guid(), '-', '') as uuid,
注册号 as	注册号,
公司名称 as	公司名称,	
nvl(负责人,联系人) as	法人代表,
电话 as	法人电话,	
QQ	 as QQ号码,	
nvl(办公地址,地址) as	办公地址,	
成立时间 as	成立时间 ,
登记机关 as	登记机关,	
nvl(公司网址,网址) as	公司网址,
经营范围 as	经营范围,
经营模式 as	经营模式,
企业类型 as	企业类型,	
--网址 as	网址,
-- as	地址,
营业期限 as	营业期限,	
员工人数 as	员工数,
主营产品 as	主要产品,
注册地址 as	注册地址,	
注册资金 as	注册资金
 from ZHCX.GYYXG_GYS_公司信息@dblink_172_16_3_17;
   drop table   GYYXG_GYS_公司信息; 
   
 -- 房地产管理业名录
   
    insert into  company_2016822_union(
UUID,
--企业信用代码,
--注册号,
公司名称,
--公司英文名,公司简称,
法人代表,法人电话,
电子邮箱,
--曾用名,发照日期,QQ号码,身份证号,登记机关,公司简介,
经营范围,
--经营状况,企业类型,
公司网址,
--注册地址,
办公地址,
--营业期限至,地址经度,地址纬度,营业期限自,省份,城市,
邮政编码,
员工数,
--主要产品,注册类型,
注册日期,注册资金
--企业证书链接地址,注销时间,采集时间,
)
select 
replace(sys_guid(), '-', '') as uuid,
单位名称 as  单位名称,
nvl(负责人,联系人) as  法人代表,
电话 as  法人电话,
--联系人 as  联系人,
电子邮箱 as  电子邮箱,
经营范围 as  经营范围,
网址 as  公司网址,
地址 as  办公地址,
邮政编码 as  邮政编码,
职工人数 as  员工数,
注册日期 as  注册日期,
注册资金 as  注册资金
 from ZHCX.SHXX_QYXG_房地产名录@dblink_172_16_3_17; 
 
 -- 金融业名录

  insert into  company_2016822_union(
UUID,
--企业信用代码,
--注册号,
公司名称,
--公司英文名,公司简称,
法人代表,法人电话,
电子邮箱,
--曾用名,发照日期,QQ号码,身份证号,登记机关,公司简介,
经营范围,
--经营状况,企业类型,
公司网址,
--注册地址,
办公地址,
--营业期限至,地址经度,地址纬度,营业期限自,省份,城市,
邮政编码,
员工数,
--主要产品,注册类型,
注册日期,注册资金
--企业证书链接地址,注销时间,采集时间,
)
select 
replace(sys_guid(), '-', '') as uuid,
单位名称 as  公司名称,
nvl(负责人,联系人) as  负责人,
--联系人 as  联系人
电话 as  法人电话,
电子邮箱 as  电子邮箱,
经营范围 as  经营范围,
网址 as  公司网址,
地址 as  办公地址,
邮政编码 as  邮政编码,
职工人数 as  员工数,
注册日期 as  注册日期,
注册资金 as  注册资金
 from ZHCX.SHXX_QYXG_金融业名录@dblink_172_16_3_17;  
  ---- 公司变更
 insert into company_2016822_union (uuid,注册号,公司名称,公司网址)
select replace(sys_guid(), '-', '') as uuid, a.* from (
select distinct t.注册号,t.公司名称 ,t.网址 from shxg_qyxg_xyxg_公司变更  t) a
 
drop table shxg_qyxg_xyxg_公司变更;
  
-- shxx_qyxg_gsjbxx_异常
insert into  company_2016822_union(uuid,注册号,公司名称,企业类型,法人代表,注册资金,注册日期,办公地址,营业期限自,营业期限至,经营范围,登记机关,经营状况)
select  replace(sys_guid(), '-', '') as uuid,注册号,名称,类型,姓名,注册资本,成立日期,住所,营业期限自,营业期限至,经营范围,登记机关,登记状态 from shxx_qyxg_gsjbxx_异常 t;
drop table shxx_qyxg_gsjbxx_异常;
 
-----公司基本信息    
insert into company_2016822_union
  (UUID,
   --企业信用代码,
   注册号,
   公司名称,
   公司英文名,
   公司简称,
   --
   法人代表,
   法人电话,
   电子邮箱,
   曾用名,
   发照日期,
   --QQ号码,身份证号,
   登记机关,
   公司简介,
   经营范围,
   经营状况,
   企业类型,
   公司网址,
   --注册地址,
   办公地址,
   营业期限至,
   --地址经度,地址纬度,
   营业期限自,
   --省份,城市,
   邮政编码,
   员工数,
   主要产品,
   注册类型,
   注册日期,
   注册资金
   --企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         注册号 as 注册号,
         公司名称 as 公司名称,
         公司英文名 as 公司英文名,
         公司简称 as 公司简称,
         nvl(法人代表, 负责人) as 法人代表,
         nvl(法人电话, 联系电话) as 法人电话,
         --as  负责人,  
         --联系电话 as  联系电话,
         电子邮箱   as 电子邮箱,
         曾用名     as 曾用名,
         成立日期   as 成立日期,
         登记机关   as 登记机关,
         公司简介   as 公司简介,
         经营范围   as 经营范围,
         经营模式   as 经营模式,
         企业类型   as 企业类型,
         网址       as 公司网址,
         详细地址   as 办公地址,
         营业期限至 as 营业期限至,
         营业期限自 as 营业期限自,
         邮政编码   as 邮政编码,
         员工数     as 员工数,
         主要产品   as 主要产品,
         注册类型   as 注册类型,
         注册日期   as 注册日期,
         注册资金   as 注册资金
    from SHXG_QYXG_公司基本信息;

drop table SHXG_QYXG_公司基本信息;
    
-- 公司客户
insert into company_2016822_union(uuid,公司名称,办公地址,注册资金,企业类型,经营范围)
select replace(sys_guid(), '-', '') as uuid, t.公司名称,t.公司地址,t.注册资金,t.经营模式,t.主营行业 from shxx_qyxg_gskhxg_公司客户 t;
drop table shxx_qyxg_gskhxg_公司客户; 





-----公司基本信息
insert into company_2016822_union
  (UUID,
   --企业信用代码,
   注册号,
   公司名称,
   公司英文名,
   公司简称,
   --
   法人代表,
   法人电话,
   电子邮箱,
   曾用名,
   发照日期,
   --QQ号码,身份证号,
   登记机关,
   公司简介,
   经营范围,
   经营状况,
   企业类型,
   公司网址,
   --注册地址,
   办公地址,
   营业期限至,
   --地址经度,地址纬度,
   营业期限自,
   --省份,城市,
   邮政编码,
   员工数,
   主要产品,
   注册类型,
   注册日期,
   注册资金
   --企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         注册号 as 注册号,
         公司名称 as 公司名称,
         公司英文名 as 公司英文名,
         公司简称 as 公司简称,
         nvl(法人代表, 负责人) as 法人代表,
         nvl(法人电话, 联系电话) as 法人电话,
         --as  负责人,  联系电话 as  联系电话,
         电子邮箱   as 电子邮箱,
         曾用名     as 曾用名,
         成立日期   as 成立日期,
         登记机关   as 登记机关,
         公司简介   as 公司简介,
         经营范围   as 经营范围,
         经营模式   as 经营模式,
         企业类型   as 企业类型,
         网址       as 公司网址,
         详细地址   as 办公地址,
         营业期限至 as 营业期限至,
         营业期限自 as 营业期限自,
         邮政编码   as 邮政编码,
         员工数     as 员工数,
         主要产品   as 主要产品,
         注册类型   as 注册类型,
         注册日期   as 注册日期,
         注册资金   as 注册资金
    from SHXG_QYXG_公司基本信息_8G;

drop table SHXG_QYXG_公司基本信息_8G;

-- 金融业名录

insert into company_2016822_union
  (UUID,
   --企业信用代码,
   注册号,
   公司名称,
   --公司英文名,公司简称,
   法人代表,
   法人电话,
   电子邮箱,
   身份证号,
   --曾用名,QQ号码,登记机关,公司简介,
   经营范围,
   --经营状况,企业类型,
   公司网址,
   --注册地址,
   办公地址,
   --营业期限至,地址经度,地址纬度,营业期限自,省份,城市,
   邮政编码,
   员工数,
   --主要产品,注册类型,
   注册日期,
   注册资金,
   发照日期,
   --
   企业证书链接地址,
   注销时间
   --,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         注册号 as 注册号,
         机构名称 as 机构名称,
         nvl(法人代表, 联系人) as 法人代表,
         -- as  联系人,
         电话号码         as 法人电话,
         电子邮箱         as 电子邮箱,
         证件号码         as 证件号码,
         经营范围         as 经营范围,
         网址             as 公司网址,
         机构地址         as 办公地址,
         邮政编码         as 邮政编码,
         注册人数         as 员工数,
         注册日期         as 注册日期,
         ZCZJ             as 注册资金,
         发照日期         as 发照日期,
         企业证书链接地址 as 企业证书链接地址,
         注销时间         as 注销时间
    from SHXX_QYXG_企业基本信息;

drop table SHXX_QYXG_企业基本信息;

----- 保险公司信息
insert into company_2016822_union
  (UUID,
   --企业信用代码,注册号,
   公司名称,
   --公司英文名,公司简称,
   法人代表,
   法人电话,
   --电子邮箱,
   身份证号
   --曾用名,QQ号码,登记机关,公司简介,经营范围,经营状况,企业类型,公司网址,注册地址,办公地址,营业期限至,地址经度,地址纬度,营业期限自,省份,城市,邮政编码,员工数,主要产品,注册类型,注册日期,注册资金,发照日期,企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         DW as 公司名称,
         XM as 法人代表,
         LXFS as 法人电话,
         SFZH as 身份证号
    from ZHCX_BXGS@dblink_172_16_3_17;
drop table ZHCX_BXGS;

----- 企业信息
insert into company_2016822_union
  (UUID,
   --企业信用代码,注册号,
   公司名称,
   --公司英文名,公司简称,
   法人代表,
   法人电话,
   --电子邮箱,
   身份证号,
   --曾用名,QQ号码,登记机关,公司简介,
   经营范围,
   --经营状况,企业类型,公司网址,注册地址,
   办公地址,
   --营业期限至,地址经度,地址纬度,营业期限自,省份,城市,
   邮政编码,
   员工数,
   --主要产品,注册类型,
   注册日期,
   注册资金
   --,发照日期,企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         机构名称 as 公司名称,
         法人代表 as 法人代表,
         电话号码 as 法人电话,
         ZJHM as 身份证号,
         经营范围 as 经营范围,
         机构地址 as 办公地址,
         邮政编码 as 邮政编码,
         职工人数 as 员工数,
         注册日期 as 注册日期,
         注册资金 as 注册资金
    from ZHCX_GSML;
drop table ZHCX_GSML;



----- 企业信息
insert into company_2016822_union
  (UUID,
   --企业信用代码,
   注册号,
   公司名称,
   --公司英文名,公司简称,法人代表,法人电话,电子邮箱,发照日期,身份证号,曾用名,QQ号码,登记机关,公司简介,经营范围,经营状况,企业类型,
   公司网址,
   --注册地址,
   省份,
   办公地址,
   --营业期限至,地址经度,地址纬度,营业期限自,城市,邮政编码,员工数,
   主要产品
   --,注册类型,注册日期,注册资金,企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         注册号 as 注册号,
         公司名称 as 公司名称,
         nvl(公司网址, 网址) as 公司网址,
         省份 as 省份,
         --网址 as  网址,
         公司地址 as 公司地址,
         主营产品 as 主要产品
    from ZZYXG_QYXG_公司信息;



----- 企业信息
insert into company_2016822_union
  (UUID,
   --企业信用代码,注册号,
   公司名称,
   --公司英文名,公司简称,
   法人代表,   法人电话,   电子邮箱,   发照日期,
   --身份证号,曾用名,QQ号码,登记机关,公司简介,
  -- 经营范围,
   --经营状况,企业类型,
   公司网址,
   --注册地址,
   办公地址,
   --营业期限至,地址经度,地址纬度,营业期限自,省份,城市,
   邮政编码,   员工数,   主要产品
   --,注册类型,注册日期,注册资金,企业证书链接地址,注销时间,采集时间,
   )
  select replace(sys_guid(), '-', '') as uuid,
         单位名称 as 公司名称,
         nvl(负责人, 联系人) as 法人代表,
         --联系人 as  联系人
         电话     as 法人电话,
         EMAIL    as 电子邮箱,
         成立时间 as 发照日期,
         网址     as 公司网址, 地址 as 办公地址, 邮政编码 as 邮政编码, 职工人数 as 员工数, 主营产品 as 主营产品
    from zhcx.ZHCX_WLXX_YXSJ_TT@dblink_172_16_3_17;
