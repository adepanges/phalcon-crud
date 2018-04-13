/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.21-0ubuntu0.16.04.1 : Database - phalcon_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`phalcon_crud` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `articles` */

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `author` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `articles` */

insert  into `articles`(`id`,`slug`,`title`,`content`,`author`,`created_at`,`updated_at`) values (2,NULL,'hai','banyak','adepanges2222',NULL,'2018-04-13 20:03:30'),(3,NULL,'hai','banyak','adepanges',NULL,NULL),(4,NULL,'hai','banyak','adepanges',NULL,NULL),(5,NULL,'hai','banyak','adepanges',NULL,NULL),(6,NULL,'hai','banyak','adepanges',NULL,NULL),(7,NULL,'hai','banyak','adepanges','2018-04-13 19:48:22',NULL),(8,NULL,'hai','banyak','adepanges','2018-04-13 19:49:19',NULL),(9,NULL,'hai','banyak','adepanges','2018-04-13 19:49:19',NULL),(10,NULL,'hai','banyak','adepanges','2018-04-13 19:49:21',NULL),(11,NULL,'hai','banyak','adepanges','2018-04-13 19:49:21',NULL),(12,NULL,'hai','banyak','adepanges','2018-04-13 19:49:21',NULL),(13,NULL,'hai','banyak','adepanges','2018-04-13 19:49:22',NULL),(14,NULL,'hai','banyak','adepanges2222',NULL,NULL),(15,NULL,'hai','banyak','adepanges2222',NULL,'2018-04-13 20:02:22'),(16,NULL,'sss','sss','adepanges','2018-04-13 21:10:12',NULL),(17,NULL,'asasass','asasasasasasas','adepanges','2018-04-13 21:10:37',NULL),(18,NULL,'sss','ssssss','adepanges','2018-04-13 21:11:07',NULL),(19,NULL,'aaaa','aaaaaaa','adepanges','2018-04-13 21:11:38',NULL),(20,NULL,'ssss','sssssss','adepanges','2018-04-13 21:12:02',NULL),(21,NULL,'eererer','erererawewae','adepanges','2018-04-13 21:12:13',NULL),(22,NULL,'sdsdsd','sdsddsdsd','adepanges','2018-04-13 21:12:19',NULL),(23,NULL,'sddsd','sdddsdsdsd','adepanges','2018-04-13 21:13:51',NULL),(24,NULL,'sdsdsdsd','sdsdsdsdsdsdsdsss','adepanges','2018-04-13 21:13:58',NULL),(25,NULL,'sdsdsdsd','sdsdsdsdsdsd','adepanges','2018-04-13 21:14:06',NULL),(26,NULL,'dsdsdsdsdsd','sdsdsdsdsdssdsdsd','adepanges','2018-04-13 21:14:14',NULL),(27,NULL,'dwdwdw','weweweewewe','adepanges','2018-04-13 21:14:22',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
