-- 查询拼接 姓名字段 做字典
select 'insert into RYXM_20160926 (uuid,xm) select replace(sys_guid(), ''-'', '''') as uuid,c.xm from (select distinct t.'||t.cols_name||' as xm from '||t1.table_name||'@dblink_172_16_3_17 t where not exists(select 1 from RYXM_20160926 a where a.xm = t.'||t.cols_name||') )c;
commit;'  as b
from sys_zhcx_cols@dblink_172_16_3_17 t ,sys_zhcx_tabs@dblink_172_16_3_17 t1
where t.table_uuid =t1.uuid
and (t.user_index = 'RYXM'
or t.cols_name = '姓名')
and t1.table_name not like '%dblink_172_16_3_18'

union 

select  'insert into RYXM_20160926 (uuid,xm) select replace(sys_guid(), ''-'', '''') as uuid,c.xm from (select distinct t.'||t.cols_name||' as xm from '||t1.table_name||' t where not exists(select 1 from RYXM_20160926 a where a.xm = t.'||t.cols_name||') )c;
commit;'  as b
 from sys_zhcx_cols@dblink_172_16_3_17 t ,
      sys_zhcx_tabs@dblink_172_16_3_17 t1
where t.table_uuid =t1.uuid
and (t.user_index = 'RYXM'
or t.cols_name = '姓名')
and t1.table_name  like '%dblink_172_16_3_18';

