create or replace procedure SP_CHECK(p_filepath in varchar2, -- �ļ�·��
                                     p_filename in varchar2, -- �ļ�����
                                     p_ret      in out integer -- ���̿���
                                     ) as
  CURSOR C_cols_map IS --������ʽ�α�  
    select distinct file_desc
      from sys_lrd_cols_map t
     where t.tab_name is null
     and t.file_col <> 'id';

  V_cols_map sys_lrd_cols_map%ROWTYPE; --�����α�������ñ���������Ϊ�����α�C_EMP�ļ�¼  û��д���ֶ������ļ�

  CURSOR C_file_map IS --������ʽ�α�  
    select distinct file_desc
      from sys_lrd_cols_map t
     where t.tab_name is not null;

  V_file_map sys_lrd_cols_map%ROWTYPE; --�����α�������ñ���������Ϊ�����α�C_EMP�ļ�¼  �������úõ��ļ�

begin

  --For ѭ��  û��д���ֶ������ļ�
  FOR V_cols_map IN C_cols_map LOOP
    if instr(p_filename, replace(V_cols_map.File_Desc, '%')) > 0 then
    
      -- �����ļ�ԭ��Ϣ
      UPDATE sys_lrd_filelist t
         SET t.stateflag = '11', t.date1 = sysdate
       WHERE t.filepath =''|| p_filepath || p_filename||'';
    
      COMMIT;
      p_ret := 0;
      return;
    end if;
  END LOOP;

  --For ѭ��  �������úõ��ļ�
  FOR V_file_map IN C_file_map LOOP
    if instr(p_filename, replace(V_file_map.File_Desc, '%')) > 0 then
      p_ret := 0;
    end if;
  END LOOP;

  if p_ret <> 0 then
    -- �����ļ�ԭ��Ϣ
    UPDATE sys_lrd_filelist t
       SET t.stateflag = '12', t.date1 = sysdate
     WHERE t.filepath = ''|| p_filepath || p_filename||'';
    p_ret := 0;
    COMMIT;
  else
    p_ret := 1;
  end if;
end;
/
