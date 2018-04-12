-- ***************   企业简称 *********************

-- 公司
update company_name_20160823 t
set t.公司简称 = t.公司名称
where t.公司名称 like '%公司'
;
commit;
-- 清洗

update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'区')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'道')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'街')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'巷')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'路')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'县')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'镇')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'乡')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'地区')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'省')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,instr(t.公司简称,'市')+1)
where t.公司简称 is not null
and length(t.公司简称) >4
;

update company_name_20160823 t
set t.公司简称 = substr(t.公司简称,0,instr(t.公司简称,'有限责任公司')-3)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 =substr(t.公司简称,0,instr(t.公司简称,'有限公司')-3)
where t.公司简称 is not null
and length(t.公司简称) >4
;
update company_name_20160823 t
set t.公司简称 =substr(t.公司简称,0,instr(t.公司简称,'公司')-3)
where t.公司简称 is not null
and length(t.公司简称) >4
;
commit;




select substr(t.公司简称,instr(t.公司简称,'市')+1) from company_name_20160823 t
where t.公司简称 like '%市%'
;



-- 地区划分
create table addr_pro_city_dis_tow as
select distinct  province,city,district,township from smaddr.amap_poi_20160706@dblink_sys_172_16_3_17 t
;
-- 做成一列
create table addr_pro_city_dis_tow_union as
select distinct t.province as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.city  as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.district  as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.township  as addr ,'' as dis from addr_pro_city_dis_tow t
;

-- 清洗 短名称

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'市',''）
where t.addr like '%市'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'省',''）
where t.addr like '%省'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'城',''）
where t.addr like '%城'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'乡',''）
where t.addr like '%乡'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'镇',''）
where t.addr like '%镇'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'村',''）
where t.addr like '%村'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'街道',''）
where t.addr like '%街道'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'道',''）
where t.addr like '%道'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'街',''）
where t.addr like '%街'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'路',''）
where t.addr like '%路'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'巷',''）
where t.addr like '%巷'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'地区',''）
where t.addr like '%地区'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'区',''）
where t.addr like '%区'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'县',''）
where t.addr like '%县'
and t.dis = '1'
;

select * from addr_pro_city_dis_tow_union t
where  t.dis = '1'

