/*
SQLyog Ultimate v10.51 
MySQL - 5.7.11-log : Database - application
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`application` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `application`;

/*Table structure for table `sys_authority_info` */

DROP TABLE IF EXISTS `sys_authority_info`;

CREATE TABLE `sys_authority_info` (
  `f_module_id` varchar(50) NOT NULL,
  `f_allow_delete` int(11) DEFAULT NULL,
  `f_allow_edit` int(11) DEFAULT NULL,
  `f_allow_expand` int(11) DEFAULT NULL,
  `f_create_date` datetime DEFAULT NULL,
  `f_create_user_id` varchar(50) DEFAULT NULL,
  `f_create_user_name` varchar(50) DEFAULT NULL,
  `f_delete_mark` int(11) DEFAULT NULL,
  `f_description` varchar(200) DEFAULT NULL,
  `f_en_code` varchar(50) DEFAULT NULL,
  `f_enabled_mark` int(11) DEFAULT NULL,
  `f_full_name` varchar(40) DEFAULT NULL,
  `f_icon` varchar(40) DEFAULT NULL,
  `f_is_menu` int(11) DEFAULT NULL,
  `f_is_public` int(11) DEFAULT NULL,
  `f_modify_date` datetime DEFAULT NULL,
  `f_modify_user_id` varchar(50) DEFAULT NULL,
  `f_modify_user_name` varchar(100) DEFAULT NULL,
  `f_parent_id` varchar(50) DEFAULT NULL,
  `f_sort_code` int(11) DEFAULT NULL,
  `f_target` varchar(20) DEFAULT NULL,
  `f_url_address` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`f_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_authority_info` */

insert  into `sys_authority_info`(`f_module_id`,`f_allow_delete`,`f_allow_edit`,`f_allow_expand`,`f_create_date`,`f_create_user_id`,`f_create_user_name`,`f_delete_mark`,`f_description`,`f_en_code`,`f_enabled_mark`,`f_full_name`,`f_icon`,`f_is_menu`,`f_is_public`,`f_modify_date`,`f_modify_user_id`,`f_modify_user_name`,`f_parent_id`,`f_sort_code`,`f_target`,`f_url_address`) values ('1',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'DatabaseManage',1,'数据管理','fa  fa-database',0,0,NULL,'','佘赐雄','2c90838f57c6e02e0157c729a9630045',0,'expand','error/404.html'),('10',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'UserManage',1,'用户管理','fa  fa-user',1,0,NULL,'System','超级管理员','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',4,'iframe','error/404.html'),('11',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'RoleManage',1,'角色管理','fa  fa-paw',1,0,NULL,'System','超级管理员','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',3,'iframe','error/404.html'),('12',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'JobManage',1,'职位管理','fa fa-briefcase',1,0,NULL,'System','超级管理员','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',6,'iframe','error/404.html'),('13',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'PostManage',1,'岗位管理','fa  fa-graduation-cap',1,0,NULL,'System','超级管理员','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',5,'iframe','error/404.html'),('14',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'UserGroupManage',1,'用户组管理','fa  fa-group',1,0,NULL,'System','超级管理员','yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',3,'iframe','http://www.runoob.com/'),('15E2530EFC1CCC0D5F21A4CA5C78A426',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'baidu','baidu',1,'百度','fa  fa-desktop',NULL,0,NULL,'','','DE55D6EDD28FC0AA058608C1E4B9F88C',0,'iframe','http://www.baidu.com'),('16d4e2d5-d154-455f-94f7-63bf80ab26aa',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'客户基础资料','ClientBaseData',1,'应用场景','fa fa-book',0,1,NULL,'System','超级管理员','0',2,'expand','error/404.html'),('1c90838f57c6e02e0157c729a95c0043',NULL,NULL,0,NULL,NULL,NULL,0,'系统导航功能','SystemModule',1,'系统功能','fa  fa-navicon',1,0,NULL,'System','超级管理员','zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',0,'iframe','system/system_function_ztree.html'),('2c90838f57c6e02e0157c729a86b000b',NULL,NULL,1,NULL,'System','超级管理员',0,'动态链接数据库','DataBaseLink',1,'数据库连接','fa  fa-plug',1,0,NULL,'System','超级管理员','2c90838f57c6e02e0157c729a9630045',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a871000c',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'发起流程',1,'发起流程','fa  fa-edit',1,0,NULL,'1','佘赐雄','5',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a876000d',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'企业号设置',1,'企业号设置','fa  fa-plug',1,0,NULL,'System','超级管理员','b9f9df92-8ac5-46e2-90ac-68c5c2e034c3',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a87b000e',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'formCategory',1,'表单类别','fa  fa-tags',1,0,NULL,'System','超级管理员','458113c6-b0be-4d6f-acce-7524f4bc3e88',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8850010',NULL,NULL,0,NULL,'System','超级管理员',0,'报表模板管理','ReportTemp',1,'报表管理','fa  fa-cogs',1,1,NULL,'System','超级管理员','6',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a88a0011',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'NewManage',1,'新闻中心','fa  fa-feed',1,0,NULL,'System','超级管理员','4',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a88f0012',NULL,NULL,0,NULL,NULL,NULL,0,'销售产品信息','Client_ProductInfo',1,'场景1 数据库配置','fa fa-bicycle',1,0,NULL,'System','佘赐雄','16d4e2d5-d154-455f-94f7-63bf80ab26aa',0,'expand','error/404.html'),('2c90838f57c6e02e0157c729a8940013',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'flowMonitor',1,'流程监控','fa  fa-eye',1,0,NULL,'System','超级管理员','b5cb98f6-fb41-4a0f-bc11-469ff117a411',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8990014',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'NoticeManage',1,'通知公告','fa  fa-volume-up',1,0,NULL,'System','超级管理员','4',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a89d0015',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'商机管理','ClientChance',1,'商机管理','fa  fa-binoculars',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8a10016',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,NULL,'PurchaseReport',1,'采购报表','fa  fa-bar-chart',1,0,NULL,'System','超级管理员','6',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8a50017',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_Trade',1,'场景2 多种数据源迁移','fa fa-automobile',1,0,NULL,'1','佘赐雄','16d4e2d5-d154-455f-94f7-63bf80ab26aa',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8a90018',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'企业号部门',1,'企业号部门','fa  fa-sitemap',1,0,NULL,'System','超级管理员','b9f9df92-8ac5-46e2-90ac-68c5c2e034c3',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8ae0019',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'flowCategory',1,'流程类别','fa  fa-tags',1,0,NULL,'System','超级管理员','458113c6-b0be-4d6f-acce-7524f4bc3e88',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8b2001a',NULL,NULL,1,NULL,'System','超级管理员',0,'数据备份、数据还原','DataBaseBackup',1,'数据库备份','fa  fa-cloud-download',1,0,NULL,'System','超级管理员','2c90838f57c6e02e0157c729a9630045',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8b6001b',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'草稿流程',1,'草稿流程','fa  fa-file-text-o',1,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬','5',2,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8c2001e',NULL,NULL,1,NULL,'System','超级管理员',0,'通用数据字典','DataItemManage',1,'通用字典','fa  fa-book',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',3,'iframe','datacentor/addr/index.html'),('2c90838f57c6e02e0157c729a8ca0020',NULL,NULL,1,NULL,'System','超级管理员',0,'自动产生号码','CodeRule',1,'单据编码','fa  fa-barcode',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',4,'iframe','http://www.baidu.com'),('2c90838f57c6e02e0157c729a8d20022',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'formDesign',1,'表单设计','fa  fa-puzzle-piece',1,0,NULL,'System','超级管理员','458113c6-b0be-4d6f-acce-7524f4bc3e88',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8d60023',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'企业号成员',1,'企业号成员','fa  fa-users',1,0,NULL,'System','超级管理员','b9f9df92-8ac5-46e2-90ac-68c5c2e034c3',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8da0024',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_Sort',1,'场景3 数据字段整理','fa  fa-bank',1,0,NULL,'1','佘赐雄','16d4e2d5-d154-455f-94f7-63bf80ab26aa',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8de0025',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,NULL,'SalesReport',1,'销售报表','fa  fa-line-chart',1,0,NULL,'System','超级管理员','6',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8e20026',NULL,NULL,1,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬',0,NULL,'我的流程',1,'我的流程','fa  fa-file-word-o',1,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬','5',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8e60027',NULL,NULL,0,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'客户管理','ClientInfoManage',1,'客户管理','fa  fa-suitcase',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8ea0028',NULL,NULL,1,NULL,'System','超级管理员',0,'文件管理','ResourceFileManage',1,'文件资料','fa  fa-jsfiddle',1,0,NULL,'System','超级管理员','2c90838f57c6e02e0157c729a9630045',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8ee0029',NULL,NULL,1,NULL,'System','超级管理员',0,'数据库表结构','DataBaseTable',1,'数据表管理','fa  fa-table',1,0,NULL,'System','超级管理员','2c90838f57c6e02e0157c729a8da0024',0,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8f2002a',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'flowDelegate',1,'流程指派','fa  fa-random',1,0,NULL,'System','超级管理员','b5cb98f6-fb41-4a0f-bc11-469ff117a411',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8f6002b',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,NULL,'StorageReport',1,'仓存报表','fa  fa-area-chart',1,0,NULL,'System','超级管理员','2c90838f57c6e02e0157c729a9630045',3,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8fa002c',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_Degree',1,'场景4 桥数据处理','fa  fa-camera',1,0,NULL,'System','超级管理员','16d4e2d5-d154-455f-94f7-63bf80ab26aa',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a8ff002d',NULL,NULL,0,NULL,'System','超级管理员',0,'开票管理','ClientInvoice',1,'客户开票','fa  fa-coffee',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a903002e',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'企业号应用',1,'企业号应用','fa  fa-safari',1,0,NULL,'System','超级管理员','b9f9df92-8ac5-46e2-90ac-68c5c2e034c3',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a907002f',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'flowDesign',1,'流程设计','fa  fa-share-alt',1,0,NULL,'System','超级管理员','458113c6-b0be-4d6f-acce-7524f4bc3e88',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a90b0030',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'待办流程',1,'待办流程','fa  fa-hourglass-half',1,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬','5',4,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9210035',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'已办流程',1,'已办流程','fa  fa-flag',1,0,NULL,'System','超级管理员','5',5,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9250036',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_Level',1,'场景5 知识库整理','fa  fa-motorcycle',1,0,NULL,'System','超级管理员','16d4e2d5-d154-455f-94f7-63bf80ab26aa',5,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9290037',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'客户订单管理','ClientOrder',1,'客户订单','fa  fa-modx',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',5,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9310039',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'现金银行报表','MoneyReport',1,'对账报表','fa  fa-pie-chart',1,0,NULL,'System','超级管理员','6',5,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a936003a',NULL,NULL,1,NULL,'System','超级管理员',0,'邮件管理','EmailManage',1,'邮件中心','fa  fa-send',1,0,NULL,'System','超级管理员','4',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a93a003b',NULL,NULL,0,NULL,'System','超级管理员',0,'日程管理','ScheduleManage',1,'日程管理','fa  fa-calendar',1,0,NULL,'System','超级管理员','4',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a942003d',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_ChanceSource',1,'场景6 特殊字段处理','fa fa-plane',1,0,NULL,'1','佘赐雄','16d4e2d5-d154-455f-94f7-63bf80ab26aa',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a946003e',NULL,NULL,0,NULL,'System','超级管理员',0,'收款管理','ClienReceivable',1,'收款管理','fa  fa-money',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a94b003f',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'工作委托',1,'工作委托','fa  fa-coffee',1,0,NULL,'System','超级管理员','5',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9540041',NULL,NULL,1,NULL,'System','超级管理员',0,'登录日志、操作日志。异常日志','SystemLog',1,'系统日志','fa  fa-warning',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',5,'iframe','https://www.oschina.net/'),('2c90838f57c6e02e0157c729a9600044',NULL,NULL,1,NULL,'System','超级管理员',0,'收款报表','ClienReceivableReport',1,'收款报表','fa  fa-bar-chart',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',7,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9630045',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_ChancePhase',1,'场景7 数据源（数据资产）管理','fa  fa-ship',1,0,NULL,'1','佘赐雄','16d4e2d5-d154-455f-94f7-63bf80ab26aa',7,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a96b0047',NULL,NULL,1,NULL,'System','超级管理员',0,'系统功能自定义表单','SystemForm',1,'系统表单','fa  fa-paw',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',6,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a96f0048',NULL,NULL,0,NULL,'System','超级管理员',0,'支出管理','ClienExpenses',1,'支出管理','fa  fa-credit-card-alt',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',8,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9730049',NULL,NULL,0,NULL,NULL,NULL,0,'','Client_PaymentMode',1,'场景8 批量处理','fa   fa-truck',1,0,NULL,'System','超级管理员','16d4e2d5-d154-455f-94f7-63bf80ab26aa',8,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a97b004b',NULL,NULL,0,NULL,'System','超级管理员',0,'自动生成代码、自动生成功能','CodeCreate',1,'快速开发','fa  fa-code',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',1,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a982004d',NULL,NULL,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬',0,'手机移动端开发','AppCreate',1,'移动开发','fa  fa-file-code-o',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',7,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a986004e',NULL,NULL,1,NULL,'System','超级管理员',0,'收支报表','ClienCashBalanceReport',1,'现金报表','fa  fa-bar-chart',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',9,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a98a004f',NULL,NULL,0,NULL,'eab01522-f4fe-48ce-8db6-76fd7813cdf5','刘晓雷',0,NULL,'rpt001',1,'销售日报表','fa  fa-pie-chart',1,0,NULL,'System','超级管理员','6',9,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a98f0050',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'Client_PaymentAccount',1,'收支账户','fa  fa-tag',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',8,'iframe','error/404.html'),('2c90838f57c6e02e0157c729a9930051',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'Client_ExpensesType',1,'支出种类','fa  fa-tag',1,0,NULL,'System','超级管理员','ad147f6d-613f-4d2d-8c84-b749d0754f3b',9,'iframe','error/404.html'),('4',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'CommonInfo',1,'公共信息','fa  fa-globe',0,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',12,'expand','error/404.html'),('41346E77B5867B9B10AA075818FFBF70',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'菜鸟教程','fa  fa-external-link',NULL,0,NULL,'','','DE55D6EDD28FC0AA058608C1E4B9F88C',3,'iframe','http://www.runoob.com/'),('458113c6-b0be-4d6f-acce-7524f4bc3e88',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'流程配置',1,'流程配置','fa  fa-wrench',0,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬','5',7,'expand','error/404.html'),('49E1D4F4FAC3D4725712E74904F58826',NULL,NULL,NULL,NULL,'','',0,'0','',NULL,'列的配置','fa  fa-shopping-bag',0,0,NULL,NULL,NULL,'2c90838f57c6e02e0157c729a88f0012',2,'iframe','scene1/column.html'),('5',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'flowManage',1,'工作流程','fa  fa-share-alt',0,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',10,'expand','error/404.html'),('555D4B098704FEC63676E1663CC69F29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'禅道','fa  fa-desktop',NULL,0,NULL,'','','7B7A686D52C5483EE7E59747AA10DA34',1,'iframe','http://192.168.1.98:81/zentao/user-login-L3plbnRhby8=.html'),('5E62534C4E4BBA27082F71C6F7F985D6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'西检平台','fa  fa-desktop',NULL,0,NULL,'','','7B7A686D52C5483EE7E59747AA10DA34',3,'iframe','http://172.16.3.17:8080/ZHXXYYPT/new/page/zhcx/search.jsp'),('6',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'ReportManage',1,'报表中心','fa  fa-area-chart',0,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',0,'expand','error/404.html'),('665FF503A18E5635D96CCA3C91AFF301',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'maven respontry','fa  fa-desktop',NULL,0,NULL,'','','DE55D6EDD28FC0AA058608C1E4B9F88C',2,'iframe','http://mvnrepository.com/'),('742E000245328C3F4BF2AE08FC1B859C',NULL,NULL,NULL,NULL,NULL,NULL,0,'','',1,'图标集合','glyphicon glyphicon-list-alt',NULL,0,NULL,'','','zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',1,'iframe','system/icons.html'),('7ae94059-9aa5-48eb-8330-4e2a6565b193',NULL,NULL,1,NULL,'System','超级管理员',0,'行政区域管理','AreaManage',1,'行政区域','fa  fa-leaf',1,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',2,'iframe','default.html'),('7B7A686D52C5483EE7E59747AA10DA34',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'内网私服','fa  fa-link',NULL,0,NULL,'','','0',4,'expand','http://www.jianshu.com/'),('8',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'OrganizeManage',1,'机构管理','fa  fa-sitemap',1,0,NULL,'System','超级管理员','2',1,'iframe','error/404.html'),('84218ADE21B5EA6F14AD485F2612D977',NULL,NULL,NULL,NULL,NULL,NULL,0,'类型配置','',1,'分类配置','fa  fa-shopping-bag',0,0,NULL,'','','2c90838f57c6e02e0157c729a88f0012',2,'iframe','scene1/type.html'),('9',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'DepartmentManage',1,'部门管理','fa  fa-th-list',1,0,NULL,'System','超级管理员','2',2,'iframe','error/404.html'),('ad147f6d-613f-4d2d-8c84-b749d0754f3b',NULL,NULL,1,NULL,'0f36148c-719f-41e0-8c8c-16ffbc40d0e0','佘赐雄',0,'客户关系管理','CustomerManage',1,'客户关系','fa  fa-briefcase',0,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',10,'expand','error/404.html'),('b5cb98f6-fb41-4a0f-bc11-469ff117a411',NULL,NULL,1,NULL,'System','超级管理员',0,NULL,'flowManage',1,'流程管理','fa  fa-cogs',0,0,NULL,'24a055d6-5924-44c5-be52-3715cdd68011','陈彬彬','5',8,'expand','error/404.html'),('b9f9df92-8ac5-46e2-90ac-68c5c2e034c3',NULL,NULL,0,NULL,'System','超级管理员',0,NULL,'WeChatManage',1,'微信管理','fa  fa-weixin',0,0,NULL,'System','超级管理员','CD162EA78B88EC492DF0DA1B87D35560',11,'expand','http://www.fenby.com/'),('CD162EA78B88EC492DF0DA1B87D35560',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'其他','fa  fa-cog',NULL,NULL,NULL,'','','0',5,'expand','error/404.html'),('D6CD7FEB010A59349CE32BAA094417BC',NULL,NULL,NULL,NULL,'','',0,'','',1,'表的配置','fa  fa-shopping-bag',0,0,NULL,NULL,NULL,'2c90838f57c6e02e0157c729a88f0012',2,'iframe','scene1/table.html'),('DE55D6EDD28FC0AA058608C1E4B9F88C',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'外网连接','fa  fa-external-link',NULL,NULL,NULL,'','','0',3,'expand','error/404.html'),('F407FC6275E88652F919FF3249E476BB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'nexus私服','fa  fa-desktop',NULL,0,NULL,'','','7B7A686D52C5483EE7E59747AA10DA34',2,'_blank','http://192.168.1.98:8082/nexus'),('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'BaseManage',1,'单位组织','fa  fa-coffee',0,0,NULL,'1','佘赐雄','CD162EA78B88EC492DF0DA1B87D35560',9,'expand','error/404.html'),('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',NULL,NULL,1,NULL,NULL,NULL,0,NULL,'SysManage',1,'系统管理','fa  fa-desktop',0,0,NULL,'System','超级管理员','0',0,'expand','error/404.html');

/*Table structure for table `sys_zhcx_cols` */

DROP TABLE IF EXISTS `sys_zhcx_cols`;

CREATE TABLE `sys_zhcx_cols` (
  `UUID` varchar(128) NOT NULL,
  `TABLE_UUID` varchar(150) DEFAULT NULL,
  `COLS_NAME` varchar(600) NOT NULL,
  `COLS_DESC` varchar(1000) DEFAULT NULL,
  `COLD_TYPE` varchar(212) DEFAULT NULL,
  `COLD_LENGTH` int(11) NOT NULL,
  `COLS_ORDER` int(11) DEFAULT NULL,
  `PAGE_INPUT` char(1) DEFAULT NULL,
  `PAGE_LIST` char(1) DEFAULT NULL,
  `PAGE_VIEW` char(1) DEFAULT NULL,
  `USER_INDEX` varchar(60) DEFAULT NULL,
  `CREATE_USER` varchar(1000) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `UPDATE_USER` varchar(92) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL,
  `TJ_COLS_NAME0` varchar(60) DEFAULT NULL,
  `TJ_COLS_DESC0` varchar(1000) DEFAULT NULL,
  `TJ_COLS_CODE_DESC0` varchar(1000) DEFAULT NULL,
  `TJ_COLS_NAME1` varchar(60) DEFAULT NULL,
  `TJ_COLS_DESC1` varchar(1000) DEFAULT NULL,
  `TJ_COLS_CODE_DESC1` varchar(1000) DEFAULT NULL,
  `TJ_COLS_NAME2` varchar(60) DEFAULT NULL,
  `TJ_COLS_DESC2` varchar(1000) DEFAULT NULL,
  `TJ_COLS_CODE_DESC2` varchar(1000) DEFAULT NULL,
  `TJ_COLS_NAME3` varchar(60) DEFAULT NULL,
  `TJ_COLS_DESC3` varchar(1000) DEFAULT NULL,
  `TJ_COLS_CODE_DESC3` varchar(1000) DEFAULT NULL,
  `TJ_COLS_FLAG` char(1) DEFAULT NULL,
  `TJ_COLS_DESC` varchar(1000) DEFAULT NULL,
  `MD5_FLAG` varchar(2) DEFAULT NULL,
  `ES_INDEX` varchar(60) DEFAULT NULL,
  `ROW_NUM_PERCENT` float(5,4) DEFAULT '1.0000',
  `MAX_LENGTH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_zhcx_cols` */

/*Table structure for table `sys_zhcx_tabs` */

DROP TABLE IF EXISTS `sys_zhcx_tabs`;

CREATE TABLE `sys_zhcx_tabs` (
  `UUID` varchar(100) NOT NULL,
  `TYPE_UUID` varchar(46) DEFAULT NULL,
  `TABLE_NAME` varchar(80) DEFAULT NULL,
  `TABLE_DESC` varchar(500) DEFAULT NULL,
  `TABLE_ROWS` int(11) DEFAULT NULL,
  `TABLE_SPACE` int(11) DEFAULT NULL,
  `TABLE_ORDER` int(11) DEFAULT NULL,
  `CREATE_USER` varchar(46) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `UPDATE_USER` varchar(46) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  `DELETE_FLAG` varchar(1) DEFAULT NULL,
  `TJ_FLAG` varchar(1) DEFAULT NULL,
  `ES_NAME` varchar(100) DEFAULT NULL,
  `DB_TYPE` varchar(80) DEFAULT NULL,
  `COLS_TIME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_zhcx_tabs` */

/*Table structure for table `sys_zhcx_type` */

DROP TABLE IF EXISTS `sys_zhcx_type`;

CREATE TABLE `sys_zhcx_type` (
  `UUID` varchar(46) NOT NULL,
  `TYPE_NAME` varchar(30) DEFAULT NULL,
  `TYPE_CLASS` varchar(30) DEFAULT NULL,
  `TYPE_ORDER` varchar(30) DEFAULT NULL,
  `CREATE_USER` varchar(46) DEFAULT NULL,
  `CREATE_TIME` date DEFAULT NULL,
  `UPDATE_USER` varchar(46) DEFAULT NULL,
  `UPDATE_TIME` date DEFAULT NULL,
  `DELETE_FLAG` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_zhcx_type` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
