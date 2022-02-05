/*
Navicat MySQL Data Transfer

Source Server         : aaa
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : secondhandbookstore

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2022-02-05 21:44:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `adminId` int(10) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `adminPhone` varchar(11) NOT NULL,
  `adminCreateTime` datetime NOT NULL,
  `adminSex` varchar(2) DEFAULT NULL,
  `adminAge` int(10) NOT NULL,
  `adminAvatar` varchar(200) DEFAULT NULL,
  `adminTypeId` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1', '彼得潘', '1000123546', '2021-11-25 13:50:33', '男', '22', '', '5');
INSERT INTO `admininfo` VALUES ('2', '爱德华', '23123123', '2021-12-14 20:56:23', '女', '23', null, '2');

-- ----------------------------
-- Table structure for adminlogin
-- ----------------------------
DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE `adminlogin` (
  `adminId` int(10) NOT NULL,
  `adminNum` varchar(30) NOT NULL,
  `adminPassword` varchar(50) NOT NULL,
  `modifyTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlogin
-- ----------------------------
INSERT INTO `adminlogin` VALUES ('1', 'admin', '21232F297A57A5A743894A0E4A801FC3', '2021-11-25 22:28:51');
INSERT INTO `adminlogin` VALUES ('2', 'aidehua', '21232F297A57A5A743894A0E4A801FC3', '2021-12-02 19:33:58');

-- ----------------------------
-- Table structure for admintype
-- ----------------------------
DROP TABLE IF EXISTS `admintype`;
CREATE TABLE `admintype` (
  `adminTypeId` int(2) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admintype
-- ----------------------------
INSERT INTO `admintype` VALUES ('1', '一级管理员', '图书管理');
INSERT INTO `admintype` VALUES ('2', '二级管理员', '图书、类型管理');
INSERT INTO `admintype` VALUES ('3', '三级管理员·', '图书、类型、用户管理');
INSERT INTO `admintype` VALUES ('4', '四级管理员', '图书、类型、用户、管理员管理');
INSERT INTO `admintype` VALUES ('5', '五级管理员', '图书、类型、用户、管理员、权限管理');

-- ----------------------------
-- Table structure for bookimage
-- ----------------------------
DROP TABLE IF EXISTS `bookimage`;
CREATE TABLE `bookimage` (
  `bookId` int(10) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookimage
-- ----------------------------
INSERT INTO `bookimage` VALUES ('12', 'book4.jpg');
INSERT INTO `bookimage` VALUES ('123', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('127', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('131', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('132', 'book5.jpg');
INSERT INTO `bookimage` VALUES ('213', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('321', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('326', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('534', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('867', 'book2.jpg');
INSERT INTO `bookimage` VALUES ('2342', 'book1.jpg');
INSERT INTO `bookimage` VALUES ('423432', 'book3.jpg');
INSERT INTO `bookimage` VALUES ('41412', 'law.jpg');
INSERT INTO `bookimage` VALUES ('2', 'b.jpg');
INSERT INTO `bookimage` VALUES ('4353453', 'law.jpg');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `bookId` int(10) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(50) NOT NULL,
  `bookLevel` int(2) NOT NULL,
  `bookPrice` decimal(10,2) NOT NULL,
  `bookSortId` int(20) NOT NULL,
  `bookCount` int(10) NOT NULL,
  `bookAuthor` varchar(50) NOT NULL,
  `bookPublisher` varchar(50) NOT NULL,
  `display` varchar(5) NOT NULL,
  `bookSales` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=4353454 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', '1', '1', '1.00', '4', '1', '1', '1', '是', '1', '1');
INSERT INTO `bookinfo` VALUES ('2', '经济学', '5', '30.00', '7', '90', 'Alice', '人民邮电出版社', '否', '0', '1');
INSERT INTO `bookinfo` VALUES ('3', '法学通论', '10', '30.00', '8', '10', '吴汉东', '高等教育出版社', '否', '0', '1');
INSERT INTO `bookinfo` VALUES ('12', '经济学原理', '9', '23.00', '7', '30', '格里高利·曼昆著', '人民出版社', '否', '21', '18');
INSERT INTO `bookinfo` VALUES ('123', '数据库开发', '9', '20.00', '1', '10', '彼得潘学', 'xx出版社', '否', '3', '1');
INSERT INTO `bookinfo` VALUES ('127', 'Java从入门到精通', '9', '30.00', '1', '50', 'Pywcc', 'xxxxx出版社', '是', '10', '2');
INSERT INTO `bookinfo` VALUES ('131', '追风筝的人', '9', '43.00', '4', '5', '卡勒德·胡赛尼', '上海人民出版社', '否', '1', '1');
INSERT INTO `bookinfo` VALUES ('132', '高等数学', '10', '24.50', '3', '21', '同济大学', '高等教育出版社', '否', '13', '1');
INSERT INTO `bookinfo` VALUES ('213', '工程线性代数', '9', '12.00', '3', '12', '同济大学', '高等教育出版社', '否', '11', '1');
INSERT INTO `bookinfo` VALUES ('321', '深入分析Java Web技术内幕', '5', '20.00', '1', '40', '许令波', '电子工业出版社', '否', '12', '23');
INSERT INTO `bookinfo` VALUES ('326', '算法与数据结构——C语言描述', '7', '10.50', '1', '2', '张乃孝', '高等教育出版社', '否', '0', '20');
INSERT INTO `bookinfo` VALUES ('534', 'Spring Boot实战', '10', '34.00', '1', '1', 'Craig Walls', '人民邮电出版社', '否', '1', '5');
INSERT INTO `bookinfo` VALUES ('867', '心理学与生活', '10', '56.00', '18', '67', '理查德·格里格', '人民邮电出版社', '否', '61', '21');
INSERT INTO `bookinfo` VALUES ('2342', '钢铁是怎样炼成的', '6', '40.00', '2', '100', '奥斯特洛夫斯基', 'xxxxxxxx', '否', '24', '1');
INSERT INTO `bookinfo` VALUES ('12321', '啊发撒法第四', '10', '50.00', '8', '100', '撒打算', 'xx', '否', '50', '7');
INSERT INTO `bookinfo` VALUES ('41412', '钢铁是怎样练成的', '10', '10.00', '2', '10', 'xxxxxxxxx', 'xxx', '是', '0', '2');
INSERT INTO `bookinfo` VALUES ('423432', 'Linux内核设计与实现', '7', '50.00', '1', '200', '奥古斯覅', 'xx', '否', '47', '17');
INSERT INTO `bookinfo` VALUES ('4353453', '12221', '3', '3.00', '9', '32', 'xxxxxxxxx', '高等教育出版社', '否', '1', '2');

-- ----------------------------
-- Table structure for booksort
-- ----------------------------
DROP TABLE IF EXISTS `booksort`;
CREATE TABLE `booksort` (
  `bookSortId` int(20) NOT NULL AUTO_INCREMENT,
  `bookSort` varchar(50) NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bookSortId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booksort
-- ----------------------------
INSERT INTO `booksort` VALUES ('1', '计算机科学', '关于计算机编程书记');
INSERT INTO `booksort` VALUES ('2', '文学', '关于文学');
INSERT INTO `booksort` VALUES ('3', '数学', '高中数学、高考数学、大学数学、考研大学');
INSERT INTO `booksort` VALUES ('4', '小说', '经典小说、古代小说、现代小说');
INSERT INTO `booksort` VALUES ('5', '外文', '外国文献');
INSERT INTO `booksort` VALUES ('6', '时尚杂志', '');
INSERT INTO `booksort` VALUES ('7', '经济学', '');
INSERT INTO `booksort` VALUES ('8', '法学', '');
INSERT INTO `booksort` VALUES ('9', '统计学', '');
INSERT INTO `booksort` VALUES ('10', '社会科学', '');
INSERT INTO `booksort` VALUES ('11', '自然科学', '');
INSERT INTO `booksort` VALUES ('18', '心理学', null);

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist` (
  `orderId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL,
  `bookId` int(10) NOT NULL,
  `orderTime` datetime NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('1', '2', '867', '2021-12-07 22:12:23');
INSERT INTO `orderlist` VALUES ('2', '2', '867', '2021-12-07 22:12:23');
INSERT INTO `orderlist` VALUES ('3', '1', '12', '2021-12-07 22:12:23');
INSERT INTO `orderlist` VALUES ('4', '1', '12', '2021-12-07 23:32:10');
INSERT INTO `orderlist` VALUES ('5', '1', '132', '2021-12-07 23:32:10');
INSERT INTO `orderlist` VALUES ('6', '1', '132', '2021-12-08 23:04:45');
INSERT INTO `orderlist` VALUES ('7', '1', '2342', '2021-12-08 23:04:45');
INSERT INTO `orderlist` VALUES ('8', '2', '2342', '2021-12-10 10:43:55');
INSERT INTO `orderlist` VALUES ('9', '2', '423432', '2021-12-10 10:43:55');
INSERT INTO `orderlist` VALUES ('10', '2', '132', '2021-12-10 10:43:55');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `cartId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NOT NULL,
  `bookId` int(10) NOT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('4', '2', '867');
INSERT INTO `shoppingcart` VALUES ('5', '2', '867');
INSERT INTO `shoppingcart` VALUES ('7', '1', '12');
INSERT INTO `shoppingcart` VALUES ('15', '2', '132');
INSERT INTO `shoppingcart` VALUES ('18', '1', '423432');
INSERT INTO `shoppingcart` VALUES ('19', '1', '2');
INSERT INTO `shoppingcart` VALUES ('21', '2', '12');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPhone` varchar(11) NOT NULL,
  `userCreateTime` datetime NOT NULL,
  `userSex` varchar(2) NOT NULL,
  `userAge` int(3) NOT NULL,
  `userAvatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '范德萨', '1231234098', '2021-11-26 00:00:00', '男', '12', '');
INSERT INTO `userinfo` VALUES ('2', '大富贵', '1213789456', '2021-11-26 00:00:00', '女', '11', null);
INSERT INTO `userinfo` VALUES ('3', '胡高峰', '123127890', '2021-11-10 20:28:26', '女', '21', null);
INSERT INTO `userinfo` VALUES ('4', '史蒂夫', '1212312', '2021-11-09 20:39:36', '女', '12', null);
INSERT INTO `userinfo` VALUES ('5', '弗杜戈', '121234124', '2021-11-10 20:39:46', '女', '23', null);
INSERT INTO `userinfo` VALUES ('7', '傅顾皓', '12312452332', '2021-11-09 20:39:56', '女', '23', null);
INSERT INTO `userinfo` VALUES ('10', '阿瑟东', '152343465', '2021-11-02 21:07:37', '女', '32', null);
INSERT INTO `userinfo` VALUES ('11', '华国锋', '12332587923', '2021-11-03 21:07:49', '女', '23', '');
INSERT INTO `userinfo` VALUES ('12', '华夫格', '1230980324', '2021-11-17 21:08:24', '女', '23', '');
INSERT INTO `userinfo` VALUES ('13', '黑杰克', '12964556', '2021-11-09 21:08:38', '女', '76', null);
INSERT INTO `userinfo` VALUES ('14', '郭师傅', '1234324', '2021-12-02 11:48:03', '男', '12', null);
INSERT INTO `userinfo` VALUES ('15', '景福宫', '1231454323', '2021-12-02 11:48:35', '男', '12', null);
INSERT INTO `userinfo` VALUES ('16', '沈殿霞', '12378564', '2021-12-02 11:52:48', '男', '12', null);
INSERT INTO `userinfo` VALUES ('17', '黄光剑', '34534534', '2021-12-02 11:53:15', '女', '45', null);
INSERT INTO `userinfo` VALUES ('18', '额外人', '3412', '2021-12-02 11:56:36', '男', '12', null);
INSERT INTO `userinfo` VALUES ('19', '高浮雕', '32423', '2021-12-02 11:59:17', '男', '43', null);
INSERT INTO `userinfo` VALUES ('20', '郭昊仑', '1235464', '2021-12-02 11:59:50', '男', '12', null);
INSERT INTO `userinfo` VALUES ('21', '斯蒂芬', '21312', '2021-12-02 12:00:27', '男', '42', null);

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `userNum` varchar(30) NOT NULL,
  `userPassword` varchar(50) NOT NULL,
  `modifyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('1', 'zhangsan', 'E10ADC3949BA59ABBE56E057F20F883E', '2021-11-26 17:31:48');
INSERT INTO `userlogin` VALUES ('2', 'lisi', 'E10ADC3949BA59ABBE56E057F20F883E', '2021-11-26 17:33:08');
INSERT INTO `userlogin` VALUES ('4', 'wangwu', 'E10ADC3949BA59ABBE56E057F20F883E', '2021-12-08 22:40:08');
INSERT INTO `userlogin` VALUES ('5', 'zhaoliu', '27311020EFC4CE2806FECA0AAB933FBD', '2021-12-10 10:32:21');
