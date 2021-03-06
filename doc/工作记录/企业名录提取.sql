
select * from ganji t;

-- 提取 企业名录
insert into 企业名录_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.企业信用代码,t.注册号,t.公司名称,t.公司简称
 from company_2016822_union t) a
 
 
 
-- 整合其他的企业
insert into 企业名录_20160823 (uuid,公司名称)
select replace(sys_guid(), '-', '') as uuid,c.公司名称 from (
select distinct
t.公司名称
from 深圳高新技术产业园园区企业项目 t
where not exists
(select 1 from 企业名录_20160823 a
where a.公司名称 = t.公司名称
) 
)c


-- 长度 18 的是信用代码
update company_name_20160823 t
set t.信用代码 = t.注册号
,t.注册号 = ''
where lengthb(t.注册号)=18
and  t.信用代码  not like '%-%'
and  t.信用代码 not  like '%)%'
and  t.信用代码 is null
;
-- 不要汉字
update company_name_20160823 t
set  t.注册号= t.信用代码
,t.信用代码 = ''
where length(t.信用代码)<>lengthb(t.信用代码)
or t.信用代码 like '%-%'
or t.信用代码 like '%)%'
where t.注册号 is null
;
-- 全角转半角
update company_name_20160823 t
set 公司名称 = to_single_byte(公司名称)
;

select * from company_name_20160823 t
--where t.信用代码 is not null
;

-- 拿出姓名
create  table tmp_company_name_20160823 as
select replace(sys_guid(),'-','') as uuid,xm from( 
select  distinct t.公司名称 as xm   from company_name_20160823 t
where length(t.公司名称) between 2 and 3
);


-- 制空
update company_name_20160823 t
set 公司名称 =''
where length(t.公司名称) < 4
;
commit;
-- 删除空数据
delete from company_name_20160823 t
where t.信用代码 is null
and t.注册号 is null
and t.公司名称 is null
;
commit;

update company_name_20160823
set 注册号 =公司名称,
公司名称=''
where length(公司名称) = lengthb(公司名称)
;
commit;

-- 导入姓名
insert into ryxm_20160926_2_3
select * from tmp_company_name_20160823 t
where not exists(
select xm from ryxm_20160926_2_3 a 
where t.xm = a.xm
)
and lengthb(xm)<> length(xm)
;
drop table tmp_company_name_20160823;



 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'?',''))
where 公司名称 like '%?%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'
',''))
where 公司名称 like '%
%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;


 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;


 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'!',''))
where 公司名称 like '%!%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'"',''))
where 公司名称 like '%"%';
commit;

--
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,')',''))
where 公司名称 like ')%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'.',''))
where 公司名称 like '%.%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'*',''))
where 公司名称 like '%*%';
commit;


 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'+',''))
where 公司名称 like '+%';
commit;


 update company_name_20160823
set 公司名称 = trim(replace(公司名称,',',''))
where 公司名称 like ',%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'-',''))
where 公司名称 like '-%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'/',''))
where 公司名称 like '/%';
commit;



--

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'=',''))
where 公司名称 like '=%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'>',''))
where 公司名称 like '>%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,' ',''))
where 公司名称 like ' %';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'’',''))
where 公司名称 like '’%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'‖',''))
where 公司名称 like '‖%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'·',''))
where 公司名称 like '·%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'。',''))
where 公司名称 like '。%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'。',''))
where 公司名称 like '。%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'|',''))
where 公司名称 like '|%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'nbsp;',''))
where 公司名称 like 'nbsp;%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'~',''))
where 公司名称 like '~%';
commit;

 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'#',''))
where 公司名称 like '#%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'`',''))
where 公司名称 like '`%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'_',''))
where 公司名称 like '_%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'^',''))
where 公司名称 like '^%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,']',''))
where 公司名称 like ']%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'\',''))
where 公司名称 like '\%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'>',''))
where 公司名称 like '>%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'?',''))
where 公司名称 like '?%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'@',''))
where 公司名称 like '@%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,';',''))
where 公司名称 like ';%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'&',''))
where 公司名称 like '&%';
commit;
 update company_name_20160823
set 公司名称 = trim(replace(公司名称,'''',''))
where 公司名称 like '''%';
commit;

 update company_name_20160823
set 公司名称 = trim(公司名称)
--where 公司名称 like '''%';
;
commit;

--
select * from company_name_20160823
where length(公司名称) = lengthb(公司名称)


=======
select * from ganji t;

-- 提取 企业名录
insert into 企业名录_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.企业信用代码,t.注册号,t.公司名称,t.公司简称
 from company_2016822_union t) a
 
 
 
-- 整合其他的企业
insert into 企业名录_20160823 (uuid,公司名称)
select replace(sys_guid(), '-', '') as uuid,c.公司名称 from (
select distinct
t.公司名称
from 深圳高新技术产业园园区企业项目 t
where not exists
(select 1 from 企业名录_20160823 a
where a.公司名称 = t.公司名称
) 
)c


