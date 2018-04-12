create or replace procedure sp_load_file_head(p_lrd_id in varchar2,
                                              p_comma  in varchar2 := '`', --�ָ�����Ĭ��`
                                              p_str    in varchar2 := '', --�ַ���
                                              p_ret    in out integer, --���̿���
                                              p_head   in integer) is
  V_LOGID   VARCHAR2(20); --д��־׼��
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
 -- ���p_head ��1 ����ִֻ�� ��ǰ
  if p_head = 1 then
   p_ret := 1;
  end if;
  --���̿���
  if p_ret <> 1 then
    return;
  end if;

  --д��־
  SP_LOG('SP_LOAD_FILE_HEAD', V_LOGID);

  --ȡ�ļ�·��
  SELECT D.DIRECTORY_NAME, T.FILE_NAME
    INTO v_path, v_file
    FROM ALL_DIRECTORIES D, SYS_LRD_TASK T
   WHERE D.DIRECTORY_PATH = T.FILE_PATH
     AND D.DIRECTORY_NAME = 'ZHCX_DIR'
     AND T.LRD_TASK_ID = p_lrd_id
     AND ROWNUM = 1;

  --�����ļ�����
  utl_file.fgetattr(v_path, v_file, v_exists, v_file_length, v_block_size);

  --�ж��ļ��Ƿ����
  if v_exists then
    --��IO
    v_fh := utl_file.fopen_nchar(v_path, v_file, 'r');
    --��ȡ�ļ���һ��
    utl_file.get_line_nchar(v_fh, v_text);
    --ת������ַ�
    --v_text := to_single_byte(v_text);
    --ȥ�������ַ�
    v_text := replace(v_text, '��', '');
    --׼�������ļ�ID
    --V_ID := nvl(p_lrd_id, FN_SEQ('LRD'));
    --V_ID := p_lrd_id;
    loop
      --�жϷָ�������
      if regexp_count(v_text, p_comma) = 0 then
        --�����ָ�������ȡ����ַ���
        v_str := v_text;
      else
        --ȡ�ָ���֮ǰ�ַ���
        v_str := substr(v_text, 1, instr(v_text, p_comma) - 1);
      end if;
    
      v_str := replace(v_str, p_str, '');
      v_str := case when lower(v_str) = 'date' then 'date1' when lower(v_str) = 'uid' then 'uuid' else v_str end;
    
      /*�������ݿ����*/
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
      --�жϷָ�������
      if regexp_count(v_text, p_comma) = 0 then
        --�����ָ������˳�ѭ��
        exit;
      else
        --��д���ı��ַ���
        v_text := substr(v_text, instr(v_text, p_comma) + 1);
      end if;
      v_i := v_i + 1;
    end loop;
  
    --�ر��ļ�
    utl_file.fclose(v_fh);
    --utl_file.fclose_all();
    -- �ж��Ƿ�ֻҪ�����ļ�
    if p_head = 1then 
     --���̿���
      p_ret := 0;
    end if;
  else
    --���̿���
    p_ret := 0;
  end if;

  --д��־
  SP_LOG('SP_LOAD_FILE_HEAD', V_LOGID);

EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    --���̿���
    p_ret := 0;
    --��¼��־
    SP_LOG('SP_LOAD_FILE_HEAD',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
end;
/
