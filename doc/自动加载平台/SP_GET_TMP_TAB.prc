CREATE OR REPLACE PROCEDURE SP_GET_TMP_TAB(P_LRD_ID   IN VARCHAR2,
                                           P_TMP_TAB  IN OUT VARCHAR2,
                                           P_TAB_STAT IN VARCHAR2,
                                           p_ret      in out integer --过程控制
                                           ) AS
  PRAGMA AUTONOMOUS_TRANSACTION; --自治事务
  V_LOGID   VARCHAR2(200); --写日志准备
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(4000);
  V_TEMP_DESC VARCHAR2(100);

  V_TMP_TAB   VARCHAR2(4000);
  V_T_FLAG    INTEGER := 0;
  V_SQL       CLOB;
  v_tab_name  varchar2(100);
  v_file_path varchar2(4000);
BEGIN
  --过程控制
  if p_ret <> 1 then
    return;
  end if;

  --写日志
  SP_LOG('SP_GET_TMP_TAB', V_LOGID);

  --判断操作
  IF P_TAB_STAT = '1' THEN
    /* 创建临时表过程 */
  
    --获得可用临时表名
    SELECT MIN(TMP_TABLE_NAME)
      INTO V_TMP_TAB
      FROM SYS_LRD_TMP_TAB_MAP
     WHERE TAB_STAT = '0'
       and lrd_task_id = P_LRD_ID;
  
    --有可使用的临时表
    IF V_TMP_TAB IS NOT NULL THEN
    
      SELECT COUNT(1)
        INTO V_T_FLAG
        FROM USER_TABLES
       WHERE TABLE_NAME = upper(V_TMP_TAB);
    
      --如果表存在，删除临时表
      IF V_T_FLAG > 0 THEN
        V_SQL := 'DROP TABLE ZHCX.' || V_TMP_TAB || ' purge';
        /*
        -- 记录sql日志
        insert into SYS_LRD_MAPPING_LOG
          (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
        values
          (P_LRD_ID, V_SQL, sysdate);
          */
        EXECUTE IMMEDIATE V_SQL;
        COMMIT;
      END IF;
    
      -- 拼写 可执行语句
      select 'CREATE TABLE ZHCX.' || V_TMP_TAB || '(' ||
             to_char(wm_concat(file_col || ' clob')) ||
             ') TABLESPACE ODS_DATA'
        INTO V_SQL
        from (SELECT * FROM SYS_LRD_FILE_COL_MAP ORDER BY FILE_COL_ID)
       WHERE LRD_TASK_ID = P_LRD_ID;
     
     /*
      -- 记录sql日志
      insert into SYS_LRD_MAPPING_LOG
        (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
      values
        (P_LRD_ID, V_SQL, sysdate);
        */
      --重新创建临时表
      EXECUTE IMMEDIATE V_SQL;
      COMMIT;
    
    END IF;
    --赋值OUT参数
    P_TMP_TAB := V_TMP_TAB;
  ELSE
    V_TMP_TAB := P_TMP_TAB;
    --  添加完数据 删除临时表
    select 'drop TABLE ZHCX.' || V_TMP_TAB || ' purge'
      into V_SQL
      from dual;  
    /*
    -- 记录sql日志
    insert into SYS_LRD_MAPPING_LOG
      (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
    values
      (P_LRD_ID, V_SQL, sysdate);
      */
    --删除临时表
    EXECUTE IMMEDIATE V_SQL;
    COMMIT;
    
    -- 取得最大的匹配字段
   V_TEMP_DESC := FN_GET_LRD_DESC(P_LRD_ID);
  
    --  取得文件路径 和 表名成 添加记录 文件指向
    select distinct cm.tab_name, t.file_path || t.file_name
      into v_tab_name, v_file_path
      from sys_lrd_task t
     inner join sys_lrd_file_col_map fm on t.lrd_task_id = fm.lrd_task_id
     inner join sys_lrd_cols_map cm on fm.file_col = cm.file_col
                                   and fm.file_name like cm.file_desc
     inner join sys_lrd_tmp_tab_map tm on tm.lrd_task_id = t.lrd_task_id
     where t.lrd_task_id = P_LRD_ID
     and cm.file_desc = V_TEMP_DESC;

  --  插入数据来源记录
    insert into aaa_入库日志
      (完成后表名, 注释, qxk_sm, lrd单号, 录入方式, 录入时间)
    values
      (v_tab_name, '', v_file_path, P_LRD_ID, 'LRD_Plant_System', sysdate);
    COMMIT;
  
      -- 更新文件原信息
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

  --临时表信息更新  改变状态 0:未使用1:使用中 2:执行完了
  UPDATE SYS_LRD_TMP_TAB_MAP
     SET TAB_STAT = P_TAB_STAT
   WHERE TMP_TABLE_NAME = V_TMP_TAB
     and lrd_task_id = P_LRD_ID;
  COMMIT;

  --写日志
  SP_LOG('SP_GET_TMP_TAB', V_LOGID);
EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    -- 
    select 'drop TABLE ZHCX.' || V_TMP_TAB into V_SQL from dual;
    --删除临时表
    EXECUTE IMMEDIATE V_SQL;
    COMMIT;
    --过程控制
    p_ret := 0;
    --记录日志
    SP_LOG('SP_GET_TMP_TAB',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
END;
/
