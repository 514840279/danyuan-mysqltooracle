-- ****��ƹ�˾Ա��
select * from SHXX_QYXG_HJXG_��˾��Ϣ;
-- ***���и߹�����
select * from  WLXX_GSXG_DJGXX
-- ***��ҵͨѶ¼
select * from ��ҵԱ��ͨѶ¼
-- ������Ϣ
select * from ZHCX_GSML_T;
-- ��ҵ��Ʒ
select * from  SHUNQIWANG_CHANPIN;






-- ֻ����ҵ���� ������Ϣ
select * from  ��ҵ������Ϣ ;
-- g��˾�� ��Ʊ����
select * from ��˾����Ʊ����;
-- �ٶ���Ƹ��Ϣ
select * from �ٶ���Ƹ��Ϣ where t_companyname is not null;
-- ��ҵ��Ŀ
select * from ���ڸ��¼�����ҵ԰԰����ҵ��Ŀ;

--�й���������ҵ
select * from  �й���������ҵ;

-- ������������ҵ
insert into ��ҵ��¼_20160823 (uuid,��˾����)
select replace(sys_guid(), '-', '') as uuid,c.��˾���� from (
select distinct
t.company as ��˾����
from company_info_large_dis t
where 
company  is not null and
not exists
(select 1 from ��ҵ��¼_20160823 a
where a.��˾���� = t.company
) 
)c


insert into ��ҵ��¼_20160823 (uuid,��˾����)
select replace(sys_guid(), '-', '') as uuid,c.��˾���� from (
select distinct
t.company as ��˾����
from company_info_little_1 t
where 
company  is not null and
not exists
(select 1 from ��ҵ��¼_20160823 a
where a.��˾���� = t.company
) 
)c




insert into ��ҵ��¼_20160823 (uuid,��˾����)
select replace(sys_guid(), '-', '') as uuid,c.��˾���� from (
select distinct
t.comname as ��˾����
from ��ҵ��Ʒ t
where 
comname  is not null and
not exists
(select 1 from ��ҵ��¼_20160823 a
where a.��˾���� = t.comname
) 
)c


drop table �й���������ҵ



