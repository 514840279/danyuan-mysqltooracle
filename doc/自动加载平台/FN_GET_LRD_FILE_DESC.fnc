CREATE OR REPLACE FUNCTION FN_GET_LRD_FILE_DESC(P_FILE IN VARCHAR2 -- �ļ�����
                                                ) RETURN VARCHAR IS
  V_TEMP_FILE VARCHAR2(400);
BEGIN
  -- ��ȡ��һ����_������Ķ���
  V_TEMP_FILE := SUBSTR(P_FILE, INSTR(P_FILE, '_') + 1);
  -- ��ȡ������� ������.txt��
  V_TEMP_FILE := SUBSTR(V_TEMP_FILE, 1, LENGTH(V_TEMP_FILE) - 12);
  --�ж��ַ����ȴ���30
  while LENGTHB(V_TEMP_FILE)>30 LOOP
        V_TEMP_FILE := SUBSTR(V_TEMP_FILE, 1, LENGTH(V_TEMP_FILE) - 1);
  end LOOP;
  -- �����%%
  V_TEMP_FILE := '%'||V_TEMP_FILE||'%';

  RETURN V_TEMP_FILE;
END;
/
