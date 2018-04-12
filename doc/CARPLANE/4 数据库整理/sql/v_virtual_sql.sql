create or replace view v_virtual_sql as
select t1.table_name as from_tables,
t2.table_name as to_tables,
'select ' ||wm_concat(c.cols_name)||' from ' ||t1.table_name as find_sql,
t.delete_flag
-- 'insert into sys_virtual_temp(t.key_code ,t.key_name,t.key_value,INSERT_TIME,INSERT_USER,UPDATE_TIME,UPDATE_USER)  select ''QQHM'' as  key_code ,''QQ'' as key_name,'||c.cols_name||' key_value,sysdate as  from '||t1.table_name||' ' as dis_sql
 from sys_virtual_corresponding t
inner join sys_zhcx_cols c on t.from_uuid = c.uuid
inner join sys_zhcx_cols c2 on t.to_uuid = c2.uuid
inner join sys_zhcx_tabs t1 on t1.uuid = c.table_uuid
inner join sys_zhcx_tabs t2 on t2.uuid = c2.table_uuid
where t2.table_name = upper('wth.sys_virtual_persion_base_info')
group by t1.table_name,t2.table_name,t.delete_flag

