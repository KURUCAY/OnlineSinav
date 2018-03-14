/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100128
 Source Host           : localhost:3306
 Source Schema         : examapp

 Target Server Type    : MySQL
 Target Server Version : 100128
 File Encoding         : 65001

 Date: 14/03/2018 22:25:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `oId` int(11) NOT NULL AUTO_INCREMENT,
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  `oqId` int(11) NULL DEFAULT NULL,
  `answer` varchar(10) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oId`) USING BTREE,
  INDEX `questions`(`oqId`) USING BTREE,
  CONSTRAINT `questions` FOREIGN KEY (`oqId`) REFERENCES `questions` (`qId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (19, 'Hukukî alanda din ayrımının sona ermesi', 16, 'YANLIŞ');
INSERT INTO `options` VALUES (20, 'Rejim tartışmalarının bitirilmesi', 16, 'YANLIŞ');
INSERT INTO `options` VALUES (21, 'Anayasanın lâikleşmesi konusunda önemli bir adımın atılması', 16, 'DOĞRU');
INSERT INTO `options` VALUES (22, 'Toplumdaki dînî çatışmaların sona ermesi', 16, 'YANLIŞ');
INSERT INTO `options` VALUES (23, 'Atatürk ilkelerinin anayasada yer alması', 16, 'YANLIŞ');
INSERT INTO `options` VALUES (24, 'Saltanatın kaldırılması', 17, 'YANLIŞ');
INSERT INTO `options` VALUES (25, 'Cumhuriyet’in ilân edilmesi', 17, 'DOĞRU');
INSERT INTO `options` VALUES (26, 'Yeni Türk harflerinin kabûl edilmesi', 17, 'YANLIŞ');
INSERT INTO `options` VALUES (27, 'Halifeliğin kaldırılması', 17, 'YANLIŞ');
INSERT INTO `options` VALUES (28, 'Medenî Kanun’un uygulamaya konulması', 17, 'YANLIŞ');
INSERT INTO `options` VALUES (29, 'Ham maddesi yurt içinde yetişen sanayi dalları kurulmalıdır', 18, 'YANLIŞ');
INSERT INTO `options` VALUES (30, 'Özel teşebbüse kredi sağlayacak bir devlet bankası kurulmalıdır', 18, 'YANLIŞ');
INSERT INTO `options` VALUES (31, 'Dış   borçlanmaya  gidilerek,  yabancı    işletmelerin  kurulması sağlanmalıdır', 18, 'DOĞRU');
INSERT INTO `options` VALUES (32, 'Küçük çaplı işletmelerden (bilgi yelpazesi.net) hızla büyük işletmelere geçilmelidir', 18, 'YANLIŞ');
INSERT INTO `options` VALUES (33, 'Özel sektör devlet tarafından desteklenmelidir', 18, 'YANLIŞ');
INSERT INTO `options` VALUES (34, 'Tevhid-i Tedrisat kanunu’nun çıkartılmasıyla', 19, 'YANLIŞ');
INSERT INTO `options` VALUES (35, 'Ölçü birimlerinin değiştirilmesiyle', 19, 'YANLIŞ');
INSERT INTO `options` VALUES (36, 'Medreselerin kapatılmasıyla', 19, 'YANLIŞ');
INSERT INTO `options` VALUES (37, 'Soyadı Kanunu’nun kabûl edilmesiyle', 19, 'YANLIŞ');
INSERT INTO `options` VALUES (38, 'Medenî Kanun’un kabûl edilmesiyle', 19, 'DOĞRU');
INSERT INTO `options` VALUES (39, 'Din ve mezhep çatışmalarını sona erdirmek', 20, 'YANLIŞ');
INSERT INTO `options` VALUES (40, 'Hukuk birliğini sağlamak', 20, 'YANLIŞ');
INSERT INTO `options` VALUES (41, 'Siyâsî açıdan kadın – erkek eşitliğini sağlamak', 20, 'DOĞRU');
INSERT INTO `options` VALUES (42, 'Azınlıklara tanınan hukukî ayrıcalıklara son vermek', 20, 'YANLIŞ');
INSERT INTO `options` VALUES (43, 'Hukukî alanda çağdaşlaşmak', 20, 'YANLIŞ');
INSERT INTO `options` VALUES (44, 'Şeriye ve Evkaf Vekâleti’nin kaldırılması', 21, 'YANLIŞ');
INSERT INTO `options` VALUES (45, 'Tekke ve zâviyelerin kapatılması', 21, 'YANLIŞ');
INSERT INTO `options` VALUES (46, 'Tevhid-i tedrisat Kanunu’nun kabûl edilmesi', 21, 'YANLIŞ');
INSERT INTO `options` VALUES (47, 'Soyadı Kanunu’nun çıkartılması', 21, 'DOĞRU');
INSERT INTO `options` VALUES (48, 'Maarif Teşkilâtı Hakkında Kanun’un kabûl edilmesi', 21, 'YANLIŞ');
INSERT INTO `options` VALUES (49, 'Tekke ve zâviyelerin kapatılması', 22, 'YANLIŞ');
INSERT INTO `options` VALUES (50, 'Medreselerin kapatılması', 22, 'YANLIŞ');
INSERT INTO `options` VALUES (51, 'Tevhid-i Tedrisat Kanunu’nun çıkartılması', 22, 'DOĞRU');
INSERT INTO `options` VALUES (52, 'Yeni Türk alfabesinin kabûl edilmesi', 22, 'YANLIŞ');
INSERT INTO `options` VALUES (53, 'Batı tarzı üniversitelerin açılması', 22, 'YANLIŞ');
INSERT INTO `options` VALUES (54, 'Tarım Kredi Kooperatiflerinin kurulması', 23, 'YANLIŞ');
INSERT INTO `options` VALUES (55, 'Köylüye destek amaçlı devlet bankası açılması', 23, 'YANLIŞ');
INSERT INTO `options` VALUES (56, 'Yüksek Ziraat Enstitülerinin açılması', 23, 'YANLIŞ');
INSERT INTO `options` VALUES (57, 'Âşâr vergisinin kaldırılması', 23, 'YANLIŞ');
INSERT INTO `options` VALUES (58, 'Toprak reformunun yapılması', 23, 'DOĞRU');
INSERT INTO `options` VALUES (66, '123', 28, 'YANLIŞ');
INSERT INTO `options` VALUES (67, '1231232', 28, 'YANLIŞ');
INSERT INTO `options` VALUES (68, '123123', 28, 'YANLIŞ');
INSERT INTO `options` VALUES (69, '1231232', 28, 'DOĞRU');
INSERT INTO `options` VALUES (70, '123123', 28, 'YANLIŞ');
INSERT INTO `options` VALUES (71, '12331123', 28, 'YANLIŞ');
INSERT INTO `options` VALUES (72, '0', NULL, 'BOS');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `qId` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) CHARACTER SET utf8 COLLATE utf8_turkish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`qId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (16, '1928’de, anayasadaki, “Devletin resmî dîni İslâm’dır” maddesinin çıkartılmasının en önemli sonucu, aşağıdakilerden hangisidir?');
INSERT INTO `questions` VALUES (17, ' Aşağıdakilerden hangisi, II. TBMM’nin gerçekleştirdiği ilk inkılâptır?');
INSERT INTO `questions` VALUES (18, ' 1.İzmir İktisat Kongresi (18 Şubat – 4 Mart 1923) kararları arasında aşağıdakilerden hangisi yer almaz?');
INSERT INTO `questions` VALUES (19, 'Aşağıdakilerden hangisiyle, hukukî alandaki ikilikler sona ermiştir?');
INSERT INTO `questions` VALUES (20, 'Aşağıdakilerden hangisi, Medenî Kanun ile ulaşılmak istenen amaçlar arasında yer almaz?');
INSERT INTO `questions` VALUES (21, 'Aşağıdakilerden hangisi, lâiklik ilkesini gerçekleştirmek için yapılan inkılâp hareketleri arasında yer almaz?');
INSERT INTO `questions` VALUES (22, 'Türkiye’de eğitim alanında lâikleşme çalışmalarını başlatan ilk gelişme, aşağıdakilerden hangisidir?');
INSERT INTO `questions` VALUES (23, 'Tarımın geliştirilmesi ve köylünün durumunun iyileştirilmesi için düşünülen, ancak günümüze kadar tam uygulanamayan inkılâp, aşağıdakilerden hangisidir?');
INSERT INTO `questions` VALUES (28, 'asdasjd;askdkasdja;ksdjasjhkkahsdk');

-- ----------------------------
-- Table structure for selections
-- ----------------------------
DROP TABLE IF EXISTS `selections`;
CREATE TABLE `selections`  (
  `sId` int(11) NOT NULL AUTO_INCREMENT,
  `oId` int(11) NULL DEFAULT NULL,
  `qId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_turkish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of selections
