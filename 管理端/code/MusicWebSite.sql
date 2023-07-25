-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: music_website
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `ad_id` int NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `com_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `mu_id` int DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `content` varchar(60) DEFAULT NULL,
  `love` int DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `com_fk_user_id_idx` (`user_id`),
  KEY `com_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `com_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`),
  CONSTRAINT `com_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_music`
--

DROP TABLE IF EXISTS `favorite_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_music` (
  `fmu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `mu_id` int DEFAULT NULL,
  PRIMARY KEY (`fmu_id`),
  KEY `famusic_fk_user_id_idx` (`user_id`),
  KEY `famusic_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `fmu_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`),
  CONSTRAINT `fmu_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_music`
--

LOCK TABLES `favorite_music` WRITE;
/*!40000 ALTER TABLE `favorite_music` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_mv`
--

DROP TABLE IF EXISTS `favorite_mv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_mv` (
  `fmv_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `mv_id` int DEFAULT NULL,
  PRIMARY KEY (`fmv_id`),
  KEY `fmv_fk_user_id_idx` (`user_id`),
  KEY `fmv_fk_mu_id_idx` (`mv_id`),
  CONSTRAINT `fmv_fk_mu_id` FOREIGN KEY (`mv_id`) REFERENCES `music` (`mu_id`),
  CONSTRAINT `fmv_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_mv`
--

LOCK TABLES `favorite_mv` WRITE;
/*!40000 ALTER TABLE `favorite_mv` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_mv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `ls_id` int NOT NULL,
  `user` varchar(60) DEFAULT NULL,
  `ls_name` varchar(60) DEFAULT NULL,
  `img` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `mu_id` int NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `singer` varchar(60) DEFAULT NULL,
  `class` varchar(60) DEFAULT NULL,
  `word` varchar(60) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `img_url` varchar(60) DEFAULT NULL,
  `number` int DEFAULT '0',
  `state` int DEFAULT '1',
  PRIMARY KEY (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'#あくあ色ぱれっと','湊あくあ',NULL,'/word/湊あくあ  - #あくあ色ぱれっと.lrc','/music/湊あくあ  - #あくあ色ぱれっと.mp3','/images/1.jpg',0,1),(2,'September','Earth, Wind & Fire',NULL,'/word/Earth, Wind & Fire  - September.lrc','/music/Earth, Wind & Fire  - September.mp3','/images/2.jpg',0,1),(3,'Say So (Japanese Version)','Rainych',NULL,'/word/Rainych  - Say So (日语).lrc','/music/Rainych  - Say So (日语).mp3','/images/3.jpg',0,1),(4,'特にない','藤井風',NULL,'/word/藤井风  - 特にない.lrc','/music/藤井风  - 特にない.mp3','/images/4.jpg',0,1),(5,'たぶん','YOASOBI',NULL,'/word/YOASOBI  - たぶん (大概).lrc','/music/YOASOBI  - たぶん (大概).mp3','/images/5.jpg',0,1),(6,'Zero Gravity','I Don\'t Like Mondays.',NULL,'/word/I Don\'t Like Mondays.  - Zero Gravity.lrc','/music/I Don\'t Like Mondays.  - Zero Gravity.mp3','/images/6.jpg',0,1),(7,'Never Gonna Give You Up','Rick Astley',NULL,'/word/Rick Astley  - Never Gonna Give You Up.lrc','/music/Rick Astley  - Never Gonna Give You Up.mp3','/images/7.jpg',0,1),(8,'One Last Kiss','宇多田光',NULL,'/word/宇多田光  - One Last Kiss.lrc','/music/宇多田光  - One Last Kiss.mp3','/images/8.jpg',0,1),(9,'閃光','[Alexandros]',NULL,'/word/[Alexandros]  - 閃光.lrc','/music/[Alexandros]  - 閃光.mp3','/images/9.jpg',0,1),(10,'Devil Trigger','Ali Edwards',NULL,'/word/Ali Edwards  - Devil Trigger.lrc','/music/Ali Edwards  - Devil Trigger.mp3','/images/10.jpg',0,1),(11,'Bury the Light','Victor Borba',NULL,'/word/Victor Borba  - Bury the Light.lrc','/music/Victor Borba  - Bury the Light.mp3','/images/11.jpg',0,1),(12,'Don\'t Be So Serious','Low Roar',NULL,'/word/Low Roar  - Don\'t Be So Serious.lrc','/music/Low Roar  - Don\'t Be So Serious.mp3','/images/12.jpg',0,1),(13,'Bones','Low Roar/Jofridur Akadottir',NULL,'/word/Low Roar _ Jófriður  - Bones.lrc','/music/Low Roar _ Jófriður  - Bones.mp3','/images/13.jpg',0,1),(14,'BB\'s Theme','Ludvig Forssell/Jenny Plant',NULL,'/word/Ludvig Forssell _ Jenny Plant  - BB\'s Theme.lrc','/music/Ludvig Forssell _ Jenny Plant  - BB\'s Theme.mp3','/images/14.jpg',0,1),(15,'Wake Up, Get Up, Get Out There','Lyn',NULL,'/word/Lyn  - Wake Up, Get Up, Get Out There.lrc','/music/Lyn  - Wake Up, Get Up, Get Out There.mp3','/images/15.jpg',0,1),(16,'Last Surprise','Lyn',NULL,'/word/Lyn  - Last Surprise.lrc','/music/Lyn  - Last Surprise.mp3','/images/16.jpg',0,1),(17,'Life Will Change','Lyn',NULL,'/word/Lyn  - Life Will Change.lrc','/music/Lyn  - Life Will Change.mp3','/images/17.jpg',0,1),(18,'Rivers In the Desert','Lyn',NULL,'/word/Lyn  - Rivers In the Desert.lrc','/music/Lyn  - Rivers In the Desert.mp3','/images/18.jpg',0,1),(19,'The Whims of Fate','Lyn',NULL,'/word/Lyn  - The Whims of Fate.lrc','/music/Lyn  - The Whims of Fate.mp3','/images/19.jpg',0,1),(20,'冬の花','宫本浩次',NULL,'/word/宮本浩次  - 冬の花 (冬之花).lrc','/music/宮本浩次  - 冬の花 (冬之花).mp3','/images/20.jpg',0,1),(21,'夜明けのうた','宫本浩次',NULL,'/word/宮本浩次  - 夜明けのうた (黎明之歌).lrc','/music/宮本浩次  - 夜明けのうた (黎明之歌).mp3','/images/21.jpg',0,1),(22,'无条件','陈奕迅',NULL,'/word/陈奕迅  - 无条件.lrc','/music/陈奕迅  - 无条件.mp3','/images/22.jpg',0,1),(23,'葡萄成熟时','陈奕迅',NULL,'/word/陈奕迅  - 葡萄成熟时.lrc','/music/陈奕迅  - 葡萄成熟时.mp3','/images/23.jpg',0,1),(24,'苦瓜','陈奕迅',NULL,'/word/陈奕迅  - 苦瓜.lrc','/music/陈奕迅  - 苦瓜.mp3','/images/24.jpg',0,1),(25,'Shall We Talk','陈奕迅',NULL,'/word/陈奕迅  - Shall We Talk.lrc','/music/陈奕迅  - Shall We Talk.mp3','/images/25.jpg',0,1),(26,'不要说话','陈奕迅',NULL,'/word/陈奕迅  - 不要说话.lrc','/music/陈奕迅  - 不要说话.mp3','/images/26.jpg',0,1),(27,'淘汰','陈奕迅',NULL,'/word/陈奕迅  - 淘汰.lrc','/music/陈奕迅  - 淘汰.mp3','/images/27.jpg',0,1),(28,'人来人往','陈奕迅',NULL,'/word/陈奕迅  - 人来人往.lrc','/music/陈奕迅  - 人来人往.mp3','/images/28.jpg',0,1),(29,'落花流水','陈奕迅',NULL,'/word/陈奕迅  - 落花流水.lrc','/music/陈奕迅  - 落花流水.mp3','/images/29.jpg',0,1),(30,'歌·颂','陈奕迅',NULL,'/word/陈奕迅  - 歌·颂.lrc','/music/陈奕迅  - 歌·颂.mp3','/images/30.jpg',0,1),(31,'一路向北','周杰伦',NULL,'/word/周杰伦  - 一路向北.lrc','/music/周杰伦  - 一路向北.mp3','/images/31.jpg',0,1),(32,'半岛铁盒','周杰伦',NULL,'/word/周杰伦  - 半岛铁盒.lrc','/music/周杰伦  - 半岛铁盒.mp3','/images/32.jpg',0,1),(33,'反方向的钟','周杰伦',NULL,'/word/周杰伦  - 反方向的钟.lrc','/music/周杰伦  - 反方向的钟.mp3','/images/33.jpg',0,1),(34,'搁浅','周杰伦',NULL,'/word/周杰伦  - 搁浅.lrc','/music/周杰伦  - 搁浅.mp3','/images/34.jpg',0,1),(35,'说了再见','周杰伦',NULL,'/word/周杰伦  - 说了再见.lrc','/music/周杰伦  - 说了再见.mp3','/images/35.jpg',0,1),(36,'爱在西元前','周杰伦',NULL,'/word/周杰伦  - 爱在西元前.lrc','/music/周杰伦  - 爱在西元前.mp3','/images/36.jpg',0,1),(37,'以父之名','周杰伦',NULL,'/word/周杰伦  - 以父之名.lrc','/music/周杰伦  - 以父之名.mp3','/images/37.jpg',0,1),(38,'明明就','周杰伦',NULL,'/word/周杰伦  - 明明就.lrc','/music/周杰伦  - 明明就.mp3','/images/38.jpg',0,1),(39,'说好不哭','周杰伦',NULL,'/word/周杰伦  - 说好不哭（with 五月天阿信）.lrc','/music/周杰伦  - 说好不哭（with 五月天阿信）.mp3','/images/39.jpg',0,1),(40,'Bohemian Rhapsody','Queen',NULL,'/word/Queen  - Bohemian Rhapsody (Remastered 2011).lrc','/music/Queen  - Bohemian Rhapsody (Remastered 2011).mp3','/images/40.jpg',0,1),(41,'Don\'t Stop Me Now','Queen',NULL,'/word/Queen  - Don\'t Stop Me Now.lrc','/music/Queen  - Don\'t Stop Me Now.mp3','/images/41.jpg',0,1),(42,'We Will Rock You','Queen',NULL,'/word/Queen  - We Will Rock You (Remastered 2011).lrc','/music/Queen  - We Will Rock You (Remastered 2011).mp3','/images/42.jpg',0,1),(43,'We Are The Champions','Queen',NULL,'/word/Queen  - We Are The Champions (Remastered 2011).lrc','/music/Queen  - We Are The Champions (Remastered 2011).mp3','/images/43.jpg',0,1),(44,'I Want To Break Free','Queen',NULL,'/word/Queen  - I Want To Break Free (Remastered 2011).lrc','/music/Queen  - I Want To Break Free (Remastered 2011).mp3','/images/44.jpg',0,1),(45,'Somebody to Love','Queen',NULL,'/word/Queen  - Somebody To Love (Remastered 2011).lrc','/music/Queen  - Somebody To Love (Remastered 2011).mp3','/images/45.jpg',0,1),(46,'Another One Bites the Dust','Queen',NULL,'/word/Queen  - Another One Bites the Dust.lrc','/music/Queen  - Another One Bites the Dust.mp3','/images/46.jpg',0,1),(47,'遥远的她','张学友',NULL,'/word/张学友  - 遥远的她.lrc','/music/张学友  - 遥远的她.mp3','/images/47.jpg',0,1),(48,'蓝雨','张学友',NULL,'/word/张学友  - 蓝雨.lrc','/music/张学友  - 蓝雨.mp3','/images/48.jpg',0,1),(49,'小城大事','张学友',NULL,'/word/张学友  - 小城大事 (Live).lrc','/music/张学友  - 小城大事 (Live).mp3','/images/49.jpg',0,1),(50,'如果这都不算爱','张学友',NULL,'/word/张学友  - 如果这都不算爱.lrc','/music/张学友 - 如果这都不算爱.mp3','/images/50.jpg',0,1),(51,'她来听我的演唱会','张学友',NULL,'/word/张学友  - 她来听我的演唱会.lrc','/music/张学友  - 她来听我的演唱会.mp3','/images/51.jpg',0,1);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mv`
--

DROP TABLE IF EXISTS `mv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mv` (
  `mv_id` int NOT NULL,
  `mu_id` int DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `time` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`mv_id`),
  KEY `mu_id_fk_idx` (`mu_id`),
  KEY `mv_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `mv_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv`
--

LOCK TABLES `mv` WRITE;
/*!40000 ALTER TABLE `mv` DISABLE KEYS */;
/*!40000 ALTER TABLE `mv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_list`
--

DROP TABLE IF EXISTS `song_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_list` (
  `ls_id` int NOT NULL,
  `list_name` varchar(60) DEFAULT NULL,
  `mu_id` int DEFAULT NULL,
  PRIMARY KEY (`ls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_list`
--

LOCK TABLES `song_list` WRITE;
/*!40000 ALTER TABLE `song_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user1','12345678',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-09 21:38:28
