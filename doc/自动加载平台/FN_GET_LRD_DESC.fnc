create or replace function FN_GET_LRD_DESC(P_LRD_ID in varchar2)
  return string is
  TYPE ref_cursor_type IS REF CURSOR; --定义一个动态游标   
  v_sql       varchar2(1000);
  V_DESC      varchar2(150) ;
  V_TEMP_DESC varchar2(150);
  C_DESC      ref_cursor_type;
  V_FILE_NAME varchar2(150);
begin
-- 查询文件名称
  SELECT DISTINCT T.FILE_NAME
  INTO V_FILE_NAME
  FROM sys_lrd_file_col_map T
  WHERE T.LRD_TASK_ID = P_LRD_ID;

  --使用连接符拼接成一条完整SQL   
  v_sql := 'SELECT DISTINCT cm.file_desc FROM sys_lrd_cols_map cm WHERE '''|| V_FILE_NAME || ''' like cm.file_desc';
  --打开游标   
  open C_DESC for v_sql;
  loop
    fetch C_DESC
      into V_TEMP_DESC;
       exit when C_DESC%notfound;
       if(V_DESC is null)then
            V_DESC := V_TEMP_DESC;
       end if;
    if (length(V_TEMP_DESC) > length(V_DESC)) then
      V_DESC := V_TEMP_DESC;
    end if;
  end loop;
  close C_DESC;
  return V_DESC;
end;
/
