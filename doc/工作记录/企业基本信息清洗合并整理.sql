-- ��ҵ������Ϣ������ϴ
/*
shxg_qyxg_��˾������Ϣ
shxg_qyxg_��˾������Ϣ_8g
shxg_qyxg_��˾������Ϣ_����
shxg_qyxg_��˾������Ϣ_qyfl
shxg_qyxg_��˾������Ϣ_����1
shxg_qyxg_��˾������Ϣ_����
shxg_qyxg_��˾������Ϣ_����
*/

-- ȥ��û���õ�����
--drop table   
--drop table  shxg_qyxg_��˾������Ϣ_qyfl;
--drop table  shxg_qyxg_��˾������Ϣ_����1;
--drop table  shxg_qyxg_��˾������Ϣ_����;
--drop table  shxg_qyxg_��˾������Ϣ_����;
--drop table  shxg_qyxg_xyxg_��˾������Ϣ_sz;

-- NO1 �ϲ����ݿ� ������ʷ����
create table  shxg_qyxg_cropBase_unionall
as
select ע���,       ��֯��������,       ��˾����,       ��ҵ����,       ��������,       ��������,       ��������,       ��������,       ��ϸ��ַ,
       ������ҵ,       ��Ӫ��Χ,       ��Ӫ���,       ��������,       ע������,       ע���ʽ�,       ע������,       ��ҵ�Ǽ�״̬,       �����ڴ���,
       ��˰��,       ��˰��,       �������,       ���ߵǼǺ�,       ��ַ,       ��ϵ�绰,       �ֻ���,       ����,       Ա����,       ���˴���,       ���˵绰,
       ������Ϣ,       ����ʱ��,       �ɼ�ʱ��,       ������Դ,       ���ʱ��,       �ļ���,       �ֻ�,       ��������,       ������,       ��˾���,
       �Ǽǻ���,       ֤ȯ���,       ��˾Ӣ����,       ������,       ֤ȯ��Ʊ����ʷ,       ע���ַ,       ��˾���,       ��Ӫģʽ,       ��Ҫ��Ʒ,
       ְ��,       Ӫҵ������,       Ӫҵ������,       ��׼ʱ��,       �����ʽ
  from shxg_qyxg_��˾������Ϣ
union all
select ע���,       ��֯��������,       ��˾����,       ��ҵ����,       ��������,       ��������,       ��������,       ��������,       ��ϸ��ַ,
       ������ҵ,       ��Ӫ��Χ,       ��Ӫ���,       ��������,       ע������,       ע���ʽ�,       ע������,       ��ҵ�Ǽ�״̬,       �����ڴ���,
       ��˰��,       ��˰��,       �������,       ���ߵǼǺ�,       ��ַ,       ��ϵ�绰,       �ֻ���,       ����,       Ա����,       ���˴���,       ���˵绰,
       ������Ϣ,       ����ʱ��,       �ɼ�ʱ��,       ������Դ,       ���ʱ��,       �ļ���,       �ֻ�,       ��������,       ������,       ��˾���,
       �Ǽǻ���,       ֤ȯ���,       ��˾Ӣ����,       ������,       ֤ȯ��Ʊ����ʷ,       ע���ַ,       ��˾���,       ��Ӫģʽ,       ��Ҫ��Ʒ,
       ְ��,       Ӫҵ������,       Ӫҵ������,       ��׼ʱ��,       �����ʽ
  from shxg_qyxg_��˾������Ϣ_8g
;



-- NO��2 ɸѡ������Ҫ����Ϣ

--  1 cropBase_union_full_name

