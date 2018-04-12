create or replace procedure sp_load_map_tmp(V_LRD_ID in varchar2,
                                            --p_path   in varchar2,
                                            p_file in varchar2) is
  v_table_name varchar2(400); --    ��ʱ����
  V_length     int;
begin
  -- ��ȡ������
  v_table_name := 'tpl_' || fn_get_lrd_temp_table(p_file);

  -- select 'insert into sys_lrd_tmp_tab_map vlaues('''|| 'sys_lrd_'|| v_table_name ||''','' V_LRD_ID '',0)' from dual;
  v_table_name := replace(v_table_name, '2015', '');
  -- ��ȡ�ַ�������
  V_length := lengthb(v_table_name);
  -- �������30 ��ȡ����4λ����
  if (V_length > 30) then
    v_table_name := substr(v_table_name, 1, length(v_table_name) - 4);
    -- �ٴλ�ȡ����
    V_length := lengthb(v_table_name);
    -- �������30 ȡ��tpl_
    if (V_length > 30) then
      v_table_name := replace(v_table_name, 'tpl_', '');
      while (lengthb(v_table_name) > 30) loop
        v_table_name := substr(v_table_name, 1, length(v_table_name) - 1);
      end loop;
    
    end if;
  end if;
  -- ���յ���ʱ�������뵽���ݿ���
  insert into sys_lrd_tmp_tab_map
    (TMP_TABLE_NAME, LRD_TASK_ID, tab_stat)
  values
    (v_table_name, V_LRD_ID, '0');
  commit;

end;
/
