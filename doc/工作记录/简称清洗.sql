-- ***************   ��ҵ��� *********************

-- ��˾
update company_name_20160823 t
set t.��˾��� = t.��˾����
where t.��˾���� like '%��˾'
;
commit;
-- ��ϴ

update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'·')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'����')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'ʡ')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,instr(t.��˾���,'��')+1)
where t.��˾��� is not null
and length(t.��˾���) >4
;

update company_name_20160823 t
set t.��˾��� = substr(t.��˾���,0,instr(t.��˾���,'�������ι�˾')-3)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� =substr(t.��˾���,0,instr(t.��˾���,'���޹�˾')-3)
where t.��˾��� is not null
and length(t.��˾���) >4
;
update company_name_20160823 t
set t.��˾��� =substr(t.��˾���,0,instr(t.��˾���,'��˾')-3)
where t.��˾��� is not null
and length(t.��˾���) >4
;
commit;




select substr(t.��˾���,instr(t.��˾���,'��')+1) from company_name_20160823 t
where t.��˾��� like '%��%'
;



-- ��������
create table addr_pro_city_dis_tow as
select distinct  province,city,district,township from smaddr.amap_poi_20160706@dblink_sys_172_16_3_17 t
;
-- ����һ��
create table addr_pro_city_dis_tow_union as
select distinct t.province as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.city  as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.district  as addr ,'' as dis from addr_pro_city_dis_tow t
union
select distinct t.township  as addr ,'' as dis from addr_pro_city_dis_tow t
;

-- ��ϴ ������

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'ʡ',''��
where t.addr like '%ʡ'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'�ֵ�',''��
where t.addr like '%�ֵ�'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'·',''��
where t.addr like '%·'
and t.dis = '1'
;
update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'����',''��
where t.addr like '%����'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;

update addr_pro_city_dis_tow_union t
set t.dis = replace(t.addr,'��',''��
where t.addr like '%��'
and t.dis = '1'
;

select * from addr_pro_city_dis_tow_union t
where  t.dis = '1'

