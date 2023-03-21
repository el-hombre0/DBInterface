CREATE DATABASE  IF NOT EXISTS `hotel_new` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel_new`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_new
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_services`
--

DROP TABLE IF EXISTS `additional_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_services` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `id_room` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `description_service` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_service`),
  KEY `id_room` (`id_room`),
  CONSTRAINT `additional_services_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_services`
--

LOCK TABLES `additional_services` WRITE;
/*!40000 ALTER TABLE `additional_services` DISABLE KEYS */;
INSERT INTO `additional_services` VALUES (1,1,'Шампанское El Torino 750 мл',3900.00,'Шампанское 2005'),(2,2,'Парковка автомобиля',1000.00,'5 суток'),(3,2,'Стирка вещей',200.00,NULL),(4,3,'Завтрак 4в1',450.00,'Каша, яйцо, творог, напиток'),(5,2,'Обед 4в1',500.00,'Суп, второе, салат, напиток'),(16,4,'Обед 4в1',500.00,'Первое, второе, салат, напиток'),(17,7,'Стирка вещей',200.00,NULL),(18,8,'Тапочки',100.00,NULL),(19,7,'Глажка вещей',70.00,'30 минут'),(20,5,'Вызов такси',1400.00,'До аэропорта на 07:00'),(21,3,'Extra breakfast',500.00,'Сытный завтрак'),(22,3,'Extra breakfast',500.00,'Сытный завтрак'),(23,3,'Extra breakfast',500.00,'Сытный завтрак'),(24,3,'Тапочки 1 пара',150.00,'Одноразовые, производство КНР');
/*!40000 ALTER TABLE `additional_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `additional_services_BEFORE_INSERT` BEFORE INSERT ON `additional_services` FOR EACH ROW BEGIN
	if (select (exists(select * from guests where guests.id_room = New.id_room)) = 0)
    then
		signal sqlstate '45000' set message_text = 'Данный постоялец не существует';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id_address` int NOT NULL AUTO_INCREMENT,
  `id_guest` int NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `registration_address` varchar(500) NOT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`id_address`),
  KEY `id_guest` (`id_guest`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`id_guest`) REFERENCES `main_guest` (`id_guest`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,1,'Russian Federation','Moscow','Generala Belova st., b. 12, ap. 19','2000-05-19'),(2,2,'USA','Los-Angeles','4823 York Blvd, Los Angeles, CA 90042','2015-09-11'),(3,3,'Russian Federation','Volgograd','Luzhskaya ul., 20, Volgograd, Volgogradskaya obl.','2004-03-29'),(4,4,'USA','Washington','George Marshall\'s sq., b.23, ap. 2, WA 25301','2003-07-21'),(5,5,'USA','Washington','George Marshall\'s sq., b.30, ap. 11, WA 25301','2004-01-19'),(6,6,'USA','Los-Angeles','7824 Jutland Ave, Northridge, CA 91325','1995-03-30'),(7,7,'China','Guangdong','44V6+XJ3, Shannan Ln Kou, Nanhai District, Foshan, Guangdong Province, 528231','1989-10-11'),(8,8,'Russian Federation','St. Petersburg','г. Санкт-Петербург, ул. Александра Матросова, д. 7, кв. 11','2001-12-01'),(9,9,'Russian Federation','St. Petersburg','г. Санкт-Петербург, ул. Александра Матросова, д. 7, кв. 11','2008-09-16'),(10,10,'Russian Federation','St. Petersburg','г. Санкт-Петербург, ул. Александра Матросова, д. 7, кв. 11','2004-03-06'),(11,5,'Russia','Moscow','Moscow, Zhukova st., b. 5, ap. 4','2004-05-05');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `id_administrator` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `second_name` varchar(100) NOT NULL,
  `number_passport` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1,'Alexander','Sinitsin','4511047833',NULL),(2,'Irina','Helman',NULL,NULL),(3,'Dmitriy','Kalanchev','4503857312',NULL),(4,'Stas','Efimtsev','43234543','7(999)-999-99-99'),(5,'Joe','Jackson','24623463','4(756)-354-82-21');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add task',7,'add_task'),(26,'Can change task',7,'change_task'),(27,'Can delete task',7,'delete_task'),(28,'Can view task',7,'view_task');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$XOp7j00QA2FuDbJ6g0dFGG$kbim7iEZRc/i0hl2HYiA5fiUYfuPd7WIFn0MnBPWxCs=','2023-01-29 15:49:30.940877',1,'admin','','','',1,1,'2023-01-29 15:48:40.402537');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'main','guest'),(7,'main','task'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-26 07:45:04.598245'),(2,'auth','0001_initial','2023-01-26 07:45:05.291332'),(3,'admin','0001_initial','2023-01-26 07:45:05.484907'),(4,'admin','0002_logentry_remove_auto_add','2023-01-26 07:45:05.534679'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-26 07:45:05.550672'),(6,'contenttypes','0002_remove_content_type_name','2023-01-26 07:45:05.670670'),(7,'auth','0002_alter_permission_name_max_length','2023-01-26 07:45:05.751544'),(8,'auth','0003_alter_user_email_max_length','2023-01-26 07:45:05.799527'),(9,'auth','0004_alter_user_username_opts','2023-01-26 07:45:05.815508'),(10,'auth','0005_alter_user_last_login_null','2023-01-26 07:45:05.895549'),(11,'auth','0006_require_contenttypes_0002','2023-01-26 07:45:05.903532'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-26 07:45:05.919586'),(13,'auth','0008_alter_user_username_max_length','2023-01-26 07:45:06.015518'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-26 07:45:06.103888'),(15,'auth','0010_alter_group_name_max_length','2023-01-26 07:45:06.138482'),(16,'auth','0011_update_proxy_permissions','2023-01-26 07:45:06.162508'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-26 07:45:06.242500'),(18,'main','0001_initial','2023-01-26 07:45:06.266475'),(19,'sessions','0001_initial','2023-01-26 07:45:06.322475');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c6rhkn6x8f94hxb2jql3iftsmm5oqmt1','.eJxVjMsOwiAUBf-FtSESHhdcuvcbmkO5SNVAUtpV479rky50e2bmbGLAupRh7TwPUxIXocTpd4sYn1x3kB6o9ybHVpd5inJX5EG7vLXEr-vh_h0U9PKtidgjR50pB7jEdvQKgEpnF7QlC1imkDxRDMgOYAY7bTVrb8gY8f4ADoY4sA:1pM9vu:InYZcQE1N4TBrbNrCbBVyG3trI2uQEXdpjTHk9jedwU','2023-02-12 15:49:30.948885');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_guest`
