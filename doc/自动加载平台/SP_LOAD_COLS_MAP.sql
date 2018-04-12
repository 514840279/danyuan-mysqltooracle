-- 载入没有的 sys_lrd_cols_map 配置
create or replace procedure   SP_LOAD_COLS_MAP(P_LRD_ID -- lrd
)
IS

V_TMP_TAB varchar2(4000);
BEGIN

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
END;




  
