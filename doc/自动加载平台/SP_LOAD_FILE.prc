create or replace procedure SP_LOAD_FILE(p_path  in varchar2,
                                         p_file  in varchar2,
                                         p_comma in varchar2 := '`', --�ָ�����Ĭ��`
                                         p_str   in varchar2 := '', --�ַ���
                                         p_head  in integer := 0 -- ��ȡ �ļ�ͷ�ı�ʶ�� 1 ֻȥ�ļ�ͷ
                                         ) is
  V_LOGID   VARCHAR2(200); --д��־׼��
  V_SQLCODE INTEGER;
  V_SQLERRM VARCHAR2(4000);
  v_ret     integer := 1; --���̿���
  V_TMP_TAB VARCHAR2(4000);
  V_LRD_ID  VARCHAR2(200);
begin
  
  --д��־
  SP_LOG('SP_LOAD_FILE', V_LOGID);

  --�������
  V_LRD_ID := FN_GET_LRD_TASK(p_path, p_file);

  --�����ļ�ͷ
  SP_LOAD_FILE_HEAD(V_LRD_ID,
                    p_comma => p_comma,
                    p_str => p_str,
                    p_ret => v_ret,
                    p_head =>p_head);

  --���� TMP_TAB ��ʱ���� ״̬ 0:�ȴ���
  SP_LOAD_MAP_TMP(V_LRD_ID, p_file);
  
  --  �����ϵӳ���ֶ� �� SYS_LRD_COLS_MAP ��
  SP_LOAD_COLS_MAP(V_LRD_ID,
                   P_RET => v_ret,
                   P_FILE => p_file);
                   
   -- ����Ƿ��ִ�е������
   -- �� SP_LOAD_COLS_MAP ���ͻ������Ҫ
  ---SP_CHECK(p_path,p_file,v_ret);

  --�����ʱ�� ��������ʱ��״̬ 1:ʹ����
  SP_GET_TMP_TAB(V_LRD_ID, V_TMP_TAB, '1', v_ret);

  --������������ʱ��
  SP_LOAD_FILE_DATA(V_LRD_ID,
                    p_comma => p_comma,
                    p_str => p_str,
                    p_ret => v_ret);

  --����ִ����־
  SP_LRD_MAPPING(V_LRD_ID, v_ret);

  --������ʱ��״̬ 2:ʹ������
  SP_GET_TMP_TAB(V_LRD_ID, V_TMP_TAB, '2', v_ret);



  --д��־
  SP_LOG('SP_LOAD_FILE', V_LOGID);
EXCEPTION
  WHEN OTHERS THEN
    V_SQLCODE := SQLCODE;
    V_SQLERRM := SUBSTR(SQLERRM, 1, 2000);
    --��¼��־
    SP_LOG('SP_LOAD_FILE', V_LOGID, TO_CHAR(V_SQLCODE) || ' ' || V_SQLERRM);
end;
/