--

DROP TABLE IF EXISTS `main_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_guest` (
  `id_guest` int NOT NULL AUTO_INCREMENT,
  `id_administrator` int NOT NULL,
  `id_room` int NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `second_name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `visit_purpose` varchar(300) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_guest`),
  KEY `id_administrator` (`id_administrator`),
  KEY `id_room` (`id_room`),
  CONSTRAINT `main_guest_ibfk_1` FOREIGN KEY (`id_administrator`) REFERENCES `administrators` (`id_administrator`),
  CONSTRAINT `main_guest_ibfk_2` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_guest`
--

LOCK TABLES `main_guest` WRITE;
/*!40000 ALTER TABLE `main_guest` DISABLE KEYS */;
INSERT INTO `main_guest` VALUES (1,1,2,'Evgeniy','Onegin','1991-12-03','tourism','Rent a car on the third day'),(2,1,1,'Sam','Jones','1999-12-31','work trip',NULL),(3,2,3,'Georgiy','Vazov','1997-06-04','tourism','None'),(4,2,4,'John','Tabacco','2023-01-27','tourism','None'),(5,2,4,'Agata','Clear','1997-01-09','tourism','Девушка Джона Табакко'),(6,2,4,'Деламейн','Никифоров','1989-06-14','туризм','Запросить СНИЛС'),(7,1,7,'Lee','Son Gee','1979-12-20','tourism',NULL),(8,2,8,'Екатерина','Фелисова','1986-05-26','tourism','Мать Владислава и Антона Фелисовых'),(9,2,8,'Владислав','Фелисов','2008-09-09','tourism','Сын Екатерины Фелисовы'),(10,2,8,'Антон','Фелисов','2004-02-25','tourism','Сын Екатерины Фелисовы'),(13,2,9,'Иван','Иванов','1997-07-09','Туризм','Нет'),(14,2,9,'Иван','Иванов','1997-07-09','Туризм','Нет'),(15,3,10,'Степан','Дмитриев','1990-07-16','Туризм','Много сумок ');
/*!40000 ALTER TABLE `main_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_payment`
--

DROP TABLE IF EXISTS `main_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `id_room` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `payment_accommodation` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `id_room` (`id_room`),
  CONSTRAINT `main_payment_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_payment`
--

