create or replace function FN_GET_LRD_column_type(p_column in varchar2)
  RETURN STRING is
  v_type varchar2(100);
  v_num  int;
begin
  --取一个未被使用的directory
  select count(1)
    into v_num
    from vw_table_column_comments t
   where t.type = 'DATE'
     and (t.column_name like '%' || p_column || '%' or
         t.column_comments like '%' || p_column || '%');

  if p_column= '出生日期' then
    v_type := p_column;
  elsif p_column = '成立日期' then
  
    v_type := 'to_date(replace(replace(replace(' || p_column ||
              ',''年'',''-''),''月'',''-''),''日'',''''),''YYYY-MM-DD'')';
  elsif p_column = 'INSERT_DATE' or p_column = 'STIME' or
        p_column = 'UPDATE_DATE' then
    v_type := 'to_date(replace(' || p_column ||
              ',''-'',''''),''YYYYMMDD HH24:MI:SS'')';
  elsif (v_num > 0) then
    v_type := 'to_date(replace(' || p_column ||
              ',''-'',''''),''YYYYMMDD'')';
  else
    v_type := p_column;
  end if;

  RETURN v_type;
end;
/
