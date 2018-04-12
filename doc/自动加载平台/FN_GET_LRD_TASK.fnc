create or replace function FN_GET_LRD_TASK(p_path in varchar2,
                                           p_file in varchar2)
  RETURN STRING is
  PRAGMA AUTONOMOUS_TRANSACTION; --��������
  v_path   varchar2(100);
  v_lrd_id varchar2(20);
begin
  --ȡһ��δ��ʹ�õ�directory
  SELECT DIRECTORY_NAME
    INTO v_path
    FROM ALL_DIRECTORIES D
    LEFT JOIN (SELECT DISTINCT FILE_PATH
                 FROM SYS_LRD_TASK
                WHERE STAT = '0'
                  AND ST_FLAG = '1') T ON (D.DIRECTORY_PATH = T.FILE_PATH OR
                                          D.DIRECTORY_PATH || '\' =
                                          T.FILE_PATH)
   WHERE D.DIRECTORY_NAME = 'ZHCX_DIR'
     AND ROWNUM = 1;

  --���¶���directory
  execute immediate 'create or replace directory ' || v_path || ' as ''' ||
                    p_path || '''';
  commit;
  v_lrd_id := FN_SEQ('LRD');
  --������������
  insert into SYS_LRD_TASK
    (LRD_TASK_ID, FILE_PATH, FILE_NAME, CRT_TIME, STAT, ST_FLAG)
  values
    (v_lrd_id, p_path, p_file, systimestamp, '0', '1');
  commit;

  -- ����lrd_frile
  update sys_lrd_filelist t
     set t.lrd_task_id = v_lrd_id, t.reason = '', t.update_time = sysdate
   where t.filepath = p_path || p_file
     and t.filename = p_file
     and t.stateflag = '2';
  commit;

  RETURN v_lrd_id;
end;
/