LOCK TABLES `main_payment` WRITE;
/*!40000 ALTER TABLE `main_payment` DISABLE KEYS */;
INSERT INTO `main_payment` VALUES (1,1,'2022-08-09','2022-08-16',32900.00),(2,1,'2022-09-01','2022-09-20',54000.00),(3,2,'2022-08-30','2022-09-03',44750.00),(7,3,'2022-10-01','2022-10-09',80550.00),(8,4,'2022-09-28','2022-10-03',21500.00),(9,5,'2022-09-10','2022-09-20',28000.00),(10,6,'2022-08-28','2022-09-07',48000.00),(11,7,'2022-10-12','2022-10-20',36000.00),(12,8,'2022-10-20','2022-10-25',24500.00),(13,4,'2022-10-04','2022-10-09',21500.00);
/*!40000 ALTER TABLE `main_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_task`
--

DROP TABLE IF EXISTS `main_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `task` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_task`
--

LOCK TABLES `main_task` WRITE;
/*!40000 ALTER TABLE `main_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passports`
--

DROP TABLE IF EXISTS `passports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passports` (
  `id_passport` int NOT NULL AUTO_INCREMENT,
  `id_guest` int NOT NULL,
  `number_passport` varchar(30) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `who_issued` varchar(300) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_passport`),
  KEY `id_guest` (`id_guest`),
  CONSTRAINT `passports_ibfk_1` FOREIGN KEY (`id_guest`) REFERENCES `main_guest` (`id_guest`),
  CONSTRAINT `CHK_rus_passport` CHECK (((`issue_date` > _utf8mb4'1997-10-01') or (`nationality` <> _utf8mb4'rus')))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passports`
--

LOCK TABLES `passports` WRITE;
/*!40000 ALTER TABLE `passports` DISABLE KEYS */;
INSERT INTO `passports` VALUES (1,1,'4313233465','2013-11-09','GU MVD G. MOSKVI','rus'),(2,2,'1284067543','2016-08-08','Los-Angeles Police Department','usa'),(3,3,'4522765940','2022-07-19','GU MVD G. VOLGOGRAD','rus'),(11,4,'462470091','2007-02-17','Vashington Migration Deparment','usa'),(12,5,'462474658','2009-07-14','Vashington Migration Deparment','usa'),(13,6,'462349200','2011-04-22','Los-Angeles Police Department','usa'),(14,7,'42011284736428475X','2011-08-19','Ministry of Foreign Affairsof the People\'s Republic of China','chn'),(15,8,'4516739156','2015-05-11','УФМС РФ по гор. Санкт-Петербургу по району Рыбацкое','rus'),(16,9,'4522038433','2022-09-30','ГУ МВД России','rus'),(17,10,'451894001','2018-03-13','ГУ МВД России','rus');
/*!40000 ALTER TABLE `passports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id_room` int NOT NULL AUTO_INCREMENT,
  `door_number` int NOT NULL,
  `number_of_rooms` int NOT NULL,
  `floor_number` int NOT NULL,
  `seats_number` int NOT NULL,
  `category` varchar(50) NOT NULL,
  `daily_fee` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,1,3,1,'economy',2700.00),(2,2,2,2,3,'standart+',4700.00),(3,3,4,3,5,'luxury',8950.00),(4,4,2,2,3,'standart+',4300.00),(5,5,1,2,2,'economy',2800.00),(6,6,3,2,3,'standart+',4800.00),(7,7,2,3,2,'standart',4500.00),(8,8,3,3,4,'standart+',4900.00),(9,9,4,3,3,'luxury',8500.00),(10,10,2,4,2,'economy',3000.00),(11,11,3,4,4,'',4700.00),(12,12,3,4,4,'standart',4700.00);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `rooms_BEFORE_INSERT` BEFORE INSERT ON `rooms` FOR EACH ROW BEGIN
	if(select(exists(select * from rooms where door_number = New.door_number)) or New.floor_number > 4) then
		signal sqlstate '45000' set message_text = 'Ошибка при вводе номера двери или номера этажа!';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'hotel_new'
--

--
-- Dumping routines for database 'hotel_new'
--
/*!50003 DROP FUNCTION IF EXISTS `admins_guests_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `admins_guests_number`(admin_surname varchar(30)) RETURNS int
    DETERMINISTIC
BEGIN
declare res int;
select count(*) into res from guests where id_administrator = (select id_administrator from administrators where second_name = admin_surname);
RETURN res;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `comfort_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `comfort_category`(cost float) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare category varchar(50);
    select null into category;
	if cost <= 3000 then 
		set category = 'economy';
	elseif cost between 3000 and 4500 then
		set category = 'standart';
	elseif cost between 4500 and 6000 then
		set category = 'standart+';
	else set category = 'luxary';
    end if;
RETURN category;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `total_pay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `total_pay`(daily_fee float, num_night_of_stay int,
 additional_services_payment float, damage float) RETURNS float
    DETERMINISTIC
BEGIN
	declare accommodation_payment, result_payment float;
    set accommodation_payment = daily_fee * num_night_of_stay;
    set result_payment = accommodation_payment + additional_services_payment + damage;
RETURN (result_payment);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comfort_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comfort_category`(in cost int, out category text)
BEGIN
	if cost <= 3000 then 
		set category = 'economy';
	elseif cost between 3000 and 4500 then
		set category = 'standart';
	elseif cost between 4500 and 6000 then
		set category = 'standart+';
	else set category = 'luxary';
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-21 22:44:02