-- ----------------------------
INSERT INTO `selections` VALUES (103, 20, 17);
INSERT INTO `selections` VALUES (104, 26, 18);
INSERT INTO `selections` VALUES (105, 30, 19);
INSERT INTO `selections` VALUES (106, 0, 20);
INSERT INTO `selections` VALUES (107, 39, 21);
INSERT INTO `selections` VALUES (108, 46, 22);
INSERT INTO `selections` VALUES (109, 0, 23);
INSERT INTO `selections` VALUES (110, 0, 17);
INSERT INTO `selections` VALUES (111, 0, 18);
INSERT INTO `selections` VALUES (112, 0, 19);
INSERT INTO `selections` VALUES (113, 0, 20);
INSERT INTO `selections` VALUES (114, 0, 21);
INSERT INTO `selections` VALUES (115, 0, 22);
INSERT INTO `selections` VALUES (116, 0, 23);
INSERT INTO `selections` VALUES (117, 21, 17);
INSERT INTO `selections` VALUES (118, 26, 18);
INSERT INTO `selections` VALUES (119, 31, 19);
INSERT INTO `selections` VALUES (120, 37, 20);
INSERT INTO `selections` VALUES (121, 42, 21);
INSERT INTO `selections` VALUES (122, 46, 22);
INSERT INTO `selections` VALUES (123, 0, 23);
INSERT INTO `selections` VALUES (124, 0, 28);
INSERT INTO `selections` VALUES (125, 0, 17);
INSERT INTO `selections` VALUES (126, 0, 18);
INSERT INTO `selections` VALUES (127, 0, 19);
INSERT INTO `selections` VALUES (128, 0, 20);
INSERT INTO `selections` VALUES (129, 0, 21);
INSERT INTO `selections` VALUES (130, 0, 22);
INSERT INTO `selections` VALUES (131, 0, 23);
INSERT INTO `selections` VALUES (132, 0, 28);
INSERT INTO `selections` VALUES (133, 19, 17);
INSERT INTO `selections` VALUES (134, 25, 18);
INSERT INTO `selections` VALUES (135, 31, 19);
INSERT INTO `selections` VALUES (136, 35, 20);
INSERT INTO `selections` VALUES (137, 39, 21);
INSERT INTO `selections` VALUES (138, 45, 22);
INSERT INTO `selections` VALUES (139, 51, 23);
INSERT INTO `selections` VALUES (140, 55, 28);
INSERT INTO `selections` VALUES (141, 0, 17);

