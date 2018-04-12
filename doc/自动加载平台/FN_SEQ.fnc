create or replace function FN_SEQ(logid varchar := 'LOG')
 RETURN STRING is
  v_type varchar2(100);
  v_seq varchar2(100);
begin
  select seq.nextval into v_seq  from dual;
  v_seq := '00000000000000000'||v_seq;
    if  length(v_seq)>15 then
        v_seq := substr(v_seq,length(v_seq)-15,length(v_seq));
    end if;

  v_type := logid||to_char(sysdate,'yyyy-mm-dd hh24:mi:ss')||v_seq;

  RETURN v_type;
end;
/
