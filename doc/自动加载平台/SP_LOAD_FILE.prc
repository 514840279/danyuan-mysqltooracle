create or replace procedure SP_LOAD_FILE(p_path  in varchar2,
                                         p_file  in varchar2,
                                         p_comma in varchar2 := '`', --分隔符，默认`
                                         p_str   in varchar2 := '', --字符串
                                         p_head  in integer := 0 -- 获取 文件头的标识符 1 只去文件头
                                         ) is
  V_LOGID   VARCHAR2(200); --写日志准备
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(4000);
  v_ret     integer := 1; --过程控制
  V_TMP_TAB VARCHAR2(4000);
  V_LRD_ID  VARCHAR2(200);
begin
  
  --写日志
  SP_LOG('SP_LOAD_FILE', V_LOGID);

  --获得任务
  V_LRD_ID := FN_GET_LRD_TASK(p_path, p_file);

  --载入文件头
  SP_LOAD_FILE_HEAD(V_LRD_ID,
                    p_comma => p_comma,
                    p_str => p_str,
                    p_ret => v_ret,
                    p_head =>p_head);

  --载入 TMP_TAB 临时表名 状态 0:等待中
  SP_LOAD_MAP_TMP(V_LRD_ID, p_file);
  
  --  载入关系映射字段 到 SYS_LRD_COLS_MAP 中
  SP_LOAD_COLS_MAP(V_LRD_ID,
                   P_RET => v_ret,
                   P_FILE => p_file);
                   
   -- 检查是否可执行导入操作
   -- 与 SP_LOAD_COLS_MAP 相冲突，不必要
  ---SP_CHECK(p_path,p_file,v_ret);

  --获得临时表 并更新临时表状态 1:使用中
  SP_GET_TMP_TAB(V_LRD_ID, V_TMP_TAB, '1', v_ret);

  --加载数据至临时表
  SP_LOAD_FILE_DATA(V_LRD_ID,
                    p_comma => p_comma,
                    p_str => p_str,
                    p_ret => v_ret);

  --载入执行日志
  SP_LRD_MAPPING(V_LRD_ID, v_ret);

  --更新临时表状态 2:使用完了
  SP_GET_TMP_TAB(V_LRD_ID, V_TMP_TAB, '2', v_ret);



  --写日志
  SP_LOG('SP_LOAD_FILE', V_LOGID);
EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    --记录日志
    SP_LOG('SP_LOAD_FILE', V_LOGID, TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
end;
/
