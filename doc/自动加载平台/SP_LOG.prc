CREATE OR REPLACE PROCEDURE SP_LOG(P_OBJECT IN VARCHAR2,
                                   P_LOGID  IN OUT VARCHAR2,
                                   P_MSG    IN VARCHAR2 := NULL) AS
BEGIN
  IF P_LOGID IS NULL THEN
    P_LOGID := FN_SEQ('LOG');
  END IF;

  --写日志
  MERGE INTO SYS_LOG L
  USING (SELECT P_LOGID      AS LOGID,
                P_OBJECT     AS OBJECTS,
                P_MSG        AS MSG,
                SYSTIMESTAMP AS TS --取时间戳
           FROM DUAL) T
  ON (L.LOGID = T.LOGID)
  WHEN MATCHED THEN
    UPDATE
       SET STAT    = DECODE(T.MSG, NULL, '0', '-1'), --没有错误信息 0  有错误信息 -1
           MSG     = T.MSG, --记录错误信息
           ENDTIME = TS --记录结束时间
  WHEN NOT MATCHED THEN
    INSERT
      (LOGID, OBJECTS, STAT, STTIME)
    VALUES
      (T.LOGID, T.OBJECTS, '1', TS); --记录开始时间

  COMMIT;

END;
/
