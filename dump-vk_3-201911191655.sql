-- MySQL dump 10.13  Distrib 5.7.28, for Win64 (x86_64)
--
-- Host: localhost    Database: vk_3
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (30,'animi'),(29,'architecto'),(70,'asperiores'),(76,'assumenda'),(7,'aut'),(49,'aut'),(56,'commodi'),(47,'consequatur'),(55,'consequatur'),(73,'consequatur'),(27,'delectus'),(15,'deserunt'),(9,'dolor'),(37,'dolorem'),(45,'doloremque'),(22,'dolorum'),(67,'dolorum'),(65,'ea'),(81,'ea'),(90,'earum'),(6,'eligendi'),(4,'error'),(19,'est'),(5,'et'),(21,'et'),(44,'et'),(78,'et'),(87,'et'),(98,'et'),(63,'eum'),(10,'eveniet'),(93,'eveniet'),(1,'excepturi'),(33,'facere'),(94,'harum'),(11,'hic'),(35,'impedit'),(66,'incidunt'),(89,'iste'),(86,'itaque'),(77,'iure'),(95,'iure'),(83,'labore'),(41,'laboriosam'),(72,'laboriosam'),(13,'laborum'),(62,'laborum'),(68,'laborum'),(59,'laudantium'),(75,'laudantium'),(99,'libero'),(2,'maiores'),(24,'maiores'),(71,'maiores'),(51,'maxime'),(17,'minus'),(100,'minus'),(40,'molestiae'),(3,'natus'),(88,'natus'),(69,'necessitatibus'),(82,'necessitatibus'),(79,'neque'),(16,'nisi'),(38,'nisi'),(53,'non'),(50,'nulla'),(36,'occaecati'),(31,'odio'),(8,'officia'),(12,'officia'),(43,'omnis'),(46,'pariatur'),(14,'provident'),(20,'qui'),(23,'qui'),(28,'qui'),(39,'quia'),(80,'quia'),(58,'quidem'),(60,'quisquam'),(84,'quo'),(85,'ratione'),(64,'reiciendis'),(96,'rerum'),(34,'sint'),(74,'soluta'),(61,'sunt'),(92,'suscipit'),(32,'tempora'),(42,'unde'),(52,'ut'),(97,'ut'),(57,'velit'),(25,'veniam'),(91,'voluptas'),(18,'voluptate'),(54,'voluptate'),(48,'voluptatem'),(26,'voluptates');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,2,'approved','2019-11-19 13:14:45','2019-11-19 14:11:38'),(1,3,'approved','2019-11-19 13:14:45','2019-11-19 14:12:27'),(1,4,'declined','2019-11-19 13:14:45','2019-11-19 14:13:46'),(1,5,'requested','2019-11-19 13:14:45',NULL),(1,6,'requested','2019-11-19 13:14:45',NULL),(1,7,'requested','2019-11-19 13:14:45',NULL),(1,8,'requested','2019-11-19 13:14:45',NULL),(1,9,'requested','2019-11-19 13:14:45',NULL),(1,10,'requested','2019-11-19 13:14:45',NULL),(1,11,'requested','2019-11-19 13:14:45',NULL);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text,
  `filename` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `media_type_id` (`media_type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'Et et et totam quo sint debitis ipsum. Aut pariatur dolores vitae quasi nihil. Numquam et ea ex doloribus placeat ea dolore et.','quia',82,NULL,'2015-02-06 05:12:52','1980-09-15 02:00:08'),(2,2,2,'Non ut nesciunt tempora ullam. Tempora repellendus quibusdam ut optio maxime. Cum voluptatibus non odio. Iste omnis voluptatum labore culpa consequatur quia.','atque',5,NULL,'1986-01-07 15:48:24','2002-10-28 23:48:02'),(3,3,3,'Consequatur eos enim veniam omnis a praesentium. Officia nulla in sed ipsam quis cum. Voluptatem esse ducimus ullam neque rerum nobis quia. Omnis aut voluptatem voluptas doloremque non doloribus et.','et',3,NULL,'1986-06-09 18:01:03','2001-04-12 00:53:43'),(4,4,4,'Dignissimos et soluta eaque vel libero est quod. Eos occaecati officiis laboriosam sit molestias eligendi. Vel in odit error autem. Quia reiciendis repudiandae facere.','et',45853,NULL,'2018-07-03 08:32:33','1999-11-10 06:29:30'),(5,5,5,'Earum reiciendis voluptates atque qui similique. Vel id optio at sapiente et commodi quasi. Quia eos commodi officiis minus aliquid porro quis. Ratione et blanditiis aut nesciunt.','rerum',26997570,NULL,'1996-12-18 12:33:15','2014-07-01 13:23:44'),(6,6,6,'Et neque praesentium saepe non et. Aliquam dolor suscipit animi. Aut eos consequatur cupiditate qui.','voluptatem',83445,NULL,'2007-06-28 17:40:57','1970-04-09 09:04:30'),(7,7,7,'Natus autem perferendis dolores beatae velit vero totam. Et sunt qui ratione soluta voluptatem in. Ut dignissimos sint quia.','est',375720341,NULL,'1998-07-10 16:14:52','1997-10-05 13:20:19'),(8,8,8,'Nesciunt at officiis optio eaque quam dicta maxime. Et consequatur corporis molestias maiores vitae modi qui. Voluptatem tempora et maiores minus nihil beatae tempore.','et',48448817,NULL,'1978-02-20 14:02:27','1975-04-13 13:34:23'),(9,9,9,'Quaerat sit omnis consequatur harum harum natus voluptatibus. Cumque delectus aut dolores ipsa praesentium et. Est et perferendis aut necessitatibus aliquid. Consectetur voluptatibus eligendi dolores cumque.','quo',1476527,NULL,'2010-08-30 00:43:29','1996-09-22 11:30:55'),(10,10,10,'Rem facere soluta quam excepturi consequatur rerum. Atque libero aut corporis impedit laboriosam.','officiis',694852698,NULL,'1994-01-11 18:54:45','1978-05-11 05:09:06'),(11,11,11,'Soluta unde quo veniam hic vel odit magni. Ab voluptas pariatur ipsa non temporibus. Voluptatem pariatur magnam maiores. Qui a aut harum recusandae sunt impedit molestias.','hic',2351,NULL,'1986-01-25 13:05:38','1999-01-18 02:24:30'),(12,12,12,'Ut architecto laboriosam odio modi. Hic quas temporibus aut harum repellat culpa nihil corporis. Harum quasi praesentium ex. Optio sed facilis et excepturi iste molestias.','fugit',4546455,NULL,'2010-08-17 15:41:01','1975-12-18 15:41:47'),(13,13,13,'Esse id cumque dolor praesentium. Quia earum alias totam consequatur a assumenda voluptatibus placeat. Explicabo sed quo aut incidunt ex quas eaque ut.','excepturi',4057371,NULL,'2019-06-18 19:04:57','1975-10-26 10:41:44'),(14,14,14,'Cumque enim voluptas asperiores quo sint dolorum consequatur velit. Id quam at praesentium porro. A ullam consequatur voluptatem non. Quas totam nemo molestiae pariatur.','ut',55860457,NULL,'1971-04-01 20:40:27','1991-08-02 23:52:55'),(15,15,15,'Et sit nihil enim qui debitis. Cum soluta beatae nemo vel adipisci voluptatem. Molestiae doloribus omnis nulla sint voluptas saepe quibusdam.','voluptatibus',202501,NULL,'2001-08-26 10:31:39','1980-07-28 08:09:08'),(16,16,16,'Eius accusamus et odio sequi nobis et. Eum atque itaque quae. Illo qui sint modi accusantium corporis veniam.','magnam',1436,NULL,'1980-07-15 09:17:37','2005-08-07 04:30:45'),(17,17,17,'Iusto aliquam laborum veniam id quidem. Sint aut voluptas voluptatem dolore maxime harum veniam. Sed placeat repellat non eum. Blanditiis quasi iste omnis quaerat qui aut.','itaque',51,NULL,'1997-07-03 21:25:35','1993-11-18 04:15:47'),(18,18,18,'Cumque tenetur reprehenderit temporibus voluptatem. Deleniti qui cum repudiandae et similique quos ut. Delectus temporibus enim debitis reiciendis. Assumenda fugiat facilis fugit sit aliquam cum pariatur.','quidem',0,NULL,'1985-05-13 08:41:30','1976-12-29 09:23:58'),(19,19,19,'Quia ab omnis sed veniam commodi quidem non. Ab aut ullam perferendis saepe quaerat voluptatem non.','eum',68,NULL,'1991-05-27 08:43:27','2011-12-30 13:58:40'),(20,20,20,'Distinctio quisquam animi et repellendus consequatur delectus ut. Quo voluptas quod incidunt ipsa. Temporibus ipsum est quis voluptatem omnis. Nisi cumque fugit sunt.','sequi',26947708,NULL,'2016-01-12 03:23:07','1984-02-08 04:08:49'),(21,21,21,'Eius totam veritatis alias et corrupti voluptatem officia temporibus. Quisquam ut recusandae esse laborum animi deserunt dignissimos fuga. Neque in eum fugit rerum temporibus dolores.','vitae',905438338,NULL,'2006-06-25 20:42:45','1990-10-11 14:27:20'),(22,22,22,'Sunt est vel omnis est quia. Et recusandae quos neque id. Fugit accusamus reprehenderit soluta. Est non soluta a consequatur numquam voluptatibus.','quo',5210,NULL,'1972-09-18 17:49:51','2017-06-15 12:50:11'),(23,23,23,'Reprehenderit cum dolores rerum itaque aut. Dolorum unde voluptatem ipsum. Quam dolores ea inventore voluptatibus.','dolores',89216,NULL,'1971-12-17 14:09:34','1998-08-24 07:38:48'),(24,24,24,'Velit enim sint voluptates ut perferendis nulla. Iusto in aperiam maxime iste porro harum.','eaque',690315722,NULL,'1972-09-07 04:31:24','2017-02-14 15:24:07'),(25,25,25,'Molestias ut magni omnis molestiae eum provident minima. Ab odio laborum est consequatur sunt enim consequuntur quo. Facilis beatae nisi nobis maxime. Ut distinctio et nobis illo ea esse. Omnis ab expedita dignissimos id rerum.','eos',4317,NULL,'1973-06-27 07:03:43','2010-05-05 18:51:00'),(26,26,26,'Itaque reiciendis recusandae mollitia numquam optio sapiente accusantium neque. Ullam optio nostrum eos qui accusamus. Dolorum libero perspiciatis tenetur hic.','et',461373798,NULL,'1986-12-10 06:29:16','1978-09-05 08:20:15'),(27,27,27,'Rerum numquam vero harum vel ratione assumenda. Maiores quia tempora suscipit asperiores ipsum et. Adipisci nostrum molestiae vero rem nihil. Dolor voluptas incidunt ut sit.','sit',841694,NULL,'2006-07-01 02:03:12','1976-05-04 02:38:24'),(28,28,28,'Autem et molestiae nam ipsa at ut excepturi. Consequuntur nihil voluptas quod et pariatur. Et quaerat et numquam maiores est deleniti quam.','suscipit',3,NULL,'1985-12-03 10:41:13','2008-10-14 07:11:30'),(29,29,29,'Perspiciatis libero voluptas laborum aut reiciendis excepturi. Et illum labore est. Consequatur nemo quibusdam quae corporis dignissimos. Tempore mollitia quo dolorem omnis voluptas perferendis id.','eaque',5844541,NULL,'1986-04-15 21:52:57','1991-07-26 20:43:33'),(30,30,30,'Consequatur magni sint porro. Aperiam id aut commodi deserunt cupiditate. Et voluptates aperiam est aperiam.','voluptas',1684,NULL,'2010-10-26 07:41:30','2012-02-12 13:01:28'),(31,31,31,'Et nostrum rem id fuga culpa. Ea et ipsam eius commodi. Aut voluptas atque nesciunt aut.','ullam',636067311,NULL,'1978-03-31 17:58:40','1996-04-18 23:39:06'),(32,32,32,'Similique mollitia autem voluptas sunt. Quibusdam asperiores excepturi ex voluptatem consequatur magni dolorum.','possimus',3,NULL,'1978-07-18 16:32:06','1974-02-02 10:57:04'),(33,33,33,'Sunt cupiditate molestiae dolorum alias et. Et dolorem unde voluptas voluptatem dolor magnam quod. Aut vel saepe est aperiam sunt.','facilis',50998211,NULL,'2009-10-21 08:54:34','1997-06-02 23:10:48'),(34,34,34,'Laudantium eius cum reprehenderit est qui quia possimus quod. Rerum voluptates quasi neque. Quia nostrum provident laudantium id alias deserunt molestiae. Repellat a et dolor aspernatur quo corrupti.','accusantium',50938219,NULL,'2013-03-12 09:59:00','1980-08-09 18:11:00'),(35,35,35,'Et pariatur doloremque id possimus iure tempora maxime quisquam. Maiores quam qui laudantium velit. Iste eaque sed dolorum expedita sunt sint sit. Voluptatem amet magni eveniet qui. Ducimus laborum quos eligendi delectus architecto reiciendis.','qui',60,NULL,'1983-08-21 17:10:31','1984-01-18 12:05:35'),(36,36,36,'Voluptatibus ducimus exercitationem doloribus nostrum nihil. Odit quam labore et et reprehenderit qui vel. Ducimus eveniet id sint numquam voluptatem quibusdam. Deleniti ipsum repellendus harum sed sint rem nisi.','consequatur',0,NULL,'1974-01-03 11:08:41','1980-02-18 07:37:06'),(37,37,37,'Aperiam doloribus sit ex eum sit sint modi. Officia quibusdam est cupiditate. Rerum optio doloribus error consequatur qui.','autem',71,NULL,'1987-02-23 10:53:48','2012-04-18 08:30:02'),(38,38,38,'Aut sunt labore nesciunt quia placeat quos ratione nihil. Et suscipit reprehenderit quod. Ut reprehenderit rerum iusto. Ea ut fugiat omnis alias dolorem laboriosam rerum laudantium.','veniam',6,NULL,'2001-07-04 01:31:27','1977-06-12 07:25:44'),(39,39,39,'Iusto eveniet cupiditate nam consequatur. Aut unde corrupti voluptatem. Nisi officia quos velit et vel excepturi. Laboriosam nihil repudiandae eum repellendus dolores quidem.','rerum',923107360,NULL,'2018-04-06 18:35:38','2005-03-27 02:52:19'),(40,40,40,'Sit earum ad rerum vero reprehenderit esse. Repellendus illum consequatur incidunt aperiam molestias hic. Accusamus mollitia accusantium non ut. Id repellendus explicabo consectetur excepturi. Nostrum eos quaerat dicta nihil dolores error.','et',8952076,NULL,'1990-03-24 18:05:57','2012-05-29 22:45:00'),(41,41,41,'Vitae quis sit qui est asperiores. Cum reprehenderit dolores sit animi sapiente qui. Reiciendis fuga illo eum voluptatem iusto nam et autem.','autem',738,NULL,'1985-08-31 12:03:28','1973-11-25 23:25:45'),(42,42,42,'Error maxime sit voluptate repellendus ea et. Magni aliquam itaque pariatur quia aut repellendus. Ut perferendis repellendus dignissimos nostrum quo alias. Odit tempora quaerat vero et dolores error. Aut cum assumenda ut enim voluptatem.','quam',9692478,NULL,'2000-04-01 02:01:54','1996-01-21 02:11:22'),(43,43,43,'Quia molestias sed dolores odit omnis ea sunt ut. Quod eos veniam rem dolor dolorem. Quibusdam repellat incidunt dignissimos qui omnis. Ea culpa voluptatem nemo consectetur eligendi qui ut quam.','quibusdam',966,NULL,'2009-08-11 13:44:10','1979-10-21 23:12:16'),(44,44,44,'Tempore sapiente quia quia consequatur. Architecto et laboriosam in quod. Similique nisi molestiae et non.','eaque',15530238,NULL,'1981-05-27 16:32:36','1995-03-02 21:41:01'),(45,45,45,'Aperiam aspernatur quia quo enim qui cupiditate. Enim ratione sit qui et ut accusamus.','ad',10415,NULL,'2016-11-22 11:57:41','1993-02-08 14:14:43'),(46,46,46,'Laboriosam iure ut doloribus. Expedita architecto id occaecati et nobis mollitia. Corrupti nam voluptas suscipit temporibus.','placeat',56,NULL,'2010-05-23 19:40:00','2004-09-27 11:26:27'),(47,47,47,'Corporis voluptatem sit eos eligendi ut non inventore. Explicabo autem minus non fugiat. Blanditiis corporis laborum est illo. Reiciendis et veniam esse recusandae beatae voluptatem aut.','id',852,NULL,'2005-02-01 22:36:16','1975-02-09 20:22:20'),(48,48,48,'Quisquam et eos officia deserunt ipsum maxime. Voluptatem molestiae ab aut aliquid ex quis. Porro odit expedita aperiam optio error quia aut rerum.','et',414465,NULL,'2003-10-28 04:38:49','1976-03-01 14:22:08'),(49,49,49,'Dolores expedita sunt sequi corrupti ullam iusto unde aut. Suscipit eum id quia et eum accusamus. Dolor voluptas eum dignissimos perferendis.','dicta',0,NULL,'1987-11-29 21:11:42','1990-12-17 07:04:11'),(50,50,50,'Sit assumenda accusamus rerum voluptatum enim possimus qui. Aliquam quas et omnis libero. Quia voluptas voluptas rem et.','consequuntur',744868,NULL,'2012-06-04 07:14:04','1971-02-09 14:43:41'),(51,51,51,'Sint omnis sint et enim inventore vel incidunt. Veniam est sapiente labore placeat ea quia. Repellendus laborum alias corrupti voluptatem in.','eaque',703,NULL,'1999-01-24 00:21:13','1980-11-06 20:21:53'),(52,52,52,'Saepe odio non et aut aut. A deserunt voluptas eum error perspiciatis. Facere explicabo minus sit eos atque.','voluptatem',4367,NULL,'1995-03-05 06:55:12','1974-03-20 18:01:38'),(53,53,53,'Laboriosam omnis nesciunt qui ducimus eum vel autem. Quae et fuga reiciendis cumque libero ut laboriosam. Qui amet alias maxime quaerat temporibus corrupti.','quibusdam',96920820,NULL,'1972-08-24 03:12:37','1987-02-23 08:49:46'),(54,54,54,'Fugiat eius eligendi voluptatum odio fuga facilis. Voluptatibus velit veritatis sed quo. Quas dolor voluptatem sed provident sit voluptas debitis ipsum. Natus et quos eligendi blanditiis. Unde eum eum iste sunt incidunt impedit rem.','dignissimos',260626091,NULL,'1986-02-13 16:13:51','2002-06-29 10:20:36'),(55,55,55,'Perferendis tempora aliquam doloremque odit expedita magnam. Aut eveniet numquam voluptatem est. Ducimus est beatae error quos occaecati quia vel adipisci. Iure qui totam officia officia modi natus.','praesentium',41187,NULL,'2004-08-20 16:47:31','1990-01-06 06:03:10'),(56,56,56,'Accusantium sint dolore itaque aut ipsum velit. Dolorem veritatis eaque nihil eos labore exercitationem quam. Dolorem voluptatibus aut error cum qui voluptas tempore.','tenetur',77,NULL,'1985-09-20 05:45:08','1982-06-02 11:18:17'),(57,57,57,'Quia ad est aspernatur iusto. Unde odio tempora quasi voluptatem. Impedit in rerum quasi. Velit aut adipisci sint nisi.','sit',0,NULL,'2002-04-05 17:58:30','2006-03-04 13:58:54'),(58,58,58,'Sit sunt pariatur ex et. Et molestiae veritatis id sequi qui quia assumenda. Eveniet quo voluptatem minima animi ut labore sit. Ex et enim magnam voluptatem et.','modi',6,NULL,'2012-03-15 06:27:29','2009-07-12 03:00:54'),(59,59,59,'Ab quidem ipsum cum architecto vitae. Qui dolor aspernatur explicabo cum aut qui quos. Ullam at sit at quas earum et. Qui aut eos reprehenderit expedita laudantium. Perferendis occaecati maiores quis totam cupiditate.','et',0,NULL,'2003-02-02 19:25:29','2000-07-21 19:16:45'),(60,60,60,'Qui cum tempora dolorem esse soluta. Mollitia debitis aspernatur impedit qui ut ea. Rerum id adipisci omnis dolorem non.','fugit',37679,NULL,'2003-04-20 04:09:28','2007-11-06 23:36:32'),(61,61,61,'Et dolorem velit qui non in. Vero earum vel voluptatem ut blanditiis vitae velit quos. Quis labore nobis incidunt delectus eligendi sunt ut. Dignissimos tenetur quidem ut sit molestiae temporibus.','maxime',9,NULL,'2017-06-13 15:13:27','2009-07-22 18:02:59'),(62,62,62,'Omnis id ullam odit perspiciatis. Ipsa ipsam laboriosam dolore ab alias corporis labore deserunt.','soluta',822182253,NULL,'1987-06-30 23:12:51','2011-09-10 05:22:46'),(63,63,63,'A ducimus blanditiis voluptas sapiente consectetur eos voluptates perferendis. Ea a rerum et nostrum corporis non.','quia',0,NULL,'2007-05-03 13:46:26','2015-10-12 07:23:12'),(64,64,64,'Voluptas labore voluptatem necessitatibus sint. Possimus quia accusamus mollitia. Non dolores excepturi dolorum aut facere itaque.','voluptas',957237,NULL,'1977-05-12 09:21:18','1995-11-15 07:09:24'),(65,65,65,'Optio aperiam et ut optio alias enim. Ad facere labore et nihil. Qui quis libero corrupti dolorem velit et.','dolor',3600,NULL,'1985-10-27 18:22:02','1991-03-07 20:57:02'),(66,66,66,'Ex ea consequuntur in repudiandae ut aspernatur consequatur. Consequatur omnis veritatis tenetur sed eos amet dignissimos. Animi quia et quasi soluta. Eveniet qui consequatur cupiditate suscipit quasi rerum ducimus. Est molestiae voluptatem ut deserunt eum aut in.','impedit',911080,NULL,'2014-12-05 19:29:00','2005-05-13 13:53:03'),(67,67,67,'Fuga earum tenetur culpa debitis aut. Officia aut ut quo velit. Ratione quaerat est natus autem eaque. Repudiandae et molestiae et error.','iste',705,NULL,'2014-02-09 05:13:48','1997-06-17 02:48:29'),(68,68,68,'Expedita nisi impedit nostrum qui et molestiae deserunt perspiciatis. Alias quod aliquid aut modi eos enim molestiae fugit. Ut ex ullam placeat aliquam architecto est nemo quas.','iste',194,NULL,'2017-11-01 04:03:09','2017-07-27 00:40:23'),(69,69,69,'Quae omnis voluptatem optio cum rerum error provident et. Dolorum modi recusandae sint autem. Recusandae odit aut aut corrupti quas ut consequatur.','quod',262,NULL,'2004-07-10 19:13:21','2001-12-08 01:20:31'),(70,70,70,'Omnis ipsum id aut corporis beatae ut voluptates. Rem numquam explicabo vel provident consectetur hic perferendis. Et magnam ratione quis eveniet non. Enim eligendi aut sapiente provident. Voluptate laboriosam reprehenderit magnam possimus odit.','voluptates',0,NULL,'1978-08-15 12:57:36','1984-10-13 02:33:18'),(71,71,71,'Neque ad deserunt minus. Voluptatem omnis eveniet officiis ad ipsa nesciunt ratione. Natus vitae consequatur nesciunt saepe sunt.','voluptatem',0,NULL,'1999-01-21 03:15:24','1993-04-04 14:07:33'),(72,72,72,'Doloribus deserunt eveniet ex qui a. Et dolor eum voluptas sapiente. Aperiam aut aut recusandae pariatur aliquam quam.','labore',701,NULL,'2011-09-02 09:38:06','2009-06-16 10:34:41'),(73,73,73,'Qui beatae sed eos dolor. Quos fugiat odio recusandae consequuntur eos consequuntur. Dolore ea consectetur molestiae sed quasi esse. Autem suscipit temporibus qui quis vel.','adipisci',729262921,NULL,'1996-03-10 00:00:11','1975-08-28 17:12:02'),(74,74,74,'Consequatur aut aut adipisci sit et. Unde nostrum delectus commodi voluptas et. Quis qui sed atque ipsum dolor. Quisquam sit et quis id exercitationem est.','est',5915,NULL,'2003-01-17 18:05:02','2000-04-10 08:53:36'),(75,75,75,'Earum non est quia alias. Consequatur aut quaerat amet. Eos alias et in quibusdam suscipit voluptas.','dolorum',283524219,NULL,'1990-04-16 06:05:03','2000-07-08 14:46:27'),(76,76,76,'Sunt deserunt minima atque. Qui ut error quia dolores. Nesciunt consequatur voluptas quo necessitatibus et. Non omnis aut minus at dolore esse.','omnis',96634733,NULL,'1984-03-14 18:18:56','1988-08-15 21:59:25'),(77,77,77,'Quo quia tenetur ut ipsam et iusto eum maiores. Mollitia omnis tenetur veritatis consequatur. Quis recusandae quisquam possimus perspiciatis temporibus.','nihil',6730538,NULL,'1971-01-25 04:44:31','1985-05-14 15:49:39'),(78,78,78,'Odio ullam quam architecto odio non officiis. Minima numquam autem quam error animi aliquid. Illo quod cupiditate ut ducimus.','quia',10413,NULL,'1984-07-04 08:44:00','2014-03-14 12:01:32'),(79,79,79,'Ratione voluptatibus voluptate iusto harum aliquam quaerat. Dolor debitis quidem ab. Consectetur accusamus sunt consequatur labore.','voluptas',9143,NULL,'2005-07-26 19:02:43','1977-08-22 13:22:12'),(80,80,80,'Eaque iste blanditiis voluptatem quam quas natus odio nisi. Itaque est magni blanditiis nulla esse expedita. Quis excepturi officia qui aut rerum deleniti.','vero',5641,NULL,'1979-06-14 15:49:07','1976-04-23 12:46:26'),(81,81,81,'Ut perferendis dicta qui eligendi totam dicta. Sapiente maxime pariatur labore exercitationem delectus. Sit tenetur fuga sunt qui consequatur non dicta. Sequi tenetur non quis quas nihil molestias.','quaerat',906188,NULL,'1983-08-03 04:44:01','1987-07-20 06:14:13'),(82,82,82,'Itaque ut a dignissimos ullam. Facere quisquam dolorem doloribus nulla cum dolor. Sapiente enim sit unde quidem sapiente sint ex.','quidem',1275368,NULL,'1976-06-08 23:12:07','2009-05-25 18:07:21'),(83,83,83,'Itaque veritatis est rerum pariatur quod optio dolores culpa. Ut et eveniet distinctio quaerat quae iure.','maiores',8182434,NULL,'1995-01-15 14:42:37','1990-04-03 10:50:13'),(84,84,84,'Sequi porro architecto repellat cum officia quod. Sunt voluptates et aut asperiores. Quis dignissimos voluptatem et nemo aut ipsum. Ipsum dolorem aut quia corporis fugiat illum minus.','temporibus',83716838,NULL,'2002-03-22 05:28:51','2001-07-08 05:06:36'),(85,85,85,'Itaque esse error a qui quis vel. Unde debitis ullam id omnis porro. Provident fugit veritatis esse sed quo.','cupiditate',3609,NULL,'1986-08-08 21:12:49','1995-12-03 13:14:07'),(86,86,86,'Aspernatur iusto qui iure est asperiores architecto non suscipit. Soluta maxime tempore molestiae praesentium non rerum assumenda. Cupiditate tempore atque voluptatum laboriosam fugit sapiente.','earum',799037,NULL,'1986-07-16 03:18:36','2001-10-05 02:39:35'),(87,87,87,'Ducimus aliquid quo ipsam fuga doloremque enim dignissimos. Non harum et nisi accusamus qui ipsa quam. Ut unde et enim saepe. Veritatis ut atque cumque facere at.','adipisci',97273652,NULL,'1984-03-20 07:33:51','1970-01-17 19:56:12'),(88,88,88,'Dolor labore sed officia maxime et. A voluptatem incidunt alias eos. Recusandae et temporibus delectus neque. Sit aliquid quos maxime sed perferendis labore.','error',7253,NULL,'1995-03-06 23:10:09','1994-07-12 15:04:07'),(89,89,89,'Eos tempore voluptates esse. Qui libero est numquam quidem. Ab ducimus labore nostrum et vitae voluptatibus.','odio',545,NULL,'1972-10-30 21:15:06','2007-06-13 01:34:35'),(90,90,90,'Est tempora iste eligendi expedita voluptatum ab. Et amet quibusdam qui labore animi dolorum laborum recusandae. Sint sint esse nulla quae est rerum itaque iure. Odit expedita earum dolores autem vel ut.','atque',79,NULL,'1998-08-02 14:22:12','2002-04-15 00:33:16'),(91,91,91,'Est omnis qui unde molestiae totam. Fuga vel beatae suscipit nihil beatae. Reprehenderit blanditiis dolores fugit aut ut sunt eos.','ut',76405,NULL,'2016-03-21 12:46:27','1994-11-17 16:16:16'),(92,92,92,'Nam aut sed et voluptatem adipisci. Omnis totam voluptatibus ut in eum dolorem dicta. Error adipisci est consectetur. Perspiciatis corrupti cupiditate vel qui autem velit quod.','laboriosam',10,NULL,'1988-02-12 11:17:43','2006-02-14 09:53:13'),(93,93,93,'Qui cumque necessitatibus sit sit. Quas at ut unde numquam perspiciatis. Reiciendis molestias dolorem est iure.','quae',817674,NULL,'1994-07-04 17:10:40','1987-05-27 19:20:12'),(94,94,94,'Sequi consequatur voluptatem aut nemo. Incidunt voluptate rerum nisi illum quas quisquam. Ex voluptatem eos provident unde. Pariatur error sunt nihil.','consequuntur',8,NULL,'1985-06-28 19:59:24','2010-05-09 05:18:41'),(95,95,95,'Praesentium architecto soluta maxime voluptas sint numquam. Quam autem et non et. Distinctio aliquam quia voluptatum voluptas sit distinctio voluptatibus. Velit dolorem quaerat consequatur quis voluptatum.','cumque',72212615,NULL,'2003-10-02 01:10:09','1988-04-26 01:01:31'),(96,96,96,'Quisquam voluptatem voluptatem ut tenetur ut. Praesentium ut blanditiis hic nobis rerum ullam. Quis quasi laboriosam distinctio vero mollitia.','sit',95,NULL,'1994-03-22 17:19:00','2004-06-04 05:33:10'),(97,97,97,'Debitis quisquam est unde occaecati consequatur quis. Accusantium quia aut officiis et voluptas.','ea',3169,NULL,'1976-06-01 15:18:22','1971-03-03 16:49:16'),(98,98,98,'Laborum vel quo autem. Commodi dolore esse dolorum voluptatem sed fuga ex. Minus voluptatem cum corporis dolor est et.','sunt',6,NULL,'1996-03-10 00:46:00','1990-01-05 19:00:52'),(99,99,99,'Impedit consequatur consequatur libero. Soluta quo velit tenetur veniam exercitationem sapiente. Harum nobis in inventore voluptas et debitis. Nostrum error explicabo ut deleniti voluptatem voluptatem. Et nam necessitatibus quo.','quia',642,NULL,'2017-01-08 18:37:29','1982-05-07 00:42:59'),(100,100,100,'Omnis dicta dolores earum distinctio aut. Sint et aut consequuntur enim. Vitae et fuga aut. Adipisci non quaerat est nobis.','quo',656,NULL,'1999-01-10 18:41:30','2018-10-20 05:25:56');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'aut'),(2,'enim'),(3,'fugiat'),(4,'repellat'),(5,'possimus'),(6,'natus'),(7,'facere'),(8,'aut'),(9,'similique'),(10,'beatae'),(11,'rerum'),(12,'voluptatem'),(13,'qui'),(14,'tenetur'),(15,'molestiae'),(16,'nihil'),(17,'impedit'),(18,'placeat'),(19,'aut'),(20,'cupiditate'),(21,'earum'),(22,'fugit'),(23,'et'),(24,'pariatur'),(25,'qui'),(26,'voluptates'),(27,'est'),(28,'quia'),(29,'repellat'),(30,'fuga'),(31,'dicta'),(32,'totam'),(33,'accusantium'),(34,'est'),(35,'illo'),(36,'fugiat'),(37,'enim'),(38,'eius'),(39,'qui'),(40,'amet'),(41,'possimus'),(42,'quam'),(43,'qui'),(44,'illo'),(45,'accusantium'),(46,'laudantium'),(47,'sit'),(48,'maxime'),(49,'quas'),(50,'adipisci'),(51,'repellendus'),(52,'vel'),(53,'at'),(54,'placeat'),(55,'voluptatem'),(56,'dolorem'),(57,'aperiam'),(58,'id'),(59,'et'),(60,'tenetur'),(61,'enim'),(62,'labore'),(63,'ut'),(64,'repudiandae'),(65,'cupiditate'),(66,'qui'),(67,'qui'),(68,'sint'),(69,'unde'),(70,'autem'),(71,'corrupti'),(72,'magnam'),(73,'consectetur'),(74,'porro'),(75,'veritatis'),(76,'labore'),(77,'eos'),(78,'dicta'),(79,'similique'),(80,'dolores'),(81,'sed'),(82,'autem'),(83,'commodi'),(84,'earum'),(85,'sed'),(86,'eius'),(87,'delectus'),(88,'id'),(89,'tenetur'),(90,'incidunt'),(91,'aut'),(92,'tempore'),(93,'autem'),(94,'maxime'),(95,'unde'),(96,'veritatis'),(97,'doloremque'),(98,'ut'),(99,'consequuntur'),(100,'quas');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned DEFAULT NULL,
  `to_user_id` bigint(20) unsigned DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'Voluptatem ut quaerat quia. Pariatur esse amet ratione qui quia. In necessitatibus reprehenderit et. Nam accusantium aut qui quae nesciunt non.','1995-08-28 22:44:29'),(2,2,1,'Sint dolores et debitis est ducimus. Aut et quia beatae minus. Ipsa rerum totam modi sunt sed. Voluptas atque eum et odio ea molestias ipsam architecto.','2019-11-19 16:55:22'),(3,3,1,'Sed mollitia quo sequi nisi est tenetur at rerum. Sed quibusdam illo ea facilis nemo sequi. Et tempora repudiandae saepe quo.','2020-09-14 19:45:58'),(4,1,3,'Quod dicta omnis placeat id et officiis et. Beatae enim aut aliquid neque occaecati odit. Facere eum distinctio assumenda omnis est delectus magnam.','2019-12-25 16:56:25'),(5,1,5,'Voluptas omnis enim quia porro debitis facilis eaque ut. Id inventore non corrupti doloremque consequuntur. Molestiae molestiae deleniti exercitationem sunt qui ea accusamus deserunt.','1999-09-19 04:35:46');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'quisquam',1),(2,'eos',2),(3,'ullam',3),(4,'voluptate',4),(5,'quasi',5),(6,'mollitia',6),(7,'saepe',7),(8,'sed',8),(9,'voluptatem',9),(10,'ea',10),(11,'voluptate',11),(12,'ea',12),(13,'perspiciatis',13),(14,'qui',14),(15,'dignissimos',15),(16,'necessitatibus',16),(17,'sed',17),(18,'distinctio',18),(19,'perspiciatis',19),(20,'sed',20),(21,'non',21),(22,'ipsam',22),(23,'fuga',23),(24,'autem',24),(25,'consequuntur',25),(26,'doloremque',26),(27,'occaecati',27),(28,'tenetur',28),(29,'est',29),(30,'consequuntur',30),(31,'suscipit',31),(32,'molestias',32),(33,'aperiam',33),(34,'deserunt',34),(35,'debitis',35),(36,'ipsa',36),(37,'quasi',37),(38,'vel',38),(39,'veniam',39),(40,'quae',40),(41,'quia',41),(42,'pariatur',42),(43,'porro',43),(44,'temporibus',44),(45,'repudiandae',45),(46,'recusandae',46),(47,'aut',47),(48,'natus',48),(49,'vitae',49),(50,'ut',50),(51,'maxime',51),(52,'similique',52),(53,'dolor',53),(54,'in',54),(55,'tempora',55),(56,'error',56),(57,'adipisci',57),(58,'quis',58),(59,'dolores',59),(60,'porro',60),(61,'ut',61),(62,'quia',62),(63,'et',63),(64,'sunt',64),(65,'rerum',65),(66,'et',66),(67,'voluptatum',67),(68,'molestias',68),(69,'quod',69),(70,'aut',70),(71,'est',71),(72,'quia',72),(73,'aut',73),(74,'et',74),(75,'incidunt',75),(76,'vel',76),(77,'natus',77),(78,'iure',78),(79,'ea',79),(80,'libero',80),(81,'exercitationem',81),(82,'in',82),(83,'explicabo',83),(84,'qui',84),(85,'vel',85),(86,'expedita',86),(87,'reprehenderit',87),(88,'voluptate',88),(89,'tempore',89),(90,'molestiae',90),(91,'autem',91),(92,'quasi',92),(93,'suscipit',93),(94,'ea',94),(95,'mollitia',95),(96,'voluptas',96),(97,'delectus',97),(98,'ut',98),(99,'qui',99),(100,'quasi',100);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned DEFAULT NULL,
  `media_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `users_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_active` binary(1) DEFAULT '0',
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `users_id` (`users_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `firstname` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Anahi','Schumm','crona.miles@example.org',NULL,'1-350-142-21'),(2,'Adrian','White','skiles.elody@example.net',NULL,'+48(1)034631'),(3,'Kylee','Daugherty','o\'hara.monica@example.net',NULL,'974.705.5814'),(4,'Antwon','Cruickshank','rafael06@example.com',NULL,'395.755.2246'),(5,'Tyrique','Turcotte','travon97@example.org',NULL,'1-923-653-46'),(6,'Tyshawn','Kris','gmoen@example.org',NULL,'(460)906-744'),(7,'Heloise','Bailey','vivianne.pagac@example.com',NULL,'(268)151-757'),(8,'Helena','Hamill','wilderman.anais@example.org',NULL,'1-428-606-19'),(9,'Kaley','Macejkovic','lwolf@example.net',NULL,'1-349-464-69'),(10,'Malinda','Donnelly','myles85@example.org',NULL,'+52(0)316408'),(11,'Gina','Ernser','murphy.daniel@example.com',NULL,'750.347.6495'),(12,'Isai','Kuphal','sandra15@example.org',NULL,'(580)574-267'),(13,'Luther','Kutch','evangeline29@example.org',NULL,'054.619.2018'),(14,'Etha','Brekke','opollich@example.org',NULL,'678.199.7007'),(15,'Shanelle','Murray','hilpert.consuelo@example.com',NULL,'241-420-7435'),(16,'Hattie','Frami','green.asa@example.com',NULL,'788.341.8645'),(17,'Hugh','Koelpin','reichel.rickey@example.com',NULL,'(382)136-230'),(18,'Missouri','Hyatt','mcdermott.isaiah@example.org',NULL,'(427)300-647'),(19,'Bonita','Yundt','meghan21@example.net',NULL,'1-046-216-11'),(20,'Dillan','Turcotte','elenor.swaniawski@example.com',NULL,'096-070-2541'),(21,'Shanie','Pagac','citlalli.hayes@example.com',NULL,'(758)872-466'),(22,'Otho','Senger','amara.simonis@example.org',NULL,'1-951-008-93'),(23,'Morris','Hodkiewicz','verona.block@example.net',NULL,'1-216-775-69'),(24,'Ottis','Beatty','nkrajcik@example.com',NULL,'1-565-241-78'),(25,'Nicolas','Homenick','mann.caesar@example.net',NULL,'465.101.2255'),(26,'Misty','Steuber','price.fritsch@example.com',NULL,'896.700.0289'),(27,'Telly','Conn','lew80@example.com',NULL,'386-631-8235'),(28,'Vincent','Klein','pablo68@example.org',NULL,'00519985588'),(29,'Shayna','Zulauf','fahey.lavinia@example.com',NULL,'435.205.0149'),(30,'Tatum','Paucek','tanner56@example.net',NULL,'182.804.2086'),(31,'Haylee','Moen','mazie.mayert@example.net',NULL,'1-130-850-07'),(32,'Asha','Muller','marta.mayert@example.org',NULL,'368.853.1445'),(33,'Shaina','Upton','sgulgowski@example.com',NULL,'839-940-2240'),(34,'Richmond','Runolfsson','hammes.estelle@example.com',NULL,'907.555.9826'),(35,'Al','Bailey','earlene02@example.com',NULL,'(632)027-969'),(36,'Mandy','Hahn','wmante@example.net',NULL,'(972)397-310'),(37,'Sylvan','Mante','levi07@example.net',NULL,'+13(6)386261'),(38,'Janelle','Hermann','tate42@example.com',NULL,'+47(2)761588'),(39,'Eugene','Kris','orlando.bins@example.net',NULL,'+33(2)323777'),(40,'Oma','Hermiston','adan.botsford@example.org',NULL,'(816)354-931'),(41,'Kristoffer','Romaguera','jedidiah.schmeler@example.org',NULL,'08043209787'),(42,'Tony','Mayert','halvorson.hipolito@example.net',NULL,'(838)439-892'),(43,'Jeanie','Wisozk','madison.gerhold@example.net',NULL,'(087)267-975'),(44,'Estelle','Leuschke','kathlyn.walker@example.net',NULL,'+72(0)182213'),(45,'Shanie','Zieme','idenesik@example.org',NULL,'(597)209-744'),(46,'Kaitlin','Tromp','jmaggio@example.org',NULL,'1-034-955-21'),(47,'Sage','Schiller','selmer.ward@example.org',NULL,'449.845.6348'),(48,'Heaven','Kulas','tyrel.gislason@example.com',NULL,'(306)853-201'),(49,'Dallas','Abshire','mmccullough@example.org',NULL,'256.540.1249'),(50,'Eleanora','Denesik','xrogahn@example.com',NULL,'1-538-961-53'),(51,'Taryn','Olson','bode.khalid@example.net',NULL,'01331008349'),(52,'Rylee','Lind','estefania.graham@example.org',NULL,'(800)491-830'),(53,'Dylan','Bradtke','amelia.pacocha@example.com',NULL,'426.244.5482'),(54,'Anne','Gusikowski','idell64@example.com',NULL,'(253)154-168'),(55,'Alexandre','Pacocha','kody86@example.net',NULL,'(360)976-185'),(56,'Jerrold','Bergnaum','cruickshank.guido@example.org',NULL,'1-249-320-69'),(57,'Nikki','Abshire','wsatterfield@example.com',NULL,'1-764-674-01'),(58,'Ricky','Leannon','rwalker@example.com',NULL,'468-983-7050'),(59,'Garnett','Conroy','chase21@example.net',NULL,'+32(9)196964'),(60,'Loyal','Sauer','ydooley@example.com',NULL,'1-669-078-26'),(61,'Jay','Feeney','xlind@example.net',NULL,'(084)370-674'),(62,'Nigel','Monahan','jaleel61@example.org',NULL,'923-192-0926'),(63,'Adela','Schmeler','bschmeler@example.com',NULL,'788.226.0741'),(64,'Forrest','Schaden','lgleason@example.com',NULL,'08960627931'),(65,'Olin','Stokes','kevon38@example.net',NULL,'(820)252-050'),(66,'Rozella','O\'Conner','florence.reichel@example.net',NULL,'06835529325'),(67,'Wava','Cummerata','rodriguez.fatima@example.org',NULL,'1-374-664-46'),(68,'Randall','Lind','xondricka@example.com',NULL,'(641)164-547'),(69,'Bernadette','Hermann','buckridge.jesse@example.com',NULL,'133-259-2890'),(70,'Raven','Veum','alec.hilll@example.com',NULL,'1-975-517-02'),(71,'Hadley','Schuster','torp.ivah@example.org',NULL,'+99(3)522287'),(72,'Bailey','Corwin','lina.hagenes@example.com',NULL,'+24(6)872658'),(73,'Helmer','Reinger','raynor.elnora@example.net',NULL,'1-194-329-01'),(74,'Madyson','Bernhard','predovic.adolphus@example.org',NULL,'381-471-8988'),(75,'Whitney','Wiza','metz.muriel@example.com',NULL,'+28(8)310903'),(76,'Chaz','Hilll','kernser@example.net',NULL,'058.654.1154'),(77,'Isabell','Beer','upadberg@example.net',NULL,'1-863-237-64'),(78,'Alva','Kuhn','imiller@example.net',NULL,'+23(2)633248'),(79,'Elvera','Pollich','rstehr@example.org',NULL,'1-428-900-44'),(80,'Deon','Tromp','ereinger@example.com',NULL,'213.786.1435'),(81,'Rossie','Hills','myra22@example.org',NULL,'1-549-728-56'),(82,'Archibald','Sawayn','kristofer.langosh@example.org',NULL,'089.918.4288'),(83,'Akeem','Conn','kirk.pfannerstill@example.org',NULL,'1-472-844-53'),(84,'Lambert','Huels','elaina.nader@example.org',NULL,'(069)901-183'),(85,'Issac','Bailey','kelsie34@example.net',NULL,'400.321.4213'),(86,'Jaunita','Stark','lvonrueden@example.com',NULL,'1-605-096-24'),(87,'Lawrence','Koelpin','emie60@example.com',NULL,'1-809-299-99'),(88,'Marley','Kris','joelle.rau@example.net',NULL,'06798403305'),(89,'Earl','Yundt','edwardo82@example.com',NULL,'611.799.4815'),(90,'Alek','Klocko','stuart.reichert@example.org',NULL,'1-918-154-02'),(91,'Derek','Brakus','faye.bins@example.org',NULL,'1-833-130-12'),(92,'Autumn','Johns','avis.renner@example.com',NULL,'(617)931-150'),(93,'Sunny','Frami','lonzo.brown@example.com',NULL,'552-718-2069'),(94,'Kelsie','Miller','cgrady@example.com',NULL,'347.310.7321'),(95,'Kasandra','Bayer','dianna.ryan@example.com',NULL,'(975)911-309'),(96,'Sven','Brekke','schmitt.beatrice@example.org',NULL,'1-322-021-88'),(97,'Alden','Runolfsson','joy.fisher@example.net',NULL,'1-748-586-11'),(98,'Aliza','Streich','marley78@example.com',NULL,'295-278-5649'),(99,'Holly','Buckridge','aufderhar.kory@example.org',NULL,'1-923-147-69'),(100,'Giovanny','Cartwright','beer.rod@example.net',NULL,'1-030-442-72');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vk_3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19 16:55:57
