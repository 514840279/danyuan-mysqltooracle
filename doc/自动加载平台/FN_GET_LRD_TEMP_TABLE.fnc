create or replace function FN_GET_LRD_TEMP_TABLE(p_file in varchar2)
  RETURN STRING is
  v_tablename varchar2(4000);
begin
  -- 文件名长度大于12 截取端文件名， 小于12 的去掉 .txt
 -- if (length(p_file) - 12 > 0 )then
  
   -- select substr(a, instr(a, '_', 1, 1) + 1)
    --  into v_tablename
   --   from (select substr(p_file, 1, length(p_file) - 12) as a from dual) a;
 -- else
      select substr(a, instr(a, '_', 1, 1) + 1)
      into v_tablename
      from (select substr(p_file, 1, length(p_file) - 4) as a from dual) a;
 -- end if;
  
  RETURN v_tablename;
end;
/
