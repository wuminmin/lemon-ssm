CREATE DATABASE  IF NOT EXISTS `crmspmvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `crmspmvc`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: crmspmvc
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lemon_customer`
--

DROP TABLE IF EXISTS `lemon_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemon_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id 主键自增长ID',
  `customer_name` varchar(30) NOT NULL DEFAULT '' COMMENT '客户名字',
  `mobile` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机账号-电信号码',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户密码-其他号码',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别：0：未知， 1 ：男， 2：女',
  `effective` tinyint(1) NOT NULL DEFAULT '0' COMMENT '客户有效性：0：未验证， 1 ：验证无效， 2：验证有效',
  `region` tinyint(1) NOT NULL DEFAULT '0' COMMENT '组区域：0：未知， 1 ：上海， 2：北京',
  `bank_card` varchar(30) NOT NULL DEFAULT '' COMMENT '银行卡-发展人电话',
  `idcard_num` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除，0否，大于0是删除（大于0是存的删除的时间戳）',
  `belong_user_id` int(11) DEFAULT NULL COMMENT '归属id',
  `group_id` int(11) DEFAULT NULL COMMENT '归属组id',
  `submit_time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemon_customer`
--

LOCK TABLES `lemon_customer` WRITE;
/*!40000 ALTER TABLE `lemon_customer` DISABLE KEYS */;
INSERT INTO `lemon_customer` VALUES (2,'吴敏民','1234','1234',0,0,0,'12341','1234','',0,NULL,NULL,'2017年08月08日 09时25分02秒');
/*!40000 ALTER TABLE `lemon_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lemon_group`
--

DROP TABLE IF EXISTS `lemon_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemon_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemon_group`
--

LOCK TABLES `lemon_group` WRITE;
/*!40000 ALTER TABLE `lemon_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lemon_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lemon_group_user`
--

DROP TABLE IF EXISTS `lemon_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemon_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `leve` tinyint(1) DEFAULT NULL COMMENT '等级 0组长 1组员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemon_group_user`
--

LOCK TABLES `lemon_group_user` WRITE;
/*!40000 ALTER TABLE `lemon_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `lemon_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lemon_seat_info`
--

DROP TABLE IF EXISTS `lemon_seat_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemon_seat_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_num` int(11) DEFAULT NULL COMMENT '坐席号',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0未使用 1使用 3废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemon_seat_info`
--

LOCK TABLES `lemon_seat_info` WRITE;
/*!40000 ALTER TABLE `lemon_seat_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `lemon_seat_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lemon_user`
--

DROP TABLE IF EXISTS `lemon_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemon_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_num` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemon_user`
--

LOCK TABLES `lemon_user` WRITE;
/*!40000 ALTER TABLE `lemon_user` DISABLE KEYS */;
INSERT INTO `lemon_user` VALUES (1,NULL,'wmm','123');
/*!40000 ALTER TABLE `lemon_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08  9:28:55