create table cropBase_unionall_temp as
select trim(ע���) as ע���,         trim(��֯��������) as ��֯��������,        trim(��˾����) as ��˾����,        trim(��ҵ����) as ��ҵ����,       
       trim(��������) as ��������,     trim(��������) as ��������,                trim(��������) as ��������,        trim(��ϸ��ַ) as ��ϸ��ַ,      
       trim(������ҵ) as ������ҵ,     trim(��Ӫ��Χ) as ��Ӫ��Χ,                trim(��Ӫ���) as ��Ӫ���,        trim(��������) as ��������,       
       trim(ע���ʽ�) as ע���ʽ�,     trim(ע������) as ע������,                trim(��ҵ�Ǽ�״̬) as ��ҵ�Ǽ�״̬,trim(�����ڴ���) as �����ڴ���,    
       trim(��������) as ��������, trim(��ϵ�绰) as ��ϵ�绰,                trim(�ֻ�) as �ֻ�,                trim(�ɼ�ʱ��) as �ɼ�ʱ��, 
       trim(��˰��) as ��˰��,         trim(��˰��) as ��˰��,                    trim(�������) as �������,        trim(���ߵǼǺ�) as ���ߵǼǺ�,               
       trim(�ֻ���) as �ֻ���,         trim(����) as ����,                        trim(Ա����) as Ա����,            trim(���˴���) as ���˴���,       
       trim(������Ϣ) as ������Ϣ,     trim(����ʱ��) as ����ʱ��,                trim(�ļ���) as �ļ���,            trim(������Դ) as ������Դ,                
       trim(��������) as ��������,     trim(������) as ������,                    trim(��˾���) as ��˾���,        trim(�Ǽǻ���) as �Ǽǻ���,              
       trim(������) as ������,         trim(֤ȯ��Ʊ����ʷ) as ֤ȯ��Ʊ����ʷ,trim(ע���ַ) as ע���ַ,        trim(��˾���) as ��˾���,        
       trim(ְ��) as ְ��,             trim(Ӫҵ������) as Ӫҵ������,            trim(Ӫҵ������) as Ӫҵ������,    trim(��׼ʱ��) as ��׼ʱ��,  
       trim(���˵绰) as ���˵绰,     trim(��ַ) as��ַ,                         trim(���ʱ��) as ���ʱ��,        trim(֤ȯ���) as ֤ȯ���,  
       trim(��Ӫģʽ) as ��Ӫģʽ,     trim(ע������) as ע������,                trim(��˾Ӣ����) as ��˾Ӣ����,    trim(��Ҫ��Ʒ) as ��Ҫ��Ʒ,
       trim(�����ʽ)  as �����ʽ
from shxg_qyxg_cropBase_unionall  t
where  t.��˾���� is not null;

-- 2 ȥ��  
-- I  1 ֱ���ó����ظ������ݵ����ձ���
/*
create table cropBase_union_full_name 
as
select * from cropBase_unionall_temp
where ��˾���� in(
  select ��˾���� from cropBase_unionall_temp
  group by ��˾����
  having count(1)<2
)
;

--    2 ȥ����ʱ���еĵ�����¼
delete from cropBase_unionall_temp
where ��˾���� in(
  select ��˾���� from cropBase_unionall_temp
  group by ��˾����
  having count(1)<2
)
;*/
-- II  ������¼�Ĵ���
--   1 �õ����ظ�����ҵ�� ��ע���
create table cropBase_union_full_name 
as
select  ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
       ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
       ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
       ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,       
       �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
       ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ 
from(
  select ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
       ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
       ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
       ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,       
       �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
       ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ ,row_number() over (partition by ��˾���� order by i desc) ord 
   from (
    select  ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
           ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
           ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
           ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,       
           �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
           ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+d5+d6+d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8
          ) i 
    from (
      select  ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
             ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
             ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,as��ַ as ��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
             ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,       
             �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
             ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ
            --,ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
            ,nvl2(ע���,1,0) a1,nvl2(��֯��������,1,0) a2,nvl2(��˾����,1,0) a3
            ,nvl2(��ҵ����,1,0) a4,nvl2(��������,1,0) a5,nvl2(��������,1,0) a6
            ,nvl2(��������,1,0) a7,nvl2(��������,1,0) a8,nvl2(��ϸ��ַ,1,0) a9
            --  ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
            ,nvl2(������ҵ,1,0) b1,nvl2(��Ӫ��Χ,1,0) b2,nvl2(��Ӫ���,1,0) b3
            ,nvl2(��������,1,0) b4,nvl2(ע������,1,0) b5,nvl2(ע���ʽ�,1,0) b6
            ,nvl2(ע������,1,0) b7,nvl2(��ҵ�Ǽ�״̬,1,0) b8,nvl2(�����ڴ���,1,0) b9
            -- ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,     
            ,nvl2(��˰��,1,0) c1,nvl2(��˰��,1,0) c2,nvl2(�������,1,0) c3
            ,nvl2(���ߵǼǺ�,1,0) c4,nvl2(as��ַ,1,0) c5,nvl2(��ϵ�绰,1,0) c6
            ,nvl2(�ֻ���,1,0) c7,nvl2(����,1,0) c8,nvl2(Ա����,1,0) c9
            -- ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,     
            ,nvl2(������Ϣ,1,0) d1,nvl2(����ʱ��,1,0) d2,nvl2(�ɼ�ʱ��,1,0) d3
            ,nvl2(������Դ,1,0) d4,nvl2(���ʱ��,1,0) d5,nvl2(�ļ���,1,0) d6
            ,nvl2(�ֻ�,1,0) d7,nvl2(��������,1,0) d8,nvl2(������,1,0) d9
            --  �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
            ,nvl2(�Ǽǻ���,1,0) e1,nvl2(֤ȯ���,1,0) e2,nvl2(��˾Ӣ����,1,0) e3
            ,nvl2(������,1,0) e4,nvl2(֤ȯ��Ʊ����ʷ,1,0) e5,nvl2(ע���ַ,1,0) e6
            ,nvl2(��˾���,1,0) e7,nvl2(��Ӫģʽ,1,0) e8,nvl2(��Ҫ��Ʒ,1,0) e9
            -- ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ
            ,nvl2(���˴���,1,0) f1,nvl2(��˾���,1,0) f2,nvl2(���˵绰,1,0) f3
            ,nvl2(ְ��,1,0) f4,nvl2(Ӫҵ������,1,0) f5,nvl2(Ӫҵ������,1,0) f6
            ,nvl2(��׼ʱ��,1,0) f7,nvl2(�����ʽ,1,0) f8

       from zhcx.cropBase_unionall_temp
      ) v
    )
  )
