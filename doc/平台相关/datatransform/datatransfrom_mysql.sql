/*
SQLyog Job Agent v10.51 Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.7.11-log : Database - datatransfrom
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/datatransfrom /*!40100 DEFAULT CHARACTER SET utf8 */;

USE datatransfrom;

/*Table structure for table sys_column_info */

DROP TABLE IF EXISTS sys_column_info;

CREATE TABLE sys_column_info (
  uuid varchar(32) NOT NULL COMMENT '唯一约束建',
  table_id varchar(30) NOT NULL COMMENT '表名称',
  column_names varchar(30) NOT NULL COMMENT '字段名',
  column_ instruction varchar(200) NOT NULL COMMENT '字段说明',
  column_type varchar(20) NOT NULL COMMENT '字段类型',
  column_length int(10) NOT NULL COMMENT '字段长度',
  primary_id varchar(2) DEFAULT '0' COMMENT '唯一主键',
  column_sort int(5) NOT NULL COMMENT '字段排序列',
  logical_column varchar(200) DEFAULT NULL COMMENT '逻辑增加列',
  oracle_table varchar(30) NOT NULL COMMENT '导入表名称',
  oracle_column varchar(30) NOT NULL COMMENT '导入表字段',
  oracle_type varchar(20) DEFAULT NULL COMMENT '导入表的类型',
  oracle_length int(10) DEFAULT NULL COMMENT '导入表的长度',
  create_flag varchar(2) DEFAULT '0' COMMENT '创建状态',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table sys_database_info */

DROP TABLE IF EXISTS sys_database_info;

CREATE TABLE sys_database_info (
  uuid varchar(32) NOT NULL COMMENT '唯一主键',
  type varchar(50) NOT NULL COMMENT '数据库类型',
  database_name varchar(30) NOT NULL COMMENT '数据库名称',
  database_information varchar(120) DEFAULT NULL COMMENT '数据库的说明',
  address varchar(120) NOT NULL COMMENT '连接地址',
  port varchar(6) NOT NULL COMMENT '端口',
  username varchar(30) NOT NULL COMMENT '用户名',
  password varchar(30) NOT NULL COMMENT '密码',
  driver varchar(240) NOT NULL COMMENT '驱动类',
  transfrom_control varchar(2) DEFAULT '1' COMMENT '整个库的同步控制',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table sys_files_info */

DROP TABLE IF EXISTS sys_files_info;

CREATE TABLE sys_files_info (
  uuid varchar(32) NOT NULL COMMENT '唯一主键',
  file_name varchar(100) NOT NULL COMMENT '文件名',
  type varchar(50) NOT NULL COMMENT '文件类型',
  byte int(11) NOT NULL COMMENT '文件大小',
  file_path varchar(2047) NOT NULL COMMENT '文件绝对路径',
  separator varchar(10) NOT NULL COMMENT '分隔符',
  start_timestimp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '插入开始时间',
  flag varchar(10) DEFAULT NULL COMMENT '插入状态',
  inser_num int(11) DEFAULT NULL COMMENT '插入记录数',
  end_eimestimp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入结束时间',
  database_id varchar(30) DEFAULT NULL COMMENT '插入数据库',
  to_database_table_name varchar(30) DEFAULT NULL COMMENT '插入数据库的表名称',
  row_count int(11) DEFAULT NULL COMMENT '插入数据库的数据量',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table sys_files_title */

DROP TABLE IF EXISTS sys_files_title;

CREATE TABLE sys_files_title (
  uuid varchar(32) NOT NULL COMMENT '唯一主键',
  file_id varchar(32) NOT NULL COMMENT '文件id',
  title varchar(30) NOT NULL COMMENT '文件标题列',
  first_row varchar(2) DEFAULT NULL COMMENT '是否是第一行',
  to_table varchar(30) NOT NULL COMMENT '导入表名称',
  to_column varchar(30) NOT NULL COMMENT '导入表字段',
  to_col_length int(11) DEFAULT NULL COMMENT '导入表的列长度',
  to_col_type varchar(10) DEFAULT NULL COMMENT '导入表的列类型',
  create_flag varchar(2) DEFAULT NULL COMMENT '创建修改状态',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table sys_table_info */

DROP TABLE IF EXISTS sys_table_info;

CREATE TABLE sys_table_info (
  uuid varchar(32) NOT NULL COMMENT '唯一约束',
  database_uuid varchar(32) NOT NULL COMMENT '数据库表id',
  table_name varchar(30) NOT NULL COMMENT '表名称',
  table_disc varchar(200) DEFAULT NULL COMMENT '表描述',
  create_flag varchar(2) DEFAULT '0' COMMENT '创建修改表的状态',
  transform_control varchar(2) DEFAULT '1' COMMENT '表级别的控制同步',
  delete_data_control varchar(2) DEFAULT '1' COMMENT '是否可删除源表数据',
  screening_conditions varchar(4000) DEFAULT NULL COMMENT '不删除的同步筛选条件',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table sys_transform_control */

DROP TABLE IF EXISTS sys_transform_control;

CREATE TABLE sys_transform_control (
  uuid varchar(32) NOT NULL COMMENT '唯一约束',
  flag varchar(2) NOT NULL DEFAULT '1' COMMENT '控制器',
  PRIMARY KEY (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
