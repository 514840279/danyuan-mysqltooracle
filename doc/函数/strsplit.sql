--创建一个　　type　　，如果为了使split函数具有通用性，请将其size 设大些。
CREATE OR REPLACE type strsplit_type
AS
  TABLE OF VARCHAR2(50);

CREATE OR REPLACE FUNCTION strsplit(
    p_value VARCHAR2,
    p_split VARCHAR2 := ',')
  --usage: select * from table(strsplit('1,2,3,4,5'))
  RETURN strsplit_type pipelined
IS
  v_idx       INTEGER;
  v_str       VARCHAR2(500);
  v_strs_last VARCHAR2(4000) := p_value;
BEGIN
  IF p_value IS NULL OR LENGTH(trim(p_value))<1 THEN
    RETURN;
  END IF;
IF p_split IS NULL OR LENGTH(trim(p_split))<1 THEN
  pipe row(p_value);
  RETURN;
END IF;
LOOP
  v_idx := instr(v_strs_last, p_split);
  EXIT
WHEN v_idx     = 0;
  v_str       := SUBSTR(v_strs_last, 1, v_idx - 1);
  v_strs_last := SUBSTR(v_strs_last, v_idx    + 1);
  pipe row(v_str);
END LOOP;
pipe row(v_strs_last);
RETURN;
END strsplit;