where ord=1
;
--   2  drop
--drop table cropBase_unionall_temp;


-- III ����
--   1 ע������� ���ô����ע���
alter table cropBase_union_full_name add ͳһ������ô��� varchar2(20);
update cropBase_union_full_name
set ͳһ������ô��� = ע���,
ע��� = ''
where lengthb(ע���) = 18
and ע��� not like '%-%'
and ע��� not like '%(%'
--lengthb(ע���) = length(ע���)
;
commit;
 
update cropBase_union_full_name
set ע��� = ͳһ������ô���
, ͳһ������ô��� = ''
where lengthb(ͳһ������ô���) <> length(ͳһ������ô���)
and ͳһ������ô��� is not null;
commit;

--   2 �ļ��� ���ʱ��
 alter table cropBase_union_full_name drop column �ļ���;  
 alter table cropBase_union_full_name drop column ���ʱ��;  
 
--  3  ��˾������ϴ
--  ɾ������
update cropBase_union_full_name
set ��˾���� = to_single_byte(��˾����)
;
commit;


delete from cropBase_union_full_name
where length(��˾����) = lengthb(��˾����);
commit;

delete from cropBase_union_full_name
where ��˾���� like '____��__��__��';
commit;
--
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'?',''))
where ��˾���� like '%?%';
commit;


-- �ñ����ʱ��




 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'
',''))
where ��˾���� like '%
%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'',''))
where ��˾���� like '%%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'!',''))
where ��˾���� like '%!%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'"',''))
where ��˾���� like '%"%';
commit;

--
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,')',''))
where ��˾���� like ')%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'.',''))
where ��˾���� like '%.%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'*',''))
where ��˾���� like '%*%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'+',''))
where ��˾���� like '+%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,',',''))
where ��˾���� like ',%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'-',''))
where ��˾���� like '-%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'/',''))
where ��˾���� like '/%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'=',''))
where ��˾���� like '=%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'>',''))
where ��˾���� like '>%';
commit;


 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,' ',''))
where ��˾���� like ' %';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '��%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'|',''))
where ��˾���� like '|%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'nbsp;',''))
where ��˾���� like 'nbsp;%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'~',''))
where ��˾���� like '~%';
commit;

 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'#',''))
where ��˾���� like '#%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'`',''))
where ��˾���� like '`%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'_',''))
where ��˾���� like '_%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'^',''))
where ��˾���� like '^%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,']',''))
where ��˾���� like ']%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'\',''))
where ��˾���� like '\%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'>',''))
where ��˾���� like '>%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'?',''))
where ��˾���� like '?%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'@',''))
where ��˾���� like '@%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,';',''))
where ��˾���� like ';%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'&',''))
where ��˾���� like '&%';
commit;
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'''',''))
where ��˾���� like '''%';
commit;
-- ȫ�ǿո�
 update cropBase_union_full_name
set ��˾���� = trim(replace(��˾����,'��',''))
where ��˾���� like '%��%';
commit;

--
select * from cropBase_union_full_name
where length(��˾����) = lengthb(��˾����)


--  *** ɾ�� �յ�
delete from cropBase_union_full_name
where length(��˾����) = lengthb(��˾����);
commit;

delete from cropBase_union_full_name t
where length(t.��˾����)<4
;
commit;
-- ����ȥ�����ɱ�
select t.��˾���� from cropBase_union_full_name t
group by t.��˾����
having count(1)>1



-- alter 
rename cropBase_union_full_name to cropBase_unionall_temp1;


create table cropBase_union_full_name 
as
select  ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
       ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
       ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
       ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ, /* ���ʱ��,        �ļ���,*/    �ֻ�,     ��������,    ������,       
       �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
       ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ ,ͳһ������ô���
