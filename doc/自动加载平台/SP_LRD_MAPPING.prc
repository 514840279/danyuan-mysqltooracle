create or replace procedure SP_LRD_MAPPING(p_lrd_id in varchar2,
                                           p_ret    in out integer --���̿���
                                           ) is
  V_LOGID    VARCHAR2(20); --д��־׼��
  V_SQLCODE  INTEGER;
  V_SQLERRM  VARCHAR2(2000);
  V_TMP_TAB  varchar2(2000); -- ��ʱ��
  V_TMP_DESC VARCHAR2(2000); -- �ļ��ֶ�
  V_TABLE_NAME VARCHAR2(100); -- ���յı���

  v_sql    CLOB;
  v_cursor NUMBER; --�α�ID
  v_count  integer;
  v_date   date;
begin
  --���̿���
  if p_ret <> 1 then
    return;
  end if;

  --д��־
  SP_LOG('SP_LRD_MAPPING', V_LOGID);

  --��ȡ����SQL
  /*select max(case
              when tab_name is not null then
               'insert \*+append*\ into ' || tab_name || ' nologging (' ||
               max(tab_col) || ',������Դ,�ļ���,���ʱ��' || ') select ' || max(file_col) ||
               ',''' || file_tab || ''',''' || file_name || ''',''' ||
               to_char(sysdate, 'YYYYMMDD') || '''' || ' from ' ||
               tmp_table_name
              else
               'create table ' || 'T_' || file_tab ||
               ' tablespace zhcx_data as select ' || max(file_col) || ',''' ||
               file_tab || ''' as ������Դ,''' || file_name || ''' as �ļ���,''' ||
               to_char(sysdate, 'YYYYMMDD') || ''' as ���ʱ��' || ' from ' ||
               tmp_table_name
            end)
   into v_sql
   from (select tm.tmp_table_name,
                cm.tab_name,
                t.file_path || t.file_name as file_name,
                wm_concat(cm.tab_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as tab_col,
                wm_concat(cm.file_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as file_col,
                replace(cm.file_desc, '%', '') as file_tab
           from sys_lrd_task t
          inner join sys_lrd_file_col_map fm
             on t.lrd_task_id = fm.lrd_task_id
           left join sys_lrd_cols_map cm
             on fm.file_col = cm.file_col
            and fm.file_name like cm.file_desc
           left join sys_lrd_tmp_tab_map tm
             on tm.lrd_task_id = t.lrd_task_id
          where t.lrd_task_id = p_lrd_id
            and cm.file_col not in ('ID'))
  group by file_tab, file_name, tmp_table_name, tab_name;
  */
  /*=================================================================================================================================*/
  /*
  select 'insert into ' || tab_name || ' nologging (' ||
         max(tab_col) || ',������Դ,�ļ���,���ʱ��' || ') select ' || max(file_col) ||
         ',''' || file_tab || ''',''' || file_name || ''',sysdate 
          from ' || tmp_table_name
    into v_sql
    from (select distinct tm.tmp_table_name,
                 cm.tab_name,
                 t.file_path || t.file_name as file_name,
                 wm_concat(cm.tab_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as tab_col,
                 wm_concat(cm.file_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as file_col,
                 replace(cm.file_desc, '%', '') as file_tab
            from sys_lrd_task t
           inner join sys_lrd_file_col_map fm on t.lrd_task_id =
                                                 fm.lrd_task_id
          
            inner join sys_lrd_tmp_tab_map tm on tm.lrd_task_id =
                                                t.lrd_task_id
            left join sys_lrd_cols_map cm on cm.file_col like '%'||fm.file_col||'%'
                                         and fm.file_name like cm.file_desc
           where t.lrd_task_id = p_lrd_id
             and cm.file_col not in ('ID'))
   where tab_name is not null
     and tab_col is not null
   group by file_tab, file_name, tmp_table_name, tab_name;
   */
  /*=================================================================================================================================*/

  --��ÿ�����ʱ����
  SELECT MIN(TMP_TABLE_NAME)
    INTO V_TMP_TAB
    FROM SYS_LRD_TMP_TAB_MAP
   WHERE lrd_task_id = P_LRD_ID;
   
  -- ��ȡ���ƥ�������
  SELECT DISTINCT MAX��T.FILE_DESC��
    INTO V_TMP_DESC
    FROM SYS_LRD_COLS_MAP T
   WHERE V_TMP_TAB LIKE T.FILE_DESC;
   
   -- ���� ���ı��� 
     SELECT DISTINCT T.TAB_NAME
    INTO V_TABLE_NAME
    FROM SYS_LRD_COLS_MAP T
   WHERE T.FILE_DESC =  V_TMP_DESC;
   
   -- ���������Ϣ lrd file
   update sys_lrd_filelist t
   set t.storage_table_name = V_TABLE_NAME
   , t.update_time = sysdate
   where t.lrd_task_id = P_LRD_ID;
   commit;

  -- ƴ������sql���
  select 'insert /*+append*/ into ' || tab_name || ' nologging (' ||
         max(tab_col) || ',������Դ,�ļ���,���ʱ��' || ') select ' || max(file_col) ||
         ',''' || file_tab || ''',''' || file_name || ''',sysdate 
          from ' || tmp_table_name
    into v_sql
    from (select tmp_table_name,
                 tab_name,
                 file_name,
                 wm_concat(tab_col) over(partition by file_desc, tmp_table_name, tab_name order by FILE_COL_ID) as tab_col,
                 wm_concat(file_col) over(partition by file_desc, tmp_table_name, tab_name order by FILE_COL_ID) as file_col,
                 file_tab
          
            from (select distinct tm.tmp_table_name,
                                  cm.tab_name,
                                  t.file_path || t.file_name as file_name,
                                  --wm_concat(cm.tab_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as tab_col,
                                  -- wm_concat(cm.file_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as file_col,
                                  cm.tab_col,
                                  replace(wm_concat('(''' || cm.file_col ||
                                                    ':''||' || cm.file_col ||
                                                    '||''/'')  '),
                                          ',',
                                          '||') as file_col,
                                  replace(cm.file_desc, '%', '') as file_tab,
                                  cm.file_desc,
                                  0 as file_col_id
                  -- FILE_COL_ID
                    from sys_lrd_task t
                   inner join sys_lrd_file_col_map fm on t.lrd_task_id =
                                                         fm.lrd_task_id
                   inner join sys_lrd_tmp_tab_map tm on tm.lrd_task_id =
                                                        t.lrd_task_id
                    left join sys_lrd_cols_map cm on cm.file_col =
                                                     fm.file_col
                                                 and fm.file_name like
                                                     cm.file_desc
                   where t.lrd_task_id = p_lrd_id
                     and cm.file_col not in ('ID')
                     and cm.tab_col is not null
                     and cm.tab_col = '������Ϣ'
                     and cm.file_desc = V_TMP_DESC
                   group by cm.file_desc,
                            t.file_path,
                            t.file_name,
                            cm.tab_name,
                            tm.tmp_table_name,
                            cm.tab_col
                  union
                  select distinct tm.tmp_table_name,
                                  cm.tab_name,
                                  t.file_path || t.file_name as file_name,
                                  --wm_concat(cm.tab_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as tab_col,
                                  -- wm_concat(cm.file_col) over(partition by cm.file_desc, tm.tmp_table_name, cm.tab_name order by FILE_COL_ID) as file_col,
                                  cm.tab_col,
                                  cm.file_col as file_col,
                                  replace(cm.file_desc, '%', '') as file_tab,
                                  cm.file_desc,
                                  fm.file_col_id
                  -- FILE_COL_ID
                    from sys_lrd_task t
                   inner join sys_lrd_file_col_map fm on t.lrd_task_id =
                                                         fm.lrd_task_id
                   inner join sys_lrd_tmp_tab_map tm on tm.lrd_task_id =
                                                        t.lrd_task_id
                    left join sys_lrd_cols_map cm on cm.file_col =
                                                     fm.file_col
                                                 and fm.file_name like
                                                     cm.file_desc
                   where t.lrd_task_id = p_lrd_id
                     and cm.file_desc = V_TMP_DESC
                     and cm.file_col not in ('ID')
                     and cm.tab_col is not null
                     and cm.tab_col not like '%������Ϣ%'))
   where tab_name is not null
     and tab_col is not null
   group by file_tab, file_name, tmp_table_name, tab_name;

  --��������ִ����־��
  v_date := sysdate;
  insert into SYS_LRD_MAPPING_LOG
    (LRD_TASK_ID, EXE_SQL, EXE_START_TIME)
  values
    (p_lrd_id, v_sql, v_date);
  commit;

  v_cursor := dbms_sql.open_cursor; --���αꣻ
  dbms_sql.parse(v_cursor, v_sql, dbms_sql.native); --����SQL
  v_count := dbms_sql.execute(v_cursor); --ִ�ж�̬SQL���
  dbms_sql.close_cursor(v_cursor); --�ر��α�
  commit;

  --��������ִ����־��
  update SYS_LRD_MAPPING_LOG
     set exe_count = v_count, exe_time = sysdate - v_date
   where lrd_task_id = p_lrd_id;
  commit;

-- ����������Ϣ lrd frile
   update sys_lrd_filelist t
   set t.storage_number = v_count
   , t.storage_end_date_time = sysdate
   where t.lrd_task_id = p_lrd_id;
   commit;

  --д��־
  SP_LOG('SP_LRD_MAPPING', V_LOGID);

EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    ROLLBACK;
    --���̿���
    p_ret := 0;
    --��¼��־
    SP_LOG('SP_LRD_MAPPING',
           V_LOGID,
           TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
end;
/
