
select * from ganji t;

-- ÌáÈ¡ ÆóÒµÃûÂ¼
insert into ÆóÒµÃûÂ¼_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.ÆóÒµĞÅÓÃ´úÂë,t.×¢²áºÅ,t.¹«Ë¾Ãû³Æ,t.¹«Ë¾¼ò³Æ
 from company_2016822_union t) a
 
 
 
-- ÕûºÏÆäËûµÄÆóÒµ
insert into ÆóÒµÃûÂ¼_20160823 (uuid,¹«Ë¾Ãû³Æ)
select replace(sys_guid(), '-', '') as uuid,c.¹«Ë¾Ãû³Æ from (
select distinct
t.¹«Ë¾Ãû³Æ
from ÉîÛÚ¸ßĞÂ¼¼Êõ²úÒµÔ°Ô°ÇøÆóÒµÏîÄ¿ t
where not exists
(select 1 from ÆóÒµÃûÂ¼_20160823 a
where a.¹«Ë¾Ãû³Æ = t.¹«Ë¾Ãû³Æ
) 
)c


-- ³¤¶È 18 µÄÊÇĞÅÓÃ´úÂë
update company_name_20160823 t
set t.ĞÅÓÃ´úÂë = t.×¢²áºÅ
,t.×¢²áºÅ = ''
where lengthb(t.×¢²áºÅ)=18
and  t.ĞÅÓÃ´úÂë  not like '%-%'
and  t.ĞÅÓÃ´úÂë not  like '%)%'
and  t.ĞÅÓÃ´úÂë is null
;
-- ²»Òªºº×Ö
update company_name_20160823 t
set  t.×¢²áºÅ= t.ĞÅÓÃ´úÂë
,t.ĞÅÓÃ´úÂë = ''
where length(t.ĞÅÓÃ´úÂë)<>lengthb(t.ĞÅÓÃ´úÂë)
or t.ĞÅÓÃ´úÂë like '%-%'
or t.ĞÅÓÃ´úÂë like '%)%'
where t.×¢²áºÅ is null
;
-- È«½Ç×ª°ë½Ç
update company_name_20160823 t
set ¹«Ë¾Ãû³Æ = to_single_byte(¹«Ë¾Ãû³Æ)
;

select * from company_name_20160823 t
--where t.ĞÅÓÃ´úÂë is not null
;

-- ÄÃ³öĞÕÃû
create  table tmp_company_name_20160823 as
select replace(sys_guid(),'-','') as uuid,xm from( 
select  distinct t.¹«Ë¾Ãû³Æ as xm   from company_name_20160823 t
where length(t.¹«Ë¾Ãû³Æ) between 2 and 3
);


-- ÖÆ¿Õ
update company_name_20160823 t
set ¹«Ë¾Ãû³Æ =''
where length(t.¹«Ë¾Ãû³Æ) < 4
;
commit;
-- É¾³ı¿ÕÊı¾İ
delete from company_name_20160823 t
where t.ĞÅÓÃ´úÂë is null
and t.×¢²áºÅ is null
and t.¹«Ë¾Ãû³Æ is null
;
commit;

update company_name_20160823
set ×¢²áºÅ =¹«Ë¾Ãû³Æ,
¹«Ë¾Ãû³Æ=''
where length(¹«Ë¾Ãû³Æ) = lengthb(¹«Ë¾Ãû³Æ)
;
commit;

-- µ¼ÈëĞÕÃû
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
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'?',''))
where ¹«Ë¾Ãû³Æ like '%?%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'
',''))
where ¹«Ë¾Ãû³Æ like '%
%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;


 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;


 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'!',''))
where ¹«Ë¾Ãû³Æ like '%!%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'"',''))
where ¹«Ë¾Ãû³Æ like '%"%';
commit;

--
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,')',''))
where ¹«Ë¾Ãû³Æ like ')%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'.',''))
where ¹«Ë¾Ãû³Æ like '%.%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'*',''))
where ¹«Ë¾Ãû³Æ like '%*%';
commit;


 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'+',''))
where ¹«Ë¾Ãû³Æ like '+%';
commit;


 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,',',''))
where ¹«Ë¾Ãû³Æ like ',%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'-',''))
where ¹«Ë¾Ãû³Æ like '-%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'/',''))
where ¹«Ë¾Ãû³Æ like '/%';
commit;



--

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'=',''))
where ¹«Ë¾Ãû³Æ like '=%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'>',''))
where ¹«Ë¾Ãû³Æ like '>%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,' ',''))
where ¹«Ë¾Ãû³Æ like ' %';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¯',''))
where ¹«Ë¾Ãû³Æ like '¡¯%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¬',''))
where ¹«Ë¾Ãû³Æ like '¡¬%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¤',''))
where ¹«Ë¾Ãû³Æ like '¡¤%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡£',''))
where ¹«Ë¾Ãû³Æ like '¡£%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡£',''))
where ¹«Ë¾Ãû³Æ like '¡£%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'|',''))
where ¹«Ë¾Ãû³Æ like '|%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'nbsp;',''))
where ¹«Ë¾Ãû³Æ like 'nbsp;%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'~',''))
where ¹«Ë¾Ãû³Æ like '~%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'#',''))
where ¹«Ë¾Ãû³Æ like '#%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'`',''))
where ¹«Ë¾Ãû³Æ like '`%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'_',''))
where ¹«Ë¾Ãû³Æ like '_%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'^',''))
where ¹«Ë¾Ãû³Æ like '^%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,']',''))
where ¹«Ë¾Ãû³Æ like ']%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'\',''))
where ¹«Ë¾Ãû³Æ like '\%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'>',''))
where ¹«Ë¾Ãû³Æ like '>%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'?',''))
where ¹«Ë¾Ãû³Æ like '?%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'@',''))
where ¹«Ë¾Ãû³Æ like '@%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,';',''))
where ¹«Ë¾Ãû³Æ like ';%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'&',''))
where ¹«Ë¾Ãû³Æ like '&%';
commit;
 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'''',''))
where ¹«Ë¾Ãû³Æ like '''%';
commit;

 update company_name_20160823
set ¹«Ë¾Ãû³Æ = trim(¹«Ë¾Ãû³Æ)
--where ¹«Ë¾Ãû³Æ like '''%';
;
commit;

--
select * from company_name_20160823
where length(¹«Ë¾Ãû³Æ) = lengthb(¹«Ë¾Ãû³Æ)


=======
select * from ganji t;

-- ÌáÈ¡ ÆóÒµÃûÂ¼
insert into ÆóÒµÃûÂ¼_20160823
select replace(sys_guid(), '-', '') as uuid,a.* from (
select distinct
t.ÆóÒµĞÅÓÃ´úÂë,t.×¢²áºÅ,t.¹«Ë¾Ãû³Æ,t.¹«Ë¾¼ò³Æ
 from company_2016822_union t) a
 
 
 
-- ÕûºÏÆäËûµÄÆóÒµ
insert into ÆóÒµÃûÂ¼_20160823 (uuid,¹«Ë¾Ãû³Æ)
select replace(sys_guid(), '-', '') as uuid,c.¹«Ë¾Ãû³Æ from (
select distinct
t.¹«Ë¾Ãû³Æ
from ÉîÛÚ¸ßĞÂ¼¼Êõ²úÒµÔ°Ô°ÇøÆóÒµÏîÄ¿ t
where not exists
(select 1 from ÆóÒµÃûÂ¼_20160823 a
where a.¹«Ë¾Ãû³Æ = t.¹«Ë¾Ãû³Æ
) 
)c


