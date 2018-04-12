-- 提取有工作经验的信息
create table ganji as
select * from ci_ganji_resume_3_201509_01 t
where t.exp_comp1 is not null;
--
insert into ganji
select * from ci_ganji_resume_1_201508_04 t
where t.exp_comp1 is not null;


insert into ganji
select * from ci_ganji_resume_1_201509_01 t
where t.exp_comp1 is not null;


insert into ganji
select * from ci_ganji_resume_201508_04 t
where t.exp_comp1 is not null;

insert into ganji
select * from ci_ganji_resume_3_201509_03 t
where t.exp_comp1 is not null;

insert into ganji
select * from ci_ganji_resume_5_201509_03 t
where t.exp_comp1 is not null;

insert into ganji
select * from ci_ganji_resume_6_201509_03 t
where t.exp_comp1 is not null;


insert into ganji
select * from ci_ganji_resume_7_201509_03 t
where t.exp_comp1 is not null;



insert into ganji
select * from ci_ganji_resume_mdj_20150615 t
where t.exp_comp1 is not null;

insert into ganji
select * from ci_ganji_resume_xj_201509_03 t
where t.exp_comp1 is not null;

-- 添加主键约束
select * from ganji t

-- 创建表赶集 工作经验
create table ganji_exp(
uuid_ganji varchar2(32),
exp_comp varchar2(4000),
exp_dec varchar2(4000),
时间 varchar2(2000),
所属行业 varchar2(2000),
职务 varchar2(2000),
工作内容 varchar2(2000)
);


--拆分工作经验
insert into ganji_exp(uuid_ganji,exp_comp,exp_dec)
select t.uuid,t.exp_comp1,t.exp_desc1 from ganji t
union all 
select t.uuid,t.exp_comp2,t.exp_desc2 from ganji t
where t.exp_comp2 is not null
union all 
select t.uuid,t.exp_comp3,t.exp_desc3 from ganji t
where t.exp_comp3 is not null
union all 
select t.uuid,t.exp_comp4,t.exp_desc4 from ganji t
where t.exp_comp4 is not null
union all 
select t.uuid,t.exp_comp5,t.exp_desc5 from ganji t
where t.exp_comp5 is not null
union all 
select t.uuid,t.exp_comp6,t.exp_desc6 from ganji t
where t.exp_comp6 is not null
union all 
select t.uuid,t.exp_comp7,t.exp_desc7 from ganji t
where t.exp_comp7 is not null

-- 数据清洗 出 工作时间 ， 行业，职务， 工作内容
update ganji_exp t
set t.时间 =  split_getinfo(t.exp_dec,'//',0),
 t.所属行业= replace (split_getinfo(t.exp_dec,'//',1),'/行业:',''),
 t.职务 = replace (split_getinfo(t.exp_dec,'//',2),'/职务:',''),
 t.工作内容 = replace (split_getinfo(t.exp_dec,'//',3),'/工作内容:','')

