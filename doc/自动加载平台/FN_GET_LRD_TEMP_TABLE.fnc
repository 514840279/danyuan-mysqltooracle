create or replace function FN_GET_LRD_TEMP_TABLE(p_file in varchar2)
  RETURN STRING is
  v_tablename varchar2(4000);
begin
  -- �ļ������ȴ���12 ��ȡ���ļ����� С��12 ��ȥ�� .txt
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
