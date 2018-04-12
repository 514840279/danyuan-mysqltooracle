create or replace procedure sp_load_map_tmp(V_LRD_ID in varchar2,
                                            --p_path   in varchar2,
                                            p_file in varchar2) is
  v_table_name varchar2(400); --    临时表名
  V_length     int;
begin
  -- 获取短名称
  v_table_name := 'tpl_' || fn_get_lrd_temp_table(p_file);

  -- select 'insert into sys_lrd_tmp_tab_map vlaues('''|| 'sys_lrd_'|| v_table_name ||''','' V_LRD_ID '',0)' from dual;
  v_table_name := replace(v_table_name, '2015', '');
  -- 获取字符串长度
  V_length := lengthb(v_table_name);
  -- 如果大于30 截取掉后4位日期
  if (V_length > 30) then
    v_table_name := substr(v_table_name, 1, length(v_table_name) - 4);
    -- 再次获取长度
    V_length := lengthb(v_table_name);
    -- 如果大于30 取消tpl_
    if (V_length > 30) then
      v_table_name := replace(v_table_name, 'tpl_', '');
      while (lengthb(v_table_name) > 30) loop
        v_table_name := substr(v_table_name, 1, length(v_table_name) - 1);
      end loop;
    
    end if;
  end if;
  -- 最终的临时表名插入到数据库中
  insert into sys_lrd_tmp_tab_map
    (TMP_TABLE_NAME, LRD_TASK_ID, tab_stat)
  values
    (v_table_name, V_LRD_ID, '0');
  commit;

end;
/
