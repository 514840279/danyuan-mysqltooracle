
select * from ganji t;

-- ��ȡ ��ҵ��¼
insert into ��ҵ��¼_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.��ҵ���ô���,t.ע���,t.��˾����,t.��˾���
 from company_2016822_union t) a
 
 
 
-- ������������ҵ
insert into ��ҵ��¼_20160823 (uuid,��˾����)
select replace(sys_guid(), '-', '') as uuid,c.��˾���� from (
select distinct
t.��˾����
from ���ڸ��¼�����ҵ԰԰����ҵ��Ŀ t
where not exists
(select 1 from ��ҵ��¼_20160823 a
where a.��˾���� = t.��˾����
) 
)c


-- ���� 18 �������ô���
update company_name_20160823 t
set t.���ô��� = t.ע���
,t.ע��� = ''
where lengthb(t.ע���)=18
and  t.���ô���  not like '%-%'
and  t.���ô��� not  like '%)%'
and  t.���ô��� is null
;
-- ��Ҫ����
update company_name_20160823 t
set  t.ע���= t.���ô���
,t.���ô��� = ''
where length(t.���ô���)<>lengthb(t.���ô���)
or t.���ô��� like '%-%'
or t.���ô��� like '%)%'
where t.ע��� is null
;
-- ȫ��ת���
update company_name_20160823 t
set ��˾���� = to_single_byte(��˾����)
;

select * from company_name_20160823 t
--where t.���ô��� is not null
;

-- �ó�����
create  table tmp_company_name_20160823 as
select replace(sys_guid(),'-','') as uuid,xm from( 
select  distinct t.��˾���� as xm   from company_name_20160823 t
where length(t.��˾����) between 2 and 3
);


-- �ƿ�
update company_name_20160823 t
set ��˾���� =''
where length(t.��˾����) < 4
;
commit;
-- ɾ��������
delete from company_name_20160823 t
where t.���ô��� is null
and t.ע��� is null
and t.��˾���� is null
;
commit;

update company_name_20160823
set ע��� =��˾����,
��˾����=''
where length(��˾����) = lengthb(��˾����)
;
commit;

-- ��������
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
set ��˾���� = trim(replace(��˾����,'?',''))
where ��˾���� like '%?%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'
',''))
where ��˾���� like '%
%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;


 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;


 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'!',''))
where ��˾���� like '%!%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'"',''))
where ��˾���� like '%"%';
commit;

--
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,')',''))
where ��˾���� like ')%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'.',''))
where ��˾���� like '%.%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'*',''))
where ��˾���� like '%*%';
commit;


 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'+',''))
where ��˾���� like '+%';
commit;


 update company_name_20160823
set ��˾���� = trim(replace(��˾����,',',''))
where ��˾���� like ',%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'-',''))
where ��˾���� like '-%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'/',''))
where ��˾���� like '/%';
commit;



--

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'=',''))
where ��˾���� like '=%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'>',''))
where ��˾���� like '>%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,' ',''))
where ��˾���� like ' %';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'|',''))
where ��˾���� like '|%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'nbsp;',''))
where ��˾���� like 'nbsp;%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'~',''))
where ��˾���� like '~%';
commit;

 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'#',''))
where ��˾���� like '#%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'`',''))
where ��˾���� like '`%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'_',''))
where ��˾���� like '_%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'^',''))
where ��˾���� like '^%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,']',''))
where ��˾���� like ']%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'\',''))
where ��˾���� like '\%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'>',''))
where ��˾���� like '>%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'?',''))
where ��˾���� like '?%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'@',''))
where ��˾���� like '@%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,';',''))
where ��˾���� like ';%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'&',''))
where ��˾���� like '&%';
commit;
 update company_name_20160823
set ��˾���� = trim(replace(��˾����,'''',''))
where ��˾���� like '''%';
commit;

 update company_name_20160823
set ��˾���� = trim(��˾����)
--where ��˾���� like '''%';
;
commit;

--
select * from company_name_20160823
where length(��˾����) = lengthb(��˾����)


=======
select * from ganji t;

-- ��ȡ ��ҵ��¼
insert into ��ҵ��¼_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.��ҵ���ô���,t.ע���,t.��˾����,t.��˾���
 from company_2016822_union t) a
 
 
 
-- ������������ҵ
insert into ��ҵ��¼_20160823 (uuid,��˾����)
select replace(sys_guid(), '-', '') as uuid,c.��˾���� from (
select distinct
t.��˾����
from ���ڸ��¼�����ҵ԰԰����ҵ��Ŀ t
where not exists
(select 1 from ��ҵ��¼_20160823 a
where a.��˾���� = t.��˾����
) 
)c


