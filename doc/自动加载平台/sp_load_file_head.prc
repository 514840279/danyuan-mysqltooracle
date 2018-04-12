create or replace procedure sp_load_file_head(p_lrd_id in varchar2,
                                              p_comma  in varchar2 := '`', --分隔符，默认`
                                              p_str    in varchar2 := '', --字符串
                                              p_ret    in out integer, --过程控制
                                              p_head   in integer) is
  V_LOGID   VARCHAR2(20); --写日志准备
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(2000);

  v_path        all_directories.Directory_Name%TYPE;
  v_file        varchar2(1000);
  v_fh          UTL_FILE.FILE_TYPE;
  v_exists      boolean;
  v_file_length integer;
  v_block_size  binary_integer;
  v_i           integer := 1;
  V_TEXT        CLOB;
  V_STR         CLOB;
  --V_ID          VARCHAR2(20);
  --V_TMP_TAB     VARCHAR2(20);
begin
 -- 如果p_head 是1 控制只执行 当前
  if p_head = 1 then
   p_ret := 1;
  end if;
  --过程控制
  if p_ret <> 1 then
    return;
  end if;

  --写日志
  SP_LOG('SP_LOAD_FILE_HEAD', V_LOGID);

  --取文件路径
  SELECT D.DIRECTORY_NAME, T.FILE_NAME
    INTO v_path, v_file
    FROM ALL_DIRECTORIES D, SYS_LRD_TASK T
   WHERE D.DIRECTORY_PATH = T.FILE_PATH
     AND D.DIRECTORY_NAME = 'ZHCX_DIR'
     AND T.LRD_TASK_ID = p_lrd_id
     AND ROWNUM = 1;

  --访问文件属性
  utl_file.fgetattr(v_path, v_file, v_exists, v_file_length, v_block_size);

  --判断文件是否存在
  if v_exists then
    --打开IO
    v_fh := utl_file.fopen_nchar(v_path, v_file, 'r');
    --读取文件第一行
    utl_file.get_line_nchar(v_fh, v_text);
    --转换半角字符
    --v_text := to_single_byte(v_text);
    --去掉特殊字符
    v_text := replace(v_text, '？', '');
    --准备载入文件ID
    --V_ID := nvl(p_lrd_id, FN_SEQ('LRD'));
    --V_ID := p_lrd_id;
    loop
      --判断分隔符数量
      if regexp_count(v_text, p_comma) = 0 then
        --不含分隔符，则取最后字符串
        v_str := v_text;
      else
        --取分隔符之前字符串
        v_str := substr(v_text, 1, instr(v_text, p_comma) - 1);
      end if;
    
      v_str := replace(v_str, p_str, '');
      v_str := case when lower(v_str) = 'date' then 'date1' when lower(v_str) = 'uid' then 'uuid' else v_str end;
    
      /*插入数据库操作*/
      insert into SYS_LRD_FILE_COL_MAP nologging
        (LRD_TASK_ID, FILE_PATH, FILE_NAME, FILE_COL, FILE_COL_ID)
      values
        (p_lrd_id,
         (select DIRECTORY_PATH
            from all_directories
           where DIRECTORY_NAME = v_path),
         v_file,
         upper(v_str),
         v_i);
      commit;
      --判断分隔符数量
      if regexp_count(v_text, p_comma) = 0 then
        --不含分隔符则退出循环
        exit;
      else
        --改写行文本字符串
        v_text := substr(v_text, instr(v_text, p_comma) + 1);
      end if;
      v_i := v_i + 1;
    end loop;
  
    --关闭文件
    utl_file.fclose(v_fh);
    --utl_file.fclose_all();
    -- 判断是否只要载入文件
    if p_head = 1then 
     --过程控制
      p_ret := 0;
    end if;
  else
    --过程控制
    p_ret := 0;
  end if;

  --写日志
  SP_LOG('SP_LOAD_FILE_HEAD', V_LOGID);

EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    --过程控制
    p_ret := 0;
    --记录日志
    SP_LOG('SP_LOAD_FILE_HEAD',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
end;
/
