

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
-- Table structure for table `t_b_book`
--

DROP TABLE IF EXISTS `t_b_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_book` (
  `id` varchar(36) NOT NULL,
  `bookname` varchar(30) DEFAULT NULL COMMENT '书名',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `booktype` varchar(2) DEFAULT NULL COMMENT '分类',
  `isbn` varchar(30) DEFAULT NULL COMMENT 'isbn',
  `pressname` varchar(30) DEFAULT NULL COMMENT '出版社名称',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_book`
--

LOCK TABLES `t_b_book` WRITE;
/*!40000 ALTER TABLE `t_b_book` DISABLE KEYS */;
INSERT INTO `t_b_book` VALUES ('402881e54592913801459292c5290001','Struts框架技术','王勇','8','111-1','动力节点','2'),('402881e54592913801459292c5b00002','spring框架技术','王勇','8','111-2','动力节点','2'),('402881e54592913801459292c5e70003','hibernate框架技术','王勇','8','111-3','动力节点','2'),('402881e54592913801459292c6080004','Java基础','杜聚宾','8','111-4','动力节点','2'),('402881e54592913801459292c6350005','Java零基础','吴士忠','8','111-5','动力节点','2'),('402881e54592913801459292c6560006','西游记','吴承恩','2','222-1','北京出版社','2'),('402881e54592913801459292c6770007','盗墓笔记','南派三叔','2','223-4','北京出版社','2'),('402881e54592913801459292c6980008','鬼吹灯','天下霸唱','2','234-5345','北京出版社','2'),('402881e54592913801459292c6b80009','艺术学概论','彭吉象','3','23-957','北京出版社','2'),('402881e54592913801459292c6da000a','灌篮高手','井上雄彦','1','9234-23','北京出版社','2'),('402881e54592913801459292c6fb000b','足球小将','高桥阳一','1','1928-578','北京出版社','2'),('402881e54592913801459292c71c000c','秘密','拜恩','4','389-34','北京出版社','2'),('402881e54592913801459292c73f000d','巧厨娘','孙春娜','5','34-34859','北京出版社','2'),('402881e54592913801459292c75f000e','人文在高处','熊培云','6','4398-348','北京出版社','2'),('402881e54592913801459292c782000f','金字塔原理','芭芭拉','7','3489-34','北京出版社','2'),('402881e54592913801459292c7a40010','小学生看图说话','博尔','9','283-23','北京出版社','2'),('402881e54592913801459292c7ce0011','成语词典','商务印馆研究中心','10','28748-9','北京出版社','2');
/*!40000 ALTER TABLE `t_b_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_lend`
--

DROP TABLE IF EXISTS `t_b_lend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_lend` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `bookid` varchar(36) DEFAULT NULL COMMENT '图书id',
  `bookname` varchar(30) DEFAULT NULL COMMENT '书名',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `isbn` varchar(30) DEFAULT NULL COMMENT 'isbn',
  `userid` varchar(36) DEFAULT NULL COMMENT '读者id',
  `realname` varchar(30) DEFAULT NULL COMMENT '读者姓名',
  `lenddate` datetime DEFAULT NULL COMMENT '借阅时间',
  `returndate` datetime DEFAULT NULL COMMENT '归还时间',
  `debit` decimal(5,2) DEFAULT '0.00' COMMENT '扣款',
  `totalcount` varchar(1) DEFAULT NULL COMMENT '续借次数',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `username` varchar(30) DEFAULT NULL COMMENT '读者编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_lend`
--

LOCK TABLES `t_b_lend` WRITE;
/*!40000 ALTER TABLE `t_b_lend` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_b_lend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_b_press`
--

DROP TABLE IF EXISTS `t_b_press`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_b_press` (
  `id` varchar(36) NOT NULL,
  `pressname` varchar(30) DEFAULT NULL COMMENT '出版社名称',
  `pressaddr` varchar(40) DEFAULT NULL COMMENT '出版社地址',
  `presstel` varchar(15) DEFAULT NULL COMMENT '出版社电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_b_press`
--

LOCK TABLES `t_b_press` WRITE;
/*!40000 ALTER TABLE `t_b_press` DISABLE KEYS */;
INSERT INTO `t_b_press` VALUES ('402881e5456863e9014568650c030001','动力节点','北京天通苑本四区10号楼4层','01084846003'),('402881e54582fed801458306164d0001','北京出版社','北京','01084846003');
/*!40000 ALTER TABLE `t_b_press` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_attachment`
--

DROP TABLE IF EXISTS `t_s_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_attachment` (
  `ID` varchar(32) NOT NULL,
  `attachmentcontent` longblob,
  `attachmenttitle` varchar(100) DEFAULT NULL,
  `businesskey` varchar(32) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `extend` varchar(32) DEFAULT NULL,
  `note` longtext,
  `realpath` varchar(100) DEFAULT NULL,
  `subclassname` longtext,
  `swfpath` longtext,
  `BUSENTITYNAME` varchar(100) DEFAULT NULL,
  `INFOTYPEID` varchar(32) DEFAULT NULL,
  `USERID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_mnq23hlc835n4ufgjl7nkn3bd` (`USERID`),
  CONSTRAINT `FK_mnq23hlc835n4ufgjl7nkn3bd` FOREIGN KEY (`USERID`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_attachment`
--

LOCK TABLES `t_s_attachment` WRITE;
/*!40000 ALTER TABLE `t_s_attachment` DISABLE KEYS */;
INSERT INTO `t_s_attachment` VALUES ('402881e5455f7eca01455f7f45a30008',NULL,'JR079839867R90000001000',NULL,NULL,'doc',NULL,'JR079839867R90000001000',NULL,'upload/files/20130719201109hDr31jP1.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45a60009',NULL,'JEECG平台协议',NULL,NULL,'docx',NULL,'JEECG平台协议',NULL,'upload/files/20130719201156sYHjSFJj.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45a7000a',NULL,'分析JEECG与其他的开源项目的不足和优势',NULL,NULL,'docx',NULL,'分析JEECG与其他的开源项目的不足和优势',NULL,'upload/files/20130719201727ZLEX1OSf.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45a8000b',NULL,'DMS-T3第三方租赁业务接口开发说明',NULL,NULL,'docx',NULL,'DMS-T3第三方租赁业务接口开发说明',NULL,'upload/files/20130719201841LzcgqUek.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45a9000c',NULL,'SAP-需求说明书-金融服务公司-第三方租赁业务需求V1.7-研发',NULL,NULL,'doc',NULL,'SAP-需求说明书-金融服务公司-第三方租赁业务需求V1.7-研发',NULL,'upload/files/20130719201925mkCrU47P.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45ac000d',NULL,'JEECG团队开发规范',NULL,NULL,'txt',NULL,'JEECG团队开发规范',NULL,'upload/files/20130724103633fvOTwNSV.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45ad000e',NULL,'第一模板',NULL,NULL,'doc',NULL,'第一模板',NULL,'upload/files/20130724104603pHDw4QUT.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45af000f',NULL,'github入门使用教程',NULL,NULL,'doc',NULL,'github入门使用教程',NULL,'upload/files/20130704200345EakUH3WB.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45b10010',NULL,'github入门使用教程',NULL,NULL,'doc',NULL,'github入门使用教程',NULL,'upload/files/20130704200651IE8wPdZ4.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45b20011',NULL,'（张代浩）-金融服务公司机构岗位职责与任职资格设置表(根据模板填写）',NULL,NULL,'xlsx',NULL,'（张代浩）-金融服务公司机构岗位职责与任职资格设置表(根据模板填写）',NULL,'upload/files/20130704201022KhdRW1Gd.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45b30012',NULL,'EIM201_CN',NULL,NULL,'pdf',NULL,'EIM201_CN',NULL,'upload/files/20130704201046JVAkvvOt.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45b60013',NULL,'github入门使用教程',NULL,NULL,'doc',NULL,'github入门使用教程',NULL,'upload/files/20130704201116Z8NhEK57.swf',NULL,NULL,NULL),('402881e5455f7eca01455f7f45b70014',NULL,'JEECGUI标签库帮助文档v3.2',NULL,NULL,'pdf',NULL,'JEECGUI标签库帮助文档v3.2',NULL,'upload/files/20130704201125DQg8hi2x.swf',NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_s_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_base_user`
--

DROP TABLE IF EXISTS `t_s_base_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_base_user` (
  `ID` varchar(32) NOT NULL,
  `activitiSync` smallint(6) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `signature` blob,
  `status` smallint(6) DEFAULT NULL,
  `userkey` varchar(200) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `departid` varchar(32) DEFAULT NULL,
  `debit` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`ID`),
  KEY `FK_15jh1g4iem1857546ggor42et` (`departid`),
  CONSTRAINT `FK_15jh1g4iem1857546ggor42et` FOREIGN KEY (`departid`) REFERENCES `t_s_depart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_base_user`
--

LOCK TABLES `t_s_base_user` WRITE;
/*!40000 ALTER TABLE `t_s_base_user` DISABLE KEYS */;
INSERT INTO `t_s_base_user` VALUES ('402881e5455f7eca01455f7f46290044',1,NULL,'c44b01947c9e6e3f','管理员',NULL,1,NULL,'admin','402881e5455f7eca01455f7f45b80015',100.00),('402881e54596fb2e014596fefd8c0001',NULL,NULL,'8f6958dabefcff2f','刘德华',NULL,1,NULL,'liu','402881e54586e3be014586ea3dc70007',100.00),('402881e54596fb2e014596fefefc0004',NULL,NULL,'283e0ba3d8220f7a','李连杰',NULL,1,NULL,'lee','402881e54586e3be014586ea3dc70007',100.00);
/*!40000 ALTER TABLE `t_s_base_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_config`
--

DROP TABLE IF EXISTS `t_s_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_config` (
  `ID` varchar(32) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `content` longtext,
  `name` varchar(100) NOT NULL,
  `note` longtext,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_m3q8r50ror4fl7fjkvd82tqgn` (`userid`),
  CONSTRAINT `FK_m3q8r50ror4fl7fjkvd82tqgn` FOREIGN KEY (`userid`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_config`
--

LOCK TABLES `t_s_config` WRITE;
/*!40000 ALTER TABLE `t_s_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_depart`
--

DROP TABLE IF EXISTS `t_s_depart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_depart` (
  `ID` varchar(32) NOT NULL,
  `departname` varchar(100) NOT NULL,
  `description` longtext,
  `parentdepartid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_knnm3wb0bembwvm0il7tf6686` (`parentdepartid`),
  CONSTRAINT `FK_knnm3wb0bembwvm0il7tf6686` FOREIGN KEY (`parentdepartid`) REFERENCES `t_s_depart` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_depart`
--

LOCK TABLES `t_s_depart` WRITE;
/*!40000 ALTER TABLE `t_s_depart` DISABLE KEYS */;
INSERT INTO `t_s_depart` VALUES ('402881e5455f7eca01455f7f45b80015','信息部','',NULL),('402881e54586e3be014586e9d8600005','教学部','',NULL),('402881e54586e3be014586ea3dc70007','信息工程系','','402881e54586e3be014586e9d8600005'),('402881e54586e3be014586ed46c00009','音乐系','','402881e54586e3be014586e9d8600005');
/*!40000 ALTER TABLE `t_s_depart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_document`
--

DROP TABLE IF EXISTS `t_s_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_document` (
  `documentstate` smallint(6) DEFAULT NULL,
  `documenttitle` varchar(100) DEFAULT NULL,
  `pictureindex` blob,
  `showhome` smallint(6) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `typeid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qr3qlmgkflj35m5ci1xv0vvg3` (`typeid`),
  KEY `FK_f2mc12eu0umghp2i70apmtxjl` (`id`),
  CONSTRAINT `FK_f2mc12eu0umghp2i70apmtxjl` FOREIGN KEY (`id`) REFERENCES `t_s_attachment` (`ID`),
  CONSTRAINT `FK_qr3qlmgkflj35m5ci1xv0vvg3` FOREIGN KEY (`typeid`) REFERENCES `t_s_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_document`
--

LOCK TABLES `t_s_document` WRITE;
/*!40000 ALTER TABLE `t_s_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_fileno`
--

DROP TABLE IF EXISTS `t_s_fileno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_fileno` (
  `ID` varchar(32) NOT NULL,
  `filenobefore` varchar(32) DEFAULT NULL,
  `filenonum` int(11) DEFAULT NULL,
  `filenotype` varchar(32) DEFAULT NULL,
  `filenoYear` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_fileno`
--

LOCK TABLES `t_s_fileno` WRITE;
/*!40000 ALTER TABLE `t_s_fileno` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_fileno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_function`
--

DROP TABLE IF EXISTS `t_s_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_function` (
  `ID` varchar(32) NOT NULL,
  `functioniframe` smallint(6) DEFAULT NULL,
  `functionlevel` smallint(6) DEFAULT NULL,
  `functionname` varchar(50) NOT NULL,
  `functionorder` varchar(255) DEFAULT NULL,
  `functionurl` varchar(100) DEFAULT NULL,
  `parentfunctionid` varchar(32) DEFAULT NULL,
  `iconid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_brd7b3keorj8pmxcv8bpahnxp` (`parentfunctionid`),
  KEY `FK_q5tqo3v4ltsp1pehdxd59rccx` (`iconid`),
  CONSTRAINT `FK_brd7b3keorj8pmxcv8bpahnxp` FOREIGN KEY (`parentfunctionid`) REFERENCES `t_s_function` (`ID`),
  CONSTRAINT `FK_q5tqo3v4ltsp1pehdxd59rccx` FOREIGN KEY (`iconid`) REFERENCES `t_s_icon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_function`
--

LOCK TABLES `t_s_function` WRITE;
/*!40000 ALTER TABLE `t_s_function` DISABLE KEYS */;
INSERT INTO `t_s_function` VALUES ('402881e5455f7eca01455f7f45d60019',NULL,0,'系统管理','5','',NULL,'402881e5455f7eca01455f7f45a00005'),('402881e5455f7eca01455f7f45d8001a',NULL,0,'统计查询','3','',NULL,'402881e5455f7eca01455f7f45a10007'),('402881e5455f7eca01455f7f45db001c',NULL,0,'系统监控','11','',NULL,'402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45de001d',NULL,1,'用户管理','5','userController.do?user','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45df001e',NULL,1,'角色管理','6','roleController.do?role','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45e0001f',NULL,1,'菜单管理','7','functionController.do?function','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45e30020',NULL,1,'数据字典','6','systemController.do?typeGroupList','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45e50021',NULL,1,'图标管理','18','iconController.do?icon','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45e60022',NULL,1,'部门管理','22','departController.do?depart','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45e80023',NULL,1,'地域管理','22','territoryController.do?territory','402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f459b0001'),('402881e5455f7eca01455f7f45f00027',NULL,1,'数据监控','11','dataSourceController.do?goDruid&isIframe','402881e5455f7eca01455f7f45db001c','402881e5455f7eca01455f7f459c0002'),('402881e5455f7eca01455f7f45f10028',NULL,1,'系统日志','21','logController.do?log','402881e5455f7eca01455f7f45db001c','402881e5455f7eca01455f7f459c0002'),('402881e5456824ef0145684a05c30004',NULL,0,'图书管理','2','',NULL,'402881e5455f7eca01455f7f459c0002'),('402881e5456824ef0145684b61b50006',NULL,1,'出版社管理','4','tBPressController.do?tBPress','402881e5456824ef0145684a05c30004','402881e5455f7eca01455f7f459c0002'),('402881e5456824ef0145684bf9ba0008',NULL,1,'书籍管理','3','tBBookController.do?tBBook','402881e5456824ef0145684a05c30004','402881e5455f7eca01455f7f459c0002'),('402881e5456824ef0145684c7501000a',NULL,1,'借阅管理','1','tBLendController.do?tBLend','402881e5456824ef0145684a05c30004','402881e5455f7eca01455f7f459c0002'),('402881e5458f055e01458f07ef1a0001',NULL,1,'图书种类','3','tBBookController.do?bookStatisticTabs','402881e5455f7eca01455f7f45d8001a','402881e5455f7eca01455f7f459b0001');
/*!40000 ALTER TABLE `t_s_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_icon`
--

DROP TABLE IF EXISTS `t_s_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_icon` (
  `ID` varchar(32) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `iconclas` varchar(200) DEFAULT NULL,
  `content` blob,
  `name` varchar(100) NOT NULL,
  `path` longtext,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_icon`
--

LOCK TABLES `t_s_icon` WRITE;
/*!40000 ALTER TABLE `t_s_icon` DISABLE KEYS */;
INSERT INTO `t_s_icon` VALUES ('402881e5455f7eca01455f7f45780000','png','back',NULL,'返回','plug-in/accordion/images/back.png',1),('402881e5455f7eca01455f7f459b0001','png','pie',NULL,'饼图','plug-in/accordion/images/pie.png',1),('402881e5455f7eca01455f7f459c0002','png','pictures',NULL,'图片','plug-in/accordion/images/pictures.png',1),('402881e5455f7eca01455f7f459d0003','png','pencil',NULL,'笔','plug-in/accordion/images/pencil.png',1),('402881e5455f7eca01455f7f459e0004','png','map',NULL,'地图','plug-in/accordion/images/map.png',1),('402881e5455f7eca01455f7f45a00005','png','group_add',NULL,'组','plug-in/accordion/images/group_add.png',1),('402881e5455f7eca01455f7f45a10006','png','calculator',NULL,'计算器','plug-in/accordion/images/calculator.png',1),('402881e5455f7eca01455f7f45a10007','png','folder',NULL,'文件夹','plug-in/accordion/images/folder.png',1);
/*!40000 ALTER TABLE `t_s_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_log`
--

DROP TABLE IF EXISTS `t_s_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_log` (
  `ID` varchar(32) NOT NULL,
  `broswer` varchar(100) DEFAULT NULL,
  `logcontent` longtext NOT NULL,
  `loglevel` smallint(6) DEFAULT NULL,
  `note` longtext,
  `operatetime` datetime NOT NULL,
  `operatetype` smallint(6) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oe64k4852uylhyc5a00rfwtay` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `t_s_operation`
--

DROP TABLE IF EXISTS `t_s_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_operation` (
  `ID` varchar(32) NOT NULL,
  `operationcode` varchar(50) DEFAULT NULL,
  `operationicon` varchar(100) DEFAULT NULL,
  `operationname` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `iconid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_pceuy41wr2fjbcilyc7mk3m1f` (`functionid`),
  KEY `FK_ny5de7922l39ta2pkhyspd5f` (`iconid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_operation`
--

LOCK TABLES `t_s_operation` WRITE;
/*!40000 ALTER TABLE `t_s_operation` DISABLE KEYS */;
INSERT INTO `t_s_operation` VALUES ('402881e5455f7eca01455f7f466c006a','add',NULL,'录入',NULL,'402881e5455f7eca01455f7f45f7002b','402881e5455f7eca01455f7f45780000'),('402881e5455f7eca01455f7f466e006b','edit',NULL,'编辑',NULL,'402881e5455f7eca01455f7f45f7002b','402881e5455f7eca01455f7f45780000'),('402881e5455f7eca01455f7f466f006c','del',NULL,'删除',NULL,'402881e5455f7eca01455f7f45f7002b','402881e5455f7eca01455f7f45780000'),('402881e5455f7eca01455f7f4670006d','szqm',NULL,'审核',NULL,'402881e5455f7eca01455f7f45f7002b','402881e5455f7eca01455f7f45780000'),('402881e5458d9f8a01458da059ef0001','return',NULL,'还书',1,'402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f45780000'),('402881e5458da3f101458da62fc10005','lendDel',NULL,'删除',1,'402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f45780000'),('402881e5458e04ff01458e09e82c0007','bookAdd',NULL,'添加',NULL,'402881e5456824ef0145684bf9ba0008','402881e5455f7eca01455f7f45780000'),('402881e5458e04ff01458e0a11870009','bookDel',NULL,'删除',NULL,'402881e5456824ef0145684bf9ba0008','402881e5455f7eca01455f7f45780000'),('402881e5458e04ff01458e0a3bb0000b','bookUp',NULL,'更新',NULL,'402881e5456824ef0145684bf9ba0008','402881e5455f7eca01455f7f45780000'),('402881e5458e04ff01458e0a6437000d','bookBatchDel',NULL,'批量删除',NULL,'402881e5456824ef0145684bf9ba0008','402881e5455f7eca01455f7f45780000'),('402881e54596fb2e01459703db13000b','lendAdd',NULL,'添加',NULL,'402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f45780000'),('402881e54596fb2e014597041250000d','lendUpdate',NULL,'更新',NULL,'402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f45780000'),('402881e54596fb2e014597043c31000f','lendAllDel',NULL,'批量删除',NULL,'402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f45780000');
/*!40000 ALTER TABLE `t_s_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_opintemplate`
--

DROP TABLE IF EXISTS `t_s_opintemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_opintemplate` (
  `ID` varchar(32) NOT NULL,
  `descript` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_opintemplate`
--

LOCK TABLES `t_s_opintemplate` WRITE;
/*!40000 ALTER TABLE `t_s_opintemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_opintemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_role`
--

DROP TABLE IF EXISTS `t_s_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role` (
  `ID` varchar(32) NOT NULL,
  `rolecode` varchar(10) DEFAULT NULL,
  `rolename` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_role`
--

LOCK TABLES `t_s_role` WRITE;
/*!40000 ALTER TABLE `t_s_role` DISABLE KEYS */;
INSERT INTO `t_s_role` VALUES ('402881e5455f7eca01455f7f46230042','admin','管理员'),('402881e545893b020145893dc9310001','reader','读者'),('402881e545967ec0014596b086d70002','libraryer','图书馆管理员');
/*!40000 ALTER TABLE `t_s_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_role_function`
--

DROP TABLE IF EXISTS `t_s_role_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_function` (
  `ID` varchar(32) NOT NULL,
  `operation` varchar(100) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fvsillj2cxyk5thnuu625urab` (`functionid`),
  KEY `FK_9dww3p4w8jwvlrgwhpitsbfif` (`roleid`),
  CONSTRAINT `FK_9dww3p4w8jwvlrgwhpitsbfif` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`),
  CONSTRAINT `FK_fvsillj2cxyk5thnuu625urab` FOREIGN KEY (`functionid`) REFERENCES `t_s_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_role_function`
--

LOCK TABLES `t_s_role_function` WRITE;
/*!40000 ALTER TABLE `t_s_role_function` DISABLE KEYS */;
INSERT INTO `t_s_role_function` VALUES ('402881e5455f7eca01455f7f467b0070',NULL,'402881e5455f7eca01455f7f45d60019','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f46820076',NULL,'402881e5455f7eca01455f7f45db001c','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f46850078',NULL,'402881e5455f7eca01455f7f45de001d','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f4687007a',NULL,'402881e5455f7eca01455f7f45df001e','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f4689007c',NULL,'402881e5455f7eca01455f7f45e0001f','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f468b007e',NULL,'402881e5455f7eca01455f7f45e30020','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f468d0080',NULL,'402881e5455f7eca01455f7f45e50021','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f46900082',NULL,'402881e5455f7eca01455f7f45e60022','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f46920084',NULL,'402881e5455f7eca01455f7f45e80023','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f469a008c',NULL,'402881e5455f7eca01455f7f45f00027','402881e5455f7eca01455f7f46230042'),('402881e5455f7eca01455f7f469c008e',NULL,'402881e5455f7eca01455f7f45f10028','402881e5455f7eca01455f7f46230042'),('402881e5456824ef0145684cba15000c','bookAdd,bookDel,bookUp,bookBatchDel,','402881e5456824ef0145684bf9ba0008','402881e5455f7eca01455f7f46230042'),('402881e5456824ef0145684cba16000d',NULL,'402881e5456824ef0145684b61b50006','402881e5455f7eca01455f7f46230042'),('402881e5456824ef0145684cba16000e',NULL,'402881e5456824ef0145684a05c30004','402881e5455f7eca01455f7f46230042'),('402881e5456824ef0145684cba16000f','return,lendDel,lendAdd,lendUpdate,lendAllDel,','402881e5456824ef0145684c7501000a','402881e5455f7eca01455f7f46230042'),('402881e545893b020145893e46120003',NULL,'402881e5456824ef0145684c7501000a','402881e545893b020145893dc9310001'),('402881e545893b020145893e46620004',NULL,'402881e5456824ef0145684a05c30004','402881e545893b020145893dc9310001'),('402881e5458e04ff01458e0ac6de000f',NULL,'402881e5456824ef0145684bf9ba0008','402881e545893b020145893dc9310001'),('402881e5458ebff601458ec1a9cc0002',NULL,'402881e5455f7eca01455f7f45d8001a','402881e5455f7eca01455f7f46230042'),('402881e5458f055e01458f0819db0003',NULL,'402881e5458f055e01458f07ef1a0001','402881e5455f7eca01455f7f46230042'),('402881e545967ec0014596b11fe70005',NULL,'402881e5455f7eca01455f7f45d8001a','402881e545967ec0014596b086d70002'),('402881e545967ec0014596b11fe90006',NULL,'402881e5458f055e01458f07ef1a0001','402881e545967ec0014596b086d70002'),('402881e545967ec0014596b11fe90007',NULL,'402881e5456824ef0145684bf9ba0008','402881e545967ec0014596b086d70002'),('402881e545967ec0014596b11fe90008',NULL,'402881e5456824ef0145684b61b50006','402881e545967ec0014596b086d70002'),('402881e545967ec0014596b11fea0009','return,lendDel,lendAdd,lendUpdate,lendAllDel,','402881e5456824ef0145684c7501000a','402881e545967ec0014596b086d70002'),('402881e545967ec0014596b11fea000a',NULL,'402881e5456824ef0145684a05c30004','402881e545967ec0014596b086d70002');
/*!40000 ALTER TABLE `t_s_role_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_role_user`
--

DROP TABLE IF EXISTS `t_s_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_role_user` (
  `ID` varchar(32) NOT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_n2ucxeorvpjy7qhnmuem01kbx` (`roleid`),
  KEY `FK_d4qb5xld2pfb0bkjx9iwtolda` (`userid`),
  CONSTRAINT `FK_d4qb5xld2pfb0bkjx9iwtolda` FOREIGN KEY (`userid`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `FK_n2ucxeorvpjy7qhnmuem01kbx` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_role_user`
--

LOCK TABLES `t_s_role_user` WRITE;
/*!40000 ALTER TABLE `t_s_role_user` DISABLE KEYS */;
INSERT INTO `t_s_role_user` VALUES ('402881e5455f7eca01455f7f46d600c2','402881e5455f7eca01455f7f46230042','402881e5455f7eca01455f7f46290044'),('402881e5455f7eca01455f7f46d800c3','402881e5455f7eca01455f7f46230042','402881e5455f7eca01455f7f46290044'),('402881e54596fb2e014596fefe830002','402881e545893b020145893dc9310001','402881e54596fb2e014596fefd8c0001'),('402881e54596fb2e014596feff390005','402881e545893b020145893dc9310001','402881e54596fb2e014596fefefc0004');
/*!40000 ALTER TABLE `t_s_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_territory`
--

DROP TABLE IF EXISTS `t_s_territory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_territory` (
  `ID` varchar(32) NOT NULL,
  `territorycode` varchar(10) NOT NULL,
  `territorylevel` smallint(6) NOT NULL,
  `territoryname` varchar(50) NOT NULL,
  `territory_pinyin` varchar(40) DEFAULT NULL,
  `territorysort` varchar(3) NOT NULL,
  `x_wgs84` double NOT NULL,
  `y_wgs84` double NOT NULL,
  `territoryparentid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_territory`
--

LOCK TABLES `t_s_territory` WRITE;
/*!40000 ALTER TABLE `t_s_territory` DISABLE KEYS */;
INSERT INTO `t_s_territory` VALUES ('1','100',1,'全国','qg','0',106.258754,38.471318,'0'),('10','00000016',2,'河南省','HNS','0',113.687228,34.76819,'1'),('100','371300',3,'临沂市','LYS','0',118.356448,35.104672,'18'),('1000','370903',4,'岱岳区','DYQ','0',117.041582,36.18799,'96'),('1001','370921',4,'宁阳县','NYX','0',116.805797,35.758787,'96'),('1002','370923',4,'东平县','DPX','0',116.470304,35.937102,'96'),('1003','370982',4,'新泰市','XTS','0',117.767953,35.909032,'96'),('1004','370983',4,'肥城市','FCS','0',116.768358,36.182571,'96'),('1005','371002',4,'环翠区','HCQ','0',122.123444,37.501991,'97'),('1006','371081',4,'文登市','WDS','0',122.058128,37.1939129,'97'),('1007','371082',4,'荣成市','RCS','0',122.486676,37.165249,'97'),('1008','371083',4,'乳山市','RSS','0',121.539764,36.919816,'97'),('1009','371102',4,'东港区','DGQ','0',119.462228,35.425475,'98'),('101','371400',3,'德州市','DZS','0',116.357465,37.434093,'18'),('1010','371103',4,'岚山区','LSQ','0',119.318813,35.121816,'98'),('1011','371121',4,'五莲县','WLX','0',119.208744,35.750095,'98'),('1012','371122',4,'莒县','JX','0',118.837131,35.579868,'98'),('1013','371202',4,'莱城区','LCQ','0',117.659864,36.203208,'99'),('1014','371203',4,'钢城区','GCQ','0',117.811355,36.058572,'99'),('1015','371302',4,'兰山区','LSQ','0',118.347707,35.051729,'100'),('1016','371311',4,'罗庄区','LZQ','0',118.284786,34.996741,'100'),('1017','371312',4,'河东区','HDQ','0',118.402893,35.089917,'100'),('1018','371321',4,'沂南县','YNX','0',118.465213,35.549976,'100'),('1019','371322',4,'郯城县','TCX','0',118.367263,34.613557,'100'),('102','371500',3,'聊城市','LCS','0',115.985371,36.4567039,'18'),('1020','371323',4,'沂水县','YSX','0',118.627918,35.79045,'100'),('1021','371324',4,'苍山县','CSX','0',118.07065,34.857149,'100'),('1022','371325',4,'费县','FX','0',117.977868,35.26634,'100'),('1023','371326',4,'平邑县','PYX','0',117.640352,35.5059429,'100'),('1024','371327',4,'莒南县','JNX','0',118.835163,35.174846,'100'),('1025','371328',4,'蒙阴县','MYX','0',117.945085,35.710032,'100'),('1026','371329',4,'临沭县','LSX','0',118.650782,34.919852,'100'),('1027','371402',4,'德城区','DCQ','0',116.299434,37.451272,'101'),('1028','371421',4,'陵县','LX','0',116.576176,37.33579,'101'),('1029','371422',4,'宁津县','NJX','0',116.800324,37.652329,'101'),('103','371600',3,'滨州市','BZS','0',117.970703,37.38199,'18'),('1030','371423',4,'庆云县','QYX','0',117.385123,37.77539,'101'),('1031','371424',4,'临邑县','LYX','0',116.86665,37.189864,'101'),('1032','371425',4,'齐河县','QHX','0',116.758917,36.795011,'101'),('1033','371426',4,'平原县','PYX','0',116.434187,37.165419,'101'),('1034','371427',4,'夏津县','XJX','0',116.001726,36.948371,'101'),('1035','371428',4,'武城县','WCX','0',116.069302,37.213311,'101'),('1036','371481',4,'乐陵市','LLS','0',117.231935,37.729907,'101'),('1037','371482',4,'禹城市','YCS','0',116.638387,36.934259,'101'),('1038','371502',4,'东昌府区','DCFQ','0',115.988484,36.434697,'102'),('1039','371521',4,'阳谷县','YGX','0',115.79182,36.114392,'102'),('104','371700',3,'菏泽市','HZS','0',115.480656,35.23375,'18'),('1040','371522',4,'莘县','SX','0',115.671191,36.233599,'102'),('1041','371523',4,'茌平县','CPX','0',116.255282,36.5807639,'102'),('1042','371524',4,'东阿县','DAX','0',116.24758,36.334917,'102'),('1043','371525',4,'冠县','GX','0',115.44274,36.484009,'102'),('1044','371526',4,'高唐县','GTX','0',116.231478,36.866062,'102'),('1045','371581',4,'临清市','LQS','0',115.704881,36.838277,'102'),('1046','371602',4,'滨城区','BCQ','0',118.019146,37.43206,'103'),('1047','371621',4,'惠民县','HMX','0',117.510451,37.489769,'103'),('1048','371622',4,'阳信县','YXX','0',117.578262,37.641106,'103'),('1049','371623',4,'无棣县','WDX','0',117.625696,37.770261,'103'),('1050','371624',4,'沾化县','ZHX','0',118.132199,37.698281,'103'),('1051','371625',4,'博兴县','BXX','0',118.131815,37.150226,'103'),('1052','371626',4,'邹平县','ZPX','0',117.743109,36.862989,'103'),('1053','371702',4,'牡丹区','MDQ','0',115.417827,35.252512,'104'),('1054','371721',4,'曹县','CX','0',115.542328,34.825508,'104'),('1055','371722',4,'单县','DX','0',116.107428,34.778808,'104'),('1056','371723',4,'成武县','CWX','0',115.889765,34.952459,'104'),('1057','371724',4,'巨野县','JYX','0',116.094674,35.396261,'104'),('1058','371725',4,'郓城县','YCX','0',115.943613,35.599758,'104'),('1059','371726',4,'鄄城县','JCX','0',115.510193,35.563408,'104'),('1060','371727',4,'定陶县','DTX','0',115.573094,35.071,'104'),('1061','371728',4,'东明县','DMX','0',115.089905,35.289368,'104'),('11','00000008',2,'黑龙江省','HLJS','0',126.662507,45.7421699,'1'),('12','20000000',2,'上海市','SHS','0',121.473704,31.230393,'1'),('13','00000010',2,'江苏省','JSS','0',118.763232,32.061707,'1'),('14','00000011',2,'浙江省','ZJS','0',120.153676,30.26586,'1'),('15','00000012',2,'安徽省','AHS','0',117.284923,31.861184,'1'),('16','00000013',2,'福建省','FJS','0',119.296506,26.099933,'1'),('17','00000014',2,'江西省','JXS','0',115.909175,28.674424,'1'),('1739','360102',4,'东湖区','DHQ','0',115.89901,28.6849159,'184'),('1740','360103',4,'西湖区','XHQ','0',115.877287,28.656887,'184'),('1741','360104',4,'青云谱区','QYPQ','0',115.925749,28.621169,'184'),('1742','360105',4,'湾里区','WLQ','0',115.730994,28.714869,'184'),('1743','360111',4,'青山湖区','QSHQ','0',115.962144,28.682985,'184'),('1744','360121',4,'南昌县','NCX','0',115.944162,28.545459,'184'),('1745','360122',4,'新建县','XJX','0',115.815233,28.692437,'184'),('1746','360123',4,'安义县','AYX','0',115.549199,28.844429,'184'),('1747','360124',4,'进贤县','JXX','0',116.240924,28.376918,'184'),('1748','360202',4,'昌江区','CJQ','0',117.183688,29.27342,'185'),('1749','360203',4,'珠山区','ZSQ','0',117.202336,29.301272,'185'),('1750','360222',4,'浮梁县','FLX','0',117.215061,29.351739,'185'),('1751','360281',4,'乐平市','LPS','0',117.129169,28.961902,'185'),('1752','360302',4,'安源区','AYQ','0',113.87073,27.615202,'186'),('1753','360313',4,'湘东区','XDQ','0',113.733059,27.640075,'186'),('1754','360321',4,'莲花县','LHX','0',113.961465,27.127669,'186'),('1755','360322',4,'上栗县','SLX','0',113.795219,27.880567,'186'),('1756','360323',4,'芦溪县','LXX','0',114.029595,27.631145,'186'),('1757','360402',4,'庐山区','LSQ','0',115.989212,29.671775,'187'),('1758','360403',4,'浔阳区','XYQ','0',115.990399,29.72746,'187'),('1759','360421',4,'九江县','JJX','0',115.911314,29.608456,'187'),('1760','360423',4,'武宁县','WNX','0',115.100579,29.256323,'187'),('1761','360424',4,'修水县','XSX','0',114.547356,29.025707,'187'),('1762','360425',4,'永修县','YXX','0',115.809111,29.021824,'187'),('1763','360426',4,'德安县','DAX','0',115.756883,29.314348,'187'),('1764','360427',4,'星子县','XZX','0',116.044893,29.448037,'187'),('1765','360428',4,'都昌县','DCX','0',116.204099,29.273194,'187'),('1766','360429',4,'湖口县','HKX','0',116.220266,29.73944,'187'),('1767','360430',4,'彭泽县','PZX','0',116.549359,29.896061,'187'),('1768','360481',4,'瑞昌市','RCS','0',115.681504,29.673795,'187'),('1769','360499',4,'共青城','GQC','0',115.774,29.2417,'187'),('1770','360502',4,'渝水区','YSQ','0',114.944574,27.80038,'188'),('1771','360521',4,'分宜县','FYX','0',114.692039,27.814628,'188'),('1772','360602',4,'月湖区','YHQ','0',117.036676,28.238797,'189'),('1773','360622',4,'余江县','YJX','0',116.818871,28.204174,'189'),('1774','360681',4,'贵溪市','GXS','0',117.245497,28.292519,'189'),('1775','360702',4,'章贡区','ZGQ','0',114.941826,25.862827,'190'),('1776','360721',4,'赣县','GX','0',115.011561,25.860691,'190'),('1777','360722',4,'信丰县','XFX','0',114.922963,25.386278,'190'),('1778','360723',4,'大余县','DYX','0',114.362094,25.401283,'190'),('1779','360724',4,'上犹县','SYX','0',114.551371,25.784978,'190'),('1780','360725',4,'崇义县','CYX','0',114.308273,25.681879,'190'),('1781','360726',4,'安远县','AYX','0',115.393922,25.136925,'190'),('1782','360727',4,'龙南县','LNX','0',114.789811,24.911107,'190'),('1783','360728',4,'定南县','DNX','0',115.027845,24.78441,'190'),('1784','360729',4,'全南县','QNX','0',114.530125,24.742401,'190'),('1785','360730',4,'宁都县','NDX','0',116.009472,26.470116,'190'),('1786','360731',4,'于都县','YDX','0',115.41551,25.952066,'190'),('1787','360732',4,'兴国县','XGX','0',115.36319,26.337937,'190'),('1788','360733',4,'会昌县','HCX','0',115.786057,25.600272,'190'),('1789','360734',4,'寻乌县','YWX','0',115.646525,24.963322,'190'),('1790','360735',4,'石城县','SCX','0',116.354201,26.32686,'190'),('1791','360781',4,'瑞金市','RJS','0',116.02713,25.885561,'190'),('1792','360782',4,'南康市','NKS','0',114.765238,25.661356,'190'),('1793','360802',4,'吉州区','JZQ','0',114.994307,27.129975,'191'),('1794','360803',4,'青原区','QYQ','0',115.01424,27.081719,'191'),('1795','360821',4,'吉安县','JAX','0',114.907659,27.040142,'191'),('1796','360822',4,'吉水县','JSX','0',115.135507,27.229632,'191'),('1797','360823',4,'峡江县','XJX','0',115.316566,27.582901,'191'),('1798','360824',4,'新干县','XGX','0',115.393043,27.740809,'191'),('1799','360825',4,'永丰县','YFX','0',115.441477,27.317869,'191'),('18','00000015',2,'山东省','SDS','0',117.020411,36.668627,'1'),('1800','360826',4,'泰和县','THX','0',114.908861,26.790231,'191'),('1801','360827',4,'遂川县','SCX','0',114.52098,26.311894,'191'),('1802','360828',4,'万安县','WAX','0',114.786256,26.458257,'191'),('1803','360829',4,'安福县','AFX','0',114.619893,27.392874,'191'),('1804','360830',4,'永新县','YXX','0',114.242675,26.945233,'191'),('1805','360881',4,'井冈山市','JGSS','0',114.289182,26.748186,'191'),('1806','360902',4,'袁州区','YZQ','0',114.424657,27.798846,'192'),('1807','360921',4,'奉新县','FXX','0',115.384904,28.700806,'192'),('1808','360922',4,'万载县','WZX','0',114.447551,28.10455,'192'),('1809','360923',4,'上高县','SGX','0',114.924494,28.232827,'192'),('1810','360924',4,'宜丰县','YFX','0',114.803542,28.393613,'192'),('1811','360925',4,'靖安县','JAX','0',115.362629,28.861475,'192'),('1812','360926',4,'铜鼓县','TGX','0',114.37098,28.520747,'192'),('1813','360981',4,'丰城市','FCS','0',115.771195,28.159325,'192'),('1814','360982',4,'樟树市','ZSS','0',115.546063,28.055796,'192'),('1815','360983',4,'高安市','GAS','0',115.375618,28.417261,'192'),('1816','361002',4,'临川区','LCQ','0',116.31136,27.934529,'193'),('1817','361021',4,'南城县','NCX','0',116.644658,27.552748,'193'),('1818','361022',4,'黎川县','LCX','0',116.907508,27.282382,'193'),('1819','361023',4,'南丰县','NFX','0',116.525725,27.218445,'193'),('1820','361024',4,'崇仁县','CRX','0',116.061164,27.764681,'193'),('1821','361025',4,'乐安县','LAX','0',115.837895,27.420441,'193'),('1822','361026',4,'宜黄县','YHX','0',116.222128,27.546146,'193'),('1823','361027',4,'金溪县','JXX','0',116.775435,27.908337,'193'),('1824','361028',4,'资溪县','ZXX','0',117.060264,27.706102,'193'),('1825','361029',4,'东乡县','DXX','0',116.590465,28.236118,'193'),('1826','361030',4,'广昌县','GCX','0',116.325757,26.837267,'193'),('1827','361102',4,'信州区','XZQ','0',117.966823,28.43121,'194'),('1828','361121',4,'上饶县','SRX','0',117.90785,28.448983,'194'),('1829','361122',4,'广丰县','GFX','0',118.19124,28.436286,'194'),('1830','361123',4,'玉山县','YSX','0',118.245124,28.682055,'194'),('1831','361124',4,'铅山县','QSX','0',117.709451,28.315217,'194'),('1832','361125',4,'横峰县','HFX','0',117.596452,28.407118,'194'),('1833','361126',4,'弋阳县','YYX','0',117.449588,28.378044,'194'),('1834','361127',4,'余干县','YGX','0',116.695647,28.702302,'194'),('1835','361128',4,'鄱阳县','PYX','0',116.699746,29.011699,'194'),('1836','361129',4,'万年县','WNX','0',117.058445,28.694582,'194'),('1837','361130',4,'婺源县','WYX','0',117.861911,29.2480249,'194'),('1838','361181',4,'德兴市','DXS','0',117.578713,28.946464,'194'),('1839','370102',4,'历下区','LXQ','0',117.07653,36.666344,'195'),('184','360100',3,'南昌市','NCS','0',115.858089,28.68316,'17'),('1840','370103',4,'市中区','SZQ','0',116.997475,36.6511749,'195'),('1841','370104',4,'槐荫区','HYQ','0',116.90113,36.651301,'195'),('1842','370105',4,'天桥区','TQQ','0',116.987492,36.678016,'195'),('1843','370112',4,'历城区','LCQ','0',117.065222,36.680171,'195'),('185','360200',3,'景德镇市','JDZS','0',117.17842,29.268836,'17'),('186','360300',3,'萍乡市','PXS','0',113.854676,27.622865,'17'),('187','360400',3,'九江市','JJS','0',116.001951,29.705103,'17'),('188','360500',3,'新余市','XYS','0',114.91741,27.817819,'17'),('189','360600',3,'鹰潭市','YTS','0',117.069202,28.260189,'17'),('19','00000017',2,'湖北省','HBS','0',114.341921,30.545861,'1'),('190','360700',3,'赣州市','GZS','0',114.935025,25.831925,'17'),('191','360800',3,'吉安市','JAS','0',114.992912,27.113039,'17'),('192','360900',3,'宜春市','YCS','0',114.416778,27.815619,'17'),('193','361000',3,'抚州市','FZS','0',116.358176,27.9492,'17'),('194','361100',3,'上饶市','SRS','0',117.943433,28.454863,'17'),('195','370100',3,'济南市','JNS','0',116.994917,36.665282,'18'),('20','00000018',2,'湖南省','HNS','0',112.98381,28.112444,'1'),('21','40000000',2,'重庆市','ZQS','0',106.551557,29.56301,'1'),('22','00000022',2,'四川省','SCS','0',104.075931,30.651652,'1'),('23','00000019',2,'广东省','GDS','0',113.266531,23.132191,'1'),('24','00000020',2,'广西壮族自治区','GXZZZZQ','0',108.327546,22.815478,'1'),('25','00000021',2,'海南省','HNS','0',110.349229,20.017378,'1'),('26','810000',2,'香港特别行政区','XGTBXZQ','0',114.109497,22.396428,'1'),('27','820000',2,'澳门特别行政区','AMTBXZQ','0',113.543873,22.198745,'1'),('28','00000023',2,'贵州省','GZS','0',106.707116,26.598026,'1'),('29','00000024',2,'云南省','YNS','0',102.709812,25.045359,'1'),('3','00000006',2,'辽宁省','LNS','0',123.42944,41.835441,'1'),('30','00000025',2,'西藏自治区','XCZZQ','0',91.1170059,29.647951,'1'),('31','00000026',2,'陕西省','SXS','0',108.954239,34.265472,'1'),('32','00000027',2,'甘肃省','GSS','0',103.826308,36.059421,'1'),('33','00000028',2,'青海省','QHS','0',101.780199,36.620901,'1'),('34','00000029',2,'宁夏回族自治区','NXHZZZQ','0',106.258754,38.471318,'1'),('35','00000030',2,'新疆维吾尔自治区','XJWWEZZQ','0',87.6278119,43.793028,'1'),('4','00000007',2,'吉林省','JLS','0',125.326065,43.896082,'1'),('5','10000000',2,'北京市','BJS','0',116.407413,39.904214,'1'),('6','30000000',2,'天津市','TJS','0',117.200983,39.084158,'1'),('7','00000003',2,'河北省','HBS','0',114.468665,38.037057,'1'),('8','00000004',2,'山西省','SXS','0',112.562569,37.873376,'1'),('89','370200',3,'青岛市','QDS','0',120.382504,36.06722,'18'),('9','00000005',2,'内蒙古自治区','NMGZZQ','0',111.765618,40.817498,'1'),('90','370300',3,'淄博市','ZBS','0',118.055007,36.813497,'18'),('91','370400',3,'枣庄市','ZZS','0',117.323725,34.810488,'18'),('92','370500',3,'东营市','DYS','0',118.674767,37.434751,'18'),('926','370113',4,'长清区','CQQ','0',116.751959,36.553691,'195'),('927','370124',4,'平阴县','PYX','0',116.456187,36.289265,'195'),('928','370125',4,'济阳县','JYX','0',117.173529,36.978547,'195'),('929','370126',4,'商河县','SHX','0',117.157183,37.309045,'195'),('93','370600',3,'烟台市','YTS','0',121.447926,37.463819,'18'),('930','370181',4,'章丘市','ZQS','0',117.534326,36.714015,'195'),('931','370202',4,'市南区','SNQ','0',120.412392,36.075651,'89'),('932','370203',4,'市北区','SBQ','0',120.374801,36.087661,'89'),('933','370205',4,'四方区','SFQ','0',120.366454,36.103993,'89'),('934','370211',4,'黄岛区','HDQ','0',120.198054,35.960935,'89'),('935','370212',4,'崂山区','LSQ','0',120.468956,36.107538,'89'),('936','370213',4,'李沧区','LCQ','0',120.432864,36.145476,'89'),('937','370214',4,'城阳区','CYQ','0',120.396529,36.307061,'89'),('938','370281',4,'胶州市','JZS','0',120.033345,36.264664,'89'),('939','370282',4,'即墨市','JMS','0',120.447162,36.389401,'89'),('94','370700',3,'潍坊市','WFS','0',119.16193,36.706691,'18'),('940','370283',4,'平度市','PDS','0',119.960014,36.7867,'89'),('941','370284',4,'胶南市','JNS','0',120.04643,35.8725,'89'),('942','370285',4,'莱西市','LXS','0',120.51769,36.889084,'89'),('943','370302',4,'淄川区','ZCQ','0',117.966842,36.643449,'90'),('944','370303',4,'张店区','ZDQ','0',118.017656,36.806773,'90'),('945','370304',4,'博山区','BSQ','0',117.861698,36.494752,'90'),('946','370305',4,'临淄区','LZQ','0',118.308977,36.827343,'90'),('947','370306',4,'周村区','ZCQ','0',117.869877,36.803109,'90'),('948','370321',4,'桓台县','HTX','0',118.097955,36.959623,'90'),('949','370322',4,'高青县','GQX','0',117.826916,37.171063,'90'),('95','370800',3,'济宁市','JNS','0',116.587099,35.414921,'18'),('950','370323',4,'沂源县','YYX','0',118.170979,36.184827,'90'),('951','370402',4,'市中区','SZQ','0',117.556124,34.864114,'91'),('952','370403',4,'薛城区','YCQ','0',117.263157,34.795206,'91'),('953','370404',4,'峄城区','YCQ','0',117.590819,34.772236,'91'),('954','370405',4,'台儿庄区','TEZQ','0',117.733832,34.562528,'91'),('955','370406',4,'山亭区','STQ','0',117.461343,35.099549,'91'),('956','370481',4,'滕州市','TZS','0',117.164388,35.084021,'91'),('957','370502',4,'东营区','DYQ','0',118.582184,37.448964,'92'),('958','370503',4,'河口区','HKQ','0',118.525579,37.886138,'92'),('959','370521',4,'垦利县','KLX','0',118.547627,37.58754,'92'),('960','370522',4,'利津县','LJX','0',118.255273,37.49026,'92'),('961','370523',4,'广饶县','GRX','0',118.407045,37.0537,'92'),('962','370602',4,'芝罘区','ZFQ','0',121.400031,37.540687,'93'),('963','370611',4,'福山区','FSQ','0',121.267697,37.498051,'93'),('964','370612',4,'牟平区','MPQ','0',121.600512,37.386901,'93'),('965','370613',4,'莱山区','LSQ','0',121.445304,37.511305,'93'),('966','370614',4,'开发区','KFQ','0',121.251001,37.554683,'93'),('967','370634',4,'长岛县','CDX','0',120.736584,37.921417,'93'),('968','370681',4,'龙口市','LKS','0',120.477836,37.646064,'93'),('969','370682',4,'莱阳市','LYS','0',120.711607,36.97891,'93'),('970','370683',4,'莱州市','LZS','0',119.942327,37.177017,'93'),('971','370684',4,'蓬莱市','PLS','0',120.758848,37.810661,'93'),('972','370685',4,'招远市','ZYS','0',120.434072,37.355469,'93'),('973','370686',4,'栖霞市','QXS','0',120.849675,37.335123,'93'),('974','370687',4,'海阳市','HYS','0',121.158477,36.776425,'93'),('975','370702',4,'潍城区','WCQ','0',119.024836,36.7281,'94'),('976','370703',4,'寒亭区','HTQ','0',119.219734,36.775491,'94'),('977','370704',4,'坊子区','FZQ','0',119.166485,36.654448,'94'),('978','370705',4,'奎文区','KWQ','0',119.132486,36.707676,'94'),('979','370724',4,'临朐县','LQX','0',118.542982,36.5125059,'94'),('980','370725',4,'昌乐县','CLX','0',118.829914,36.706945,'94'),('981','370781',4,'青州市','QZS','0',118.479622,36.684528,'94'),('982','370782',4,'诸城市','ZCS','0',119.410103,35.995654,'94'),('983','370783',4,'寿光市','SGS','0',118.790652,36.85548,'94'),('984','370784',4,'安丘市','AQS','0',119.218978,36.478494,'94'),('985','370785',4,'高密市','GMS','0',119.755597,36.3825949,'94'),('986','370786',4,'昌邑市','CYS','0',119.398525,36.85882,'94'),('987','370802',4,'市中区','SZQ','0',116.596614,35.40819,'95'),('988','370811',4,'任城区','RCQ','0',116.628562,35.433727,'95'),('989','370826',4,'微山县','WSX','0',117.128946,34.8071,'95'),('990','370827',4,'鱼台县','YTX','0',116.650608,35.012749,'95'),('991','370828',4,'金乡县','JXX','0',116.311532,35.06662,'95'),('992','370829',4,'嘉祥县','JXX','0',116.342442,35.407829,'95'),('993','370830',4,'汶上县','WSX','0',116.489043,35.732799,'95'),('994','370831',4,'泗水县','SSX','0',117.251195,35.664323,'95'),('995','370832',4,'梁山县','LSX','0',116.096044,35.802306,'95'),('996','370881',4,'曲阜市','QFS','0',116.986532,35.581137,'95'),('997','370882',4,'兖州市','YZS','0',116.783834,35.553144,'95'),('998','370883',4,'邹城市','ZCS','0',117.003743,35.405185,'95'),('999','370902',4,'泰山区','TSQ','0',117.135354,36.192084,'96');
/*!40000 ALTER TABLE `t_s_territory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_timetask`
--

DROP TABLE IF EXISTS `t_s_timetask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_timetask` (
  `ID` varchar(32) NOT NULL,
  `CREATE_BY` varchar(32) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `CREATE_NAME` varchar(32) DEFAULT NULL,
  `CRON_EXPRESSION` varchar(100) NOT NULL,
  `IS_EFFECT` varchar(1) NOT NULL,
  `IS_START` varchar(1) NOT NULL,
  `TASK_DESCRIBE` varchar(50) NOT NULL,
  `TASK_ID` varchar(100) NOT NULL,
  `UPDATE_BY` varchar(32) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `UPDATE_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_timetask`
--

LOCK TABLES `t_s_timetask` WRITE;
/*!40000 ALTER TABLE `t_s_timetask` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_s_timetask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_type`
--

DROP TABLE IF EXISTS `t_s_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_type` (
  `ID` varchar(32) NOT NULL,
  `typecode` varchar(50) DEFAULT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `typepid` varchar(32) DEFAULT NULL,
  `typegroupid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nw2b22gy7plh7pqows186odmq` (`typepid`),
  KEY `FK_3q40mr4ebtd0cvx79matl39x1` (`typegroupid`),
  CONSTRAINT `FK_3q40mr4ebtd0cvx79matl39x1` FOREIGN KEY (`typegroupid`) REFERENCES `t_s_typegroup` (`ID`),
  CONSTRAINT `FK_nw2b22gy7plh7pqows186odmq` FOREIGN KEY (`typepid`) REFERENCES `t_s_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_type`
--

LOCK TABLES `t_s_type` WRITE;
/*!40000 ALTER TABLE `t_s_type` DISABLE KEYS */;
INSERT INTO `t_s_type` VALUES ('402881e5455f7eca01455f7f464f0052','2','菜单图标',NULL,'402881e5455f7eca01455f7f46320048'),('402881e5455f7eca01455f7f46510053','1','系统图标',NULL,'402881e5455f7eca01455f7f46320048'),('402881e5455f7eca01455f7f46520054','files','附件',NULL,'402881e5455f7eca01455f7f46410050'),('402881e5455f7eca01455f7f465b005b','single','单条件查询',NULL,'402881e5455f7eca01455f7f463b004c'),('402881e5455f7eca01455f7f465c005c','group','范围查询',NULL,'402881e5455f7eca01455f7f463b004c'),('402881e5455f7eca01455f7f465d005d','Y','是',NULL,'402881e5455f7eca01455f7f463d004d'),('402881e5455f7eca01455f7f465e005e','N','否',NULL,'402881e5455f7eca01455f7f463d004d'),('402881e5455f7eca01455f7f465e005f','Integer','Integer',NULL,'402881e5455f7eca01455f7f463e004e'),('402881e5455f7eca01455f7f465f0060','Date','Date',NULL,'402881e5455f7eca01455f7f463e004e'),('402881e5455f7eca01455f7f46600061','String','String',NULL,'402881e5455f7eca01455f7f463e004e'),('402881e5455f7eca01455f7f46610062','Long','Long',NULL,'402881e5455f7eca01455f7f463e004e'),('402881e5455f7eca01455f7f46620063','act','工作流引擎表',NULL,'402881e5455f7eca01455f7f463f004f'),('402881e5455f7eca01455f7f46630064','t_s','系统基础表',NULL,'402881e5455f7eca01455f7f463f004f'),('402881e5455f7eca01455f7f46640065','t_b','业务表',NULL,'402881e5455f7eca01455f7f463f004f'),('402881e5455f7eca01455f7f46660066','t_p','自定义引擎表',NULL,'402881e5455f7eca01455f7f463f004f'),('402881e5455f7eca01455f7f46660067','news','新闻',NULL,'402881e5455f7eca01455f7f46410050'),('402881e5455f7eca01455f7f46670068','0','男性',NULL,'402881e5455f7eca01455f7f46420051'),('402881e5455f7eca01455f7f46680069','1','女性',NULL,'402881e5455f7eca01455f7f46420051'),('402881e545922d610145923227c70008','1','青春',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d6101459232add0000a','4','励志成功',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d6101459232ecdf000c','5','生活',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d61014592332634000e','6','人文社科',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d610145923380270010','7','经管',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d6101459233cbfb0012','8','科技',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d610145923410250014','9','教育',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e545922d6101459234394c0016','10','工具类',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e6456eb42d01456ecf931e0005','2','小说',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e6456eb42d01456ed05a2b0007','3','文艺',NULL,'402881e6456eb42d01456ecd039f0001'),('402881e6456eb42d01456ef7f979000d','1','已借出',NULL,'402881e6456eb42d01456ef7861b000b'),('402881e6456eb42d01456ef851c7000f','2','已入库',NULL,'402881e6456eb42d01456ef7861b000b'),('402881e6456eb42d01456ef87f380011','3','延迟',NULL,'402881e6456eb42d01456ef7861b000b');
/*!40000 ALTER TABLE `t_s_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_typegroup`
--

DROP TABLE IF EXISTS `t_s_typegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_typegroup` (
  `ID` varchar(32) NOT NULL,
  `typegroupcode` varchar(50) DEFAULT NULL,
  `typegroupname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_typegroup`
--

LOCK TABLES `t_s_typegroup` WRITE;
/*!40000 ALTER TABLE `t_s_typegroup` DISABLE KEYS */;
INSERT INTO `t_s_typegroup` VALUES ('402881e5455f7eca01455f7f46320048','icontype','图标类型'),('402881e5455f7eca01455f7f463b004c','searchmode','查询模式'),('402881e5455f7eca01455f7f463d004d','yesorno','逻辑条件'),('402881e5455f7eca01455f7f463e004e','fieldtype','字段类型'),('402881e5455f7eca01455f7f463f004f','database','数据表'),('402881e5455f7eca01455f7f46410050','fieltype','文档分类'),('402881e5455f7eca01455f7f46420051','sex','性别类'),('402881e6456eb42d01456ecd039f0001','bookType','图书分类'),('402881e6456eb42d01456ef7861b000b','bookstatus','图书状态');
/*!40000 ALTER TABLE `t_s_typegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_s_user`
--

DROP TABLE IF EXISTS `t_s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_s_user` (
  `email` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(30) DEFAULT NULL,
  `officePhone` varchar(20) DEFAULT NULL,
  `signatureFile` varchar(100) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2cuji5h6yorrxgsr8ojndlmal` (`id`),
  CONSTRAINT `FK_2cuji5h6yorrxgsr8ojndlmal` FOREIGN KEY (`id`) REFERENCES `t_s_base_user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_s_user`
--

LOCK TABLES `t_s_user` WRITE;
/*!40000 ALTER TABLE `t_s_user` DISABLE KEYS */;
INSERT INTO `t_s_user` VALUES (NULL,NULL,NULL,'images/renfang/qm/licf.gif','402881e5455f7eca01455f7f46290044'),(NULL,'15188888888',NULL,NULL,'402881e54596fb2e014596fefd8c0001'),(NULL,'15188888888',NULL,NULL,'402881e54596fb2e014596fefefc0004');
/*!40000 ALTER TABLE `t_s_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


