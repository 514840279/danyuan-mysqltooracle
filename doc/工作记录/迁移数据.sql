select 'create table '||t.table_name||' as  select * from '||t.table_name||'@dblink_172_16_3_17;' 
  from sys_zhcx_tabs@DBLINK_172_16_3_17 t
 where t.table_desc like '%公司%'
 or t.table_desc like '%企业%'
 ;
 
 
 
 -- 企业相关数据 迁移
 create table SHXX_WLXG_GDRJHWTGD_GSXX as  select * from ZHCX.SHXX_WLXG_GDRJHWTGD_GSXX@dblink_172_16_3_17;
create table SHXX_QYXG_企业基本信息 as  select * from ZHCX.SHXX_QYXG_企业基本信息@dblink_172_16_3_17;
create table SHXX_QYXG_GSKHXG_公司客户 as  select * from ZHCX.SHXX_QYXG_GSKHXG_公司客户@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_现金流量 as  select * from ZHCX.SHXX_QYXG_GSMCDM_现金流量@dblink_172_16_3_17;
create table SHXX_QYXG_HJXG_公司信息 as  select * from ZHCX.SHXX_QYXG_HJXG_公司信息@dblink_172_16_3_17;
create table QYDZ_QBXX as  select * from LGY.QYDZ_QBXX@dblink_172_16_3_17;
create table QY_GABM_LINK_QBXX as  select * from LGY.QY_GABM_LINK_QBXX@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_资产负债表 as  select * from ZHCX.SHXX_QYXG_GSMCDM_资产负债表@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_对外担保 as  select * from ZHCX.SHXX_QYXG_GSMCDM_对外担保@dblink_172_16_3_17;
create table SHXX_QYXG_GSJBXX_异常 as  select * from ZHCX.SHXX_QYXG_GSJBXX_异常@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_运营能力指标 as  select * from ZHCX.SHXX_QYXG_GSMCDM_运营能力指标@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_财务风险 as  select * from ZHCX.SHXX_QYXG_GSMCDM_财务风险@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_盈利能力 as  select * from ZHCX.SHXX_QYXG_GSMCDM_盈利能力@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_利润表 as  select * from ZHCX.SHXX_QYXG_GSMCDM_利润表@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_龙虎榜单 as  select * from ZHCX.SHXX_QYXG_GSMCDM_龙虎榜单@dblink_172_16_3_17;
create table WLXX_GSXG_GPDM as  select * from ZHCX.WLXX_GSXG_GPDM@dblink_172_16_3_17;
create table WLXX_QYXG_ZPXX as  select * from ZHCX.WLXX_QYXG_ZPXX@dblink_172_16_3_17;
create table SHXX_QYXG_JJXG_基金持仓 as  select * from ZHCX.SHXX_QYXG_JJXG_基金持仓@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_每股指标 as  select * from ZHCX.SHXX_QYXG_GSMCDM_每股指标@dblink_172_16_3_17;
create table SHXX_QYXG_SZGS_企业项目 as  select * from ZHCX.SHXX_QYXG_SZGS_企业项目@dblink_172_16_3_17;
create table GYYXG_GYS_公司信息 as  select * from ZHCX.GYYXG_GYS_公司信息@dblink_172_16_3_17;
create table SHXG_QYXG_XYXG_公司变更 as  select * from ZHCX.SHXG_QYXG_XYXG_公司变更@dblink_172_16_3_17;
create table COMPANY_INFO_TXT_1 as  select * from HADOOP.COMPANY_INFO_TXT_1@dblink_172_16_3_17;
create table COMPANY_INFO_LARGE_DIS as  select * from HADOOP.COMPANY_INFO_LARGE_DIS@dblink_172_16_3_17;
create table COMPANY_INFO_LITTLE_1 as  select * from HADOOP.COMPANY_INFO_LITTLE_1@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_成长能力 as  select * from ZHCX.SHXX_QYXG_GSMCDM_成长能力@dblink_172_16_3_17;
create table SHXX_QYXG_GSMCDM_大宗交易 as  select * from ZHCX.SHXX_QYXG_GSMCDM_大宗交易@dblink_172_16_3_17;
create table ZHCX_BXGS as  select * from ZHCX.ZHCX_BXGS@dblink_172_16_3_17;
create table ZHCX_GSML as  select * from ZHCX.ZHCX_GSML@dblink_172_16_3_17;
create table ZHCX_GSML_T as  select * from ZHCX.ZHCX_GSML_T@dblink_172_16_3_17;
create table SHXG_QYXG_公司基本信息_8G as  select * from ZHCX.SHXG_QYXG_公司基本信息_8G@dblink_172_16_3_17;
create table SHXG_QYXG_公司基本信息 as  select * from ZHCX.SHXG_QYXG_公司基本信息@dblink_172_16_3_17;
create table ZZYXG_QYXG_公司信息 as  select * from ZHCX.ZZYXG_QYXG_公司信息@dblink_172_16_3_17;
create table ZZYXG_QYXG_公司联系方式 as  select * from ZHCX.ZZYXG_QYXG_公司联系方式@dblink_172_16_3_17;
create table ZHANGMIXINXI_150108 as  select * from HADOOP.ZHANGMIXINXI_150108@dblink_172_16_3_18;
create table SHUNQIWANG_CHANPIN as  select * from HADOOP.SHUNQIWANG_CHANPIN@dblink_172_16_3_18;
create table WLXX_GSXG_DJGXX as  select * from ZHCX.WLXX_GSXG_DJGXX@dblink_172_16_3_17;
create table SHXG_QYXG_XYXG_公司基本信息_SZ as  select * from ZHCX.SHXG_QYXG_XYXG_公司基本信息_SZ@dblink_172_16_3_17;
create table ENT as  select * from HY.ENT@dblink_172_16_3_17;
create table HIRE_INFO_1 as  select * from HADOOP.HIRE_INFO_1@dblink_172_16_3_17;
create table COMPANY_CONTACT as  select * from HADOOP.COMPANY_CONTACT@dblink_172_16_3_17;
