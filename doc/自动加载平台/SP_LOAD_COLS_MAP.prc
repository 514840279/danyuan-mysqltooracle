CREATE OR REPLACE PROCEDURE SP_LOAD_COLS_MAP(P_LRD_ID IN VARCHAR2, -- lrd
                                             P_RET    in out integer, -- ���̿���
                                             P_FILE   in varchar2) IS
  V_LOGID   VARCHAR2(20); --д��־׼��
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(2000);

  V_TMP_TAB  VARCHAR2(400); -- ��ʱ����
  V_NUM      INTEGER; -- ��¼��
  V_TMP_DESC VARCHAR2(400);

BEGIN
  --д��־
  SP_LOG('SP_LOAD_COLS_MAP', V_LOGID);

  V_TMP_TAB := NULL;

  --��ÿ�����ʱ����
  SELECT MIN(TMP_TABLE_NAME)
    INTO V_TMP_TAB
    FROM SYS_LRD_TMP_TAB_MAP
   WHERE lrd_task_id = P_LRD_ID;

  --��ȡ���ñ�� file_desc 
  SELECT COUNT(*)
    INTO V_NUM
    FROM SYS_LRD_COLS_MAP T
   WHERE V_TMP_TAB LIKE T.FILE_DESC;
  IF V_NUM > 0 THEN
    SELECT DISTINCT MAX��T.FILE_DESC��
      INTO V_TMP_DESC
      FROM SYS_LRD_COLS_MAP T
     WHERE V_TMP_TAB LIKE T.FILE_DESC;
  ELSE
    -- ȡ��desc����
    V_TMP_DESC := FN_GET_LRD_FILE_DESC(P_FILE);
  END IF;

  -- �鿴�Ƿ���û������ֶ�
  select count(*)
    into V_NUM
    from (select a.file_col
            from sys_lrd_file_col_map a
           where a.file_col not in
                 (select DISTINCT m.file_col
                    from SYS_LRD_COLS_MAP t
                   inner join sys_lrd_file_col_map m on t.file_col =
                                                        m.file_col
                                                    and m.file_name like
                                                        t.file_desc
                   where t.file_desc = V_TMP_DESC
                     and m.lrd_task_id = P_LRD_ID
                     AND T.TAB_NAME IS NOT NULL) -- �ɹ���
             and a.lrd_task_id = P_LRD_ID);

  --�������ñ���û�е���
  IF V_NUM > 0 THEN
    insert into SYS_LRD_COLS_MAP
      (file_desc, FILE_COL)
      select V_TMP_DESC, a.file_col
        from sys_lrd_file_col_map a
       where a.file_col not in
             (select m.file_col
                from SYS_LRD_COLS_MAP t
               inner join sys_lrd_file_col_map m on t.file_col = m.file_col
                                                and m.file_name like
                                                    t.file_desc
               where t.file_desc = V_TMP_DESC
                 and m.lrd_task_id = P_LRD_ID)
         and a.lrd_task_id = P_LRD_ID;
    COMMIT;
  
    ---  �޸��ļ���Ϣ sys_lrd_filelist = 13
    update sys_lrd_filelist t
       set t.stateflag = '13',
           t.reason    = '��sp��SP_LOAD_COLS_MAP������ ������µ��ֶΣ�����£�SYS_LRD_COLS_MAP)������Ϣ',
           t.date1     = sysdate
     where t.filename = P_FILE;
    COMMIT;
    P_RET := 0;
    return;
  end if;

  --д��־
  SP_LOG('SP_LOAD_COLS_MAP', V_LOGID);

EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    P_RET := 0;
    --��¼��־
    SP_LOG('SP_LOAD_COLS_MAP',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
END;
/
