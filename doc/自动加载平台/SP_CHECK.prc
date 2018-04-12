create or replace procedure SP_CHECK(p_filepath in varchar2, -- 文件路径
                                     p_filename in varchar2, -- 文件名称
                                     p_ret      in out integer -- 过程控制
                                     ) as
  CURSOR C_cols_map IS --声明显式游标  
    select distinct file_desc
      from sys_lrd_cols_map t
     where t.tab_name is null
     and t.file_col <> 'id';

  V_cols_map sys_lrd_cols_map%ROWTYPE; --定义游标变量，该变量的类型为基于游标C_EMP的记录  没有写表字段名的文件

  CURSOR C_file_map IS --声明显式游标  
    select distinct file_desc
      from sys_lrd_cols_map t
     where t.tab_name is not null;

  V_file_map sys_lrd_cols_map%ROWTYPE; --定义游标变量，该变量的类型为基于游标C_EMP的记录  所有配置好的文件

begin

  --For 循环  没有写表字段名的文件
  FOR V_cols_map IN C_cols_map LOOP
    if instr(p_filename, replace(V_cols_map.File_Desc, '%')) > 0 then
    
      -- 更新文件原信息
      UPDATE sys_lrd_filelist t
         SET t.stateflag = '11', t.date1 = sysdate
       WHERE t.filepath =''|| p_filepath || p_filename||'';
    
      COMMIT;
      p_ret := 0;
      return;
    end if;
  END LOOP;

  --For 循环  所有配置好的文件
  FOR V_file_map IN C_file_map LOOP
    if instr(p_filename, replace(V_file_map.File_Desc, '%')) > 0 then
      p_ret := 0;
    end if;
  END LOOP;

  if p_ret <> 0 then
    -- 更新文件原信息
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
