CREATE OR REPLACE FUNCTION SPLIT_GETINFO(P_LIST VARCHAR2,
                                         P_SEP  VARCHAR2,
                                         INDEX_ NUMBER) RETURN VARCHAR2 IS

  V_LIST VARCHAR2(4000) := '';
BEGIN
  SELECT NR
    INTO V_LIST
    FROM (select column_value NR,
                 (SELECT COUNT(*) FROM table(split(P_LIST, P_SEP))) S_COUNT,
                 ROWNUM - 1 S_INDEX
            from table(split(P_LIST, P_SEP)))
   WHERE S_INDEX = INDEX_
     AND ROWNUM < 2;
  RETURN V_LIST;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
  
END SPLIT_GETINFO;
/
