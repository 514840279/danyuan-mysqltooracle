--第一步清洗
CREATE OR REPLACE VIEW zhcx.company_abbreviation_1 AS
SELECT t1.company_name,p1.name,
       replace(TRIM(t1.company_name),p1.name||p1.type,'') 
        company_abbreviation
FROM  zhcx.mv_company t1,
      zhcx.province p1
WHERE t1.company_name LIKE '%'||p1.name||p1.type||'%'
UNION ALL
SELECT t1.company_name,p1.name,
replace(TRIM(t1.company_name),p1.name,'')
FROM  zhcx.mv_company t1,
      zhcx.province p1
WHERE t1.company_name LIKE '%'||p1.name||'%' 
AND NOT (
t1.company_name LIKE '%'||p1.name||p1.type||'%'
)
UNION ALL
SELECT t1.company_name,p1.name,
t1.company_name
FROM  zhcx.mv_company t1,
      zhcx.province p1
WHERE t1.company_name NOT LIKE '%'||p1.name||'%' ;

--第二部清洗
CREATE OR REPLACE VIEW zhcx.company_abbreviation_2 AS
SELECT t1.company_name,
       REPLACE(t1.company_abbreviation,c1.name||c1.city_type,'') company_abbreviation
FROM zhcx.company_abbreviation_1 t1,
     zhcx.city c1
WHERE t1.company_abbreviation LIKE '%'||c1.name||c1.city_type||'%'
UNION ALL
SELECT t1.company_name,
       REPLACE(t1.company_abbreviation,c1.name,'') company_abbreviation
FROM zhcx.company_abbreviation_1 t1,
     zhcx.city c1
WHERE t1.company_abbreviation LIKE '%'||c1.name||'%'
AND NOT (
t1.company_name LIKE '%'||c1.name||c1.city_type||'%'
)   
UNION ALL 
SELECT t1.company_name,
       t1.company_abbreviation
FROM zhcx.company_abbreviation_1 t1,
     zhcx.city c1
WHERE t1.company_abbreviation NOT LIKE '%'||c1.name||'%';

--第三步清洗
CREATE OR REPLACE VIEW zhcx.company_abbreviation_3 AS
SELECT t1.company_name,
       REPLACE(t1.company_abbreviation,d1.name2,'') company_abbreviation
FROM zhcx.company_abbreviation_2 t1,
     zhcx.district d1
WHERE t1.company_abbreviation LIKE '%'||d1.name2||'%'   
UNION ALL 
SELECT t1.company_name,
       t1.company_abbreviation company_abbreviation   
FROM zhcx.company_abbreviation_2 t1,
     zhcx.district d1
WHERE t1.company_abbreviation NOT LIKE  '%'||d1.name2||'%'; 

--第四步清洗
CREATE OR REPLACE VIEW zhcx.company_abbreviation_4 AS
SELECT t1.company_name,
       SUBSTR(t1.COMPANY_ABBREVIATION,0,INSTR(t1.COMPANY_ABBREVIATION,'发展股份有限公司')-1) company_abbreviation
FROM zhcx.company_abbreviation_3 t1
WHERE INSTR(t1.COMPANY_ABBREVIATION,'发展股份有限公司')>1
UNION ALL 
SELECT t1.company_name,
       SUBSTR(t1.COMPANY_ABBREVIATION,0,INSTR(t1.COMPANY_ABBREVIATION,'股份有限公司')-1) company_abbreviation
FROM zhcx.company_abbreviation_3 t1
WHERE INSTR(t1.COMPANY_ABBREVIATION,'股份有限公司')>1 
AND NOT (INSTR(t1.COMPANY_ABBREVIATION,'发展股份有限公司')>1)   
UNION ALL 
SELECT t1.company_name,
       SUBSTR(t1.COMPANY_ABBREVIATION,0,INSTR(t1.COMPANY_ABBREVIATION,'有限责任公司')-1) company_abbreviation
FROM zhcx.company_abbreviation_3 t1
WHERE INSTR(t1.COMPANY_ABBREVIATION,'有限责任公司')>1       
UNION ALL 
SELECT t1.company_name,
       SUBSTR(t1.COMPANY_ABBREVIATION,0,INSTR(t1.COMPANY_ABBREVIATION,'有限责任公司')-1) company_abbreviation
FROM zhcx.company_abbreviation_3 t1
WHERE INSTR(t1.COMPANY_ABBREVIATION,'有限责任公司')>1 
UNION ALL
SELECT t1.company_name,
       t1.company_abbreviation company_abbreviation
FROM zhcx.company_abbreviation_3 t1
WHERE  t1.company_abbreviation NOT LIKE '有限公司'
   OR  t1.company_abbreviation NOT LIKE '有限责任公司';

explain plan for
SELECT * FROM zhcx.company_abbreviation_4;
select * from table(dbms_xplan.display());
select * from table(dbms_xplan.display(format=>'ALL'));

SELECT * FROM zhcx.company_abbreviation_4;

exec dbms_sqltune.drop_tuning_task('test_sql_tuning_task1');

DECLARE 
my_task_name VARCHAR2(30); 
my_sqltext CLOB; 
BEGIN 
my_sqltext := '
SELECT * FROM zhcx.company_abbreviation_4
';
my_task_name := DBMS_SQLTUNE.CREATE_TUNING_TASK( 
sql_text => my_sqltext, 
user_name => 'SCOTT', 
scope => 'COMPREHENSIVE', 
time_limit => 600, 
task_name => 'test_sql_tuning_task1', 
description => 'Task to tune a query'); 
DBMS_SQLTUNE.EXECUTE_TUNING_TASK(task_name => 'test_sql_tuning_task1');
END; 
/
--select * from dba_advisor_tasks where task_name='test_sql_tuning_task1';

SELECT DBMS_SQLTUNE.REPORT_TUNING_TASK('test_sql_tuning_task1', 'TEXT', 'ALL', 'ALL') FROM DUAL;

execute dbms_sqltune.accept_sql_profile(task_name => 'test_sql_tuning_task1', task_owner => 'SYS', replace => TRUE);

create index ZHCX.IDX$$_18760001 on ZHCX.MV_COMPANY("COMPANY_NAME");

explain plan for
SELECT /*+parallel(t,8)*/ * FROM zhcx.company_abbreviation_4 t;
select * from table(dbms_xplan.display);

create table zhcx.company_abbreviation as 
SELECT * FROM zhcx.company_abbreviation_4
;

