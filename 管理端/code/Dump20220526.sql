CREATE DATABASE  IF NOT EXISTS `music_website` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `music_website`;
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
  `ad_name` varchar(60) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telephone` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ad_name`)
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
  `mu_id` int DEFAULT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `time` varchar(60) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `love` int DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `com_fk_user_name_idx` (`user_name`),
  KEY `con_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `com_fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`),
  CONSTRAINT `con_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'user1','2020.11.17','无论如何，也会一直陪伴着你的。 心情低落的时候听到你可爱的声音，看着傻傻的你，心情就会好起来，感觉自己又有动力了。 感谢你曾经给我带来的快乐，现在轮到我来帮助你了。 谢谢你，永远会单推你的，我的天使。',152),(2,1,'user1','2022.12.21','夸，快带我润吧，夸',0),(3,1,'user1','2020.12.6','这首歌在ytb的版本比b站多一行字 企划：bilibili 只有阿夸尊重各个国家的粉丝',127),(4,1,'user1','2021.1.16','我有句话想要说！ aqua实在是可爱！ 喜欢喜欢超喜欢！果然还是喜欢！ 好不容易遇见的公主大人！ 是我生于世上唯一的理由！ 那就是为了与aqua相遇！ 和我一起度过余生吧！ 我比世上任何人都爱你！ 阿！姨！洗！铁！路！',21),(5,1,'user1','2020.2.14','阿夸拯救了我，我至今无法拯救她',19),(6,2,'user1','2014.12.5','德里斯跳舞那段真是嗨，老菲利普也开心的不行～',10016),(7,2,'user1','2015.2.10','推荐触不可及这部电影!!不看真的会后悔',9241),(8,2,'user1','2014.12.12','听歌的时候，旋律永远是第一感觉，然后才是歌词，歌词过后才是细节。',5102),(9,2,'user1','2014.12.5','国电影触不可及的',2465),(10,2,'user1','2015.3.14','再分享一遍，september！我最喜欢一部法语电影里面的最喜欢的片段的最喜欢的舞蹈的背景音乐，德里斯舞蹈跳起来的时候我跟老菲利普都开心的笑了。很温暖的电影，很温暖的一首歌。愿温暖你我。',2392),(11,3,'user1','2020.4.18','原版如果是身材超好的欧美大姐姐在灯光绚烂的迪厅里热舞的话 那么日语版就是有些不良气质但可爱爆表的JK在夜晚东京繁华街头戴着耳机边走边跳着舞',24565),(12,3,'user1','2020.5.31','一个印尼歌手用日语翻唱一首英文歌',20101),(13,4,'user1','2020.4.7','没有欲望没有期望没有失望',14938),(14,4,'user1','2020.6.1','天哪天哪天哪天哪！我要流泪了！我好喜欢他唱的歌！太好听了！是那种奇妙的感觉明白吗松弟萌！是那种听前奏就觉得好喜欢！一开口就觉得晚点了！整个就OMG！太喜欢这种唱歌的感觉了，还有他本身的那种氛围感，太舒服了！在自己喜欢的领域游刃有余的感觉！好特别好轻快！完蛋了！我可太喜欢他了！',9002),(15,5,'user1','2021.1.6','啊！可以在歌单里收藏两个版本！这样就有两倍的几率循环到这首歌！',6448),(16,5,'user1','2021.1.24','给新粉科普一下：YOASOBl是一个组合，ikura是组合里的主唱，是一个有着天使吻过的嗓音的小姐姐；ayase是这个组合里负责歌曲制作的小哥哥，同时也是一位p主，术曲也都很好听！！真是个神仙组合啊！爱啦爱啦！',4469),(17,6,'user1','2020.8.19','第一反应：这是日本maroon 5？',2918),(18,6,'user1','2020.2.13','月亮占满心头 都会醉眼惺忪',2408),(19,7,'user1','2021.2.10','第一次听：我 被 骗 了 第二次听：好像还有点好听 现在：never gonna give you up~',9618),(20,7,'user1','2022.1.2','《 世 界 上 播 放 量 最 高 的 歌 》',6817),(21,7,'user1','2021.8.15','你被骗了(X) 爷搜索来的(√)',6057),(22,7,'user1','2016.1.17','87年还是88年得到这张人生中第一盒外国原版卡带，翻来覆去听了n遍。借给同学传来传去，最终丢了。后来才知道Rick Astley和他的这张唱片红遍全球。',4445),(23,7,'user1','2020.11.24','这个meme就是各种发小视频链接的会弹到这个MV，或者辛辛苦苦下了一晚上的资源结果是高清MV。 之前油管整顿那种视频的时候，把所有的视频内容都替换成了这个MV，而且歌词又很应景，然后又在油管上火了一遍。 Never gonna give up绝对不让你高潮 Never gonna let you down（load）绝对不让你下（载）',3593),(24,8,'user1','2021.3.9','25年的EVA 9年最终章的等待 他们也都长大了 我们最后的青春也结束了 再见 所有的EVANGELION！',37588),(25,8,'user1','2021.9.15','哥几个又来逛卢浮宫啦',31120),(26,8,'user1','2021.3.9','再见了，所有的Evangelion.',27344),(27,8,'user1','2021.6.30','属于真嗣，也属于我们每个人的困在蝉鸣热浪中的永夏结束了。但属于他们的新生才刚刚开启，在一个没有使徒也没有EVA的世界。跨出EVA的诅咒，他们都将迈向美好的未来。我们也是。 祝我们的青春盛大落幕。 感谢痞子圆了整整一代人的跨世纪牵挂。 完结不是结束，心之壁垒终存。 再见了，所有的EVANGELION',27024),(28,8,'user1','2021.3.9','真正意难平的不是你家cp没有在一起，而是EVA真的结束了。你也长大了，把EVA的故事埋在心底，向不完美的世界和解。正如结尾那样随着真嗣走出车站动漫变为现实。你也该像个大人一样面对现实了。',22474),(29,9,'user1','2021.6.15','这部剧场版最撼动让我难忘的不是柯西帅气登场的那一幕，而是夜深人静时，哈撒维独自一人躺在酒店的床上为担忧着人类与地球的未来而流泪，此时琪琪和凯奈斯大佐却在舞厅蹦迪所形成的强烈对比',4217),(30,10,'user1','2019.3.22','尼禄绝世好男人，抱着裸女还想着凯莉叶，会处理家庭纠纷（叔父矛盾），还满嘴抹了蜜',7367),(31,10,'user1','2019.3.22','斯巴达家族家训： 1.出场一定要表演剑插自己以示友好； 2.拿到新武器要当场耍给观众看； 3.挡路的不管是精密机关还是不精密的路障，不要想太多砸坏就好； 4.没什么问题是打一架不能解决的，如果不行就变魔人再打一架； 5.打架招数可以不实用，但一定要帅； 6.不符合以上条件的逐出家门。',6803),(32,11,'user1','2021.2.14','不知道怎么调音量的老父亲.mp4',3284),(33,11,'user1','2021.2.8','我翻开历史一查，这历史没有年代，歪歪斜斜的每页上都写着“兄友情深”几个字，我横竖睡不着，仔细看了半夜，才从字缝里看出来，满本上都写着两个字“抛瓦！”',2748),(34,12,'user1','2019.11.12','1:在风电机厂前面的危险区建立的两座桥花费了前期几乎所有的资源，一天后我收获了10万赞(⁎⁍̛ᴗ⁍̛⁎) 2:通宵修路时被米尔人追杀弹尽粮绝，车子开到没电，看着一车的装的材料不忍放弃，在线申请送构造器，第二天醒来，私人储存柜里塞满了各种工具，在车子旁边建了一个大桥一个充电桩。',8833),(35,12,'user1','2020.7.24','各位玩家们，如果你们到达中部地区的雪山的时候，请一定要注意修滑索，如果能碰见一些id叫:kanzaki–ranko–59的高空滑索，那就是我。我搜遍全部资源，踏着bt的尸体，顶着暴风雪的侵蚀，豁着老命修出来的滑索，只为方便后面到来的各位新进快递员们。',5596),(36,13,'user1','2019.11.12','这首是Sam背着总统的尸体前往焚化厂途中响起的BGM，不得不说小岛秀夫真的是很懂，在我第一次正式踏上送货旅途，刚刚对遥远的路程感到迷茫并产生一丝厌倦时，悄无声息的拉远镜头，降低背景的声音，播放起了这首旋律舒缓又节奏明快的歌曲，一时间竟有点泪目，太久没有在游戏中有过这种代入感了。',2993),(37,13,'user1','2019.11.15','小岛在终极预告里放了几个主要角色流泪的特写，然后在游戏一开头就告诉我们开罗尔过敏会导致流泪，欺骗你先入为主。当玩过整个流程之后却发现，预告里流泪的桥段都不是因为过敏。',2102),(38,14,'user1','2019.10.30','我没有贷款，粉丝帮我弄。 我没有工作室，粉丝帮我弄。 我没有办公设备，联想帮我弄。 我没有发行商，索尼帮我弄。 我没有引擎，索尼第一方给我。 我没有演员，弩哥找上门。 我还要演员，演员的朋友帮我找 我要制作经费，索尼给我钱。 我还想出pc，索尼还特么同意了。 ——死亡搁浅诞生纪第一章',5198),(39,14,'user1','2019.10.30','很显然 10分是他的最低分',3168),(40,15,'user1','2019.1.22','P5真的是去年甚至过去几年内鲜有的JRPG佳作，除了绝赞的人设和音乐，剧情的引人入胜和丝丝相扣也让人回味无穷。去年拿到制作人大奖的确实至名归，也让久等的玩家没有失望！谁说JRPG不行了？关键还是得看是否真的用心去做',7004),(41,15,'user1','2019.3.15','Take your Heart：觉得JRPG已经走到绝路的愚昧的之人啊，我们决定将于3月23日盗走你那充满怀疑的腐败之心，让你自己发出对于Persona5的赞美之声。——心之怪盗团',4555),(42,16,'user1','2017.4.14','包围→要钱→全给你了，再怎么数也不会多→还有吗→还有吗→还有吗→总攻击',10546),(43,16,'user1','2017.4.7','流水的队员，铁打的摩那',7274),(44,17,'user1','2017.4.21','知道波特进入殿堂为什么要点一下手机吗？是为了异世界app？不不不，他其实是在切歌',19110),(45,17,'user1','2017.1.18','进行犯罪预告之后偷宝物时的bgm，也是整个游戏的主旋律。 从容、潇洒、华丽、中二爆表。 燃烧心中的恐惧，直面真实的自我，生命的轨迹就在此刻改变！！ personaaaa！！！',12719),(46,18,'user1','2017.4.10','狮童正义的行动次数增加了，炙热奋起，拉坤达，霸王波动。谈笑间我放下了手柄',5477),(47,18,'user1','2017.4.8','强劲有力充满侵略感的前奏。配合低沉压抑的女声给人一种庄重威严的感觉。但短暂的低沉后随即便是高昂的战意，低落低沉只是为了致命一击的蓄力！是时候了，该掀起所有底牌，放手一搏的时候到了！是时候了，给这个贯穿在主角故事中占据着重要地位的男人一个终结！创造奇迹！在这片干涸的沙漠中开拓江河！',2964),(48,19,'user1','2017.4.29','冴姐：“最后还有件事我想确认一下。” 波特：“……” 冴姐：“说出来你可能不信，我怎么觉得你好像还欠我100万没还？”',2983),(49,19,'user1','2017.4.12','万万没想到这首下面的戾气是最重的。我在这里只提醒各位，大家都是来听歌的，多数人是因为喜欢P5，也有不少纯粹是因为喜欢音乐风格才来的，举报功能也不是摆设，非要不考虑别人想法争个你死我活的话，还不如全部拉去给怪盗团改心。',1614),(50,20,'user1','2021.12.8','你也是来听歌的罢（心虚',6951),(51,20,'user1','2022.1.2','因日共失败而绝望大叫的学生',4612),(52,21,'user1','2021.12.31','红白打卡！在江船上疯疯癫癫的表演像个艺术家，太爱了！携飞仙以遨游，抱明月而长终的感觉',74),(53,21,'user1','2020.2.25','宫本浩次的声音真的很有味道，从冬の花转粉，有一种历经沧桑唱述悲欢的感觉。不管是平静还是嘶吼，都让我觉得有一种深情和激昂感。',28),(54,22,'user1','2021.7.15','“你听陈奕迅想到的那个人 是不会有结果的”',11138),(55,22,'user1','2017.10.12','他教会我们 不要人云亦云 谣言止于智者 我们要学会无私的爱 原来无条件就是挚爱最大的条件',6187),(56,23,'user1','2015.12.18','高中一位老师说过，你们这一代人最痛苦的事是什么？是“失恋”。温饱思淫欲，因为失恋那点小事自怨自艾，其实你没有那么多故事，也没有那么多的苦难。一切的一切，只是你的自以为，你心中的自导自演。',54921),(57,23,'user1','2015.1.17','我知葡萄已熟透，但何人可举杯共饮酒。',29071),(58,24,'user1','2014.11.8','这首词借苦瓜写尽世间百态，过瘾。苦瓜的苦，从未变过，变了的是我们，是时间，是际遇，是已经悄悄爬上鬓角的白丝，年轻人永远无法体会老者的清心寡欲，也无法领悟苦瓜里的那份禅意，就像是这首歌唱的那样，青春如快餐，余生险恶，如艺坛杰作，但有痛苦，就有欢乐。',59250),(59,24,'user1','2016.3.27','听懂陈奕迅 真的 不是一件 值得 开心的事',47267),(60,25,'user1','2014.12.23','陪我讲 陪我讲出我们最后何以生疏',3074),(61,25,'user1','2014.10.5','用着技巧，怀着心机说话，不论是为了你多爱我一点，还是为了多一发钞票，结果都是忘了那个所谓傻乎乎的不会说话的自己，当技巧用累了，心机枯竭了，又开始怀恋那个好好说话的自己',2129),(62,26,'user1','2014.11.9','人生第一大错觉：他喜欢你',201285),(63,26,'user1','2015.1.7','当时室友在放这首歌，我就问是啥名字？他说不要说话，我就说我偏要说话，我就问一下名字嘛，为啥不能说话……后来，后来，可尴尬了',92592),(64,27,'user1','2014.10.6','周杰伦给别人的歌也全是精品！！',194555),(65,27,'user1','2016.1.30','考59分比考0分更难过，最痛苦的不是不曾拥有，而是差一点就可以。',172101),(66,28,'user1','2014.12.5','其实备胎都不是悲哀，千斤顶才悲哀，换备胎的时候才会用一下',24267),(67,28,'user1','2015.10.14','中学喜欢你六年，你起得早，我就每天第一个跑到教室开门，和你静静的待到第三个人来，，大学暗恋你四年，我在长沙，你在杭州，开心难过你都知道，直到那天你兴高采烈打电话给我说你终于有男朋友了。。我第一次为你笑着流泪了，，十年，我只爱过你一个人，，',10436),(68,29,'user1','2015.1.15','有时候可以循环，有时候一遍都听不下去',55801),(69,29,'user1','2016.4.7','生最好的三种状态：不期而遇、不言而喻、不药而愈。',39902),(70,30,'user1','2015.2.23','词是魂，曲是肉身，一开始总是被曲调吸引，最终真正爱上这首歌的往往是词写的太对，道破心境。感谢所有词曲作者演唱者。',8109),(71,30,'user1','2015.11.21','多人说e神只是靠着一把声在华语乐坛，确实，他不能写出那么极富智慧和经典的歌词，但每一分歌词他都能表达出词作者的感情，世界是没有全才的，那些借此贬低他的人，殊不知每一次的现场演唱，他都会衷心感谢乐队，控制台，90度的鞠躬感谢观众，感谢你的真诚，真诚的声音和感情。',7424),(72,31,'user1','2021.12.17','公子向北走，小女子向南瞧，此生就此别过了，纵有千般不舍，却也万般无奈。',146),(73,31,'user1','2021.12.3','五刷《头文字D》1：10：25响起一路向北伴奏1：40：15响起了《一路向北》，从夏树“回乡下”再到夏树返回。',31),(74,32,'user1','2022.1.11','昨天考试听见某同学唱了句“为什么这样子~”勾起了我对这首歌的回忆，回家直接单曲循环了?，能看到别人跟我一样也喜欢周杰伦，有点小感动',347),(75,32,'user1','2021.11.23','Jay，每次我在受委屈和校园冷暴力后，都会听你的歌，你的歌给了我很大的支撑，谢谢你，Jay，我还是忠爱你的歌',172),(76,33,'user1','2022.1.19','听一千遍反方向的钟，可不可以回到你爱我的那个时候',4629),(77,33,'user1','2022.2.3','“听一千遍反方向的钟不会回到过去，但读一万遍书就能战胜未来。”',2198),(78,34,'user1','2021.11.29','人还是刚认识的好，虚伪又浪漫，新鲜又热情。',242),(79,34,'user1','2022.2.10','所以你分享给我的事情 又同时发给了几个人呢',105),(80,35,'user1','2021.11.22','把我爱你小心藏在心里 你默契的把他也小心的藏在了心里 上次你杳无音信 ，这次好歹我还说再见',183),(81,35,'user1','2022.1.23','没有人见过风的模样 每当树叶摇曳 水波涟漪 或浮云飘过 我们才知道风一直都在 从未离开',127),(82,36,'user1','2022.1.1','晚上还在听爱在西元前呢，听见最爱的人直播清唱最爱的歌的感觉真的太棒了！！！周杰伦yyds！！！',5496),(83,36,'user1','2022.1.21','还记得学生时代唱着爱在西元前和简单爱追女孩的情景。好怀念。',530),(84,37,'user1','2020.1.15','妈妈问我为什么要跪着听歌?',621),(85,37,'user1','2020.2.3','原来听这首歌喜欢跳过前奏，现在快三百遍了，每次前奏都会安静听完，带入那种庄严肃穆的氛围',312),(86,38,'user1','2021.11.22','那天喝多了，给她打电话，哭的稀里哗啦说了两个小时。第二天醒来后看通话记录。通话记录7秒.',2365),(87,38,'user1','2022.2.3','城堡为爱守着秘密 而我为你守着回忆',133),(88,39,'user1','2022.2.12','虽然现在是假期，但还是时常会很伤心，还有3天就开学了，我不想再像上个学期一样的难熬，再说，这是我初中的最后一个学期，我不想以后我想起初中时都是这些抑郁的情绪，我很想很想快乐度过最后一个学期，求求了，别让我有那种低落的情绪了好嘛',208),(89,39,'user1','2021.12.29','我的年度歌手永远是周杰伦❤️',172),(90,40,'user1','2015.6.21','当年在KTV唱这首歌唱到高潮被同学切掉，呆滞了一个下午。当年模仿王小波写小说被同学嘲笑，几万字付之一炬。当时我已苍老，现在我正风华正茂。',114794),(91,40,'user1','2016.5.8','6分钟5章4种风格，1、钢琴伴奏，倾诉。2、咏叹调，向母亲交代罪行。3、合唱，众神审判。4、金属，反抗。5、钢琴伴奏，从命。就酱。',47796),(92,41,'user1','2015.10.23','感觉自从用了网易云 大家都开始深谋远虑 连葬礼都考虑好了',12959),(93,41,'user1','2018.2.2','别家的粉丝：颜控、手控、声控、腿控；queen的粉丝：牙控。',8266),(94,42,'user1','2014.11.11','哈哈，一听开头就想起来以前初中的时候只要有一个同学拍桌子，其他同学也跟着拍，超整齐，鹏鹏啪！鹏鹏啪！',236537),(95,42,'user1','2015.1.26','达到这歌的效果只需一个班级和一群逗比',218699),(96,43,'user1','2016.4.7','我能说这首歌本意上不是写给同性恋者的吗。。。。我查了。。。。这首歌只不过是后来也被解读成给同性恋者的赞歌。。。。人家乐队的成员都说了，他认为这首歌就是给所有人的。。。没有特指好吗 只是后来演绎来的。。。',44201),(97,43,'user1','2015.4.4','这首歌是写给同性恋们的，不是比赛后给冠军的。。',32111),(98,44,'user1','2015.8.20','每次听这首歌都会想到一个手持吸尘器 身穿粉色上衣的短发少妇',9723),(99,44,'user1','2015.10.31','单身久了 ，第一次看mv的时候鼓手女装看得我都心动了',5716),(100,45,'user1','2015.8.12','有时候特别希望自己活在七八十年代的欧美，可以见证好多神一样的传奇歌手的辉煌。君生我未生，我生君已逝。',7712),(101,45,'user1','2015.4.4','皇后永远被无视的贝斯手也参与和声的',4202),(102,46,'user1','2015.1.3','这贝斯弹的只有一个词能形容——得瑟',37545),(103,46,'user1','2015.919','这首歌叫做《我他妈终于听到过贝斯声音了》',35984),(104,47,'user1','2021.1.14','和她分手半年了，她的苹果11我还在分期。',7559),(105,47,'user1','2020.11.16','但这天收到她爸爸的一封信，信里面说土豪已带走她',3103),(106,48,'user1','2017.1.21','对喜欢张学友的朋友，不论男女，我觉得都可以相处',1071),(107,48,'user1','2016.1026','有人问学友为什么不去参加我是歌手，我想说如果有叫我是歌神的节目，他或许可以考虑一下',798),(108,49,'user1','2014.12.1','之前在一个视频上看到千桦亲口说，学友唱了这歌她自己都不敢唱了。。。',24940),(109,49,'user1','2015.1.3','谁还记得，演唱会上的学友在吃的苹果？',13568),(110,50,'user1','2015.7.6','女孩子经常会被男人感动，以为是被爱了。但过段时间后，却忽然发觉，他其实并不爱你……没错，男人能感动你，却并不一定爱你。感动只是想得到你，而爱却是需要付出自己……不要轻易被感动，因为你需要的不是个感动你的人，而是个能和你在一起的人。',73449),(111,50,'user1','2016.3.16','今天在网吧上网，网管放了这首歌。到了副歌地方，竟然整个网吧大合唱。经典就是经典！',64758),(112,51,'user1','2014.10.24','四十岁我们再相遇，你问我什么是风花雪夜，我说 一个成语而已。',91517),(113,51,'user1','2016.1.30','半年的积蓄买了门票一对。。。你tm也知道你演唱会门票死贵啊',84556);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_music`
--

DROP TABLE IF EXISTS `favorite_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_music` (
  `user_name` varchar(60) NOT NULL,
  `mu_id` int NOT NULL,
  PRIMARY KEY (`user_name`,`mu_id`),
  KEY `fm_fk_list_mu_id_idx` (`mu_id`),
  CONSTRAINT `fm_fk_list_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`),
  CONSTRAINT `fm_fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_music`
--

LOCK TABLES `favorite_music` WRITE;
/*!40000 ALTER TABLE `favorite_music` DISABLE KEYS */;
INSERT INTO `favorite_music` VALUES ('user1',8),('user1',9),('user2',9),('user1',10),('user1',11),('user1',12),('user2',12),('user2',18),('user2',20);
/*!40000 ALTER TABLE `favorite_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_mv`
--

DROP TABLE IF EXISTS `favorite_mv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_mv` (
  `user_name` varchar(60) NOT NULL,
  `mv_id` int NOT NULL,
  PRIMARY KEY (`user_name`,`mv_id`),
  KEY `fmv_fk_mv_id_idx` (`mv_id`),
  CONSTRAINT `fmv_fk_mv_id` FOREIGN KEY (`mv_id`) REFERENCES `mv` (`mv_id`),
  CONSTRAINT `fmv_fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
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
  `user_name` varchar(60) NOT NULL,
  `list_name` varchar(60) NOT NULL,
  `img` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`user_name`,`list_name`),
  CONSTRAINT `ls_fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES ('user1','Death Stranding',NULL),('user1','Devil May Cry 5',NULL),('user1','Persona 5',NULL),('user1','Queen',NULL),('user1','周杰伦·精选',NULL),('user1','张学友精选集',NULL),('user1','生草歌单',NULL),('user1','陈奕迅·精选',NULL),('user2','ca',NULL),('user2','casca',NULL),('user2','cascade',NULL);
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `love_comment`
--

DROP TABLE IF EXISTS `love_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `love_comment` (
  `user_name` varchar(60) NOT NULL,
  `com_id` varchar(60) NOT NULL,
  PRIMARY KEY (`user_name`,`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `love_comment`
--

LOCK TABLES `love_comment` WRITE;
/*!40000 ALTER TABLE `love_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `love_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `music` (
  `mu_id` int NOT NULL,
  `mu_name` varchar(60) DEFAULT NULL,
  `singer` varchar(60) DEFAULT NULL,
  `class` varchar(60) DEFAULT NULL,
  `word` varchar(60) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  `img_url` varchar(60) DEFAULT NULL,
  `state` int DEFAULT '1',
  PRIMARY KEY (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,'#あくあ色ぱれっと','湊あくあ',NULL,'/word/湊あくあ  - #あくあ色ぱれっと.lrc','/music/湊あくあ  - #あくあ色ぱれっと.mp3','/images/1.jpg',0),(2,'September','Earth, Wind & Fire',NULL,'/word/Earth, Wind & Fire  - September.lrc','/music/Earth, Wind & Fire  - September.mp3','/images/2.jpg',1),(3,'Say So (Japanese Version)','Rainych',NULL,'/word/Rainych  - Say So (日语).lrc','/music/Rainych  - Say So (日语).mp3','/images/3.jpg',1),(4,'特にない','藤井風',NULL,'/word/藤井风  - 特にない.lrc','/music/藤井风  - 特にない.mp3','/images/4.jpg',1),(5,'たぶん','YOASOBI',NULL,'/word/YOASOBI  - たぶん (大概).lrc','/music/YOASOBI  - たぶん (大概).mp3','/images/5.jpg',1),(6,'Zero Gravity','I Don\'t Like Mondays.',NULL,'/word/I Don\'t Like Mondays.  - Zero Gravity.lrc','/music/I Don\'t Like Mondays.  - Zero Gravity.mp3','/images/6.jpg',1),(7,'Never Gonna Give You Up','Rick Astley',NULL,'/word/Rick Astley  - Never Gonna Give You Up.lrc','/music/Rick Astley  - Never Gonna Give You Up.mp3','/images/7.jpg',1),(8,'One Last Kiss','宇多田光',NULL,'/word/宇多田光  - One Last Kiss.lrc','/music/宇多田光  - One Last Kiss.mp3','/images/8.jpg',1),(9,'閃光','[Alexandros]',NULL,'/word/[Alexandros]  - 閃光.lrc','/music/[Alexandros]  - 閃光.mp3','/images/9.jpg',1),(10,'Devil Trigger','Ali Edwards',NULL,'/word/Ali Edwards  - Devil Trigger.lrc','/music/Ali Edwards  - Devil Trigger.mp3','/images/10.jpg',1),(11,'Bury the Light','Victor Borba',NULL,'/word/Victor Borba  - Bury the Light.lrc','/music/Victor Borba  - Bury the Light.mp3','/images/11.jpg',1),(12,'Don\'t Be So Serious','Low Roar',NULL,'/word/Low Roar  - Don\'t Be So Serious.lrc','/music/Low Roar  - Don\'t Be So Serious.mp3','/images/12.jpg',1),(13,'Bones','Low Roar/Jofridur Akadottir',NULL,'/word/Low Roar _ Jófriður  - Bones.lrc','/music/Low Roar _ Jófriður  - Bones.mp3','/images/13.jpg',1),(14,'BB\'s Theme','Ludvig Forssell/Jenny Plant',NULL,'/word/Ludvig Forssell _ Jenny Plant  - BB\'s Theme.lrc','/music/Ludvig Forssell _ Jenny Plant  - BB\'s Theme.mp3','/images/14.jpg',1),(15,'Wake Up, Get Up, Get Out There','Lyn',NULL,'/word/Lyn  - Wake Up, Get Up, Get Out There.lrc','/music/Lyn  - Wake Up, Get Up, Get Out There.mp3','/images/15.jpg',1),(16,'Last Surprise','Lyn',NULL,'/word/Lyn  - Last Surprise.lrc','/music/Lyn  - Last Surprise.mp3','/images/16.jpg',1),(17,'Life Will Change','Lyn',NULL,'/word/Lyn  - Life Will Change.lrc','/music/Lyn  - Life Will Change.mp3','/images/17.jpg',1),(18,'Rivers In the Desert','Lyn',NULL,'/word/Lyn  - Rivers In the Desert.lrc','/music/Lyn  - Rivers In the Desert.mp3','/images/18.jpg',1),(19,'The Whims of Fate','Lyn',NULL,'/word/Lyn  - The Whims of Fate.lrc','/music/Lyn  - The Whims of Fate.mp3','/images/19.jpg',1),(20,'冬の花','宫本浩次',NULL,'/word/宮本浩次  - 冬の花 (冬之花).lrc','/music/宮本浩次  - 冬の花 (冬之花).mp3','/images/20.jpg',1),(21,'夜明けのうた','宫本浩次',NULL,'/word/宮本浩次  - 夜明けのうた (黎明之歌).lrc','/music/宮本浩次  - 夜明けのうた (黎明之歌).mp3','/images/21.jpg',1),(22,'无条件','陈奕迅',NULL,'/word/陈奕迅  - 无条件.lrc','/music/陈奕迅  - 无条件.mp3','/images/22.jpg',1),(23,'葡萄成熟时','陈奕迅',NULL,'/word/陈奕迅  - 葡萄成熟时.lrc','/music/陈奕迅  - 葡萄成熟时.mp3','/images/23.jpg',1),(24,'苦瓜','陈奕迅',NULL,'/word/陈奕迅  - 苦瓜.lrc','/music/陈奕迅  - 苦瓜.mp3','/images/24.jpg',1),(25,'Shall We Talk','陈奕迅',NULL,'/word/陈奕迅  - Shall We Talk.lrc','/music/陈奕迅  - Shall We Talk.mp3','/images/25.jpg',1),(26,'不要说话','陈奕迅',NULL,'/word/陈奕迅  - 不要说话.lrc','/music/陈奕迅  - 不要说话.mp3','/images/26.jpg',1),(27,'淘汰','陈奕迅',NULL,'/word/陈奕迅  - 淘汰.lrc','/music/陈奕迅  - 淘汰.mp3','/images/27.jpg',1),(28,'人来人往','陈奕迅',NULL,'/word/陈奕迅  - 人来人往.lrc','/music/陈奕迅  - 人来人往.mp3','/images/28.jpg',1),(29,'落花流水','陈奕迅',NULL,'/word/陈奕迅  - 落花流水.lrc','/music/陈奕迅  - 落花流水.mp3','/images/29.jpg',1),(30,'歌·颂','陈奕迅',NULL,'/word/陈奕迅  - 歌·颂.lrc','/music/陈奕迅  - 歌·颂.mp3','/images/30.jpg',1),(31,'一路向北','周杰伦',NULL,'/word/周杰伦  - 一路向北.lrc','/music/周杰伦  - 一路向北.mp3','/images/31.jpg',1),(32,'半岛铁盒','周杰伦',NULL,'/word/周杰伦  - 半岛铁盒.lrc','/music/周杰伦  - 半岛铁盒.mp3','/images/32.jpg',1),(33,'反方向的钟','周杰伦',NULL,'/word/周杰伦  - 反方向的钟.lrc','/music/周杰伦  - 反方向的钟.mp3','/images/33.jpg',1),(34,'搁浅','周杰伦',NULL,'/word/周杰伦  - 搁浅.lrc','/music/周杰伦  - 搁浅.mp3','/images/34.jpg',1),(35,'说了再见','周杰伦',NULL,'/word/周杰伦  - 说了再见.lrc','/music/周杰伦  - 说了再见.mp3','/images/35.jpg',1),(36,'爱在西元前','周杰伦',NULL,'/word/周杰伦  - 爱在西元前.lrc','/music/周杰伦  - 爱在西元前.mp3','/images/36.jpg',1),(37,'以父之名','周杰伦',NULL,'/word/周杰伦  - 以父之名.lrc','/music/周杰伦  - 以父之名.mp3','/images/37.jpg',1),(38,'明明就','周杰伦',NULL,'/word/周杰伦  - 明明就.lrc','/music/周杰伦  - 明明就.mp3','/images/38.jpg',1),(39,'说好不哭','周杰伦',NULL,'/word/周杰伦  - 说好不哭（with 五月天阿信）.lrc','/music/周杰伦  - 说好不哭（with 五月天阿信）.mp3','/images/39.jpg',1),(40,'Bohemian Rhapsody','Queen',NULL,'/word/Queen  - Bohemian Rhapsody (Remastered 2011).lrc','/music/Queen  - Bohemian Rhapsody (Remastered 2011).mp3','/images/40.jpg',1),(41,'Don\'t Stop Me Now','Queen',NULL,'/word/Queen  - Don\'t Stop Me Now.lrc','/music/Queen  - Don\'t Stop Me Now.mp3','/images/41.jpg',1),(42,'We Will Rock You','Queen',NULL,'/word/Queen  - We Will Rock You (Remastered 2011).lrc','/music/Queen  - We Will Rock You (Remastered 2011).mp3','/images/42.jpg',1),(43,'We Are The Champions','Queen',NULL,'/word/Queen  - We Are The Champions (Remastered 2011).lrc','/music/Queen  - We Are The Champions (Remastered 2011).mp3','/images/43.jpg',1),(44,'I Want To Break Free','Queen',NULL,'/word/Queen  - I Want To Break Free (Remastered 2011).lrc','/music/Queen  - I Want To Break Free (Remastered 2011).mp3','/images/44.jpg',1),(45,'Somebody to Love','Queen',NULL,'/word/Queen  - Somebody To Love (Remastered 2011).lrc','/music/Queen  - Somebody To Love (Remastered 2011).mp3','/images/45.jpg',1),(46,'Another One Bites the Dust','Queen',NULL,'/word/Queen  - Another One Bites the Dust.lrc','/music/Queen  - Another One Bites the Dust.mp3','/images/46.jpg',1),(47,'遥远的她','张学友',NULL,'/word/张学友  - 遥远的她.lrc','/music/张学友  - 遥远的她.mp3','/images/47.jpg',1),(48,'蓝雨','张学友',NULL,'/word/张学友  - 蓝雨.lrc','/music/张学友  - 蓝雨.mp3','/images/48.jpg',1),(49,'小城大事','张学友',NULL,'/word/张学友  - 小城大事 (Live).lrc','/music/张学友  - 小城大事 (Live).mp3','/images/49.jpg',1),(50,'如果这都不算爱','张学友',NULL,'/word/张学友  - 如果这都不算爱.lrc','/music/张学友 - 如果这都不算爱.mp3','/images/50.jpg',1),(51,'她来听我的演唱会','张学友',NULL,'/word/张学友  - 她来听我的演唱会.lrc','/music/张学友  - 她来听我的演唱会.mp3','/images/51.jpg',1);
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
  `singer` varchar(60) DEFAULT NULL,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`mv_id`),
  KEY `mv_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `mv_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv`
--

LOCK TABLES `mv` WRITE;
/*!40000 ALTER TABLE `mv` DISABLE KEYS */;
INSERT INTO `mv` VALUES (1,1,'#あくあ色ぱれっと','湊あくあ','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(2,2,'September','Earth, Wind & Fire','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(3,3,'Say So (Japanese Version)','Rainych','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(4,4,'特にない','藤井風','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(5,5,'たぶん','YOASOBI','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(6,6,'Zero Gravity','I Don\'t Like Mondays.','/mv/YOASOBI  - たぶん (大概)'),(7,7,'Never Gonna Give You Up','Rick Astley','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(8,8,'One Last Kiss','宇多田光','/mv/宇多田光  - One Last Kiss'),(9,9,'閃光','[Alexandros]','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(10,10,'Devil Trigger','Ali Edwards','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(11,11,'Bury the Light','Victor Borba','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(12,12,'Don\'t Be So Serious','Low Roar','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(13,13,'Bones','Low Roar/Jofridur Akadottir','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(14,14,'BB\'s Theme','Ludvig Forssell/Jenny Plant','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(15,15,'Wake Up, Get Up, Get Out There','Lyn','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(16,16,'Last Surprise','Lyn','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(17,17,'Life Will Change','Lyn','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(18,18,'Rivers In the Desert','Lyn','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(19,19,'The Whims of Fate','Lyn','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(20,20,'冬の花','宫本浩次','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(21,21,'夜明けのうた','宫本浩次','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(22,22,'无条件','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(23,23,'葡萄成熟时','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(24,24,'苦瓜','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(25,25,'Shall We Talk','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(26,26,'不要说话','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(27,27,'淘汰','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(28,28,'人来人往','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(29,29,'落花流水','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(30,30,'歌·颂','陈奕迅','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(31,31,'一路向北','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(32,32,'半岛铁盒','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(33,33,'反方向的钟','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(34,34,'搁浅','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(35,35,'说了再见','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(36,36,'爱在西元前','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(37,37,'以父之名','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(38,38,'明明就','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(39,39,'说好不哭','周杰伦','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(40,40,'Bohemian Rhapsody','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(41,41,'Don\'t Stop Me Now','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(42,42,'We Will Rock You','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(43,43,'We Are The Champions','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(44,44,'I Want To Break Free','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(45,45,'Somebody to Love','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(46,46,'Another One Bites the Dust','Queen','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(47,47,'遥远的她','张学友','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(48,48,'蓝雨','张学友','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(49,49,'小城大事','张学友','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(50,50,'如果这都不算爱','张学友','/mv/Rick Astley  - Never Gonna Give You Up.mp4'),(51,51,'她来听我的演唱会','张学友','/mv/Rick Astley  - Never Gonna Give You Up.mp4');
/*!40000 ALTER TABLE `mv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_list`
--

DROP TABLE IF EXISTS `song_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_list` (
  `user_name` varchar(60) NOT NULL,
  `list_name` varchar(60) NOT NULL,
  `mu_id` int NOT NULL,
  PRIMARY KEY (`user_name`,`list_name`,`mu_id`),
  KEY `sl_fk_mu_id_idx` (`mu_id`),
  CONSTRAINT `sl_fk_mu_id` FOREIGN KEY (`mu_id`) REFERENCES `music` (`mu_id`),
  CONSTRAINT `sl_fk_user_name` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_list`
--

LOCK TABLES `song_list` WRITE;
/*!40000 ALTER TABLE `song_list` DISABLE KEYS */;
INSERT INTO `song_list` VALUES ('user1','生草歌单',7),('user2','cascade',8),('user1','生草歌单',9),('user2','casca',9),('user2','cascade',9),('user1','Devil May Cry 5',10),('user1','Devil May Cry 5',11),('user1','Death Stranding',12),('user1','Death Stranding',13),('user1','Death Stranding',14),('user1','Persona 5',15),('user1','Persona 5',16),('user1','Persona 5',17),('user1','Persona 5',18),('user1','Persona 5',19),('user1','生草歌单',20),('user1','陈奕迅·精选',22),('user1','陈奕迅·精选',23),('user1','陈奕迅·精选',24),('user1','陈奕迅·精选',25),('user1','陈奕迅·精选',26),('user1','陈奕迅·精选',27),('user1','陈奕迅·精选',28),('user1','陈奕迅·精选',29),('user1','陈奕迅·精选',30),('user1','周杰伦·精选',31),('user1','周杰伦·精选',32),('user1','周杰伦·精选',33),('user1','周杰伦·精选',34),('user1','周杰伦·精选',35),('user1','周杰伦·精选',36),('user1','周杰伦·精选',37),('user1','周杰伦·精选',38),('user1','周杰伦·精选',39),('user1','Queen',40),('user1','Queen',41),('user1','Queen',42),('user1','Queen',43),('user1','Queen',44),('user1','Queen',45),('user1','Queen',46),('user1','张学友精选集',47),('user1','张学友精选集',48),('user1','张学友精选集',49),('user1','张学友精选集',50),('user1','张学友精选集',51);
/*!40000 ALTER TABLE `song_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_name` varchar(60) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `telephone` varchar(60) DEFAULT NULL,
  `gender` varchar(60) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user1','12345678',NULL,NULL,NULL),('user2','123456789',NULL,NULL,NULL),('user3','12345678',NULL,NULL,NULL);
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

-- Dump completed on 2022-05-26 19:57:52
