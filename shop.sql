/*
SQLyog v10.2 
MySQL - 5.1.12-beta-community-nt : Database - shop
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adminuser` */

insert  into `adminuser`(`uid`,`username`,`password`) values (1,'admin','123');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values (1,'图书'),(2,'电子书'),(3,'视频课程'),(4,'考研资料'),(5,'闲置数码'),(6,'鞋服配饰'),(7,'户外运动'),(8,'特色纺大');

/*Table structure for table `categorysecond` */

DROP TABLE IF EXISTS `categorysecond`;

CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categorysecond` */

insert  into `categorysecond`(`csid`,`csname`,`cid`) values (1,'计算机',1),(2,'管理',1),(3,'文学',1),(4,'历史',1),(5,'传记',1),(6,'小说',1),(7,'成功励志',1),(8,'青春',2),(9,'文艺',2),(10,'生活',2),(11,'社科',2),(12,'教育',2),(13,'科技',2),(14,'英语基础',3),(15,'数学基础',3),(16,'C语言编程',3),(17,'PHP基础',3),(18,'JAVA编程',3),(19,'SQL基础',3),(20,'英语一笔记',4),(21,'数学二高分笔记',4),(22,'软件工程综合885',4),(23,'政治高分攻略',4),(24,'手机',5),(25,'平板',5),(26,'电脑',5),(27,'相机',5),(28,'配饰',6),(29,'行李箱',6),(30,'男鞋',6),(31,'男包',6),(32,'健身用品',7),(33,'骑行装备',7),(34,'明信片系列',8),(35,'特色毕业照',8);

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  KEY `FKE8B2AB6140ACF87A` (`oid`),
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`itemid`,`count`,`subtotal`,`pid`,`oid`) values (18,1,28,1,9999),(19,1,12,6,9998),(20,1,8888,27,10000),(21,1,18,15,10001),(22,1,28,1,10002);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`oid`,`total`,`ordertime`,`state`,`name`,`phone`,`addr`,`uid`) values (9998,28,'2015-05-14 23:21:56',1,'aa','1380000000','武汉',4),(9999,12,'2015-05-14 23:27:40',1,'aa','1380000000','武汉',4),(10000,8888,'2015-05-17 22:38:03',1,NULL,NULL,NULL,4),(10001,18,'2015-05-17 22:47:36',1,'aa','1380000000','武汉',4),(10002,28,'2015-05-17 23:24:56',1,NULL,NULL,NULL,5);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`pname`,`market_price`,`shop_price`,`image`,`pdesc`,`is_hot`,`pdate`,`csid`) values (1,'计算机网络',58,28,'images/ProductsPhoto/1.jpg','该书自出版以来，受到国内各大专院校师生的好评，被国内著名高校如清华大学、北京邮电大学、成都电子科技大学、西安电子科技大学等100多所院校选为教材，特别是计算机网络专业、通信与信息化专业、电子工程专业使用本教材的比较多；有些相关专业也指定本教材为计算机网络方面的参考书，供学生深入掌握网络知识。',1,'2015-05-08 20:18:00',1),(2,'计算机组成原理',36,17,'images/ProductsPhoto/2.jpg','《计算机组成原理(附光盘第5版立体化教材十二五普通高等教育本科国家级规划教材)》编著者白中英。内容共分11章：（1）计算机系统概论；（2）运算方法和运算器；（3）多层次的存储器；（4）指令系统；（5）中央处理器；（6）总线系统；（7）外存与I/O设备；（8）输入输出系统；（9）并行组织与结构；（10）课程教学实验设计；（11）课程综合设计。本书是作者对“计算机组成原理”课程体系、教学内容、教学方法、教学手段进行综合改革的具体成果。',0,'2015-05-04 20:17:00',1),(3,'数据结构',34,19,'images/ProductsPhoto/3.jpg','涵盖教学大纲内容，兼顾学科知识的广度和深度，适用面广；引入抽象数据类型的基本概念，有助于培养学生的数据抽象和算法设计能力；以C伪码语言描述存储结构和算法，有助于提高学生的程序设计能力',1,'2015-05-01 20:18:00',1),(4,'操作系统',38,19,'images/ProductsPhoto/4.jpg','本书全面、系统地阐述了现代操作系统的基本原理、主要功能及实现技术，重点论述多用户、多任务操作系统的运行机制，系统资源管理的策略和方法，操作系统提供的用户界面。',0,'2015-05-07 20:18:00',1),(5,'UML面向对象设计基础',38,11,'images/ProductsPhoto/5.jpg','《UML面向对象设计基础》是关于面向对象软件设计的基本概念、符号表示、术语、准则以及原理的书籍。',1,'2015-05-02 20:18:00',1),(6,'大数据时代的系统工程',23,12,'images/ProductsPhoto/6.jpg','本书以简单平实的语言，将这些思考一一展现给读者，并结合作者多年的实践经验，对云计算涉及的概念、技术，以及将给我们的生活和社会带来的影响等各方面进行了阐述，从一种全新的视角展现了云计算的魅力。',1,'2015-05-18 00:35:43',1),(7,'人工智能',20,13,'images/ProductsPhoto/7.jpg',' Michael Negnevitsky所著的《人工智能智能系统指南（原书第3版）》是一本很好的人工智能入门书籍，内容丰富、浅显易懂。作者根据自己多年的教学、实践经验，并结合实际代码、图示、案例等讲解了人工智能的基本知识。',0,'2015-05-03 20:19:00',1),(8,'信息安全原理与实践',72,36,'images/ProductsPhoto/8.jpg','一大特色，就是大幅度地扩展和更新课后思考题，并增补了许多新的图解、表格和图形，用以阐明和澄清·些复杂的主题和问题。最后，对于课程开发来说，还有一组综合性的课堂测试用的PowerPoint幻灯片文件以及问题等手册可供利用。',1,'2015-05-03 10:18:00',1),(9,'数字图像处理',38,11,'images/ProductsPhoto/9.jpg','这一版本是作者在前两版的基础上修订而成的，是前两版的发展与延续。除保留了前两版的大部分内容外，根据读者的反馈，作者在13个方面对《数字图像处理(第三版)》进行了修订，新增了400多幅图像、200多幅图表及80多道习题，融入了近年来数字图像处理领域的重要进展，因而《数字图像处理(第三版)》特色鲜明且与时俱进。',1,'2015-05-05 20:18:00',1),(10,'虚拟现实技术及应用',56,15,'images/ProductsPhoto/10.jpg','本书通过对虚拟现实技术原理和案例的介绍，帮助广大读者快速、深入地学习和掌握虚拟现实技术，为推动该领域科学技术的发展和应用作出贡献。',1,'2015-05-03 21:18:00',1),(11,'管理的实践',49,31.5,'images/ProductsPhoto/11.jpg','本书的根本目的在于通过对管理原则、责任和实践的研究，探索如何建立有效的管理机制和制度。而衡量一个管理制度是否有效的标准就在于该制度能否将管理者个人特征的影响降低到最低限度。',0,'2015-05-04 00:01:28',2),(12,'汪国真精选集',60,42.9,'images/ProductsPhoto/12.jpg','汪国真——我们成长道路上不可绕过的名字！多年不曾念过，不曾记起的篇章，却原来还能够只看了开头，就径自背诵下去。整理一下少年时的心情，顿觉清纯许多！本书收录了他的多首诗文，有《活得真》、《是真将军不佩剑》、《还有一支春天的歌》、《迟到的祝福》、《不要总说“好吧”》、《叶子黄的时候》等，分为生命感悟和赤诚之心两辑。',1,'2015-05-10 00:04:35',3),(13,'唐朝那些事儿',32,23,'images/ProductsPhoto/13.jpg','中国史和世界史丰富复杂、多姿多彩，在本书中，作者从给千万读者进行了一次全方位的中国史和世界史大普及。让你读完本书便可以迅速变成历史达人！',0,'2015-05-10 00:07:52',4),(14,'成大事者不纠结',42,26,'images/ProductsPhoto/14.jpg','罗辑思维是目前影响力最大的互联网知识社群，以“有种、有料、有趣”凝聚350+万爱智求真、积极上进、自由阳光、人格健全的年轻人，是国内社群运作的典范。',1,'2015-05-10 00:10:16',7),(15,'你是最好的自己',36,18,'images/ProductsPhoto/15.jpg','21个最感人的励志故事，150张最文艺摄影，10组超级创意插图，构筑给所有年轻人的完美励志故事集。每个人都曾遭遇拒绝，遭遇失败，遭遇人生中的各种不快，都会在失败的时候怀疑自己是不是不够好，都会觉得世界上是不是没有人爱自己……不！你要相信，你是最好的自己。每当遇到阴雨天，就努力做自己的小太阳，正能量的青春，不畏惧的未来，你也可以拥有。',1,'2015-05-10 00:12:07',8),(16,'曾国藩传',56,45,'images/ProductsPhoto/16.jpg','曾国藩是晚清的重臣，官至两江总督、直隶总督、武英殿大学士，封一等毅勇侯；他又是公认的晚清军事家、理学家、政治家、书法家，文学家。曾国藩可谓中国近代史上最具有争议的人物。肯定之言，说他“立德、立功、立言三并不朽”，其成就“震古铄今”，是个“完人”。否定之言，说他不顾“民族大义”，是 “吾祖民贼”，“民族罪人”。',0,'2015-05-10 00:15:56',5),(17,'荒野求生少年生存小说系列',132,81,'images/ProductsPhoto/17.jpg','作为三个男孩的父亲，同时也身为全球2800万童子军的总教官，我太明白孩子内心所渴求的东西了。那就是鲜活的生存自救技能——也许某天救你一命的正是它们。这些技能历练了孩子对于生活的态度，让他们无论在野外生存还是在日常生活中都显得如此与众不同——拥有一颗蓬勃着乐观、协作、积极、勇敢、智慧和坚毅的心灵。',1,'2015-05-10 00:17:32',6),(18,'简笔画5000例',39,23,'images/ProductsPhoto/18.jpg','零基础学习绘画？喜欢画画却苦于没有时间？不愿意一丝不苟地费心创作，想体会绘画的快意？超萌的简笔画将是你的最佳选择！儿童的绘画应该从哪里起步？如何激发孩子的绘画兴趣和丰富的想象力？如果你对幼儿的美术教育存在这些问题，相信你在这本《简笔画5000例，一本就够》中可以找到答案。',0,'2015-05-10 00:20:27',9),(19,'韩国自助游',39,29,'images/ProductsPhoto/19.jpg','本书为畅销书《韩国自助游》2015年全新升级版！特别附赠韩国超市必买好物清单。',0,'2015-05-10 00:22:37',10),(20,'走遍中国',13,2,'images/ProductsPhoto/20.jpg','《走遍中国》一改传统旅游手册的面目，集中介绍景区（点）的同时，为游客更多地展示了该地区代表性图片。全书以地域划分章节，中国34个行政区划最具价值的旅游景点一一陈列，让读者在舒适的环境中就可以“游览”神州美景。通过这一篇篇汩汩流淌的文字，通过这一张张精心挑选的图画，抵达你向往的内心，从而走向更远！',0,'2015-05-10 00:24:42',11),(21,'卡尔威特的教育',29,18,'images/ProductsPhoto/21.jpg','卡尔的父亲把小卡尔长到14岁以前的教育写成了一本书，这就是《卡尔·威特的教育》。书中详细地记载了卡尔的成长过程，以及自己教子的心得和独辟蹊径的教育方法。',0,'2015-05-10 00:26:45',12),(22,'你不可不知的50个物理知识',30,22,'images/ProductsPhoto/22.jpg','　这是一本物理学科普书。作者通过50篇短文，描述了掌控世界运转的定律、原理和理论的发现、意义及其作用。这些短文，以及著名物理学家的生平介绍、说明性图表和名人名言，使内容更加生动有趣，让读者读起来津津有味、兴味盎然，并对物理学深深着迷。　　本书适合对物理学感兴趣的各层次读者。',0,'2015-05-10 00:29:29',13),(23,'学士服',10,10,'images/ProductsPhoto/23.jpg','学生服出租',1,'2015-05-10 00:32:17',35),(24,'婚纱',20,20,'images/ProductsPhoto/24.jpg','特色毕业照',1,'2015-05-10 00:33:56',35),(25,'软件工程综合',1000,1000,'images/ProductsPhoto/25.jpg','高分笔记',1,'2015-05-18 00:40:56',22),(26,'iMac',15000,10000,'images/ProductsPhoto/26.jpg','苹果 新iMac 21.5寸系列为2012年上市的21.5英寸家用娱乐一体电脑，采用银色的高度可回收铝合金与玻璃材质外壳设计，以及1920×1080高清分辨率屏幕',1,'2015-05-17 23:21:30',1),(27,'lenove',9999,8888,'images/ProductsPhoto/27.jpg','联想电脑',1,'2015-05-17 23:21:17',26),(28,'英语自学',100,99.9,'images/ProductsPhoto/28.jpg','新概念英语第1、2册全套连读 随到随学 终身学习权限，精讲教学视频+直播答疑课教学视频学员随到随学,更加自由的安排学习时间。',1,'2015-05-17 23:45:40',1),(29,'张宇考研数学',88.8,77.7,'images/ProductsPhoto/29.jpg','现货正版 张宇[套装] 2016张宇高等数学18讲 张宇线性代数9讲 张宇概率论与数理统计9讲 【数1数3】2016张宇高数18讲 线代考研数学',1,'2015-05-17 23:52:40',15),(30,'C语言入门到精通',55.5,33.3,'images/ProductsPhoto/30.jpg','正版C语言从入门到精通第2版 赠计算机c语言入门视频教程光盘零基础学c语言入门经典教材C程序设计语言畅销c语言程序设计教科书籍',1,'2015-05-18 00:35:53',16),(31,'PHP训练',9.9,8.8,'images/ProductsPhoto/31.jpg','PHP（外文名:PHP: Hypertext Preprocessor，中文名：“超文本预处理器”）是一种通用开源脚本语言。语法吸收了C语言、Java和Perl的特点，利于学习，使用广泛，主要适用于Web开发领域。PHP 独特的语法混合了C、Java、Perl以及PHP自创的语法。它可以比CGI或者Perl更快速地执行动态网页。',0,'2015-05-18 00:35:43',17),(35,'零基础学Java java入门到精通',66.6,33.3,'images/ProductsPhoto/32.jpg','Java是目前最流行的开发语言之一，也是目前提供职位最多的开发语言之一。本书站在零基础学习的角度，使初学者能尽快掌握Java语言程序设计的精髓而少走弯路。',1,'2015-05-18 00:35:30',1),(36,'数据库视频教程',55.5,33.3,'images/ProductsPhoto/33.jpg','    Microsoft SQL Server已经成为世界上最受欢迎的数据库管理系统之一.无论是用在小型开发项目上,还是用来构建那引起声名显赫网站,SQL Server都证明了自己是个稳定、可靠、快速、可信的系统，足以胜任任何数据存储业务的需要。 ',1,'2015-05-18 00:37:18',19),(37,'复试英语全套资料',66,55,'images/ProductsPhoto/34.jpg','复试是如何进行的、复试考什么内容、复试要怎么准备、复试要看那些书、是否需要联系导师以及如何联系导师、面试的时候有什么技巧、面试老师会喜欢什么样的学生等等关于复试的问题表示关注。针对同学们的疑虑和困惑，至诚教育根据同学们的需要，经过一段时间的调研和探究之后，精心地编写',0,'2015-05-18 00:40:56',20),(38,'高分考研数学笔记',23,22.9,'images/ProductsPhoto/35.jpg','名校高分学子原创，简洁精炼，浓缩精华。 对于想获得一本数学方法集的同学们来说，这是一个很好地选择。',0,'2015-05-18 00:43:14',21),(39,'考研思想政治理论复习',33,22,'images/ProductsPhoto/36.jpg','考研真相复习方法 考研政治冲刺第一复习全书',0,'2015-05-18 00:44:43',23),(40,'iphone6',4999,4999,'images/ProductsPhoto/37.jpg','苹果iPhone 6(16GB/三网通)采用4.7英寸触摸屏，搭载A8 64位处理器，20nm工艺，运行iOS8操作系统，内置800万像素iSight摄像头，true-tone闪光灯，1.5微米像素， f/2.2光圈，使用新的影像传感器“focus pixels”，拍摄能力更好，自动对焦速度提升至之前的2倍。可拍摄1080p的视频。',1,'2015-05-18 00:47:02',24),(41,'Microsoft/微软 Surface Pro 3 ',5555,5554,'images/ProductsPhoto/38.jpg','平板新风格，笔记本新选择。\r\n全新的 Surface Pro 3 创意独特。SurfacePro3以光泽的镁质框架环绕震撼的12英寸显示器，外形极其轻巧灵活，能提供笔记本电脑的所有功能和性能。一机在手，别无他求。',1,'2015-05-18 00:49:54',25),(42,'Canon/佳能 EOS 70D 单反相机',6898,6888,'images/ProductsPhoto/39.jpg','产品名称：Canon/佳能 EOS 70D套机(...单反级别: 中级屏幕尺寸: 3英寸像素: 2020万储存介质: SD卡电池类型: 锂电池上市时间: 2013年单反画幅: APS-C画幅感光元件类型: CMOS对焦点数: 19点是否支持外接闪光灯: 支持是否支持机身除尘: 支持是否支持机身马达: 不支持传感器尺寸: 22.5mmx15.0mm品牌: Canon/佳能曝光模式: 程序自动曝光 B门曝光 快门优先 光圈优先 手动曝光影像处理类型: DIGIC 5+',1,'2015-05-18 00:53:36',27),(43,'小叶紫檀手串',822,699,'images/ProductsPhoto/40.jpg','做事凭良心，做人尽本分，都是自己家里做的珠子！图片都是真实自己拍的，没有打灯光请人专业摄影，更没有经过电脑美化处理！100%真实，100%正宗小叶紫檀！',0,'2015-05-18 00:57:08',28),(44,'外交官行李箱',1666,1499,'images/ProductsPhoto/41.jpg','源自德国工艺，进口拜耳PC材质，超轻、耐磨、抗摔。优质金属感外观适合外交官，各阶层白领。20寸适合登机，万向轮灵活轻便。',1,'2015-05-18 00:58:48',29),(45,'阿迪达斯跑鞋',899,888,'images/ProductsPhoto/42.jpg','舒适！',0,'2015-05-18 01:01:35',30),(46,'意大利正品路易威登2015新款LV男包',8600,8599,'images/ProductsPhoto/43.jpg','自1854年以来，代代相传至今的路易威登以卓越品质、杰出创意和精湛工艺成为时尚旅行艺术的象征。产品系列包括手提包，旅行用品，小型皮具，围巾及配饰，鞋履，成衣，腕表，高级珠宝及个性化定制服务等。这些悉心打造的产品，代表着路易威登对卓越工艺的承诺。',0,'2015-05-18 01:03:40',31),(47,'亿健跑步机8008A家用',2999,2998,'images/ProductsPhoto/44.jpg','此款亿健8008A 跑步机，是当值无愧的2500-4000价位中级的性价比方面的王者，优势，价格不是很高，功能却和一般的土豪级别的上万的可以力拼，同时又是亿健CCTV的合作品牌的，各种售后的服务是可以全国联保的。',0,'2015-05-18 01:05:55',32),(48,'GIANT捷安特ATX CLASSIC铝合金山地车',3118,3111,'images/ProductsPhoto/45.jpg','ATX730采用ALUXX A6061 专用铝合金技术，使用捷安特热塑一体成型技术，将ALUXX铝合金推向极限。整车13.8KG，XCM铝合金前叉坚固可靠，可调节软硬，轻松回弹，SHIMANO变速精准无比。DA3碟刹比肩SRAM BB5和SHIMANO M375。整车性价比很高，尤其是骚红色特别养眼。',0,'2015-05-18 01:08:37',33),(49,'手绘纺大',9.9,9.9,'images/ProductsPhoto/46.jpg','手绘纺大明信片，留一份美好的回忆',1,'2015-05-18 01:10:13',34);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`phone`,`addr`,`state`,`code`) values (4,'aaa','aaa','赵aa','aaa@tsinghua.com','1380000000','武汉',1,''),(5,'bbb','bbb','bb','bbb@tsinghua.com','1390000000','贵州',1,'45cac017918f4d7486d3971bd7185fb1e26331f743a94b41b7f327a1d62f537c');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
