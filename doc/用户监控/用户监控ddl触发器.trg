CREATE OR REPLACE TRIGGER tr_issgzt_ddl
  AFTER ddl ON database
DECLARE
  sql_text  ora_name_list_t;
  state_sql zhcx.sys_tab_ddl.ddl_sql%TYPE;
  v_program zhcx.sys_tab_ddl.module%TYPE;
  error1 exception;

BEGIN

  IF SUBSTR(SYS_CONTEXT('USERENV', 'SESSION_USER'), 1, 1) = 'T' AND
     SYS_CONTEXT('USERENV', 'SESSION_USER') NOT IN ('username') AND
     lower(state_sql) not like 'alter user t%' THEN
    raise error1;

  end if;

  FOR i IN 1 .. nvl(ora_sql_txt(sql_text), 2) LOOP
    begin
      state_sql := state_sql || sql_text(i);
    Exception
      when others then
        null;
    end;
  END LOOP;
  select nvl(s.program, s.MODULE)
    into v_program
    from v$session s
   where s.SID = (select distinct sid from v$mystat);

  INSERT INTO zhcx.sys_TAB_DDL
    (login_user,
     audsid,
     machine,
     ipaddress,
     schema_user,
     schema_object,
     SCHEMA_OBJECT_TYPE,
     ddl_time,
     ddl_sql,
     module)
  VALUES
    (ora_login_user,
     userenv('SESSIONID'),
     SYS_CONTEXT('USERENV', 'TERMINAL'),
     sys_context('userenv', 'ip_address'),
     ora_dict_obj_owner,
     ora_dict_obj_name,
     ora_dict_obj_type,
     SYSDATE,
     substr(state_sql, 1, 3000),
     v_program);
EXCEPTION
  WHEN error1 THEN

    raise_application_error(num => -20000, msg => ' ERROR');
END tr_trace_ddl;
/
