-- ****会计公司员工
select * from SHXX_QYXG_HJXG_公司信息;
-- ***上市高管履历
select * from  WLXX_GSXG_DJGXX
-- ***企业通讯录
select * from 企业员工通讯录
-- 机构信息
select * from ZHCX_GSML_T;
-- 企业产品
select * from  SHUNQIWANG_CHANPIN;






-- 只有企业名称 物流信息
select * from  企业物流信息 ;
-- g公司名 股票代码
select * from 公司名股票代码;
-- 百度招聘信息
select * from 百度招聘信息 where t_companyname is not null;
-- 企业项目
select * from 深圳高新技术产业园园区企业项目;

--中国制造网企业
select * from  中国制造网企业;

-- 整合其他的企业
insert into 企业名录_20160823 (uuid,公司名称)
select replace(sys_guid(), '-', '') as uuid,c.公司名称 from (
select distinct
t.company as 公司名称
from company_info_large_dis t
where 
company  is not null and
not exists
(select 1 from 企业名录_20160823 a
where a.公司名称 = t.company
) 
)c


insert into 企业名录_20160823 (uuid,公司名称)
select replace(sys_guid(), '-', '') as uuid,c.公司名称 from (
select distinct
t.company as 公司名称
from company_info_little_1 t
where 
company  is not null and
not exists
(select 1 from 企业名录_20160823 a
where a.公司名称 = t.company
) 
)c




insert into 企业名录_20160823 (uuid,公司名称)
select replace(sys_guid(), '-', '') as uuid,c.公司名称 from (
select distinct
t.comname as 公司名称
from 企业产品 t
where 
comname  is not null and
not exists
(select 1 from 企业名录_20160823 a
where a.公司名称 = t.comname
) 
)c


drop table 中国制造网企业



