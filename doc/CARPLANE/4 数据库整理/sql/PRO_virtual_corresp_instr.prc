create or replace procedure PRO_virtual_corresp_instr(p_from_uuid varchar2, p_to_cols varchar2 )
as 
  v_from_cols varchar2(100);
  v_to_uuid varchar2(100);
  v_to_sort number;
  v_sql varchar2(4000);
begin
  select t.cols_name into  v_from_cols
   from wth.sys_zhcx_cols t
   where t.uuid = p_from_uuid;
   
   select t.uuid into v_to_uuid
   from wth.sys_zhcx_cols t
   where t.cols_name = p_to_cols
   and t.table_uuid = 'WTH_SYS_VIRTUAL_PERSION_BASE_INFO';
   
   select  t.cols_order into  v_to_sort
   from wth.sys_zhcx_cols t
   where t.cols_name = p_to_cols
   and t.table_uuid = 'WTH_SYS_VIRTUAL_PERSION_BASE_INFO';

 v_sql:= 'insert into sys_virtual_corresponding(uuid,from_uuid,from_cols,to_uuid,to_cols,sort,flag,delete_flag,insert_time,insert_user,update_time,update_user)'
          || 'values('''
          ||sys_guid()
          ||''','''||p_from_uuid
          ||''','''||v_from_cols
          ||''','''||v_to_uuid
          ||''','''||p_to_cols
          ||''','||v_to_sort
          ||','||'0'||','||'0'||',sysdate,''system'',sysdate,''system'')';
   --  dbms_output.put_line(v_sql);
    execute immediate(v_sql);      
          
          
 commit;
end;
/
