select 'create table '||t.table_name||' as  select * from '||t.table_name||'@dblink_172_16_3_17;' 
  from sys_zhcx_tabs@DBLINK_172_16_3_17 t
 where t.table_desc like '%��˾%'
 or t.table_desc like '%��ҵ%'
 ;
 
 
 
 -- ��ҵ������� Ǩ��
 create table SHXX_WLXG_GDRJHWTGD_GSXX as  select * from ZHCX.SHXX_WLXG_GDRJHWTGD_GSXX@dblink_172_16_3_17;
create table SHXX_QYXG_��ҵ������Ϣ as  select * from ZHCX.SHXX_QYXG_��ҵ������Ϣ@dblink_172_16_3_17;
create table SHXX_QYXG_GSKHXG_��˾�ͻ� as  select * from ZHCX.SHXX_QYXG_GSKHXG_��˾�ͻ�@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_�ֽ����� as  select * from ZHCX.SHXX_QYXG_GSMCDM_�ֽ�����@dblink_172_16_3_17;
create table SHXX_QYXG_HJXG_��˾��Ϣ as  select * from ZHCX.SHXX_QYXG_HJXG_��˾��Ϣ@dblink_172_16_3_17;
create table QYDZ_QBXX as  select * from LGY.QYDZ_QBXX@dblink_172_16_3_17;
create table QY_GABM_LINK_QBXX as  select * from LGY.QY_GABM_LINK_QBXX@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_�ʲ���ծ�� as  select * from ZHCX.SHXX_QYXG_GSMCDM_�ʲ���ծ��@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_���ⵣ�� as  select * from ZHCX.SHXX_QYXG_GSMCDM_���ⵣ��@dblink_172_16_3_17;
create table SHXX_QYXG_GSJBXX_�쳣 as  select * from ZHCX.SHXX_QYXG_GSJBXX_�쳣@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_��Ӫ����ָ�� as  select * from ZHCX.SHXX_QYXG_GSMCDM_��Ӫ����ָ��@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_������� as  select * from ZHCX.SHXX_QYXG_GSMCDM_�������@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_ӯ������ as  select * from ZHCX.SHXX_QYXG_GSMCDM_ӯ������@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_����� as  select * from ZHCX.SHXX_QYXG_GSMCDM_�����@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_������ as  select * from ZHCX.SHXX_QYXG_GSMCDM_������@dblink_172_16_3_17;
create table WLXX_GSXG_GPDM as  select * from ZHCX.WLXX_GSXG_GPDM@dblink_172_16_3_17;
create table WLXX_QYXG_ZPXX as  select * from ZHCX.WLXX_QYXG_ZPXX@dblink_172_16_3_17;
create table SHXX_QYXG_JJXG_����ֲ� as  select * from ZHCX.SHXX_QYXG_JJXG_����ֲ�@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_ÿ��ָ�� as  select * from ZHCX.SHXX_QYXG_GSMCDM_ÿ��ָ��@dblink_172_16_3_17;
create table SHXX_QYXG_SZGS_��ҵ��Ŀ as  select * from ZHCX.SHXX_QYXG_SZGS_��ҵ��Ŀ@dblink_172_16_3_17;
create table GYYXG_GYS_��˾��Ϣ as  select * from ZHCX.GYYXG_GYS_��˾��Ϣ@dblink_172_16_3_17;
create table SHXG_QYXG_XYXG_��˾��� as  select * from ZHCX.SHXG_QYXG_XYXG_��˾���@dblink_172_16_3_17;
create table COMPANY_INFO_TXT_1 as  select * from HADOOP.COMPANY_INFO_TXT_1@dblink_172_16_3_17;
create table COMPANY_INFO_LARGE_DIS as  select * from HADOOP.COMPANY_INFO_LARGE_DIS@dblink_172_16_3_17;
create table COMPANY_INFO_LITTLE_1 as  select * from HADOOP.COMPANY_INFO_LITTLE_1@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_�ɳ����� as  select * from ZHCX.SHXX_QYXG_GSMCDM_�ɳ�����@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_���ڽ��� as  select * from ZHCX.SHXX_QYXG_GSMCDM_���ڽ���@dblink_172_16_3_17;
create table ZHCX_BXGS as  select * from ZHCX.ZHCX_BXGS@dblink_172_16_3_17;
create table ZHCX_GSML as  select * from ZHCX.ZHCX_GSML@dblink_172_16_3_17;
create table ZHCX_GSML_T as  select * from ZHCX.ZHCX_GSML_T@dblink_172_16_3_17;
create table SHXG_QYXG_��˾������Ϣ_8G as  select * from ZHCX.SHXG_QYXG_��˾������Ϣ_8G@dblink_172_16_3_17;
create table SHXG_QYXG_��˾������Ϣ as  select * from ZHCX.SHXG_QYXG_��˾������Ϣ@dblink_172_16_3_17;
create table ZZYXG_QYXG_��˾��Ϣ as  select * from ZHCX.ZZYXG_QYXG_��˾��Ϣ@dblink_172_16_3_17;
create table ZZYXG_QYXG_��˾��ϵ��ʽ as  select * from ZHCX.ZZYXG_QYXG_��˾��ϵ��ʽ@dblink_172_16_3_17;
create table ZHANGMIXINXI_150108 as  select * from HADOOP.ZHANGMIXINXI_150108@dblink_172_16_3_18;
create table SHUNQIWANG_CHANPIN as  select * from HADOOP.SHUNQIWANG_CHANPIN@dblink_172_16_3_18;
create table WLXX_GSXG_DJGXX as  select * from ZHCX.WLXX_GSXG_DJGXX@dblink_172_16_3_17;
create table SHXG_QYXG_XYXG_��˾������Ϣ_SZ as  select * from ZHCX.SHXG_QYXG_XYXG_��˾������Ϣ_SZ@dblink_172_16_3_17;
create table ENT as  select * from HY.ENT@dblink_172_16_3_17;
create table HIRE_INFO_1 as  select * from HADOOP.HIRE_INFO_1@dblink_172_16_3_17;
create table COMPANY_CONTACT as  select * from HADOOP.COMPANY_CONTACT@dblink_172_16_3_17;
