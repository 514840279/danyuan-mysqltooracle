CREATE OR REPLACE FUNCTION FN_GET_LRD_FILE_DESC(P_FILE IN VARCHAR2 -- 文件名称
                                                ) RETURN VARCHAR IS
  V_TEMP_FILE VARCHAR2(400);
BEGIN
  -- 截取第一个“_”后面的东西
  V_TEMP_FILE := SUBSTR(P_FILE, INSTR(P_FILE, '_') + 1);
  -- 截取掉后面的 “日期.txt”
  V_TEMP_FILE := SUBSTR(V_TEMP_FILE, 1, LENGTH(V_TEMP_FILE) - 12);
  --判断字符长度大于30
  while LENGTHB(V_TEMP_FILE)>30 LOOP
        V_TEMP_FILE := SUBSTR(V_TEMP_FILE, 1, LENGTH(V_TEMP_FILE) - 1);
  end LOOP;
  -- 添加上%%
  V_TEMP_FILE := '%'||V_TEMP_FILE||'%';

  RETURN V_TEMP_FILE;
END;
/
