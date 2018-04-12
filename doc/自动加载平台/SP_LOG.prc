CREATE OR REPLACE PROCEDURE SP_LOG(P_OBJECT IN VARCHAR2,
                                   P_LOGID  IN OUT VARCHAR2,
                                   P_MSG    IN VARCHAR2 := NULL) AS
BEGIN
  IF P_LOGID IS NULL THEN
    P_LOGID := FN_SEQ('LOG');
  END IF;

  --д��־
  MERGE INTO SYS_LOG L
  USING (SELECT P_LOGID      AS LOGID,
                P_OBJECT     AS OBJECTS,
                P_MSG        AS MSG,
                SYSTIMESTAMP AS TS --ȡʱ���
           FROM DUAL) T
  ON (L.LOGID = T.LOGID)
  WHEN MATCHED THEN
    UPDATE
       SET STAT    = DECODE(T.MSG, NULL, '0', '-1'), --û�д�����Ϣ 0  �д�����Ϣ -1
           MSG     = T.MSG, --��¼������Ϣ
           ENDTIME = TS --��¼����ʱ��
  WHEN NOT MATCHED THEN
    INSERT
      (LOGID, OBJECTS, STAT, STTIME)
    VALUES
      (T.LOGID, T.OBJECTS, '1', TS); --��¼��ʼʱ��

  COMMIT;

END;
/
