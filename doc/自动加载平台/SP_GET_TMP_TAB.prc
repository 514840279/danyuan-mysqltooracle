CREATE OR REPLACE PROCEDURE SP_GET_TMP_TAB(P_LRD_ID   IN VARCHAR2,
                                           P_TMP_TAB  IN OUT VARCHAR2,
                                           P_TAB_STAT IN VARCHAR2,
                                           p_ret      in out integer --���̿���
                                           ) AS
  PRAGMA AUTONOMOUS_TRANSACTION; --��������
  V_LOGID   VARCHAR2(200); --д��־׼��
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(4000);
  V_TEMP_DESC VARCHAR2(100);

  V_TMP_TAB   VARCHAR2(4000);
  V_T_FLAG    INTEGER := 0;
  V_SQL       CLOB;
  v_tab_name  varchar2(100);
  v_file_path varchar2(4000);
BEGIN
  --���̿���
  if p_ret <> 1 then
    return;
  end if;

  --д��־
  SP_LOG('SP_GET_TMP_TAB', V_LOGID);

  --�жϲ���
  IF P_TAB_STAT = '1' THEN
    /* ������ʱ����� */
  
    --��ÿ�����ʱ����
    SELECT MIN(TMP_TABLE_NAME)
      INTO V_TMP_TAB
      FROM SYS_LRD_TMP_TAB_MAP
     WHERE TAB_STAT = '0'
       and lrd_task_id = P_LRD_ID;
  
    --�п�ʹ�õ���ʱ��
    IF V_TMP_TAB IS NOT NULL THEN
    
      SELECT COUNT(1)
        INTO V_T_FLAG
        FROM USER_TABLES
       WHERE TABLE_NAME = upper(V_TMP_TAB);
    
      --�������ڣ�ɾ����ʱ��
      IF V_T_FLAG > 0 THEN
        V_SQL := 'DROP TABLE ZHCX.' || V_TMP_TAB || ' purge';
        /*
        -- ��¼sql��־
        insert into SYS_LRD_MAPPING_LOG
          (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
        values
          (P_LRD_ID, V_SQL, sysdate);
          */
        EXECUTE IMMEDIATE V_SQL;
        COMMIT;
      END IF;
    
      -- ƴд ��ִ�����
      select 'CREATE TABLE ZHCX.' || V_TMP_TAB || '(' ||
             to_char(wm_concat(file_col || ' clob')) ||
             ') TABLESPACE ODS_DATA'
        INTO V_SQL
        from (SELECT * FROM SYS_LRD_FILE_COL_MAP ORDER BY FILE_COL_ID)
       WHERE LRD_TASK_ID = P_LRD_ID;
     
     /*
      -- ��¼sql��־
      insert into SYS_LRD_MAPPING_LOG
        (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
      values
        (P_LRD_ID, V_SQL, sysdate);
        */
      --���´�����ʱ��
      EXECUTE IMMEDIATE V_SQL;
      COMMIT;
    
    END IF;
    --��ֵOUT����
    P_TMP_TAB := V_TMP_TAB;
  ELSE
    V_TMP_TAB := P_TMP_TAB;
    --  ��������� ɾ����ʱ��
    select 'drop TABLE ZHCX.' || V_TMP_TAB || ' purge'
      into V_SQL
      from dual;  
    /*
    -- ��¼sql��־
    insert into SYS_LRD_MAPPING_LOG
      (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
    values
      (P_LRD_ID, V_SQL, sysdate);
      */
    --ɾ����ʱ��
    EXECUTE IMMEDIATE V_SQL;
    COMMIT;
    
    -- ȡ������ƥ���ֶ�
   V_TEMP_DESC := FN_GET_LRD_DESC(P_LRD_ID);
  
    --  ȡ���ļ�·�� �� ������ ��Ӽ�¼ �ļ�ָ��
    select distinct cm.tab_name, t.file_path || t.file_name
      into v_tab_name, v_file_path
      from sys_lrd_task t
     inner join sys_lrd_file_col_map fm on t.lrd_task_id = fm.lrd_task_id
     inner join sys_lrd_cols_map cm on fm.file_col = cm.file_col
                                   and fm.file_name like cm.file_desc
     inner join sys_lrd_tmp_tab_map tm on tm.lrd_task_id = t.lrd_task_id
     where t.lrd_task_id = P_LRD_ID
     and cm.file_desc = V_TEMP_DESC;

  --  ����������Դ��¼
    insert into aaa_�����־
      (��ɺ����, ע��, qxk_sm, lrd����, ¼�뷽ʽ, ¼��ʱ��)
    values
      (v_tab_name, '', v_file_path, P_LRD_ID, 'LRD_Plant_System', sysdate);
    COMMIT;
  
      -- �����ļ�ԭ��Ϣ
    update sys_lrd_filelist b
       set b.stateflag = '3'
     where b.filepath =v_file_path;
    /*
    UPDATE  ZHCX.sys_lrd_filelist t
       SET t.stateflag = '3', t.date1 = sysdate
     WHERE t.filepath =  v_file_path;
     */
    COMMIT;
    
  END IF;

  --��ʱ����Ϣ����  �ı�״̬ 0:δʹ��1:ʹ���� 2:ִ������
  UPDATE SYS_LRD_TMP_TAB_MAP
     SET TAB_STAT = P_TAB_STAT
   WHERE TMP_TABLE_NAME = V_TMP_TAB
     and lrd_task_id = P_LRD_ID;
  COMMIT;

  --д��־
  SP_LOG('SP_GET_TMP_TAB', V_LOGID);
EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    -- 
    select 'drop TABLE ZHCX.' || V_TMP_TAB into V_SQL from dual;
    --ɾ����ʱ��
    EXECUTE IMMEDIATE V_SQL;
    COMMIT;
    --���̿���
    p_ret := 0;
    --��¼��־
    SP_LOG('SP_GET_TMP_TAB',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
END;
/
