--  企业名录
insert into company_2016822_union (UUID,
省份,城市,--企业信用代码,注册号,
公司名称,
--公司简称,曾用名,公司英文名,
法人代表,身份证号,法人电话,邮政编码,电子邮箱,注册日期,地址经度,地址纬度,办公地址,员工数,
--QQ号码,
--发照日期,
--公司简介,
--公司网址,
--经营状况,企业类型,登记机关,

--主要产品,注册地址,注册类型,
--注册资金
经营范围
--企业证书链接地址,注销时间,采集时间,营业期限至,营业期限自

)
select replace(sys_guid(), '-', '') as uuid,PROVINCE ,CITY,COMPANY,
nvl(OWNER,CONTACT),nvl(OWNER_CTZID,CONTACT_PST),
--ADMINI_AREA,
nvl(MOBILE,PHONE),
--CITY_NO,FAX,
ZIP_NO,EMAIL,REGIST_DATE,ADDR_LAT,ADDR_LNG,ADDRESS_STD,STAFF,

BUSS_SCOPE
 from COMPANY_INFO_LARGE_DIS;
 
 
 drop table COMPANY_INFO_LARGE_DIS;
 
 
 
 
 
--  企业名录
insert into company_2016822_union (UUID,
省份,城市,--企业信用代码,注册号,
公司名称,
--公司简称,曾用名,公司英文名,
法人代表,身份证号,法人电话,邮政编码,电子邮箱,注册日期,地址经度,地址纬度,办公地址,员工数,
--QQ号码,
--发照日期,
--公司简介,
--公司网址,
--经营状况,企业类型,登记机关,

--主要产品,注册地址,注册类型,
--注册资金
经营范围
--企业证书链接地址,注销时间,采集时间,营业期限至,营业期限自

)
select replace(sys_guid(), '-', '') as uuid,PROVINCE ,CITY,COMPANY,
nvl(OWNER,CONTACT),nvl(OWNER_CTZID,CONTACT_PST),
--ADMINI_AREA,
nvl(MOBILE,PHONE),
--CITY_NO,FAX,
ZIP_NO,EMAIL,REGIST_DATE,ADDR_LAT,ADDR_LNG,ADDRESS_STD,STAFF,

BUSS_SCOPE
 from COMPANY_INFO_LITTLE_1;
 
 
 
 drop table COMPANY_INFO_LITTLE_1;
 
 
 
 
 
 -- 40323091
select count(1) from 企业名录_20160823 t
