-- ��ȡ�й����������Ϣ
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

-- �������Լ��
select * from ganji t

-- ������ϼ� ��������
create table ganji_exp(
uuid_ganji varchar2(32),
exp_comp varchar2(4000),
exp_dec varchar2(4000),
ʱ�� varchar2(2000),
������ҵ varchar2(2000),
ְ�� varchar2(2000),
�������� varchar2(2000)
);


--��ֹ�������
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

-- ������ϴ �� ����ʱ�� �� ��ҵ��ְ�� ��������
update ganji_exp t
set t.ʱ�� =  split_getinfo(t.exp_dec,'//',0),
 t.������ҵ= replace (split_getinfo(t.exp_dec,'//',1),'/��ҵ:',''),
 t.ְ�� = replace (split_getinfo(t.exp_dec,'//',2),'/ְ��:',''),
 t.�������� = replace (split_getinfo(t.exp_dec,'//',3),'/��������:','')

