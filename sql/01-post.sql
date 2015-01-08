-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2014-12-07 09:22:07','2014-12-07 09:22:07','Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!','Hello world!','','publish','open','open','','hello-world','','','2014-12-07 09:22:07','2014-12-07 09:22:07','',0,'http://wordpress.local/?p=1',0,'post','',1),(2,1,'2014-12-07 09:22:07','2014-12-07 09:22:07','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://wordpress.local/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','open','open','','sample-page','','','2014-12-07 09:22:07','2014-12-07 09:22:07','',0,'http://wordpress.local/?page_id=2',0,'page','',0),(4,1,'2014-12-14 17:37:39','2014-12-14 09:37:39','An action-packed one-week course where participants get a feel of what it is like to be on a Scrum team. Comprises 30% lecture, 70% exercises, we go through Scrum practices as well as effective software engineering techniques useful for those aspiring for product development agility and competency. This structure is also as close to agile coaching as you can get within a one-week training.','Odd-e In Action: Certified Scrum Developer Course','','publish','open','open','','odd-e-in-action-certified-scrum-developer-course','','','2014-12-14 17:37:39','2014-12-14 09:37:39','',0,'http://wordpress.local/?p=4',0,'post','',0),(5,1,'2014-12-14 17:37:39','2014-12-14 09:37:39','An action-packed one-week course where participants get a feel of what it is like to be on a Scrum team. Comprises 30% lecture, 70% exercises, we go through Scrum practices as well as effective software engineering techniques useful for those aspiring for product development agility and competency. This structure is also as close to agile coaching as you can get within a one-week training.','Odd-e In Action: Certified Scrum Developer Course','','inherit','open','open','','4-revision-v1','','','2014-12-14 17:37:39','2014-12-14 09:37:39','',4,'http://wordpress.local/archives/5',0,'revision','',0),(6,1,'2014-12-14 17:40:54','2014-12-14 09:40:54','Agile Coaching means that an experienced Agile Coach will work closely together with an organization to improve the organizationals product development agility. Agility is a broad term used for the flexibility in product development-- the ability to respond to changes. This flexibility is achieved by shortening feedback loops and focus on improved quality. This faster feedback cycle might also leads to other benefits such as higher productivity.\r\n\r\nThere are three broad categories of agile coaching:\r\n\r\n<strong>Organizational coaching</strong>\r\n\r\nThis is where a coach works with multiple teams and the management to improve the organization and it’s structure in order to increase its agility.\r\n\r\n<strong>Team coaching (or Scrum coaching)</strong>\r\n\r\nThis is where a coach works with one or a few teams to improve their team-working and Scrum practices. It is common for a coach to take on the ScrumMaster role.\r\n\r\n<strong>Technical practices coaching</strong>\r\n\r\nThis is where a coach works with (or on) a team on their actual codebase in order to improve the technical practices and adopt agile development techniques such as simple design, refactoring, unit testing, test-driven development, acceptance test-driven development.\r\n\r\nOdd-e provides coaching for all types of agile coaching (depending on the coach)','Odd-e Coaching','','publish','open','open','','odd-e-coaching','','','2014-12-14 17:40:54','2014-12-14 09:40:54','',0,'http://wordpress.local/?p=6',0,'post','',0),(7,1,'2014-12-14 17:40:54','2014-12-14 09:40:54','Agile Coaching means that an experienced Agile Coach will work closely together with an organization to improve the organizationals product development agility. Agility is a broad term used for the flexibility in product development-- the ability to respond to changes. This flexibility is achieved by shortening feedback loops and focus on improved quality. This faster feedback cycle might also leads to other benefits such as higher productivity.\r\n\r\nThere are three broad categories of agile coaching:\r\n\r\n<strong>Organizational coaching</strong>\r\n\r\nThis is where a coach works with multiple teams and the management to improve the organization and it’s structure in order to increase its agility.\r\n\r\n<strong>Team coaching (or Scrum coaching)</strong>\r\n\r\nThis is where a coach works with one or a few teams to improve their team-working and Scrum practices. It is common for a coach to take on the ScrumMaster role.\r\n\r\n<strong>Technical practices coaching</strong>\r\n\r\nThis is where a coach works with (or on) a team on their actual codebase in order to improve the technical practices and adopt agile development techniques such as simple design, refactoring, unit testing, test-driven development, acceptance test-driven development.\r\n\r\nOdd-e provides coaching for all types of agile coaching (depending on the coach)','Odd-e Coaching','','inherit','open','open','','6-revision-v1','','','2014-12-14 17:40:54','2014-12-14 09:40:54','',6,'http://wordpress.local/archives/7',0,'revision','',0),(8,1,'2014-12-14 17:46:28','2014-12-14 09:46:28','Odd-e is a company originally founded by Bas Vodde in 1999 in Amsterdam, Holland. At that time we provided help in software development projects. In 2001, Bas moved to China. Since 2005 Odd-e (now located in Singapore) provides training and coaching related to product development and agile development, lean development, quality management and Scrum.','About Odd-e','','publish','open','open','','about-odd-e','','','2014-12-14 17:46:28','2014-12-14 09:46:28','',0,'http://wordpress.local/?p=8',0,'post','',0),(9,1,'2014-12-14 17:46:28','2014-12-14 09:46:28','Odd-e is a company originally founded by Bas Vodde in 1999 in Amsterdam, Holland. At that time we provided help in software development projects. In 2001, Bas moved to China. Since 2005 Odd-e (now located in Singapore) provides training and coaching related to product development and agile development, lean development, quality management and Scrum.','About Odd-e','','inherit','open','open','','8-revision-v1','','','2014-12-14 17:46:28','2014-12-14 09:46:28','',8,'http://wordpress.local/8-revision-v1/',0,'revision','',0),(10,1,'2014-12-14 17:50:31','2014-12-14 09:50:31','By the end of the course you will be able to:\r\n<ul>\r\n	<li>Understand the importance of engineering practices and how they support business agility</li>\r\n	<li>Apply acceptance test driven development for requirement clarification and elaboration</li>\r\n	<li>Write programs in a test driven manner and sustain the practice of test driven development with common patterns and techniques</li>\r\n	<li>Identify common code smells and ways of refactoring</li>\r\n	<li>Understand basic design principles</li>\r\n	<li>Understand the problem of legacy code and common ways to break dependencies</li>\r\n	<li>Help applying ideas at work</li>\r\n</ul>','Learning Objectives','','publish','open','open','','learning-objectives','','','2014-12-14 17:50:31','2014-12-14 09:50:31','',0,'http://wordpress.local/?p=10',0,'post','',0),(11,1,'2014-12-14 17:50:31','2014-12-14 09:50:31','By the end of the course you will be able to:\r\n<ul>\r\n	<li>Understand the importance of engineering practices and how they support business agility</li>\r\n	<li>Apply acceptance test driven development for requirement clarification and elaboration</li>\r\n	<li>Write programs in a test driven manner and sustain the practice of test driven development with common patterns and techniques</li>\r\n	<li>Identify common code smells and ways of refactoring</li>\r\n	<li>Understand basic design principles</li>\r\n	<li>Understand the problem of legacy code and common ways to break dependencies</li>\r\n	<li>Help applying ideas at work</li>\r\n</ul>','Learning Objectives','','inherit','open','open','','10-revision-v1','','','2014-12-14 17:50:31','2014-12-14 09:50:31','',10,'http://wordpress.local/10-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-14 17:54:22