from(
  select ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
       ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
       ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
       ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  /*���ʱ��,        �ļ���,  */  �ֻ�,     ��������,    ������,       
       �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
       ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ,ͳһ������ô���
        ,row_number() over (partition by ��˾���� order by i desc) ord 
   from (
    select  ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
           ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
           ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
           ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ, /* ���ʱ��,        �ļ���,*/    �ֻ�,     ��������,    ������,       
           �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
           ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ,ͳһ������ô���,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+ d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8+f9
          ) i 
    from (
      select  ע���,  ��֯��������,trim(��˾����) as ��˾���� ,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
             ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
             ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ as ��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,            
             ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  /*���ʱ��,        �ļ���,*/    �ֻ�,     ��������,    ������,       
             �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
             ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ,ͳһ������ô���
            --,ע���,  ��֯��������,��˾����,  ��ҵ����,  ��������,      ��������,  ��������, ��������,    ��ϸ��ַ,
            ,nvl2(ע���,1,0) a1,nvl2(��֯��������,1,0) a2,nvl2(��˾����,1,0) a3
            ,nvl2(��ҵ����,1,0) a4,nvl2(��������,1,0) a5,nvl2(��������,1,0) a6
            ,nvl2(��������,1,0) a7,nvl2(��������,1,0) a8,nvl2(��ϸ��ַ,1,0) a9
            --  ������ҵ,��Ӫ��Χ,    ��Ӫ���,  ��������,  ע������,        ע���ʽ�,  ע������, ��ҵ�Ǽ�״̬,�����ڴ���,
            ,nvl2(������ҵ,1,0) b1,nvl2(��Ӫ��Χ,1,0) b2,nvl2(��Ӫ���,1,0) b3
            ,nvl2(��������,1,0) b4,nvl2(ע������,1,0) b5,nvl2(ע���ʽ�,1,0) b6
            ,nvl2(ע������,1,0) b7,nvl2(��ҵ�Ǽ�״̬,1,0) b8,nvl2(�����ڴ���,1,0) b9
            -- ��˰��,  ��˰��,      �������,  ���ߵǼǺ�,��ַ,            ��ϵ�绰,  �ֻ���,   ����,        Ա����,     
            ,nvl2(��˰��,1,0) c1,nvl2(��˰��,1,0) c2,nvl2(�������,1,0) c3
            ,nvl2(���ߵǼǺ�,1,0) c4,nvl2(��ַ,1,0) c5,nvl2(��ϵ�绰,1,0) c6
            ,nvl2(�ֻ���,1,0) c7,nvl2(����,1,0) c8,nvl2(Ա����,1,0) c9
            -- ������Ϣ,����ʱ��,    �ɼ�ʱ��,  ������Դ,  ���ʱ��,        �ļ���,    �ֻ�,     ��������,    ������,     
            ,nvl2(������Ϣ,1,0) d1,nvl2(����ʱ��,1,0) d2,nvl2(�ɼ�ʱ��,1,0) d3
            ,nvl2(������Դ,1,0) d4 /* ,nvl2(���ʱ��,1,0) d5,nvl2(�ļ���,1,0) d6 */
            ,nvl2(�ֻ�,1,0) d7,nvl2(��������,1,0) d8,nvl2(������,1,0) d9
            --  �Ǽǻ���,֤ȯ���,    ��˾Ӣ����,������,    ֤ȯ��Ʊ����ʷ,ע���ַ,  ��˾���, ��Ӫģʽ,    ��Ҫ��Ʒ,
            ,nvl2(�Ǽǻ���,1,0) e1,nvl2(֤ȯ���,1,0) e2,nvl2(��˾Ӣ����,1,0) e3
            ,nvl2(������,1,0) e4,nvl2(֤ȯ��Ʊ����ʷ,1,0) e5,nvl2(ע���ַ,1,0) e6
            ,nvl2(��˾���,1,0) e7,nvl2(��Ӫģʽ,1,0) e8,nvl2(��Ҫ��Ʒ,1,0) e9
            -- ���˴���,��˾���,    ���˵绰,  ְ��,      Ӫҵ������,      Ӫҵ������,��׼ʱ��, �����ʽ
            ,nvl2(���˴���,1,0) f1,nvl2(��˾���,1,0) f2,nvl2(���˵绰,1,0) f3
            ,nvl2(ְ��,1,0) f4,nvl2(Ӫҵ������,1,0) f5,nvl2(Ӫҵ������,1,0) f6
            ,nvl2(��׼ʱ��,1,0) f7,nvl2(�����ʽ,1,0) f8,nvl2(ͳһ������ô���,1,0) f9

       from zhcx.cropBase_unionall_temp1
      ) v
    )
  )
where ord=1
;

-- 
drop table cropBase_unionall_temp1
;



-- ����ϵͳ��

--  �������ݿ�  
--  ɾ�� ���ݱ�
/*
shxg_qyxg_��˾������Ϣ
shxg_qyxg_��˾������Ϣ_8g
*/
 