-- ----------------------------
-- Procedure structure for deleteOptionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOptionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOptionPro`(IN `oid` int)
BEGIN
	DELETE FROM `options` WHERE `options`.oId = oid ; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteQuestionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteQuestionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteQuestionPro`(IN `qid` int)
BEGIN
	DELETE FROM questions WHERE questions.qId = qid ; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertOptionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertOptionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertOptionPro`(IN `qid` int ,IN `op` varchar(500),IN `ans` VARCHAR(10))
BEGIN
	
	INSERT into `options` VALUES(null,op,qid,ans);

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertQuestionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertQuestionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertQuestionPro`(IN `question` varchar(500))
BEGIN
	INSERT INTO questions VALUES(null,question);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for insertSelectionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertSelectionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertSelectionPro`(IN `s` varchar(500) ,IN `q` varchar(500))
BEGIN
	INSERT INTO selections VALUES(null,s,q);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectExamQuestion
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectExamQuestion`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectExamQuestion`()
BEGIN
	SELECT  o.oId , o.`option` , o.answer ,q.qId , q.question FROM `options` as o join questions as q on o.oqId = q.qId;

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectExistQuestion
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectExistQuestion`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectExistQuestion`()
BEGIN
		SELECT q.qId , q.question FROM `options` as o join questions as q on o.oqId = q.qId GROUP BY q.qId ; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectOptionsPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectOptionsPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectOptionsPro`(IN `qid` int)
BEGIN
	SELECT  o.oId , o.`option` , o.answer ,q.qId , q.question FROM `options` as o join questions as q on o.oqId = q.qId WHERE q.qId = qid ;  

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectQuestionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectQuestionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectQuestionPro`(IN `qid` int)
BEGIN
	SELECT questions.question FROM questions WHERE questions.qId = qid ; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectQuestionsPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectQuestionsPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectQuestionsPro`()
BEGIN
	SELECT * FROM questions;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectSelectionPro
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectSelectionPro`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectSelectionPro`()
BEGIN
	SELECT  q.qId,q.question,o.answer FROM questions as q JOIN selections as s on s.qId = q.qId left join `options` as o on o.oId = s.oId;

END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
