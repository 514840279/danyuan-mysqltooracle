create or replace procedure sp_load_file_data(p_lrd_id in varchar2,
                                              p_comma  in varchar2 := '`', --分隔符，默认`
                                              p_str    in varchar2 := '', --字符串
                                              p_ret    in out integer --过程控制
                                              ) is
  V_LOGID   VARCHAR2(200); --写日志准备
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(4000);

  V_FH      UTL_FILE.FILE_TYPE;
  V_TEXT    CLOB;
  V_SQL     CLOB;
  v_row     integer := 0;
  v_file    varchar2(4000);
  v_tmp_tab varchar2(200);
  v_path    all_directories.Directory_Name%TYPE;

begin
  --过程控制
  if p_ret <> 1 then
    return;
  end if;
  --写日志
  SP_LOG('SP_LOAD_FILE_DATA', V_LOGID);

  --取文件路径
  SELECT D.DIRECTORY_NAME, T.FILE_NAME
    INTO v_path, v_file
    FROM ALL_DIRECTORIES D, SYS_LRD_TASK T
   WHERE D.DIRECTORY_PATH = T.FILE_PATH
     AND D.DIRECTORY_NAME = 'ZHCX_DIR'
     AND T.LRD_TASK_ID = p_lrd_id
     AND ROWNUM = 1;

  --获得临时表
  SELECT distinct TMP_TABLE_NAME
    INTO v_tmp_tab
    FROM SYS_LRD_TMP_TAB_MAP
   WHERE LRD_TASK_ID = p_lrd_id;

  V_FH := utl_file.fopen_nchar(v_path, v_file, 'R', 32767);
  utl_file.get_line_nchar(v_fh, V_TEXT);

  loop
    begin
      --读取一行数据
      utl_file.get_line_nchar(v_fh, V_TEXT, 32767);
      --记录行号
      v_row := v_row + 1;
      --替换冲突字符
      V_TEXT := replace(V_TEXT, '''', '"');
      V_TEXT := replace(V_TEXT, ',', '，');
    
      if p_str is null then
        V_TEXT := replace(V_TEXT, p_comma, ''',''');
        V_SQL  := 'INSERT INTO ' || v_tmp_tab || ' VALUES(''' || V_TEXT ||
                  ''')';
      else
        V_TEXT := replace(V_TEXT, p_str || p_comma || p_str, ''',''');
        V_TEXT := replace(V_TEXT, p_str, '''');
        V_SQL  := 'INSERT INTO ' || v_tmp_tab || ' nologging VALUES(' ||
                  V_TEXT || ')';
      end if;
    
      /*插入数据库操作*/
      execute immediate V_SQL;
    
      --每1000行提交一次
      if mod(v_row, 1000) = 0 then
        commit;
      end if;
    exception
      when no_data_found then
        --文件结尾commit;
        commit;
        utl_file.fclose(v_fh);
        exit;
      WHEN OTHERS THEN
        V_SQLCODE := SQLCODE;
        V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
        ROLLBACK;
        utl_file.fclose(v_fh);
        --过程控制
        p_ret := 0;
        --记录日志
        SP_LOG('SP_LOAD_FILE_DATA',
               V_LOGID,
               TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
        return;
    end;
  end loop;
  --写日志
  SP_LOG('SP_LOAD_FILE_DATA', V_LOGID);
end;
/
