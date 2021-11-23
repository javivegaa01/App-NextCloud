-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-0+deb11u1

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
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('Admin','{\"displayname\":{\"value\":\"Admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'Admin','displayname','Admin'),(2,'Admin','address',''),(3,'Admin','website',''),(4,'Admin','email',''),(5,'Admin','phone',''),(6,'Admin','twitter','');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `subjectparams` longtext COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `messageparams` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `file` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1637664415,30,'file_created','Admin','Admin','files','created_self','[{\"58\":\"\\/Talk\"}]','','[]','/Talk','http://cloud.javiervega.org/apps/files/?dir=/','files',58);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_affecteduser` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `amq_appid` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `amq_subject` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amq_subjectparams` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `object_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('accessibility','enabled','yes'),('accessibility','installed_version','1.8.0'),('accessibility','types',''),('activity','enabled','yes'),('activity','installed_version','2.15.0'),('activity','types','filesystem'),('backgroundjob','lastjob','2'),('bruteforcesettings','enabled','yes'),('bruteforcesettings','installed_version','2.2.0'),('bruteforcesettings','types',''),('calendar','enabled','yes'),('calendar','installed_version','2.3.4'),('calendar','types',''),('circles','enabled','yes'),('circles','installed_version','22.1.1'),('circles','loopback_tmp_scheme','http'),('circles','types','filesystem,dav'),('cloud_federation_api','enabled','yes'),('cloud_federation_api','installed_version','1.5.0'),('cloud_federation_api','types','filesystem'),('comments','enabled','yes'),('comments','installed_version','1.12.0'),('comments','types','logging'),('contacts','enabled','yes'),('contacts','installed_version','4.0.6'),('contacts','types','dav'),('contactsinteraction','enabled','yes'),('contactsinteraction','installed_version','1.3.0'),('contactsinteraction','types','dav'),('core','installed.bundles','[\"CoreBundle\"]'),('core','installedat','1637664352.2963'),('core','lastcron','1637664420'),('core','lastupdatedat','1637664352.3003'),('core','oc.integritycheck.checker','[]'),('core','public_files','files_sharing/public.php'),('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),('core','theming.variables','b92d206521717ac032f8aa58d3c7ff2f'),('core','vendor','nextcloud'),('dashboard','enabled','yes'),('dashboard','installed_version','7.2.0'),('dashboard','types',''),('dav','enabled','yes'),('dav','installed_version','1.19.0'),('dav','types','filesystem'),('federatedfilesharing','enabled','yes'),('federatedfilesharing','installed_version','1.12.0'),('federatedfilesharing','types',''),('federation','enabled','yes'),('federation','installed_version','1.12.0'),('federation','types','authentication'),('files','enabled','yes'),('files','installed_version','1.17.0'),('files','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','2.3.0'),('files_pdfviewer','types',''),('files_rightclick','enabled','yes'),('files_rightclick','installed_version','1.1.0'),('files_rightclick','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','1.14.0'),('files_sharing','types','filesystem'),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','1.12.0'),('files_trashbin','types','filesystem,dav'),('files_versions','enabled','yes'),('files_versions','installed_version','1.15.0'),('files_versions','types','filesystem,dav'),('files_videoplayer','enabled','yes'),('files_videoplayer','installed_version','1.11.0'),('files_videoplayer','types',''),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','2.11.0'),('firstrunwizard','types','logging'),('logreader','enabled','yes'),('logreader','installed_version','2.7.0'),('logreader','types',''),('lookup_server_connector','enabled','yes'),('lookup_server_connector','installed_version','1.10.0'),('lookup_server_connector','types','authentication'),('mail','enabled','yes'),('mail','installed_version','1.10.5'),('mail','types',''),('nextcloud_announcements','enabled','yes'),('nextcloud_announcements','installed_version','1.11.0'),('nextcloud_announcements','types','logging'),('notifications','enabled','yes'),('notifications','installed_version','2.10.1'),('notifications','types','logging'),('oauth2','enabled','yes'),('oauth2','installed_version','1.10.0'),('oauth2','types','authentication'),('password_policy','enabled','yes'),('password_policy','installed_version','1.12.0'),('password_policy','types','authentication'),('photos','enabled','yes'),('photos','installed_version','1.4.0'),('photos','types',''),('privacy','enabled','yes'),('privacy','installed_version','1.6.0'),('privacy','types',''),('provisioning_api','enabled','yes'),('provisioning_api','installed_version','1.12.0'),('provisioning_api','types','prevent_group_restriction'),('recommendations','enabled','yes'),('recommendations','installed_version','1.1.0'),('recommendations','types',''),('richdocuments','enabled','yes'),('richdocuments','installed_version','4.2.3'),('richdocuments','types','prevent_group_restriction'),('serverinfo','enabled','yes'),('serverinfo','installed_version','1.12.0'),('serverinfo','types',''),('settings','enabled','yes'),('settings','installed_version','1.4.0'),('settings','types',''),('sharebymail','enabled','yes'),('sharebymail','installed_version','1.12.0'),('sharebymail','types','filesystem'),('spreed','enabled','yes'),('spreed','installed_version','12.1.2'),('spreed','types','dav,prevent_group_restriction'),('support','enabled','yes'),('support','installed_version','1.5.0'),('support','types','session'),('survey_client','enabled','yes'),('survey_client','installed_version','1.10.0'),('survey_client','types',''),('systemtags','enabled','yes'),('systemtags','installed_version','1.12.0'),('systemtags','types','logging'),('text','enabled','yes'),('text','installed_version','3.3.0'),('text','types','dav'),('theming','enabled','yes'),('theming','installed_version','1.13.0'),('theming','types','logging'),('twofactor_backupcodes','enabled','yes'),('twofactor_backupcodes','installed_version','1.11.0'),('twofactor_backupcodes','types',''),('updatenotification','enabled','yes'),('updatenotification','installed_version','1.12.0'),('updatenotification','types',''),('user_status','enabled','yes'),('user_status','installed_version','1.2.0'),('user_status','types',''),('viewer','enabled','yes'),('viewer','installed_version','1.6.0'),('viewer','types',''),('weather_status','enabled','yes'),('weather_status','installed_version','1.2.0'),('weather_status','types',''),('workflowengine','enabled','yes'),('workflowengine','installed_version','2.4.0'),('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `login_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `password` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `public_key` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'Admin','Admin','byTNRhX6YdbpzmKlb+TAZvL1h++DAtQL/kQ0WhWBapIqyp4cfjBGpnklrrjBc7BtdMmVBxUdA+z4TRaEJbUowGhAa1PtjeQwl2BkwPz4hoZW6aoPVMRJhzqPnD2Cd5TV8knofFPjlADiB1+JW5fePRLEtfS+DXyIq9UO7E05zIbm4l4VL20qYaSPEY/tZVAi3eH1cTafmduw69jlHIji2oJu4B4+ov00VcCJofQqcYVtsUcPtCciYA88WgHfznHQadLA6+fyFQiByEi5JMOYxPPMdoZ25krC9VovpGh4O6uJuQ5L18EItlvoDQ/h+tp6Wj/zdwJ3rylZN6hpPc1OMQ==','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36','157cdb2da681ed9f007a86d10c0945ea1106281b381bb27b2bbf4f934eb9831b8a4051000acc3f0407f295df2df3be8cace6ce168f21d87ee71e4dcca9b5ab95',0,0,1637665710,1637665709,NULL,NULL,'20395b329997eedf7a3dbcaea4b48e4e98bfc6e6c85d65288eee921ae5a907abcada2eb12f4a16ce8ca9cb94d1b2873c709a9e0841f88fe798eb49a5562b5e738e36cfdc91f9bad6ec82c41670408538aa97471eb9a310239653b558c51a13b6ca40a44779c8c86a034698d06b7acf4b896dca367c86718ca3bdbfb93dac497c341717c7309421ce598f6ae0b579092381b758783c46c26b87db055aa2a1f4768087ab282e388711c6d27e89b73ee45ee8ea1d30805d4612de40ce3a1a0b75418c0fa17e5e2a48e50a68ff808ff4678234dc582580a8a347bac49810406f909dbd56b71c2f48dcba18969a83f84f18f6ca12f76e8dc54b26676da6eb9128722752a32b45de63f4fdcc5edaba154185d16a6de5f9519b45ecb64baaf90189477627d1967da1b1576acf09cc4b411ba1ce97665a54a0441891893bdc41e9c462fdc455e849f222813704cefed160f66a849891a9c8b0cbabe29bf1459fb0e7ee68df095d5165b60ee68104ff981d3474d5ac244ae4dc9d23ed27b8af8253c853c4565411edc947ed990474a2850f3105c1fdf0489dafb912b11773d81024d87051babdcfb1f78d82a30df42f292347b7b8bce42b37f4821fed5a67ff5495eb74b1034b53cc5717dfa61bd352a1cd45802b1e47d8010507b2871a320c66ef83cdbe0f167b55ca15a58b2f918980893838d828251e693cdf35f82612f200723a06789e6556ec02b1576f7f6d058bcc22b6bf33a54f9ee0d18457df890db12d281bed0118a6ecddf2df9bc29c204f9155e164fb8af45986b62a544dbf4e0048b0208b06e215aed443503e79979ece14596a2c97db51b7a23a4c033459fdba4635b1c62f24d7addbcf5d69f5467ec837871126f232c5b4a790fa5fce3f0b71fd89c23b89e5b71f0981b06f7e9fb07ca71bb20dac0750a676369eb39cd30079754d94da93503a113db9433ff297bc3d7cd319ab070f46dc67f3bbfd8da3298f4c461e1098e807fe7d37a177fab905a20d85cd2673715380df98b876f323b5d823c286de7b2473114e53ef74efbac204c1d3f2059e207e848723adf64441a3ff7cea12357e0b5cec5700b38ddc2717ea593e3ad48b7c82993895703122f053a0e91a1c51374f352430ffe75af3872a8e54f929a807504bc89fd7fa2ab77aa6c52c0824737a12cf47574bf711bcadcc8c8ab61a7a2a9712499841c027203d0000f37e1a508834c59d72abc91a131203b9d0da9d84e701a8f836db88d1e763709f460728e4d88c093899ef0b6f0207ff64a9e631c65336651409c3a9e73c92bcb60cd648028a1c7d455f7f5b5395107f99354c643d75edbcc114ab46364bf2ed75937e22d63a565c0367be295719cfa0ef96a4956cab7546553cce6300b3f36781ccb2dbc1177b18b0e4de4521f55f99546c1d524959bb58546710b9eeed7280513e345a4ea1966b9fb609d2f2f1eb00627cb855d35588b0554166cbdaf0f9b80a86aba35c545e8121d136d80d349646061b386e52307933f1ae71f027c264efc3c5703374310de89a3dbb4e7fd4b00ff683af28e291cf4aca08f28a21f3c1fa1f5f183d459c27e4b8d93faa32eb9e14408a7ee567aa5629a74fb61fbcf9a38b454cb8eef021f8327c4349f2a1e268b42f696e8beaacb401018c9614da8e9b14e6b3bb48b9c74e6f8744f3bcab905071d8d212e368b9ba475fc33ba2f6257615ab5e545cb2818ca705267f6d7d05e2c1f14f93572ee33a78294916d3bd898d3c9f87b0049756a5dbd36fbca26c3e1f8f3e8cd10770d5db77e90495e69f62f34e0b3d0f93bcb338430bf39ccce49602798c0203c378596f3ef75ab421121099636ae9c01a93d5f0689be50e6cbf98461492ce108e255611449f1fd102a908dfa00183ac50ee2031c1bca9fb8764a558c5ebde41f94c5f5f2f5636f1e11fd319411022d16e1cbb4fe8ae79f017753471b62df70ce5a6ef851d6018f32e79efe4aa3fa65aa5dbec2ef46a99b84732a0c2b44a89a224e6bea0bf1350d0555259b93920d6b043d10ae9004acfe3e72ed7333bf6f81521b725dcca53e625e76530584e5fe61211d750451d267a29334c84bb5c216ede11f8799d69f8eb0a2d7035c41891c926da0a6b4a2b5b7d9f53f8b01b6fffccf3217a0399236b74278f1862386451a36f2b7004928d8062d41c154f08cbe7fc962facb4c9d67f509cbcf299aec16a4ef4cdea94613d8956e1a569c6ace854acc0e022f88c3e53ce12b3942dd1618cca93715b8cbf96206b9a52d5995e5e64165313477d2c2ef96d25ab2a453608194da45d48db27a6d07151ac0f2d7527d7b7778b135a65dade4ae3272b721f2f10570c2be4dd3957932df538cce9a638d928ac4b38f1537a895beb824c31c5df1dd07d6defce4e34a29b782cd543e831e8388ffcde|9a6cd61117d1736e08bdbc1555618a6f|3ac20acaae1b742f721554cf4ce3cbc7709a143ce5b796b0c00216b8c4e94a3d3230c0254500ddf983b8ade24ffed4d36fe41dbbdfe4f0dd602e8a20619118e1|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqiuoGLAi1B2yEbAzPg08\ns52dBrDJU/4s9Z+RYw37dpr2wFvweILbMDFmKqZt9/GIpBldi6B22CziG2ACGAvl\nTxFGffs0H12PkOcN7MAvA/R16aor6eAARKWhlb83gbTRbO5TbUuQBECYtpECDh1Z\nOpvDFuJmwZe9XCebY+MVn1U+zMqhbZXPU16oDbvghDGQuPW29/ghknjAsMAqmZZN\nGw8Ul/LilzHz0qRHfj3+AzNY0xF+2SHfj3gimKkc09BsMNegpXb7VuhepkEsWCpf\nJB01FatReKhoN2ATI+FsurC1VlhgfwPc3c00I57Wv/wdhHeSoHgMD0lLltS63xg6\nUQIDAQAB\n-----END PUBLIC KEY-----\n',2,0);
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `metadata` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrenceid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `attendee` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `organizer` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `alarm_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `group_restrictions` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parameter` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `timezone` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `components` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `refreshrate` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abid` (`addressbookid`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(127) COLLATE utf8mb4_bin DEFAULT '',
  `sanitized_name` varchar(127) COLLATE utf8mb4_bin DEFAULT '',
  `instance` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','user:Admin:lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','Admin','','',1,1,'[]','','2021-11-23 10:46:08',0,''),(2,'Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','app:circles:Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','Circles','','',8193,10001,'[]','','2021-11-23 10:46:08',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) COLLATE utf8mb4_bin DEFAULT NULL,
  `event` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `result` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `instance` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  UNIQUE KEY `UNIQ_1C1814105F37A13B4230B1DE` (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `member_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `invited_by` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cached_name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `contact_meta` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','circles',10000,'',NULL,9,'Member','[]','Circles','2021-11-23 10:46:08','',NULL,'2021-11-23 10:46:08'),(2,'lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','Admin',1,'','Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai',9,'Member','[]','Admin','2021-11-23 10:46:08','',NULL,'2021-11-23 10:46:08');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `inheritance_last` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `UNIQ_8FC816EAE7C1D92B70EE2FF6` (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai',9,'Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai','Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai',1,'[\"Tll4O54VFWCQpJMN1MRvJ6IHdVYHtai\"]'),('lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','lwj6AyLUHPLiokbAj8q6jONGk4vwsKG',9,'lwj6AyLUHPLiokbAj8q6jONGk4vwsKG','lwj6AyLUHPLiokbAj8q6jONGk4vwsKG',1,'[\"lwj6AyLUHPLiokbAj8q6jONGk4vwsKG\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(63) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `mountpoint_hash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `mountpoint_hash` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) COLLATE utf8mb4_bin NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `instance` varchar(127) COLLATE utf8mb4_bin DEFAULT NULL,
  `href` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `item` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `instance` varchar(127) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `single_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `member_id` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(31) COLLATE utf8mb4_bin DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `resource_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `resource_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `actor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `verb` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `reference_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
INSERT INTO `oc_comments` VALUES (1,0,0,0,'users','Admin','{\"message\":\"conversation_created\",\"parameters\":[]}','system','2021-11-23 10:46:59',NULL,'chat','1',NULL),(2,0,0,0,'guests','changelog','¡Bienvenido a Nextcloud Talk!\nEn esta conversación te informaremos de las nuevas características disponibles en Nextcloud Talk.','comment','2021-11-23 10:46:59',NULL,'chat','1',NULL),(3,0,0,0,'guests','changelog','Nuevo en Talk 6','comment','2021-11-23 10:46:59',NULL,'chat','1',NULL),(4,0,0,0,'guests','changelog','Se puede usar Microsoft Edge y Safari para participar en llamadas de audio y de vídeo','comment','2021-11-23 10:46:59',NULL,'chat','1',NULL),(5,0,0,0,'guests','changelog','* Las conversaciones individuales ahora son persistentes y ya no se pueden convertirse en conversaciones de grupo por accidente. Además, cuando uno de los participantes abandone la conversación, esta ya no se borrará automáticamente. Solo si ambos participantes se van, la conversación se borra del servidor','comment','2021-11-23 10:46:59',NULL,'chat','1',NULL),(6,0,0,0,'guests','changelog','- Ahora puedes enviar una notificación a todos los participantes escribiendo \"@all\" en el chat','comment','2021-11-23 10:46:59',NULL,'chat','1',NULL),(7,0,0,0,'guests','changelog','- Con la tecla \"flecha hacia arriba\" puedes volver a enviar el último mensaje','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(8,0,0,0,'guests','changelog','- Ahora, Talk dispone de comandos. Envia \"/help\" como un mensaje de chat para comprobar si tu administrador ha configurado alguno','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(9,0,0,0,'guests','changelog','- Con los proyectos, puedes crear enlaces rápidos entre conversaciones, archivos y otros objetos','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(10,0,0,0,'guests','changelog','Nuevo en Talk 7','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(11,0,0,0,'guests','changelog','- Ahora puedes mencionar a los invitados en la conversación','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(12,0,0,0,'guests','changelog','- Ahora, las conversaciones pueden tener una sala de espera. Esto permite a los moderadores unirse al chat y llamar inmediatamente para preparar la reunión, mientras que los usuarios y los invitados tienen que esperar','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(13,0,0,0,'guests','changelog','Nuevo en Talk 8','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(14,0,0,0,'guests','changelog','- Ahora puedes responder directamente a los mensajes, dando a los usuarios más contexto sobre el tema de tu mensaje','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(15,0,0,0,'guests','changelog','- La búsqueda por conversaciones y participantes también filtrará tus conversaciones existentes, haciendo mucho más fácil encontrar conversaciones previas','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(16,0,0,0,'guests','changelog','- Puedes añadir grupos personalizados de usuarios a las conversaciones cuando la app de Círculos está instalada','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(17,0,0,0,'guests','changelog','Nuevo en Talk 9','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(18,0,0,0,'guests','changelog','- Una nueva cuadrícula y vista de llamadas.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(19,0,0,0,'guests','changelog','- Ya puedes subir y arrastrar archivos desde tu dispositivo al chat.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(20,0,0,0,'guests','changelog','- Los archivos compartidos se abrirán ahora dentro del chat con el visor que corresponda.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(21,0,0,0,'guests','changelog','Nuevo en Talk 10','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(22,0,0,0,'guests','changelog','- Ahora puedes buscar chats y mensajes en la búsqueda unificada de la barra superior.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(23,0,0,0,'guests','changelog','- Dales sabor a tus mensajes con emojis desde el selector.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(24,0,0,0,'guests','changelog','- Ahora puedes cambiar la cámara y el micrófono mientras estás en una llamada.','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(25,0,0,0,'guests','changelog','Nuevo en Talk 11','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(26,0,0,0,'guests','changelog','- De un cierto contexto a la conversación con una descripción y ábrela para que los usuarios registrados puedan encontrarla y unirse ellos mismos','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(27,0,0,0,'guests','changelog','- Ver un estado de lectura y enviar nuevamente los mensajes fallidos ','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(28,0,0,0,'guests','changelog','- Levante la mano en una llamada con la tecla R','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(29,0,0,0,'guests','changelog','Nuevo en Talk 12','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(30,0,0,0,'guests','changelog','- Únase a la misma conversación y llamada desde varios dispositivos','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(31,0,0,0,'guests','changelog','- Envíe mensajes de voz, comparta su ubicación o sus datos de contacto','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL),(32,0,0,0,'guests','changelog','- Añada grupos a una conversación y los nuevos miembros del grupo se añadirán automáticamente como participantes','comment','2021-11-23 10:47:00',NULL,'chat','1',NULL);
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `proxy_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/51cce57c3eda9100ebf192399fe34bab',1637668015),(2,0,'files/00d303f083a0e12e22aeedf18cfea27a',1637668021),(3,0,'files/b9fe4063a040040f7b20876de8214d16',1637668021),(4,0,'files/8d06b96c2b41d68014117acac80aeb2f',1637668017),(5,0,'files/63517126ef72d2b4bb829c3082ffa962',1637668017),(6,0,'files/ec055908a6a17c239e1e53e146bae4fe',1637668020),(7,0,'files/7b29e38688dcd96577b5c6529b434726',1637668020),(8,0,'files/c95f9442070e7e95831f1d2bd16ad0e7',1637668020),(9,0,'files/65907d1b2db021c8faf1e794d141a3cd',1637668020),(10,0,'files/9bdaca4a4906dbdcf33cd9f90ff8aa13',1637668020),(11,0,'files/1c481427abce476e45b456f32ed1aa73',1637668020),(12,0,'files/8f28148588448a33a51838e7011bd3eb',1637668020),(13,0,'files/6ec796485943c53ed3b106f253cce30d',1637668020),(16,0,'files/700e3240a59ee4d85798f19943972f5f',1637668021),(17,0,'files/73678060536b66677b93b53d230c5c04',1637668021),(18,0,'files/5cd195e136cc254bb91fc565b10629c2',1637668021),(19,0,'files/e18c99cc8cad97f7d8cc3231dda9bea9',1637668021),(20,0,'files/1625239c72edb41d3b7f81634ff8fda8',1637668021),(21,0,'files/fa4687e0b5cc45fde538be5f9a9da252',1637668021),(22,0,'files/d541470e72eed1d0f303bf1f7bb9b64b',1637668021),(23,0,'files/5dfa6a22c697637e05a99c6685de7654',1637668021),(24,0,'files/494bcd5d7b56bfb951725309ca4c2168',1637668021),(28,0,'files/a645e0a0053bfbc828767ad13124e073',1637668021),(29,0,'files/ac5c4e6f515a31ab641e5410b90aeb6a',1637668021),(30,0,'files/4765a1540aa24e0499e375ffb6b5ce37',1637668021),(31,0,'files/fa5be399d3ed3178ad0d84c621deb6c1',1637668021),(32,0,'files/3a4017b8ea64e8796427d6dc621f9c90',1637668021),(33,0,'files/a76a248a8ac2d5f30ed272501f05eb4b',1637668021),(34,0,'files/fc5f329ba5c76555a83f80f3b57dc7b6',1637668021),(35,0,'files/b037d9ca098a0160ea3f2f9c8073da6a',1637668021),(38,0,'files/aa9e939a4c054fcdcc9c2b0cba718cd2',1637668021),(39,0,'files/eb166faedfc32c4d96ce5832b4c4ebf7',1637668021),(40,0,'files/917b1046bfe6c7b79d08375ce47d4090',1637668021),(41,0,'files/c6cdf411464e235f5e232f41218b5634',1637668021),(42,0,'files/487e3d4aaefc6a042d043125b3ae1849',1637668021),(43,0,'files/853b5983fe3766abfa9aa505fe018f79',1637668021),(44,0,'files/8710b02edb454d8eec407f6c5956a783',1637668021),(45,0,'files/1624b7a0f907b2f90f5eb2e4db018df1',1637668021),(46,0,'files/575bcab90d96151af1688839416284e1',1637668021);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `path_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,-1,1637664358,1637664358,0,0,'619cc666c95d1',23,''),(2,1,'appdata_oc9udbsgg2jg','d1756c7eb6156be88e151f8fe60e9ddf',1,'appdata_oc9udbsgg2jg',2,1,0,1637664420,1637664420,0,0,'619cc666c93ac',31,''),(3,1,'appdata_oc9udbsgg2jg/appstore','de5b2d6bd69bcdc9180a989808ff2fa6',2,'appstore',2,1,0,1637664359,1637664359,0,0,'619cc666d06d3',31,''),(4,1,'appdata_oc9udbsgg2jg/appstore/apps.json','a01e782b9bd8d07cd584ef9051667c00',3,'apps.json',4,3,1955066,1637664359,1637664359,0,0,'a63d8a7ff752aded6bde7a0095d87341',27,''),(5,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,22868396,1637664415,1637664361,0,0,'619cc69fc76d5',23,''),(6,2,'files','45b963397aa40d4a0063e0d85e4fe7a1',5,'files',2,1,22868396,1637664415,1637664415,0,0,'619cc69fc76d5',31,''),(7,2,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',6,'Nextcloud Manual.pdf',5,3,11639371,1637664361,1637664361,0,0,'86529839c2cd1a8929c49f06a59c30d5',27,''),(8,2,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',6,'Nextcloud.png',7,6,50598,1637664361,1637664361,0,0,'3f3cf7d58c7fb482c735dd059761344f',27,''),(9,2,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',6,'Photos',2,1,5656463,1637664361,1637664361,0,0,'619cc669e457e',31,''),(10,2,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',9,'Gorilla.jpg',8,6,474653,1637664361,1637664361,0,0,'af833467f76493f38e20af21e37a9e86',27,''),(11,2,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',9,'Library.jpg',8,6,2170375,1637664361,1637664361,0,0,'33d060762525722f4beb75a2fee42f16',27,''),(12,2,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',9,'Toucan.jpg',8,6,167989,1637664361,1637664361,0,0,'7775c3e7cb7ec311aee4606b935d885d',27,''),(13,2,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',9,'Vineyard.jpg',8,6,427030,1637664361,1637664361,0,0,'d22efbcd3fd63c462a1763217d097ae5',27,''),(14,2,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',9,'Frog.jpg',8,6,457744,1637664361,1637664361,0,0,'ef38833cefbc935bad853964a5e77896',27,''),(15,2,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',9,'Birdie.jpg',8,6,593508,1637664361,1637664361,0,0,'a49e2d9386e7e775a94fb15e165f7825',27,''),(16,2,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',9,'Steps.jpg',8,6,567689,1637664361,1637664361,0,0,'7809b9d465c1cff0dd47e23f615b329f',27,''),(17,2,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',9,'Readme.md',10,9,150,1637664361,1637664361,0,0,'0a5566a95cc93ff93e918ed05f8a287a',27,''),(18,2,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',9,'Nextcloud community.jpg',8,6,797325,1637664361,1637664361,0,0,'e9840157a4229a105d0e5880a3d48202',27,''),(19,2,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',6,'Nextcloud intro.mp4',12,11,3963036,1637664361,1637664361,0,0,'b58ae0d5c943d296de4cc5c746e8912e',27,''),(20,2,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',6,'Reasons to use Nextcloud.pdf',5,3,976625,1637664361,1637664361,0,0,'b638d43e9adbee1fc72c7905fc637b85',27,''),(21,2,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',6,'Documents',2,1,400389,1637664362,1637664362,0,0,'619cc66a13e09',31,''),(22,2,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',21,'Nextcloud flyer.pdf',5,3,374008,1637664362,1637664362,0,0,'dcf764e6a656e8c3f567a32c49f0eedc',27,''),(23,2,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',21,'Welcome to Nextcloud Hub.docx',13,3,25150,1637664362,1637664362,0,0,'7e76d443233e2354526f26ad314a937f',27,''),(24,2,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',21,'Example.md',10,9,1095,1637664362,1637664362,0,0,'cc7f45ca9ec36010a5171fd881f4e0d6',27,''),(25,2,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',21,'Readme.md',10,9,136,1637664362,1637664362,0,0,'c6e1b73c92aa2ad49771f5c52074b53d',27,''),(26,2,'files/Plantillas','2b9304b95ddfb740f80ba568c427cfd5',6,'Plantillas',2,1,181914,1637664362,1637664362,0,0,'619cc66a3fa56',31,''),(27,2,'files/Plantillas/Invoice.odt','5de4159bedff5f00b7d8fef2f606b0f4',26,'Invoice.odt',14,3,17276,1637664362,1637664362,0,0,'ca4d089edc8887d55d6ab197bed98ec2',27,''),(28,2,'files/Plantillas/Product plan.md','9539d6e0195264d2ff2954e8965c9b98',26,'Product plan.md',10,9,573,1637664362,1637664362,0,0,'d2343c09969c9a83340ed388318d848c',27,''),(29,2,'files/Plantillas/Simple.odp','70fc92247c27cba05dd786d934303cb8',26,'Simple.odp',15,3,14810,1637664362,1637664362,0,0,'21858b5a4b24e7cff84e18b3d9874f06',27,''),(30,2,'files/Plantillas/Letter.odt','660481295c81cd9e4a60955892f264f4',26,'Letter.odt',14,3,15961,1637664362,1637664362,0,0,'f3d51aafa593aba2130c58a222a82dd2',27,''),(31,2,'files/Plantillas/SWOT analysis.whiteboard','8710dff12b9053cf20c7da04d099c33c',26,'SWOT analysis.whiteboard',16,3,38605,1637664362,1637664362,0,0,'1beb747ea5597675d9d324329b74fc8a',27,''),(32,2,'files/Plantillas/Meeting notes.md','c372ec28a1de451d4cdd6cfb9bba0f6a',26,'Meeting notes.md',10,9,326,1637664362,1637664362,0,0,'36b8873267ce29381623137ee52877bd',27,''),(33,2,'files/Plantillas/Elegant.odp','c7c20bd2eb0d4238107200a292ad9d03',26,'Elegant.odp',15,3,14316,1637664362,1637664362,0,0,'c2cabc7fc781234fcd9bb548fe885704',27,''),(34,2,'files/Plantillas/Impact effort matrix.whiteboard','eb9acc5f8cbc9ec87d540e33d4d5796d',26,'Impact effort matrix.whiteboard',16,3,52674,1637664362,1637664362,0,0,'5bbffb7006b98bc75c3a127815089349',27,''),(35,2,'files/Plantillas/Diagram & table.ods','3092d76156afda82d6f06e4b38789ecb',26,'Diagram & table.ods',17,3,13378,1637664362,1637664362,0,0,'672c3dc1259cbe00656e74c65ae507b3',27,''),(36,2,'files/Plantillas/Readme.md','9f63494c6ef59d87559af47a179610c5',26,'Readme.md',10,9,554,1637664362,1637664362,0,0,'cfc2103c13bf2b7bede166853adf859b',27,''),(37,2,'files/Plantillas/Expense report.ods','d179bb7b81ee778f38873fe6ee0d66fd',26,'Expense report.ods',17,3,13441,1637664362,1637664362,0,0,'9d0b81aa38288129b7828a79dd2e03f7',27,''),(38,1,'appdata_oc9udbsgg2jg/js','52d6c23d6b6789400618aa8933054d9d',2,'js',2,1,0,1637664415,1637664415,0,0,'619cc67085a5e',31,''),(39,1,'appdata_oc9udbsgg2jg/js/core','d8887163e49b906ab56a9754f9165e00',38,'core',2,1,0,1637664368,1637664368,0,0,'619cc67088714',31,''),(40,1,'appdata_oc9udbsgg2jg/js/core/merged-template-prepend.js','6902d934cfebd50fb01c8cb099f8d915',39,'merged-template-prepend.js',18,3,11396,1637664368,1637664368,0,0,'7e8464ea5084a8e4e60f7aa64e3e500a',27,''),(41,1,'appdata_oc9udbsgg2jg/js/core/merged-template-prepend.js.deps','0765e334a808959d590ff0e8d8c7afc9',39,'merged-template-prepend.js.deps',16,3,266,1637664368,1637664368,0,0,'21ce4ae6305f284a438e4ce76faf991b',27,''),(42,1,'appdata_oc9udbsgg2jg/js/core/merged-template-prepend.js.gzip','68692c9d7949aee6dc1441dfd1da2a93',39,'merged-template-prepend.js.gzip',19,3,2982,1637664368,1637664368,0,0,'6701f7b53179d3bb1f2c569c53590786',27,''),(43,1,'appdata_oc9udbsgg2jg/css','25f96cfdb54496a0d79d1ec1acb0761f',2,'css',2,1,0,1637664416,1637664416,0,0,'619cc670aaad9',31,''),(44,1,'appdata_oc9udbsgg2jg/css/icons','257378c1cfd409ea0dfb82dad29b6833',43,'icons',2,1,0,1637664369,1637664369,0,0,'619cc670ad6fd',31,''),(45,1,'appdata_oc9udbsgg2jg/css/core','84c9a4f618cbef3241251abfb1010428',43,'core',2,1,0,1637664369,1637664369,0,0,'619cc670b856a',31,''),(46,1,'appdata_oc9udbsgg2jg/css/icons/icons-vars.css','860a80c27e35530bcfd3647f75b4dc24',44,'icons-vars.css',20,9,174745,1637664416,1637664416,0,0,'bd0795a2703b26127d079008d27fa8c5',27,''),(47,1,'appdata_oc9udbsgg2jg/css/icons/icons-list.template','7ee50bb2aa855b782e124fe90f2652b7',44,'icons-list.template',16,3,16451,1637664416,1637664416,0,0,'44448a9cef5833dd1c5c2351878c1b6f',27,''),(48,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-server.css','e9cd5b87427b202ce8c5701ef57b692f',45,'dd9a-f175-server.css',20,9,138633,1637664369,1637664369,0,0,'5fc7f5b6457b2e8baa71ba86535d33d6',27,''),(49,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-server.css.deps','a33becb2e082f35e590f74fc3c8cd040',45,'dd9a-f175-server.css.deps',16,3,829,1637664369,1637664369,0,0,'fcc22b9f9a537fb60bb8534af4a797d4',27,''),(50,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-server.css.gzip','c8be36c7ca9306d9a5237555b7987f9b',45,'dd9a-f175-server.css.gzip',19,3,19853,1637664369,1637664369,0,0,'1b24eb883b594a25071a7011f06cb90a',27,''),(51,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-css-variables.css','3103e9645b3602d2b09d8c65171bc940',45,'dd9a-f175-css-variables.css',20,9,1545,1637664369,1637664369,0,0,'efca627fcd7598a0c1514e7ddc5bd7eb',27,''),(52,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-css-variables.css.deps','d3d9e9f7b13c9d3442e60abef2df4df2',45,'dd9a-f175-css-variables.css.deps',16,3,191,1637664369,1637664369,0,0,'7ad8b7de9937865aed6fa66c4e4c5e99',27,''),(53,1,'appdata_oc9udbsgg2jg/css/core/dd9a-f175-css-variables.css.gzip','485409aba5789c50d2fd743249799fdd',45,'dd9a-f175-css-variables.css.gzip',19,3,628,1637664369,1637664369,0,0,'405e312972922e078a33edcbf72a1761',27,''),(54,1,'appdata_oc9udbsgg2jg/css/theming','a7ee394b7454c624d22e15a523eb95cf',43,'theming',2,1,0,1637664369,1637664369,0,0,'619cc6717483f',31,''),(55,1,'appdata_oc9udbsgg2jg/css/theming/a472-f175-theming.css','b63057302b7beb6230c7156547e0a3db',54,'a472-f175-theming.css',20,9,1591,1637664369,1637664369,0,0,'639718d2d671952c38409ed84b0b6afe',27,''),(56,1,'appdata_oc9udbsgg2jg/css/theming/a472-f175-theming.css.deps','24c5ac72b643d6e3a67b4167bdcc74ef',54,'a472-f175-theming.css.deps',16,3,194,1637664369,1637664369,0,0,'69c9f54cca904a09c61165c7f6aae890',27,''),(57,1,'appdata_oc9udbsgg2jg/css/theming/a472-f175-theming.css.gzip','a0b6ca8a576aa7fed050bd2aec9a6c02',54,'a472-f175-theming.css.gzip',19,3,505,1637664369,1637664369,0,0,'0580f7f5940f9d79dee97d9d561570a4',27,''),(58,2,'files/Talk','a12e821edb92901676dee9cfe1487de3',6,'Talk',2,1,0,1637664415,1637664415,0,0,'619cc69fc452c',31,''),(59,1,'appdata_oc9udbsgg2jg/js/activity','9cc2eafd0375f79475c9aaf43bd0ca25',38,'activity',2,1,0,1637664416,1637664416,0,0,'619cc69fe97f5',31,''),(60,1,'appdata_oc9udbsgg2jg/js/activity/activity-sidebar.js','7e56876c71d11d3ef59ab031e2fceee8',59,'activity-sidebar.js',18,3,1131414,1637664415,1637664415,0,0,'7c047633f9fea91565420e0e9cca5159',27,''),(61,1,'appdata_oc9udbsgg2jg/js/activity/activity-sidebar.js.deps','cf08c967da7154fc89e19ed5f04744dc',59,'activity-sidebar.js.deps',16,3,457,1637664415,1637664415,0,0,'c1e301339d0f6516c237191e96aa39c4',27,''),(62,1,'appdata_oc9udbsgg2jg/js/activity/activity-sidebar.js.gzip','b4bc0958acf54fdc8608b1d76f05bf11',59,'activity-sidebar.js.gzip',19,3,319706,1637664416,1637664416,0,0,'2008b0f2c4a487698286c7843fdd3d4f',27,''),(63,1,'appdata_oc9udbsgg2jg/css/dashboard','be9ed4bfe206655904c3ed57a5078f9a',43,'dashboard',2,1,0,1637664416,1637664416,0,0,'619cc6a01528a',31,''),(64,1,'appdata_oc9udbsgg2jg/css/dashboard/b0c0-f175-dashboard.css','0f82d469ea26499b4f1ab39bdd99be58',63,'b0c0-f175-dashboard.css',20,9,2050,1637664416,1637664416,0,0,'deb876d12ca810b802cb2311232ad314',27,''),(65,1,'appdata_oc9udbsgg2jg/css/dashboard/b0c0-f175-dashboard.css.deps','cf7cd18462fe68282e733608bf1c2ef6',63,'b0c0-f175-dashboard.css.deps',16,3,198,1637664416,1637664416,0,0,'8f66cb48bcc284d38a5541759768e9a1',27,''),(66,1,'appdata_oc9udbsgg2jg/css/dashboard/b0c0-f175-dashboard.css.gzip','cef5c95c858da8cd0f54838de81e7ed4',63,'b0c0-f175-dashboard.css.gzip',19,3,594,1637664416,1637664416,0,0,'97b6a2fc09aa7effcdee985963613063',27,''),(67,1,'appdata_oc9udbsgg2jg/css/activity','7a89f474a01936a43506ac6b0232ad0e',43,'activity',2,1,0,1637664416,1637664416,0,0,'619cc6a02ad45',31,''),(68,1,'appdata_oc9udbsgg2jg/css/activity/96db-f175-style.css','1cd289832e05ae2d4c15571924c5e93d',67,'96db-f175-style.css',20,9,3353,1637664416,1637664416,0,0,'feda9b313300a3a6494603bf0f291b09',27,''),(69,1,'appdata_oc9udbsgg2jg/css/activity/96db-f175-style.css.deps','71b4d1765212e2c1a5ff6f4ff7325b07',67,'96db-f175-style.css.deps',16,3,193,1637664416,1637664416,0,0,'2de70f34f4d41736de2049f3ad8c67f9',27,''),(70,1,'appdata_oc9udbsgg2jg/css/activity/96db-f175-style.css.gzip','f612e9d3a89523a106b136a1ec9016d8',67,'96db-f175-style.css.gzip',19,3,1108,1637664416,1637664416,0,0,'a584a52ceec9a6f9a4a6465d83014051',27,''),(71,1,'appdata_oc9udbsgg2jg/css/spreed','22fa6eb4e0357ab6427a158739f1f682',43,'spreed',2,1,0,1637664416,1637664416,0,0,'619cc6a03b3a3',31,''),(72,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-merged-files.css','823ebf48ef9e1aeae7015e94c8d6d119',71,'89b3-f175-merged-files.css',20,9,10275,1637664416,1637664416,0,0,'b10f78698326ab3f0eeb7294670344e0',27,''),(73,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-merged-files.css.deps','31eb126fe19a58e222b20e28a88a1a8f',71,'89b3-f175-merged-files.css.deps',16,3,327,1637664416,1637664416,0,0,'d3ccb4ed97b53f11c2b426365170fb8b',27,''),(74,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-merged-files.css.gzip','402cc956b7f6c2d33ac68944320b09d1',71,'89b3-f175-merged-files.css.gzip',19,3,1875,1637664416,1637664416,0,0,'c58525a4303b15ea9560b37d57e74c69',27,''),(75,1,'appdata_oc9udbsgg2jg/css/text','ab28484af79154b102c4d0eb6236fd93',43,'text',2,1,0,1637664416,1637664416,0,0,'619cc6a04e77c',31,''),(76,1,'appdata_oc9udbsgg2jg/css/text/593e-f175-icons.css','0526b09b99dfe08fc4ec12f307a83398',75,'593e-f175-icons.css',20,9,2710,1637664416,1637664416,0,0,'017838501d0422125fee5c7be757ec99',27,''),(77,1,'appdata_oc9udbsgg2jg/css/text/593e-f175-icons.css.deps','0d55bfe2b2143ca64066bf9602f598db',75,'593e-f175-icons.css.deps',16,3,189,1637664416,1637664416,0,0,'84d86eb63d2a0b13b7f10e315b58d6f2',27,''),(78,1,'appdata_oc9udbsgg2jg/css/text/593e-f175-icons.css.gzip','4f386de3ad4c46ed7307355ad6bad84e',75,'593e-f175-icons.css.gzip',19,3,417,1637664416,1637664416,0,0,'440ce89c25ea6612a3f8823e59665017',27,''),(79,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-icons.css','8168d7319de229c2c01dc8fda838993f',71,'89b3-f175-icons.css',20,9,7951,1637664416,1637664416,0,0,'18ca9ad475262e52afa7f684f9fe74aa',27,''),(80,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-icons.css.deps','0325a31ba9cc44376a4e7d6d0e4bee6b',71,'89b3-f175-icons.css.deps',16,3,191,1637664416,1637664416,0,0,'4b82cae6a7c422c6747bf1b2bf39fa3d',27,''),(81,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-icons.css.gzip','5b2c13580fa0d4213607f63e62b222ad',71,'89b3-f175-icons.css.gzip',19,3,1263,1637664416,1637664416,0,0,'bd6dd2d7cd67cb779f47a6555d8431f4',27,''),(82,1,'appdata_oc9udbsgg2jg/css/notifications','5f2fa1e0714e07c64061f8ae6dd21718',43,'notifications',2,1,0,1637664416,1637664416,0,0,'619cc6a0707da',31,''),(83,1,'appdata_oc9udbsgg2jg/css/notifications/e2ca-f175-styles.css','65a15e7d70338135f01fcfcf2bc5376f',82,'e2ca-f175-styles.css',20,9,3679,1637664416,1637664416,0,0,'cc518894a70b82bc9f07f0f8b490ab2a',27,''),(84,1,'appdata_oc9udbsgg2jg/css/notifications/e2ca-f175-styles.css.deps','84938aaedafebcbc85f442b7dfa6ac95',82,'e2ca-f175-styles.css.deps',16,3,199,1637664416,1637664416,0,0,'55c060d3eb3d1a27d4718566b678ecaf',27,''),(85,1,'appdata_oc9udbsgg2jg/css/notifications/e2ca-f175-styles.css.gzip','19aacebfe201b9152f7e0a0ef2ab6348',82,'e2ca-f175-styles.css.gzip',19,3,916,1637664416,1637664416,0,0,'b8ae0d856797ba22c920e63e8450430c',27,''),(86,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-unified-search.css','a2e2aa8d9e48b65655a94006f792c0c9',71,'89b3-f175-unified-search.css',20,9,666,1637664416,1637664416,0,0,'aef38cd6da77e0f65c61ffbe498c5a98',27,''),(87,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-unified-search.css.deps','b2bb112acc7147f68f95e6e1455a5d58',71,'89b3-f175-unified-search.css.deps',16,3,200,1637664416,1637664416,0,0,'7ea98c9c22e7528a10c10a4762179a76',27,''),(88,1,'appdata_oc9udbsgg2jg/css/spreed/89b3-f175-unified-search.css.gzip','cb0a144f8fab8d797cb3244a925b027d',71,'89b3-f175-unified-search.css.gzip',19,3,215,1637664416,1637664416,0,0,'6ea2c888b2940b6482608fd29bb7791b',27,''),(89,1,'appdata_oc9udbsgg2jg/css/user_status','dfe92294b41834c6d1c17df7bd22d518',43,'user_status',2,1,0,1637664416,1637664416,0,0,'619cc6a08b89c',31,''),(90,1,'appdata_oc9udbsgg2jg/css/user_status/62ab-f175-user-status-menu.css','0852f8c9367676583a0d3315da9f46c1',89,'62ab-f175-user-status-menu.css',20,9,999,1637664416,1637664416,0,0,'6863028d6607cfdabea842f108343e54',27,''),(91,1,'appdata_oc9udbsgg2jg/css/user_status/62ab-f175-user-status-menu.css.deps','68df7c9f8236b1c6f8ced9120be84d67',89,'62ab-f175-user-status-menu.css.deps',16,3,207,1637664416,1637664416,0,0,'9667697305b7b0c5b4dbf51622f71212',27,''),(92,1,'appdata_oc9udbsgg2jg/css/user_status/62ab-f175-user-status-menu.css.gzip','f5859ba30d1f486b903e845c00a0dc07',89,'62ab-f175-user-status-menu.css.gzip',19,3,232,1637664416,1637664416,0,0,'05d79d59ebf42d0c883cbb6ea91f2eb7',27,''),(93,1,'appdata_oc9udbsgg2jg/avatar','52623f1ba6fce48b270d1d1f41bbd44e',2,'avatar',2,1,0,1637664417,1637664417,0,0,'619cc6a18e241',31,''),(94,1,'appdata_oc9udbsgg2jg/avatar/Admin','670093fc86d71a0e20a08e5203c73c00',93,'Admin',2,1,0,1637664417,1637664417,0,0,'619cc6a192487',31,''),(95,1,'appdata_oc9udbsgg2jg/avatar/Admin/avatar.png','7a803ef432199ddb3ff63c8ebee6adb3',94,'avatar.png',7,6,15681,1637664417,1637664417,0,0,'81a811f70c4408026776916a56174064',27,''),(96,1,'appdata_oc9udbsgg2jg/avatar/Admin/generated','7ab707d283a30c27649171befffd1825',94,'generated',16,3,0,1637664417,1637664417,0,0,'bccf6a2a49a451d2d0543c6798cd2089',27,''),(97,1,'appdata_oc9udbsgg2jg/avatar/Admin/avatar.32.png','d0b42a46e278e1c0124378e8f5f8af16',94,'avatar.32.png',7,6,392,1637664417,1637664417,0,0,'18b43235cab42ceecaf19598ee79df5d',27,''),(98,1,'appdata_oc9udbsgg2jg/preview','c6954a87a0a18d42e5b110dab32c3d73',2,'preview',2,1,0,1637664420,1637664420,0,0,'619cc6a4466c8',31,''),(99,1,'appdata_oc9udbsgg2jg/preview/1','a9f1fa2345bae10a25535cf97d4ce7a8',98,'1',2,1,-1,1637664420,1637664420,0,0,'619cc6a44f9e7',31,''),(100,1,'appdata_oc9udbsgg2jg/preview/1/f','1c0fbb327f37a400f40951dff99958dc',99,'f',2,1,-1,1637664420,1637664420,0,0,'619cc6a44eade',31,''),(101,1,'appdata_oc9udbsgg2jg/preview/1/f/f','41410ece2d3073c6946d7c75391597fb',100,'f',2,1,-1,1637664420,1637664420,0,0,'619cc6a44e49f',31,''),(102,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1','70f3c32bc9ad58c79162c40fe6d046bc',101,'1',2,1,-1,1637664420,1637664420,0,0,'619cc6a44dd3d',31,''),(103,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d','893614a31da82675c333b38e3e83ffbd',102,'d',2,1,-1,1637664420,1637664420,0,0,'619cc6a44d5de',31,''),(104,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d/e','099f8befb41860b2ec72c18c31bc5f52',103,'e',2,1,-1,1637664420,1637664420,0,0,'619cc6a44cd1f',31,''),(105,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d/e/7','fa0552093222d71284dc0549dd56f1c4',104,'7',2,1,-1,1637664420,1637664420,0,0,'619cc6a44c44f',31,''),(106,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d/e/7/24','7fecc618a82545e0272352239d70995c',105,'24',2,1,0,1637664422,1637664422,0,0,'619cc6a44afed',31,''),(107,1,'appdata_oc9udbsgg2jg/theming','69c30e9a9ee9717f2fac22a3721133ea',2,'theming',2,1,0,1637664420,1637664420,0,0,'619cc6a455e8c',31,''),(108,1,'appdata_oc9udbsgg2jg/theming/0','038ef9869cd530f799ce03c9a1bd5146',107,'0',2,1,0,1637664420,1637664420,0,0,'619cc6a45bb06',31,''),(109,1,'appdata_oc9udbsgg2jg/theming/0/icon-core-filetypes_text.svg','ca9617191c05c7e2294c2673aedcd156',108,'icon-core-filetypes_text.svg',21,6,295,1637664420,1637664420,0,0,'acf1a9386a24ffce20f06a0693e9584b',27,''),(110,1,'appdata_oc9udbsgg2jg/theming/0/icon-core-filetypes_folder.svg','0de737a6b871e4762b912899cb5dc4c7',108,'icon-core-filetypes_folder.svg',21,6,255,1637664420,1637664420,0,0,'00d719ab2a5e2d2d97a1e4706c07c1c3',27,''),(111,1,'appdata_oc9udbsgg2jg/theming/0/icon-core-filetypes_application-pdf.svg','8534e080768fe02992f7b3d15ef55b16',108,'icon-core-filetypes_application-pdf.svg',21,6,1054,1637664420,1637664420,0,0,'760f64ce257ae22bd2b5789b22e8587c',27,''),(112,1,'appdata_oc9udbsgg2jg/theming/0/icon-core-filetypes_x-office-document.svg','8e61d06cfbfe93bd49cc3aa3a3d6c4fa',108,'icon-core-filetypes_x-office-document.svg',21,6,295,1637664420,1637664420,0,0,'08970e3a2977975cf13c5bc9a4216c7f',27,''),(113,1,'appdata_oc9udbsgg2jg/preview/8','b0d6401c405963dc763df8ccbd92c962',98,'8',2,1,-1,1637664421,1637664421,0,0,'619cc6a50bbcd',31,''),(114,1,'appdata_oc9udbsgg2jg/preview/8/e','058368cb65bcf280f324a20dca4e421f',113,'e',2,1,-1,1637664421,1637664421,0,0,'619cc6a50a4a1',31,''),(115,1,'appdata_oc9udbsgg2jg/preview/8/e/2','37c563c4077cded575dfb0b185729ac3',114,'2',2,1,-1,1637664421,1637664421,0,0,'619cc6a509c2e',31,''),(116,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9','8064b2ba58efa882f4fd35e6767def2b',115,'9',2,1,-1,1637664421,1637664421,0,0,'619cc6a5093d9',31,''),(117,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6','84e90c31d013fd961e2be9b880f84182',116,'6',2,1,-1,1637664421,1637664421,0,0,'619cc6a508922',31,''),(118,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6/a','4f7d0afef2455e63189e9911ffe794da',117,'a',2,1,-1,1637664421,1637664421,0,0,'619cc6a507df2',31,''),(119,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6/a/0','e50c4742681d80113fec219e07b39e07',118,'0',2,1,-1,1637664421,1637664421,0,0,'619cc6a506911',31,''),(120,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6/a/0/25','9e5d7eb6670cb14d70b4684572f6eba7',119,'25',2,1,0,1637664422,1637664422,0,0,'619cc6a5047f2',31,''),(121,1,'appdata_oc9udbsgg2jg/preview/0','3ac4286b1a960b6ed413ec8f02ba1aa0',98,'0',2,1,-1,1637664421,1637664421,0,0,'619cc6a52c15e',31,''),(122,1,'appdata_oc9udbsgg2jg/preview/0/2','084bce7579c63eb5168cec892f122d72',121,'2',2,1,-1,1637664421,1637664421,0,0,'619cc6a52b6be',31,''),(123,1,'appdata_oc9udbsgg2jg/preview/0/2/e','04d3a53a08e03ebeffbf295aac767b63',122,'e',2,1,-1,1637664421,1637664421,0,0,'619cc6a52a50c',31,''),(124,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7','eeb444b7908b6301860504d7a70f4f72',123,'7',2,1,-1,1637664421,1637664421,0,0,'619cc6a529d32',31,''),(125,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4','755811e0ebbcd2e2454317425424ae7d',124,'4',2,1,-1,1637664421,1637664421,0,0,'619cc6a528dd0',31,''),(126,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4/f','121fc0d525a6dd8a63b5c1b3759d72da',125,'f',2,1,-1,1637664421,1637664421,0,0,'619cc6a52631d',31,''),(127,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4/f/1','233c1239aef951cf133527cc2f1d567d',126,'1',2,1,-1,1637664421,1637664421,0,0,'619cc6a52428e',31,''),(128,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4/f/1/27','32cdfb4bc857ed0ed7862f06d843f9ec',127,'27',2,1,0,1637664421,1637664421,0,0,'619cc6a5226de',31,''),(129,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4/f/1/27/181-256-max.png','e8d3326eaa05be52161b678c47962c2a',128,'181-256-max.png',7,6,3547,1637664421,1637664421,0,0,'1f5fc7ad3a11d53b22b6e3be0ceb8723',27,''),(130,1,'appdata_oc9udbsgg2jg/preview/0/2/e/7/4/f/1/27/64-64-crop.png','cd95b3e1e7f00c38c4fcb1b1d3b142c7',128,'64-64-crop.png',7,6,3037,1637664421,1637664421,0,0,'615a33ba77a288ace862f1894cdcc700',27,''),(131,1,'appdata_oc9udbsgg2jg/preview/3','9d995b8851e63577c05b8136362d5055',98,'3',2,1,-1,1637664421,1637664421,0,0,'619cc6a5723ff',31,''),(132,1,'appdata_oc9udbsgg2jg/preview/3/3','1a1be9c36e8bb58814018e9558e6c9af',131,'3',2,1,-1,1637664421,1637664421,0,0,'619cc6a56ff3a',31,''),(133,1,'appdata_oc9udbsgg2jg/preview/3/3/e','bd14ac6aa52d72568397fc31c4d2353f',132,'e',2,1,-1,1637664421,1637664421,0,0,'619cc6a56efe4',31,''),(134,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7','92433c3e21c9524581e509e91ce57847',133,'7',2,1,-1,1637664421,1637664421,0,0,'619cc6a56d35f',31,''),(135,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5','2c50b9bd0a74d65f611ba6a892ef6b87',134,'5',2,1,-1,1637664421,1637664421,0,0,'619cc6a56c70d',31,''),(136,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5/f','a6c7baa0e311ba3cbdff733f3430dfcc',135,'f',2,1,-1,1637664421,1637664421,0,0,'619cc6a56be62',31,''),(137,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5/f/f','f8986c2600db461900ae49e0de0cec2c',136,'f',2,1,-1,1637664421,1637664421,0,0,'619cc6a56a82e',31,''),(138,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5/f/f/28','fc5dc273d79dd0df619b93e8c8a46874',137,'28',2,1,0,1637664422,1637664422,0,0,'619cc6a5660d7',31,''),(139,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d/e/7/24/4096-4096-max.png','997ce14e925e26d8f116507bae8dc66c',106,'4096-4096-max.png',7,6,199853,1637664421,1637664421,0,0,'84711ced08c2501a87338664fb818f1e',27,''),(140,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6/a/0/25/4096-4096-max.png','d41d3d56acdfe2aae3475b657ae540f4',120,'4096-4096-max.png',7,6,37882,1637664421,1637664421,0,0,'f13fafa477eab2cf8d7a8a7a37e2fb20',27,''),(141,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5/f/f/28/4096-4096-max.png','a87f8055ea8c58e791432519594e6371',138,'4096-4096-max.png',7,6,67719,1637664422,1637664422,0,0,'a3c1a963459795dad720ec5286edbf4e',27,''),(142,1,'appdata_oc9udbsgg2jg/preview/1/f/f/1/d/e/7/24/64-64-crop.png','11c6f0c5ecf0f23f366881a2ff6a22bb',106,'64-64-crop.png',7,6,3563,1637664422,1637664422,0,0,'273a0c30666a3038e15041e28f8485e5',27,''),(143,1,'appdata_oc9udbsgg2jg/preview/8/e/2/9/6/a/0/25/64-64-crop.png','a3266f74879d091ad54d45a834b41126',120,'64-64-crop.png',7,6,844,1637664422,1637664422,0,0,'8a4e1720310651ad3fa2afe6003713b2',27,''),(144,1,'appdata_oc9udbsgg2jg/preview/3/3/e/7/5/f/f/28/64-64-crop.png','e76399093c4a2bc41fc01d6149f5fc98',138,'64-64-crop.png',7,6,1565,1637664422,1637664422,0,0,'2bf87c553e08b0a32b650e248adc365b',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `timestamp` varchar(12) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `location` varchar(512) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(4) COLLATE utf8mb4_bin DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `operator` varchar(16) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `hash` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `name` varchar(256) COLLATE utf8mb4_bin DEFAULT '',
  `checks` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `operation` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `entity` varchar(256) COLLATE utf8mb4_bin NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','Admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `argument` varchar(4000) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1637664369,1637664369,0,0),(2,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1637664420,1637664420,0,0),(3,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1637664352,0,0),(4,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1637664352,0,0),(5,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1637664353,0,0),(6,'OCA\\Circles\\Cron\\Maintenance','null',0,1637664353,0,0),(7,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1637664353,0,0),(8,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1637664353,0,0),(9,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1637664353,0,0),(10,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1637664353,0,0),(11,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1637664353,0,0),(12,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1637664354,0,0),(13,'OCA\\Federation\\SyncJob','null',0,1637664354,0,0),(14,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1637664355,0,0),(15,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1637664355,0,0),(16,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1637664355,0,0),(17,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1637664355,0,0),(18,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1637664355,0,0),(19,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1637664356,0,0),(20,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',0,1637664357,0,0),(21,'OCA\\Text\\Cron\\Cleanup','null',0,1637664358,0,0),(22,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1637664358,0,0),(23,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1637664358,0,0),(24,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1637664358,0,0),(25,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1637664358,0,0),(26,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1637664358,0,0),(27,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1637664358,0,0),(28,'OC\\Authentication\\Token\\DefaultTokenCleanupJob','null',0,1637664361,0,0),(29,'OC\\Log\\Rotate','null',0,1637664361,0,0),(30,'OC\\Preview\\BackgroundCleanupJob','null',0,1637664361,0,0),(31,'OCA\\Richdocuments\\Backgroundjobs\\ObtainCapabilities','null',0,1637664374,0,0),(32,'OCA\\Contacts\\Cron\\SocialUpdateRegistration','null',0,1637664405,0,0),(33,'OCA\\Mail\\BackgroundJob\\CleanupJob','null',0,1637664411,0,0),(34,'OCA\\Talk\\BackgroundJob\\ExpireSignalingMessage','null',0,1637664415,0,0),(35,'OCA\\Talk\\BackgroundJob\\RemoveEmptyRooms','null',0,1637664415,0,0),(36,'OCA\\Talk\\BackgroundJob\\ResetAssignedSignalingServer','null',0,1637664415,0,0),(37,'OCA\\Talk\\BackgroundJob\\CheckReferenceIdColumn','null',0,1637664415,0,0),(38,'OCA\\Talk\\BackgroundJob\\CheckHostedSignalingServer','null',0,1637664415,0,0),(39,'OCA\\Talk\\BackgroundJob\\CheckMatterbridges','null',0,1637664415,0,0),(40,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"Admin\"}',0,1637664415,0,0);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `known_user` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `login_token` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `public_key` text COLLATE utf8mb4_bin NOT NULL,
  `private_key` text COLLATE utf8mb4_bin NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `login_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `server` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `app_password` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_accounts`
--

DROP TABLE IF EXISTS `oc_mail_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `inbound_host` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `inbound_port` varchar(6) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `inbound_ssl_mode` varchar(10) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `inbound_user` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `inbound_password` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL,
  `outbound_host` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `outbound_port` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `outbound_ssl_mode` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `outbound_user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `outbound_password` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL,
  `signature` text COLLATE utf8mb4_bin DEFAULT NULL,
  `last_mailbox_sync` int(11) NOT NULL DEFAULT 0,
  `editor_mode` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT 'plaintext',
  `order` int(11) NOT NULL DEFAULT 1,
  `show_subscribed_only` tinyint(1) DEFAULT 0,
  `personal_namespace` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `drafts_mailbox_id` int(11) DEFAULT NULL,
  `sent_mailbox_id` int(11) DEFAULT NULL,
  `trash_mailbox_id` int(11) DEFAULT NULL,
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_host` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_port` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_ssl_mode` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_password` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL,
  `provisioning_id` int(11) DEFAULT NULL,
  `signature_above_quote` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mail_userid_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_accounts`
--

LOCK TABLES `oc_mail_accounts` WRITE;
/*!40000 ALTER TABLE `oc_mail_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_aliases`
--

DROP TABLE IF EXISTS `oc_mail_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `signature` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_aliases`
--

LOCK TABLES `oc_mail_aliases` WRITE;
/*!40000 ALTER TABLE `oc_mail_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_attachments`
--

DROP TABLE IF EXISTS `oc_mail_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `file_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  `mime_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_attach_userid_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_attachments`
--

LOCK TABLES `oc_mail_attachments` WRITE;
/*!40000 ALTER TABLE `oc_mail_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_classifiers`
--

DROP TABLE IF EXISTS `oc_mail_classifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_classifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `estimator` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `app_version` varchar(31) COLLATE utf8mb4_bin NOT NULL,
  `training_set_size` int(11) NOT NULL,
  `validation_set_size` int(11) NOT NULL,
  `recall_important` decimal(10,5) NOT NULL,
  `precision_important` decimal(10,5) NOT NULL,
  `f1_score_important` decimal(10,5) NOT NULL,
  `duration` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_clssfr_accnt_id_type` (`account_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_classifiers`
--

LOCK TABLES `oc_mail_classifiers` WRITE;
/*!40000 ALTER TABLE `oc_mail_classifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_classifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_coll_addresses`
--

DROP TABLE IF EXISTS `oc_mail_coll_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_coll_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_coll_addr_userid_index` (`user_id`),
  KEY `mail_coll_addr_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_coll_addresses`
--

LOCK TABLES `oc_mail_coll_addresses` WRITE;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_mailboxes`
--

DROP TABLE IF EXISTS `oc_mail_mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_mailboxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `account_id` int(11) NOT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `delimiter` varchar(1) COLLATE utf8mb4_bin NOT NULL,
  `messages` int(11) NOT NULL,
  `unseen` int(11) NOT NULL,
  `selectable` tinyint(1) DEFAULT 0,
  `special_use` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `sync_new_lock` int(11) DEFAULT NULL,
  `sync_changed_lock` int(11) DEFAULT NULL,
  `sync_vanished_lock` int(11) DEFAULT NULL,
  `sync_new_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sync_changed_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sync_vanished_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sync_in_background` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_22DEBD839B6B5FBA5E237E06` (`account_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_mailboxes`
--

LOCK TABLES `oc_mail_mailboxes` WRITE;
/*!40000 ALTER TABLE `oc_mail_mailboxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_message_tags`
--

DROP TABLE IF EXISTS `oc_mail_message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_message_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imap_message_id` varchar(1023) COLLATE utf8mb4_bin NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_msg_imap_id_idx` (`imap_message_id`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_message_tags`
--

LOCK TABLES `oc_mail_message_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_messages`
--

DROP TABLE IF EXISTS `oc_mail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `message_id` varchar(1023) COLLATE utf8mb4_bin DEFAULT NULL,
  `mailbox_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL,
  `flag_answered` tinyint(1) DEFAULT 0,
  `flag_deleted` tinyint(1) DEFAULT 0,
  `flag_draft` tinyint(1) DEFAULT 0,
  `flag_flagged` tinyint(1) DEFAULT 0,
  `flag_seen` tinyint(1) DEFAULT 0,
  `flag_forwarded` tinyint(1) DEFAULT 0,
  `flag_junk` tinyint(1) DEFAULT 0,
  `flag_notjunk` tinyint(1) DEFAULT 0,
  `flag_attachments` tinyint(1) DEFAULT 0,
  `flag_important` tinyint(1) DEFAULT 0,
  `structure_analyzed` tinyint(1) DEFAULT 0,
  `preview_text` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `references` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `in_reply_to` varchar(1023) COLLATE utf8mb4_bin DEFAULT NULL,
  `thread_root_id` varchar(1023) COLLATE utf8mb4_bin DEFAULT NULL,
  `flag_mdnsent` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_mb_uid_idx` (`uid`,`mailbox_id`),
  KEY `mail_msg_sent_idx` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_messages`
--

LOCK TABLES `oc_mail_messages` WRITE;
/*!40000 ALTER TABLE `oc_mail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_provisionings`
--

DROP TABLE IF EXISTS `oc_mail_provisionings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_provisionings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provisioning_domain` varchar(63) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `email_template` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imap_user` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imap_host` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imap_port` smallint(5) unsigned NOT NULL,
  `imap_ssl_mode` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `smtp_user` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `smtp_host` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `smtp_port` smallint(5) unsigned NOT NULL,
  `smtp_ssl_mode` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_user` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_host` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `sieve_port` smallint(5) unsigned DEFAULT NULL,
  `sieve_ssl_mode` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_provsng_dm_idx` (`provisioning_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_provisionings`
--

LOCK TABLES `oc_mail_provisionings` WRITE;
/*!40000 ALTER TABLE `oc_mail_provisionings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_provisionings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_recipients`
--

DROP TABLE IF EXISTS `oc_mail_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_recipients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_recipient_msg_id_idx` (`message_id`),
  KEY `mail_recipient_email_idx` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_recipients`
--

LOCK TABLES `oc_mail_recipients` WRITE;
/*!40000 ALTER TABLE `oc_mail_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_tags`
--

DROP TABLE IF EXISTS `oc_mail_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `imap_label` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `color` varchar(9) COLLATE utf8mb4_bin DEFAULT '#fff',
  `is_default_tag` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_tags_usr_lbl_idx` (`user_id`,`imap_label`),
  KEY `mail_msg_tags_usr_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_tags`
--

LOCK TABLES `oc_mail_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_trusted_senders`
--

DROP TABLE IF EXISTS `oc_mail_trusted_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_trusted_senders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'individual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_trusted_sender_uniq` (`email`,`user_id`),
  KEY `mail_trusted_senders_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_trusted_senders`
--

LOCK TABLES `oc_mail_trusted_senders` WRITE;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210906132259'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_trashbin','1010Date20200630192639'),('mail','0100Date20180825194217'),('mail','0110Date20180825195812'),('mail','0110Date20180825201241'),('mail','0130Date20190408134101'),('mail','0156Date20190828140357'),('mail','0161Date20190902103559'),('mail','0161Date20190902103701'),('mail','0161Date20190902114635'),('mail','0180Date20190927124207'),('mail','0190Date20191118160843'),('mail','0210Date20191212144925'),('mail','1020Date20191002091034'),('mail','1020Date20191002091035'),('mail','1020Date20200206134751'),('mail','1030Date20200228105714'),('mail','1040Date20200422130220'),('mail','1040Date20200422142920'),('mail','1040Date20200506111214'),('mail','1040Date20200515080614'),('mail','1040Date20200529124657'),('mail','1050Date20200624101359'),('mail','1050Date20200831124954'),('mail','1050Date20200921141700'),('mail','1050Date20200923180030'),('mail','1060Date20201015084952'),('mail','1080Date20201119084820'),('mail','1080Date20210108093802'),('mail','1090Date20210127160127'),('mail','1090Date20210216154409'),('mail','1096Date20210407150016'),('mail','1100Date20210304143008'),('mail','1100Date20210317164707'),('mail','1100Date20210326103929'),('mail','1100Date20210409091311'),('mail','1100Date20210419080523'),('mail','1100Date20210419121734'),('mail','1100Date20210421113423'),('mail','1100Date20210512142306'),('mail','1105Date20210922104324'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('privacy','100Date20190217131943'),('richdocuments','2060Date20200302131958'),('richdocuments','2060Date20200302132145'),('richdocuments','30704Date20200626072306'),('richdocuments','30709Date20201111104147'),('richdocuments','30717Date20210310164901'),('spreed','10000Date20200819121721'),('spreed','10000Date20201012144235'),('spreed','10000Date20201015134000'),('spreed','10000Date20201015143852'),('spreed','10000Date20201015150000'),('spreed','11000Date20200922161218'),('spreed','11000Date20201011082810'),('spreed','11000Date20201201102528'),('spreed','11000Date20201204110210'),('spreed','11000Date20201209142525'),('spreed','11000Date20201209142526'),('spreed','11001Date20210211111527'),('spreed','11001Date20210212105406'),('spreed','12000Date20210217134030'),('spreed','12000Date20210401124139'),('spreed','12000Date20210528100404'),('spreed','2000Date20170707093535'),('spreed','2000Date20171026140256'),('spreed','2000Date20171026140257'),('spreed','2001Date20170707115443'),('spreed','2001Date20170913104501'),('spreed','2001Date20170921145301'),('spreed','2001Date20170929092606'),('spreed','2001Date20171009132424'),('spreed','2001Date20171026134605'),('spreed','2001Date20171026141336'),('spreed','2001Date20171031102049'),('spreed','2001Date20180103144447'),('spreed','2001Date20180103150836'),('spreed','3002Date20180319104030'),('spreed','3003Date20180707222130'),('spreed','3003Date20180718112436'),('spreed','3003Date20180718133519'),('spreed','3003Date20180720162342'),('spreed','3003Date20180722152733'),('spreed','3003Date20180722152849'),('spreed','3003Date20180730080327'),('spreed','4099Date20181001123058'),('spreed','5099Date20190121102337'),('spreed','5099Date20190319134820'),('spreed','6099Date20190627172429'),('spreed','7000Date20190717141457'),('spreed','7000Date20190724121136'),('spreed','7000Date20190724121137'),('spreed','8000Date20200331144101'),('spreed','8000Date20200402124456'),('spreed','8000Date20200407073807'),('spreed','8000Date20200407115318'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(18,'application/javascript'),(4,'application/json'),(16,'application/octet-stream'),(5,'application/pdf'),(15,'application/vnd.oasis.opendocument.presentation'),(17,'application/vnd.oasis.opendocument.spreadsheet'),(14,'application/vnd.oasis.opendocument.text'),(13,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(19,'application/x-gzip'),(1,'httpd'),(2,'httpd/unix-directory'),(6,'image'),(8,'image/jpeg'),(7,'image/png'),(21,'image/svg+xml'),(9,'text'),(20,'text/css'),(10,'text/markdown'),(11,'video'),(12,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mount_point` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,2,5,'Admin','/Admin/',NULL);
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `object_id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `subject_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `message_parameters` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `icon` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `actions` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','Admin',1637664415,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(2,'firstrunwizard','Admin',1637664415,'app','social','apphint-social','[]','','[]','','','[]'),(3,'firstrunwizard','Admin',1637664415,'app','notes','apphint-notes','[]','','[]','','','[]'),(4,'firstrunwizard','Admin',1637664415,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','Admin',1637664415,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickey` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `devicepublickeyhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `pushtokenhash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `proxyserver` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `apptype` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `encrypted_token` varchar(786) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `redirect_uri` varchar(2000) COLLATE utf8mb4_bin NOT NULL,
  `client_identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `secret` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `appid` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configkey` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `configvalue` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('Admin','avatar','generated','true'),('Admin','core','lang','es'),('Admin','core','templateDirectory','Plantillas/'),('Admin','dashboard','firstRun','0'),('Admin','firstrunwizard','apphint','18'),('Admin','firstrunwizard','show','0'),('Admin','login','lastLogin','1637664361'),('Admin','spreed','changelog','31');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertypath` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyname` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `propertyvalue` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`),
  KEY `properties_path_index` (`userid`,`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `hash` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `delete_after` datetime NOT NULL,
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `federated_cloud_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_assets`
--

DROP TABLE IF EXISTS `oc_richdocuments_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_assets_token_idx` (`token`),
  UNIQUE KEY `rd_assets_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_assets`
--

LOCK TABLES `oc_richdocuments_assets` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_direct`
--

DROP TABLE IF EXISTS `oc_richdocuments_direct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_direct` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `share` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `initiator_host` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `initiator_token` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_direct_token_idx` (`token`),
  KEY `rd_direct_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_direct`
--

LOCK TABLES `oc_richdocuments_direct` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_direct` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_direct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_wopi`
--

DROP TABLE IF EXISTS `oc_richdocuments_wopi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_wopi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `editor_uid` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `guest_displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT 0,
  `canwrite` tinyint(1) DEFAULT 0,
  `server_host` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'localhost',
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT '',
  `expiry` bigint(20) unsigned DEFAULT NULL,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `hide_download` tinyint(1) DEFAULT 0,
  `direct` tinyint(1) DEFAULT 0,
  `remote_server` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `remote_server_token` varchar(32) COLLATE utf8mb4_bin DEFAULT '',
  `share` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `token_type` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_wopi_token_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_wopi`
--

LOCK TABLES `oc_richdocuments_wopi` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `uid_owner` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `item_source` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `item_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `remote_id` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `share_token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint` varchar(4000) COLLATE utf8mb4_bin NOT NULL,
  `mountpoint_hash` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'local::/var/www/nextcloud/data/',1,NULL),(2,'home::Admin',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `credentials` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `objecttype` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_attendees`
--

DROP TABLE IF EXISTS `oc_talk_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_attendees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `actor_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `display_name` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `pin` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `participant_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `favorite` tinyint(1) DEFAULT 0,
  `notification_level` int(11) DEFAULT 0,
  `last_joined_call` int(10) unsigned NOT NULL DEFAULT 0,
  `last_read_message` bigint(20) DEFAULT 0,
  `last_mention_message` bigint(20) DEFAULT 0,
  `read_privacy` smallint(5) unsigned DEFAULT 0,
  `publishing_permissions` int(11) NOT NULL DEFAULT 7,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ta_ident` (`room_id`,`actor_type`,`actor_id`),
  KEY `ta_roompin` (`room_id`,`pin`),
  KEY `ta_room` (`room_id`),
  KEY `ta_actor` (`actor_type`,`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_attendees`
--

LOCK TABLES `oc_talk_attendees` WRITE;
/*!40000 ALTER TABLE `oc_talk_attendees` DISABLE KEYS */;
INSERT INTO `oc_talk_attendees` VALUES (1,1,'users','Admin','Admin',NULL,3,0,0,0,1,0,0,7);
/*!40000 ALTER TABLE `oc_talk_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_bridges`
--

DROP TABLE IF EXISTS `oc_talk_bridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_bridges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `json_values` longtext COLLATE utf8mb4_bin NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbr_room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_bridges`
--

LOCK TABLES `oc_talk_bridges` WRITE;
/*!40000 ALTER TABLE `oc_talk_bridges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_bridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_commands`
--

DROP TABLE IF EXISTS `oc_talk_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `command` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `script` longtext COLLATE utf8mb4_bin NOT NULL,
  `response` int(11) NOT NULL DEFAULT 1,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_commands`
--

LOCK TABLES `oc_talk_commands` WRITE;
/*!40000 ALTER TABLE `oc_talk_commands` DISABLE KEYS */;
INSERT INTO `oc_talk_commands` VALUES (1,'','talk','help','help',1,3);
/*!40000 ALTER TABLE `oc_talk_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_internalsignaling`
--

DROP TABLE IF EXISTS `oc_talk_internalsignaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_internalsignaling` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `message` longtext COLLATE utf8mb4_bin NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tis_recipient_time` (`recipient`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_internalsignaling`
--

LOCK TABLES `oc_talk_internalsignaling` WRITE;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_rooms`
--

DROP TABLE IF EXISTS `oc_talk_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `token` varchar(32) COLLATE utf8mb4_bin DEFAULT '',
  `type` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `active_since` datetime DEFAULT NULL,
  `active_guests` int(10) unsigned NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `last_message` bigint(20) DEFAULT 0,
  `object_type` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `object_id` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `read_only` int(11) NOT NULL DEFAULT 0,
  `lobby_state` int(11) NOT NULL DEFAULT 0,
  `lobby_timer` datetime DEFAULT NULL,
  `assigned_hpb` int(11) DEFAULT NULL,
  `sip_enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `listable` smallint(5) unsigned DEFAULT 0,
  `call_flag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tr_room_token` (`token`),
  KEY `last_active` (`last_activity`),
  KEY `tr_listable` (`listable`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_rooms`
--

LOCK TABLES `oc_talk_rooms` WRITE;
/*!40000 ALTER TABLE `oc_talk_rooms` DISABLE KEYS */;
INSERT INTO `oc_talk_rooms` VALUES (1,'Admin','2pf78q9r',4,'',NULL,0,'2021-11-23 10:47:00',32,'','',1,0,NULL,NULL,0,NULL,0,0);
/*!40000 ALTER TABLE `oc_talk_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_sessions`
--

DROP TABLE IF EXISTS `oc_talk_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attendee_id` bigint(20) unsigned NOT NULL,
  `session_id` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `in_call` int(11) NOT NULL DEFAULT 0,
  `last_ping` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_session` (`session_id`),
  KEY `ts_in_call` (`in_call`),
  KEY `ts_last_ping` (`last_ping`),
  KEY `ts_attendee_id` (`attendee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_sessions`
--

LOCK TABLES `oc_talk_sessions` WRITE;
/*!40000 ALTER TABLE `oc_talk_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  `base_version_etag` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `guest_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `color` varchar(7) COLLATE utf8mb4_bin DEFAULT NULL,
  `token` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) COLLATE utf8mb4_bin NOT NULL,
  `url_hash` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `token` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL,
  `shared_secret` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `code` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','Admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_icon` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `custom_message` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'Admin','away',1637665619,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `target_user` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `displayname` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `uid_lower` varchar(64) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('Admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$R3l5RXBhM1ZROU11VXhGRw$2X35uSqjQ9G0cdqtwK50GNHRbqW2OW+vjv0lu6KDqxk','admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `category` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `public_key_credential_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '11',
  `etag` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nextcloud'
--

--
-- Dumping routines for database 'nextcloud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 12:02:56
