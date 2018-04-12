/*
SQLyog Ultimate v10.51 
MySQL - 5.7.11-log : Database - datatransform
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`datatransform` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `datatransform`;

/*Table structure for table `sys_department_info` */

DROP TABLE IF EXISTS `sys_department_info`;

CREATE TABLE `sys_department_info` (
  `UUID` varchar(32) NOT NULL,
  `department_discription` varchar(1024) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `organization_id` varchar(32) NOT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_menu_info` */

DROP TABLE IF EXISTS `sys_menu_info`;

CREATE TABLE `sys_menu_info` (
  `UUID` varchar(32) NOT NULL,
  `discription` varchar(140) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` date NOT NULL,
  `menu_name` varchar(50) NOT NULL,
  `parents_id` varchar(32) NOT NULL,
  `updata_datatime` date DEFAULT NULL,
  `uri` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_organization_info` */

DROP TABLE IF EXISTS `sys_organization_info`;

CREATE TABLE `sys_organization_info` (
  `UUID` varchar(32) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `organization_discription` varchar(1024) NOT NULL,
  `organization_name` varchar(50) NOT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_roles_info` */

DROP TABLE IF EXISTS `sys_roles_info`;

CREATE TABLE `sys_roles_info` (
  `UUID` varchar(32) NOT NULL,
  `department_id` varchar(32) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `role_discription` varchar(1024) DEFAULT NULL,
  `role_name` varchar(50) NOT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_roles_jurisdiction_info` */

DROP TABLE IF EXISTS `sys_roles_jurisdiction_info`;

CREATE TABLE `sys_roles_jurisdiction_info` (
  `UUID` varchar(32) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_base_info` */

DROP TABLE IF EXISTS `sys_user_base_info`;

CREATE TABLE `sys_user_base_info` (
  `UUID` varchar(32) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `password` varchar(50) NOT NULL,
  `persion_name` varchar(50) NOT NULL,
  `seniority` float DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`UUID`),
  UNIQUE KEY `UK_filjsx4kbabuqh2fkxgd72dx5` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_user_roles_info` */

DROP TABLE IF EXISTS `sys_user_roles_info`;

CREATE TABLE `sys_user_roles_info` (
  `UUID` varchar(32) NOT NULL,
  `flag` varchar(30) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  `roles_id` varchar(32) NOT NULL,
  `updata_datatime` datetime DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
