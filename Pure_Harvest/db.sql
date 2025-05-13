/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - pure_harvest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pure_harvest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `pure_harvest`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add farmer_table',7,'add_farmer_table'),
(26,'Can change farmer_table',7,'change_farmer_table'),
(27,'Can delete farmer_table',7,'delete_farmer_table'),
(28,'Can view farmer_table',7,'view_farmer_table'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add officer_table',9,'add_officer_table'),
(34,'Can change officer_table',9,'change_officer_table'),
(35,'Can delete officer_table',9,'delete_officer_table'),
(36,'Can view officer_table',9,'view_officer_table'),
(37,'Can add order_table',10,'add_order_table'),
(38,'Can change order_table',10,'change_order_table'),
(39,'Can delete order_table',10,'delete_order_table'),
(40,'Can view order_table',10,'view_order_table'),
(41,'Can add product_table',11,'add_product_table'),
(42,'Can change product_table',11,'change_product_table'),
(43,'Can delete product_table',11,'delete_product_table'),
(44,'Can view product_table',11,'view_product_table'),
(45,'Can add user_table',12,'add_user_table'),
(46,'Can change user_table',12,'change_user_table'),
(47,'Can delete user_table',12,'delete_user_table'),
(48,'Can view user_table',12,'view_user_table'),
(49,'Can add subsidy_table',13,'add_subsidy_table'),
(50,'Can change subsidy_table',13,'change_subsidy_table'),
(51,'Can delete subsidy_table',13,'delete_subsidy_table'),
(52,'Can view subsidy_table',13,'view_subsidy_table'),
(53,'Can add payment_table',14,'add_payment_table'),
(54,'Can change payment_table',14,'change_payment_table'),
(55,'Can delete payment_table',14,'delete_payment_table'),
(56,'Can view payment_table',14,'view_payment_table'),
(57,'Can add orderdetails_table',15,'add_orderdetails_table'),
(58,'Can change orderdetails_table',15,'change_orderdetails_table'),
(59,'Can delete orderdetails_table',15,'delete_orderdetails_table'),
(60,'Can view orderdetails_table',15,'view_orderdetails_table'),
(61,'Can add notification_table',16,'add_notification_table'),
(62,'Can change notification_table',16,'change_notification_table'),
(63,'Can delete notification_table',16,'delete_notification_table'),
(64,'Can view notification_table',16,'view_notification_table'),
(65,'Can add feedback_table',17,'add_feedback_table'),
(66,'Can change feedback_table',17,'change_feedback_table'),
(67,'Can delete feedback_table',17,'delete_feedback_table'),
(68,'Can view feedback_table',17,'view_feedback_table'),
(69,'Can add equipment_table',18,'add_equipment_table'),
(70,'Can change equipment_table',18,'change_equipment_table'),
(71,'Can delete equipment_table',18,'delete_equipment_table'),
(72,'Can view equipment_table',18,'view_equipment_table'),
(73,'Can add equipbooking_table',19,'add_equipbooking_table'),
(74,'Can change equipbooking_table',19,'change_equipbooking_table'),
(75,'Can delete equipbooking_table',19,'delete_equipbooking_table'),
(76,'Can view equipbooking_table',19,'view_equipbooking_table'),
(77,'Can add doubt_table',20,'add_doubt_table'),
(78,'Can change doubt_table',20,'change_doubt_table'),
(79,'Can delete doubt_table',20,'delete_doubt_table'),
(80,'Can view doubt_table',20,'view_doubt_table'),
(81,'Can add complaint_table',21,'add_complaint_table'),
(82,'Can change complaint_table',21,'change_complaint_table'),
(83,'Can delete complaint_table',21,'delete_complaint_table'),
(84,'Can view complaint_table',21,'view_complaint_table'),
(85,'Can add chat_table',22,'add_chat_table'),
(86,'Can change chat_table',22,'change_chat_table'),
(87,'Can delete chat_table',22,'delete_chat_table'),
(88,'Can view chat_table',22,'view_chat_table'),
(89,'Can add fertilizer_table',23,'add_fertilizer_table'),
(90,'Can change fertilizer_table',23,'change_fertilizer_table'),
(91,'Can delete fertilizer_table',23,'delete_fertilizer_table'),
(92,'Can view fertilizer_table',23,'view_fertilizer_table'),
(93,'Can add fertbooking_table',24,'add_fertbooking_table'),
(94,'Can change fertbooking_table',24,'change_fertbooking_table'),
(95,'Can delete fertbooking_table',24,'delete_fertbooking_table'),
(96,'Can view fertbooking_table',24,'view_fertbooking_table'),
(97,'Can add symptoms',25,'add_symptoms'),
(98,'Can change symptoms',25,'change_symptoms'),
(99,'Can delete symptoms',25,'delete_symptoms'),
(100,'Can view symptoms',25,'view_symptoms'),
(101,'Can add diease',26,'add_diease'),
(102,'Can change diease',26,'change_diease'),
(103,'Can delete diease',26,'delete_diease'),
(104,'Can view diease',26,'view_diease'),
(105,'Can add remedy',25,'add_remedy'),
(106,'Can change remedy',25,'change_remedy'),
(107,'Can delete remedy',25,'delete_remedy'),
(108,'Can view remedy',25,'view_remedy'),
(109,'Can add cart',27,'add_cart'),
(110,'Can change cart',27,'change_cart'),
(111,'Can delete cart',27,'delete_cart'),
(112,'Can view cart',27,'view_cart');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(27,'Myapp','cart'),
(22,'Myapp','chat_table'),
(21,'Myapp','complaint_table'),
(26,'Myapp','diease'),
(20,'Myapp','doubt_table'),
(19,'Myapp','equipbooking_table'),
(18,'Myapp','equipment_table'),
(7,'Myapp','farmer_table'),
(17,'Myapp','feedback_table'),
(24,'Myapp','fertbooking_table'),
(23,'Myapp','fertilizer_table'),
(8,'Myapp','login_table'),
(16,'Myapp','notification_table'),
(9,'Myapp','officer_table'),
(15,'Myapp','orderdetails_table'),
(10,'Myapp','order_table'),
(14,'Myapp','payment_table'),
(11,'Myapp','product_table'),
(25,'Myapp','remedy'),
(13,'Myapp','subsidy_table'),
(12,'Myapp','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'Myapp','0001_initial','2024-02-10 00:13:31.066411'),
(2,'contenttypes','0001_initial','2024-02-10 00:13:32.768124'),
(3,'auth','0001_initial','2024-02-10 00:13:33.625610'),
(4,'admin','0001_initial','2024-02-10 00:13:34.493259'),
(5,'admin','0002_logentry_remove_auto_add','2024-02-10 00:13:34.605029'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-02-10 00:13:34.616391'),
(7,'contenttypes','0002_remove_content_type_name','2024-02-10 00:13:34.783167'),
(8,'auth','0002_alter_permission_name_max_length','2024-02-10 00:13:34.862873'),
(9,'auth','0003_alter_user_email_max_length','2024-02-10 00:13:34.931690'),
(10,'auth','0004_alter_user_username_opts','2024-02-10 00:13:34.946693'),
(11,'auth','0005_alter_user_last_login_null','2024-02-10 00:13:35.027763'),
(12,'auth','0006_require_contenttypes_0002','2024-02-10 00:13:35.040731'),
(13,'auth','0007_alter_validators_add_error_messages','2024-02-10 00:13:35.057732'),
(14,'auth','0008_alter_user_username_max_length','2024-02-10 00:13:35.174741'),
(15,'auth','0009_alter_user_last_name_max_length','2024-02-10 00:13:35.242266'),
(16,'auth','0010_alter_group_name_max_length','2024-02-10 00:13:35.297183'),
(17,'auth','0011_update_proxy_permissions','2024-02-10 00:13:35.319123'),
(18,'sessions','0001_initial','2024-02-10 00:13:35.506064'),
(19,'Myapp','0002_farmer_table_status','2024-02-10 00:37:17.902883'),
(20,'Myapp','0003_remove_doubt_table_officer','2024-02-10 00:57:07.587931'),
(21,'Myapp','0004_auto_20240210_0638','2024-02-10 01:08:41.691538'),
(22,'Myapp','0005_fertilizer_table_type','2024-02-10 01:19:55.242992'),
(23,'Myapp','0006_fertilizer_table_price','2024-02-10 01:32:01.969012'),
(24,'Myapp','0007_auto_20240210_0817','2024-02-10 02:47:39.753399'),
(25,'Myapp','0008_auto_20240210_0824','2024-02-10 02:54:39.696296'),
(26,'Myapp','0009_diease_symptoms','2024-02-10 03:26:13.238369'),
(27,'Myapp','0010_auto_20240210_0954','2024-02-10 04:24:16.935289'),
(28,'Myapp','0011_auto_20240210_1011','2024-02-10 04:41:22.931912'),
(29,'Myapp','0012_auto_20240317_1040','2024-03-17 05:10:59.407419'),
(30,'Myapp','0013_auto_20240317_1041','2024-03-17 05:11:40.758580'),
(31,'Myapp','0014_auto_20240317_1126','2024-03-17 05:56:05.412216'),
(32,'Myapp','0015_cart','2024-03-17 08:55:15.275544'),
(33,'Myapp','0016_auto_20240319_1104','2024-03-19 05:35:06.646579'),
(34,'Myapp','0002_fertilizer_table_stock','2024-03-30 02:26:02.163661'),
(35,'Myapp','0003_fertilizer_table_current_stock','2024-03-30 02:27:04.194438'),
(36,'Myapp','0004_product_table_description','2024-03-30 05:56:55.601222');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('f2nmy2i860it2k7j9y3s195c6cs7sy5u','MGJkNGZmZTE4NjQ3MWI5NTljMjNkNDU0NWNkN2QxY2ZjOGE0MDc2Mzp7ImxpZCI6MSwic3IiOjIsImRpZCI6IjIiLCJpZGQiOjN9','2024-02-24 05:00:17.541179'),
('q3ayn6bzswtqfp72mmi73pwcd5ydcco2','NGE0MzQxZjJlNGZkMzdmOWZiYTNkMWEyOTNiMTIwMzAxN2ZmOTI2Yjp7ImxpZCI6MX0=','2024-03-30 10:45:11.199985');

/*Table structure for table `myapp_cart` */

DROP TABLE IF EXISTS `myapp_cart`;

CREATE TABLE `myapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `PRODUCT_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_cart_PRODUCT_id_124c8494_fk_Myapp_product_table_id` (`PRODUCT_id`),
  KEY `Myapp_cart_USER_id_ebf614c9_fk_Myapp_user_table_id` (`USER_id`),
  CONSTRAINT `Myapp_cart_PRODUCT_id_124c8494_fk_Myapp_product_table_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product_table` (`id`),
  CONSTRAINT `Myapp_cart_USER_id_ebf614c9_fk_Myapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_cart` */

insert  into `myapp_cart`(`id`,`quantity`,`PRODUCT_id`,`USER_id`) values 
(1,10,3,1),
(2,20,5,1);

/*Table structure for table `myapp_chat_table` */

DROP TABLE IF EXISTS `myapp_chat_table`;

CREATE TABLE `myapp_chat_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `fromid_id` int(11) NOT NULL,
  `toid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_chat_table_fromid_id_405457c7_fk_Myapp_login_table_id` (`fromid_id`),
  KEY `Myapp_chat_table_toid_id_8e839c4b_fk_Myapp_login_table_id` (`toid_id`),
  CONSTRAINT `Myapp_chat_table_fromid_id_405457c7_fk_Myapp_login_table_id` FOREIGN KEY (`fromid_id`) REFERENCES `myapp_login_table` (`id`),
  CONSTRAINT `Myapp_chat_table_toid_id_8e839c4b_fk_Myapp_login_table_id` FOREIGN KEY (`toid_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_chat_table` */

/*Table structure for table `myapp_complaint_table` */

DROP TABLE IF EXISTS `myapp_complaint_table`;

CREATE TABLE `myapp_complaint_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` longtext NOT NULL,
  `date` date NOT NULL,
  `reply` longtext NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_complaint_table_LOGIN_id_7c744609_fk_Myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `Myapp_complaint_table_LOGIN_id_7c744609_fk_Myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaint_table` */

insert  into `myapp_complaint_table`(`id`,`complaint`,`date`,`reply`,`LOGIN_id`) values 
(2,'nnnnnnnntbvs','2023-12-05','pending',4),
(6,'i was cheated by giving rotten veg','2023-12-07','pending',6),
(7,'doneee','2023-12-07','pending',7),
(10,'doneee','2023-12-08','We will solve it asap',8),
(13,'I need refund\r\n','2023-12-09','pending',4),
(15,'Hello','2023-12-10','pending',4),
(16,'xcdf','2024-03-19','pending',4),
(17,'xcdf','2024-03-19','pending',4),
(18,'vzdgt','2024-03-19','pending',4);

/*Table structure for table `myapp_diease` */

DROP TABLE IF EXISTS `myapp_diease`;

CREATE TABLE `myapp_diease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dieasename` varchar(100) NOT NULL,
  `details` varchar(2000) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_diease` */

insert  into `myapp_diease`(`id`,`dieasename`,`details`,`photo`) values 
(2,'onum nadannille kathichu kala','ok allenkil para','Screenshot 2023-10-17 154038.png');

/*Table structure for table `myapp_doubt_table` */

DROP TABLE IF EXISTS `myapp_doubt_table`;

CREATE TABLE `myapp_doubt_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doubt` longtext NOT NULL,
  `date` date NOT NULL,
  `reply` longtext NOT NULL,
  `FARMER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_doubt_table_FARMER_id_b62d0b7a_fk_Myapp_farmer_table_id` (`FARMER_id`),
  CONSTRAINT `Myapp_doubt_table_FARMER_id_b62d0b7a_fk_Myapp_farmer_table_id` FOREIGN KEY (`FARMER_id`) REFERENCES `myapp_farmer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_doubt_table` */

insert  into `myapp_doubt_table`(`id`,`doubt`,`date`,`reply`,`FARMER_id`) values 
(7,'asdghjkkkk','2023-12-10','ok',2),
(8,'rrrrrrrrrrrrr','2023-12-10','ok',2),
(9,'wwwwww','2023-12-10','pending',2),
(10,'nooooo','2023-12-10','hhhh',2),
(11,'shsdhdb','2024-03-17','pending',2);

/*Table structure for table `myapp_farmer_table` */

DROP TABLE IF EXISTS `myapp_farmer_table`;

CREATE TABLE `myapp_farmer_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_farmer_table_LOGIN_id_540adeff_fk_Myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `Myapp_farmer_table_LOGIN_id_540adeff_fk_Myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_farmer_table` */

insert  into `myapp_farmer_table`(`id`,`name`,`place`,`post`,`pin`,`phone`,`email`,`photo`,`LOGIN_id`,`status`) values 
(2,'sonu','Alappuzha','dhhv',234667,7558464589,'dhh@gmail.com','20240317-105121.jpg',9,'approved'),
(3,'fffff','aaaaa','rrrrr',237854,6677667789,'farmer@gmqil.com','null',10,'approved');

/*Table structure for table `myapp_feedback_table` */

DROP TABLE IF EXISTS `myapp_feedback_table`;

CREATE TABLE `myapp_feedback_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` longtext NOT NULL,
  `date` date NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_feedback_table_USER_id_70604aaa_fk_Myapp_user_table_id` (`USER_id`),
  CONSTRAINT `Myapp_feedback_table_USER_id_70604aaa_fk_Myapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback_table` */

insert  into `myapp_feedback_table`(`id`,`feedback`,`date`,`USER_id`) values 
(1,'Very bad','2023-12-04',1),
(4,'Im happy with the customer experience','2024-01-09',3),
(12,'bad application','2024-01-26',4);

/*Table structure for table `myapp_fertbooking_table` */

DROP TABLE IF EXISTS `myapp_fertbooking_table`;

CREATE TABLE `myapp_fertbooking_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `FARMER_id` int(11) NOT NULL,
  `FERTILIZER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_fertbooking_ta_FARMER_id_c3e00b19_fk_Myapp_far` (`FARMER_id`),
  KEY `Myapp_fertbooking_ta_FERTILIZER_id_417ae429_fk_Myapp_fer` (`FERTILIZER_id`),
  CONSTRAINT `Myapp_fertbooking_ta_FARMER_id_c3e00b19_fk_Myapp_far` FOREIGN KEY (`FARMER_id`) REFERENCES `myapp_farmer_table` (`id`),
  CONSTRAINT `Myapp_fertbooking_ta_FERTILIZER_id_417ae429_fk_Myapp_fer` FOREIGN KEY (`FERTILIZER_id`) REFERENCES `myapp_fertilizer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_fertbooking_table` */

insert  into `myapp_fertbooking_table`(`id`,`date`,`status`,`qty`,`FARMER_id`,`FERTILIZER_id`) values 
(1,'2024-02-10','approved',2,2,1),
(2,'2024-03-17','pending',2,2,1);

/*Table structure for table `myapp_fertilizer_table` */

DROP TABLE IF EXISTS `myapp_fertilizer_table`;

CREATE TABLE `myapp_fertilizer_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `usage` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `company` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `stock` varchar(50) NOT NULL,
  `current_stock` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_fertilizer_table` */

insert  into `myapp_fertilizer_table`(`id`,`name`,`usage`,`description`,`company`,`photo`,`type`,`price`,`stock`,`current_stock`) values 
(1,'mam','New Block Innauguration','ssd','fgn','1328609110.jpg','Nitrogen Fertilizer','100','30','30'),
(3,'mamsdgnb','New Block Innauguration','ssd','fgn','images.jpeg','Nitrogen Fertilizer','345','30','30');

/*Table structure for table `myapp_login_table` */

DROP TABLE IF EXISTS `myapp_login_table`;

CREATE TABLE `myapp_login_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login_table` */

insert  into `myapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(4,'usr','usr','user'),
(5,'offi','offi','officer'),
(6,'ssssa','123456','user'),
(7,'hhhhh','55555555','user'),
(8,'farmer123','farmer123','farmer'),
(9,'sonu','farm','farmer'),
(10,'farm234','farmer234','farmer');

/*Table structure for table `myapp_notification_table` */

DROP TABLE IF EXISTS `myapp_notification_table`;

CREATE TABLE `myapp_notification_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_notification_table` */

insert  into `myapp_notification_table`(`id`,`notification`,`date`) values 
(2,'cxvbn m,','2023-12-05'),
(4,'lkhhg','2023-12-10'),
(5,'wertyu','2023-12-10'),
(6,'trytyuui','2023-12-10');

/*Table structure for table `myapp_order_table` */

DROP TABLE IF EXISTS `myapp_order_table`;

CREATE TABLE `myapp_order_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_order_table_USER_id_3f573ae2_fk_Myapp_user_table_id` (`USER_id`),
  CONSTRAINT `Myapp_order_table_USER_id_3f573ae2_fk_Myapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_order_table` */

insert  into `myapp_order_table`(`id`,`date`,`amount`,`status`,`USER_id`) values 
(2,'2023-12-07',7739,'PAID',3),
(3,'2023-12-07',478,'PAID',3),
(4,'2023-12-10',1200,'cart',1);

/*Table structure for table `myapp_orderdetails_table` */

DROP TABLE IF EXISTS `myapp_orderdetails_table`;

CREATE TABLE `myapp_orderdetails_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `ORDER_id` int(11) NOT NULL,
  `PRODUCT_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_orderdetails_t_ORDER_id_e99b0922_fk_Myapp_ord` (`ORDER_id`),
  KEY `Myapp_orderdetails_t_PRODUCT_id_4f16182b_fk_Myapp_pro` (`PRODUCT_id`),
  CONSTRAINT `Myapp_orderdetails_t_ORDER_id_e99b0922_fk_Myapp_ord` FOREIGN KEY (`ORDER_id`) REFERENCES `myapp_order_table` (`id`),
  CONSTRAINT `Myapp_orderdetails_t_PRODUCT_id_4f16182b_fk_Myapp_pro` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_orderdetails_table` */

insert  into `myapp_orderdetails_table`(`id`,`quantity`,`amount`,`status`,`ORDER_id`,`PRODUCT_id`) values 
(1,2,478,'pending',3,3),
(4,7,1050,'pending',4,5),
(5,1,150,'pending',4,5);

/*Table structure for table `myapp_payment_table` */

DROP TABLE IF EXISTS `myapp_payment_table`;

CREATE TABLE `myapp_payment_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `ORDER_id` int(11) NOT NULL,
  `USER_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_payment_table_ORDER_id_466a7ade_fk_Myapp_order_table_id` (`ORDER_id`),
  KEY `Myapp_payment_table_USER_id_29c34742_fk_Myapp_user_table_id` (`USER_id`),
  CONSTRAINT `Myapp_payment_table_ORDER_id_466a7ade_fk_Myapp_order_table_id` FOREIGN KEY (`ORDER_id`) REFERENCES `myapp_order_table` (`id`),
  CONSTRAINT `Myapp_payment_table_USER_id_29c34742_fk_Myapp_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_payment_table` */

insert  into `myapp_payment_table`(`id`,`amount`,`date`,`status`,`ORDER_id`,`USER_id`) values 
(1,500,'2023-12-07','PAID',2,3),
(2,478,'2023-12-07','PAID',3,3);

/*Table structure for table `myapp_product_table` */

DROP TABLE IF EXISTS `myapp_product_table`;

CREATE TABLE `myapp_product_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `image` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `FARMER_id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_product_table_FARMER_id_69dca9c6_fk_Myapp_farmer_table_id` (`FARMER_id`),
  CONSTRAINT `Myapp_product_table_FARMER_id_69dca9c6_fk_Myapp_farmer_table_id` FOREIGN KEY (`FARMER_id`) REFERENCES `myapp_farmer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_product_table` */

insert  into `myapp_product_table`(`id`,`name`,`image`,`quantity`,`price`,`FARMER_id`,`description`) values 
(3,'gt','products/20240317-113240.jpg',44,45,2,''),
(5,'srggg','products/20240317-113240.jpg',7,150,2,'');

/*Table structure for table `myapp_remedy` */

DROP TABLE IF EXISTS `myapp_remedy`;

CREATE TABLE `myapp_remedy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remedy` varchar(100) NOT NULL,
  `DISEASE_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_symptoms_DISEASE_id_0f58126e_fk_Myapp_diease_id` (`DISEASE_id`),
  CONSTRAINT `Myapp_symptoms_DISEASE_id_0f58126e_fk_Myapp_diease_id` FOREIGN KEY (`DISEASE_id`) REFERENCES `myapp_diease` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_remedy` */

insert  into `myapp_remedy`(`id`,`remedy`,`DISEASE_id`,`description`) values 
(1,'vbnm angane cheythit ingane cheytha mathy',2,'vfcvc df df  df f'),
(2,'onum nadannille kathichu kala',2,'fdv'),
(3,'sdf',2,'gsrghjgk,bn dhgjgnb  hrhgn'),
(6,'af',2,'gn vhdfhjgkhm,  ');

/*Table structure for table `myapp_subsidy_table` */

DROP TABLE IF EXISTS `myapp_subsidy_table`;

CREATE TABLE `myapp_subsidy_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subsidy` varchar(500) NOT NULL,
  `details` longtext NOT NULL,
  `date` date NOT NULL,
  `PRODUCT_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_subsidy_table_PRODUCT_id_930b0c65_fk_Myapp_pro` (`PRODUCT_id`),
  CONSTRAINT `Myapp_subsidy_table_PRODUCT_id_930b0c65_fk_Myapp_pro` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_subsidy_table` */

insert  into `myapp_subsidy_table`(`id`,`subsidy`,`details`,`date`,`PRODUCT_id`) values 
(7,'43','dsjhkl','2023-12-10',3);

/*Table structure for table `myapp_user_table` */

DROP TABLE IF EXISTS `myapp_user_table`;

CREATE TABLE `myapp_user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `LOGIN_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Myapp_user_table_LOGIN_id_a9008bba_fk_Myapp_login_table_id` (`LOGIN_id`),
  CONSTRAINT `Myapp_user_table_LOGIN_id_a9008bba_fk_Myapp_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_user_table` */

insert  into `myapp_user_table`(`id`,`name`,`place`,`post`,`pin`,`phone`,`email`,`photo`,`LOGIN_id`) values 
(1,'Anu','uuu','uuu',765435,9876787656,'anu@gmail.com','2142 (1).jpg',4),
(3,'Jinu','vcfkf','dgjfgbd',343434,2345678928,'jinu@gmail.com','null',6),
(4,'Sonu','efhh','fhjg',346867,8797675757,'sonu@gmail.com','null',7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
