-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.18-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- dacham 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `dacham` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `dacham`;


-- 테이블 dacham.cookmethod 구조 내보내기
CREATE TABLE IF NOT EXISTS `cookmethod` (
  `cookMCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `cookMName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cookMCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='조리방법';

-- 테이블 데이터 dacham.cookmethod:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cookmethod` DISABLE KEYS */;
INSERT INTO `cookmethod` (`cookMCode`, `cookMName`) VALUES
	('01', '튀김'),
	('02', '구이'),
	('03', '조림'),
	('04', '찜'),
	('05', '초벌'),
	('06', '무침'),
	('07', '탕');
/*!40000 ALTER TABLE `cookmethod` ENABLE KEYS */;


-- 테이블 dacham.counsel 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel` (
  `counselCode` int(5) NOT NULL AUTO_INCREMENT,
  `counselItemCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `customer` varchar(20) COLLATE utf8_bin NOT NULL,
  `adviser` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `counselTitle` text COLLATE utf8_bin NOT NULL,
  `counselDate` date NOT NULL,
  `counselContent` text COLLATE utf8_bin NOT NULL,
  `counselRec` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`counselCode`,`counselItemCode`),
  KEY `FK_counsel_counselitem` (`counselItemCode`),
  KEY `FK_counsel_member` (`customer`),
  KEY `FK_counsel_member_2` (`adviser`),
  CONSTRAINT `FK_counsel_counselitem` FOREIGN KEY (`counselItemCode`) REFERENCES `counselitem` (`counselItemCode`),
  CONSTRAINT `FK_counsel_member` FOREIGN KEY (`customer`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_counsel_member_2` FOREIGN KEY (`adviser`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.counsel:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel` DISABLE KEYS */;
INSERT INTO `counsel` (`counselCode`, `counselItemCode`, `customer`, `adviser`, `counselTitle`, `counselDate`, `counselContent`, `counselRec`) VALUES
	(1, '4', 'customer', 'counselor', '기타', '2017-06-05', '된다', NULL),
	(2, '2', 'test', 'counselor', '고지혈증이', '2017-06-07', '고기좀 주세요', NULL);
/*!40000 ALTER TABLE `counsel` ENABLE KEYS */;


-- 테이블 dacham.counselitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `counselitem` (
  `counselItemCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `counselItemName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`counselItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.counselitem:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counselitem` DISABLE KEYS */;
INSERT INTO `counselitem` (`counselItemCode`, `counselItemName`) VALUES
	('1', '식단문의'),
	('2', '특별식단'),
	('3', '배송문의'),
	('4', '기타문의');
/*!40000 ALTER TABLE `counselitem` ENABLE KEYS */;


-- 테이블 dacham.diet 구조 내보내기
CREATE TABLE IF NOT EXISTS `diet` (
  `dietCode` int(5) NOT NULL AUTO_INCREMENT,
  `dietName` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(7) NOT NULL,
  `dietImg` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `diseaseCode` int(3) NOT NULL,
  `spDietItem` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dietCode`),
  KEY `FK_diet_disease` (`diseaseCode`),
  CONSTRAINT `FK_diet_disease` FOREIGN KEY (`diseaseCode`) REFERENCES `disease` (`diseaseCode`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.diet:~44 rows (대략적) 내보내기
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` (`dietCode`, `dietName`, `price`, `dietImg`, `diseaseCode`, `spDietItem`) VALUES
	(51, '고단백 해산물 식단', 30000, 'korean-726741_960_7202017-06-25 08_05_36.jpg', 1, '1'),
	(52, '저당 식단', 20000, '한식학원한식밥상2017-06-25 08_23_21.png', 4, '1');
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;


-- 테이블 dacham.dietinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `dietinfo` (
  `dietCode` int(5) NOT NULL,
  `sideDCode` int(5) NOT NULL,
  `sideDType` int(11) DEFAULT NULL,
  PRIMARY KEY (`dietCode`,`sideDCode`),
  KEY `FK_dietinfo_sidedish` (`sideDCode`),
  CONSTRAINT `FK_dietinfo_diet` FOREIGN KEY (`dietCode`) REFERENCES `diet` (`dietCode`),
  CONSTRAINT `FK_dietinfo_sidedish` FOREIGN KEY (`sideDCode`) REFERENCES `sidedish` (`sideDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.dietinfo:~117 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dietinfo` DISABLE KEYS */;
INSERT INTO `dietinfo` (`dietCode`, `sideDCode`, `sideDType`) VALUES
	(51, 18, NULL),
	(51, 32, NULL),
	(51, 34, NULL),
	(51, 36, NULL),
	(51, 49, NULL),
	(51, 62, NULL),
	(52, 18, NULL),
	(52, 32, NULL),
	(52, 36, NULL),
	(52, 40, NULL),
	(52, 41, NULL),
	(52, 51, NULL);
/*!40000 ALTER TABLE `dietinfo` ENABLE KEYS */;


-- 테이블 dacham.disease 구조 내보내기
CREATE TABLE IF NOT EXISTS `disease` (
  `diseaseCode` int(3) NOT NULL AUTO_INCREMENT,
  `diseaseName` varchar(20) COLLATE utf8_bin NOT NULL,
  `minAge` int(3) NOT NULL,
  `maxAge` int(3) NOT NULL,
  `minBloodS` int(3) NOT NULL,
  `maxBloodS` int(3) NOT NULL,
  `minBloodP` int(3) NOT NULL,
  `maxBloodP` int(3) NOT NULL,
  `judgement` varchar(10) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`diseaseCode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.disease:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` (`diseaseCode`, `diseaseName`, `minAge`, `maxAge`, `minBloodS`, `maxBloodS`, `minBloodP`, `maxBloodP`, `judgement`) VALUES
	(1, '당뇨', 10, 80, 100, 126, 0, 0, '주의'),
	(2, '당뇨', 10, 80, 127, 200, 0, 0, '위험'),
	(3, '당뇨', 10, 80, 201, 300, 0, 0, '고위험'),
	(4, '신부전증', 10, 80, 100, 126, 80, 120, '주의'),
	(5, '신부전증', 10, 80, 100, 126, 90, 140, '위험'),
	(6, '신부전증', 10, 80, 100, 126, 100, 160, '고위험'),
	(7, '신부전증', 10, 80, 127, 200, 80, 120, '위험'),
	(8, '신부전증', 10, 80, 127, 200, 90, 140, '위험'),
	(9, '신부전증', 10, 80, 127, 200, 100, 160, '고위험'),
	(10, '신부전증', 10, 80, 201, 300, 80, 120, '고위험'),
	(11, '신부전증', 10, 80, 201, 300, 90, 140, '고위험'),
	(12, '신부전증', 10, 80, 201, 300, 100, 160, '고위험'),
	(13, '고지혈증', 10, 80, 0, 300, 80, 120, '주의'),
	(14, '고지혈증', 10, 80, 0, 300, 90, 140, '위험'),
	(15, '고지혈증', 10, 80, 0, 300, 100, 160, '고위험'),
	(16, '심부전증', 10, 80, 0, 300, 80, 120, '주의'),
	(17, '심부전증', 10, 80, 0, 300, 90, 140, '위험'),
	(18, '심부전증', 10, 80, 0, 300, 10, 160, '고위험');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;


-- 테이블 dacham.foodgroup 구조 내보내기
CREATE TABLE IF NOT EXISTS `foodgroup` (
  `foodGCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `foodGName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`foodGCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodgroup:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodgroup` DISABLE KEYS */;
INSERT INTO `foodgroup` (`foodGCode`, `foodGName`) VALUES
	('01', '밥'),
	('02', '국'),
	('03', '메인 메뉴1'),
	('04', '메인 메뉴2'),
	('05', '메인 메뉴3'),
	('06', '메인 메뉴4');
/*!40000 ALTER TABLE `foodgroup` ENABLE KEYS */;


-- 테이블 dacham.foodmaterial 구조 내보내기
CREATE TABLE IF NOT EXISTS `foodmaterial` (
  `foodMCode` int(4) NOT NULL AUTO_INCREMENT,
  `foodMName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `kcal` double DEFAULT NULL,
  `carbohydrate` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `vitaminA_RE` double DEFAULT NULL,
  `vitaminA_retinol` double DEFAULT NULL,
  `vitaminA_beta` double DEFAULT NULL,
  `vitaminB1` double DEFAULT NULL,
  `vitaminB2` double DEFAULT NULL,
  `niacin` double DEFAULT NULL,
  `vitaminC` double DEFAULT NULL,
  `ca` double DEFAULT NULL,
  `p` double DEFAULT NULL,
  `fe` double DEFAULT NULL,
  `k` double DEFAULT NULL,
  `na` double DEFAULT NULL,
  `foodMImg` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `price` int(8) DEFAULT NULL,
  `unit` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`foodMCode`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodmaterial:~149 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodmaterial` DISABLE KEYS */;
INSERT INTO `foodmaterial` (`foodMCode`, `foodMName`, `kcal`, `carbohydrate`, `protein`, `fat`, `vitaminA_RE`, `vitaminA_retinol`, `vitaminA_beta`, `vitaminB1`, `vitaminB2`, `niacin`, `vitaminC`, `ca`, `p`, `fe`, `k`, `na`, `foodMImg`, `price`, `unit`) VALUES
	(1, '삼겹살', 493, 30, 22, 41, 25, 25, 0, 1, 0, 1, 0, 6, 0, 0, 0, 0, 'wher2017-06-07 07_14_28.PNG', 24000, 'kg'),
	(2, '후춧가루', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 'images2017-05-07 08_05_11.jpg', 15000, 'kg'),
	(4, '백미', 363, 13.4, 6.4, 0.4, 1, 0, 4, 0.23, 0.02, 1.2, 0, 7, 87, 1.3, 170, 8, 'o2017-06-07 08_22_15.jpg', 1500, 'kg'),
	(6, '시금치', 33, 6, 3.1, 0.5, 479, 0, 2876, 0.12, 0.34, 0.5, 60, 40, 29, 2.6, 502, 54, 'o2017-06-07 08_22_15.jpg', 8000, 'kg'),
	(7, '도라지', 74, 19.2, 2, 0.1, 2, 0, 9, 0.02, 0.06, 6, 14, 45, 70, 1.3, 302, 19, 'o2017-06-07 08_22_15.jpg', 18000, 'kg'),
	(8, '콩나물', 53, 4.7, 4.6, 1.8, 0.7, 0, 0, 0.59, 0.09, 0.8, 5, 48, 99, 0.6, 298, 3, '3', 9000, 'kg'),
	(12, '고추장', 178, 43.8, 4.9, 1.1, 408, 0, 2445, 0.17, 0.52, 1.6, 5, 40, 90, 2.2, 822, 3164, NULL, 15000, 'kg'),
	(13, '땅콩기름', 884, 0, 0, 100, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, NULL, 15000, 'L'),
	(14, '고추', 57, 10.3, 2.6, 1.7, 1078, 0, 6466, 0.13, 0.21, 2.1, 116, 16, 56, 0.9, 284, 12, NULL, 7900, 'kg'),
	(15, '오트밀', 382, 64.9, 13.2, 0, 0, 0, 3, 2.6, 0.07, 1.1, 0, 60, 381, 5.8, 383, 4, NULL, 41000, 'mg'),
	(20, '느타리버섯', 17, 5.8, 2.6, 0.1, 1, 0, 5, 0.21, 0.11, 0.9, 3, 1, 54, 0.5, 260, 3, NULL, 5000, 'kg'),
	(21, '도정곡', 373, 73.5, 11.4, 3.7, 0, 0, 0, 0.13, 0.21, 2.3, 0, 16, 175, 6.6, 574, 2, NULL, 14000, 'mg'),
	(22, '목이버섯', 19, 5, 0.7, 0, 0, 0, 0, 0.12, 0.06, 0.5, 0, 25, 19, 0.6, 98, 8, NULL, 5000, 'kg'),
	(23, '상황버섯', 182, 83.7, 5.5, 0.2, 0, 0, 0, 0.27, 2.68, 5.2, 0, 35, 94, 4.6, 463, 13, NULL, 15000, 'kg'),
	(24, '기장', 357, 74.6, 11.2, 1.4, 0, 0, 0, 0.42, 0.09, 2, 0, 14, 226, 2.8, 233, 6, NULL, 6000, 'g'),
	(25, '송이버섯', 32, 7.3, 1.9, 0.2, 0, 0, 0, 0.19, 0.3, 0.8, 0, 3, 34, 3.5, 342, 1, NULL, 100000, 'kg'),
	(26, '달걀, 유정란, 생것', 156, 8.1, 10.9, 0, 452, 450, 13, 0.18, 0.45, 0.4, 0, 63, 245, 2.9, 133, 163, NULL, 7500, 'kg'),
	(27, '양송이버섯', 17, 4.8, 3.5, 0.1, 0, 0, 0, 0.07, 0.53, 4, 0, 7, 102, 1.5, 535, 8, NULL, 7000, 'kg'),
	(28, '메밀', 374, 74.7, 11.5, 2.3, 17, 0, 104, 0.46, 0.26, 1.2, 0, 18, 308, 2.6, 477, 14, NULL, 20000, 'g'),
	(29, '팽이버섯', 39, 9.4, 2.5, 0, 1, 0, 8, 0.35, 0.11, 1.1, 11, 3, 158, 5.3, 134, 8, NULL, 7000, 'kg'),
	(31, '표고버섯', 18, 6.1, 2, 0.3, 0, 0, 0, 0.08, 0.23, 4, 0, 6, 28, 0.6, 180, 5, NULL, 12000, 'kg'),
	(32, '완두콩', 79, 13.2, 5.8, 0.3, 1, 0, 8, 0.01, 0.09, 0.8, 12, 25, 134, 1.6, 356, 13, NULL, 5000, 'kg'),
	(33, '감', 51, 13.5, 0.5, 0.1, 31, 0, 184, 0.07, 0.04, 0.3, 110, 7, 14, 0.4, 185, 11, NULL, 20000, 'kg'),
	(34, '멥쌀', 363, 79.5, 6.4, 0.4, 1, 0, 4, 0.23, 0.02, 1.2, 0, 7, 87, 1.3, 170, 8, NULL, 7000, 'mg'),
	(35, '귤', 39, 9.9, 0.7, 0.1, 1, 0, 5, 0.13, 0.04, 0.34, 44, 13, 11, 0, 173, 11, NULL, 15000, 'kg'),
	(36, '거위알, 생것 ', 193, 0.8, 13.2, 0, 173, 170, 18, 0.15, 0.48, 0.1, 0, 41, 70, 2.5, 77, 45, NULL, 10000, 'kg'),
	(37, '대추', 90, 22.8, 2.2, 0.1, 2, 0, 13, 0.04, 0.05, 0.6, 62, 28, 45, 1.2, 357, 1, NULL, 30000, 'kg'),
	(38, '메추라기알, 생것', 176, 2.2, 12.6, 0, 571, 560, 66, 0.07, 1.16, 0.6, 0, 60, 191, 1.8, 151, 156, NULL, 8000, 'kg'),
	(39, '딸기', 36, 8.9, 0.8, 0.2, 0, 0, 0, 0.03, 0.17, 0.5, 71, 7, 30, 0.4, 167, 13, NULL, 10000, 'kg'),
	(40, '밀', 342, 74.6, 13.2, 1.5, 10, 0, 57, 0.52, 0.23, 2.6, 0, 24, 290, 5.2, 780, 20, NULL, 9000, 'kg'),
	(41, '두부', 880, 8, 76, 59, 0, 0, 0, 1.2, 0.5, 3, 0, 440, 1230, 14, 1360, 40, NULL, 20000, 'kg'),
	(42, '레몬', 30, 7, 1.4, 0.8, 0, 0, 0, 0.05, 0.02, 0.7, 70, 55, 15, 0.4, 120, 4, NULL, 9000, 'kg'),
	(43, '매실', 34, 7.8, 1.1, 1.1, 2, 0, 14, 0.06, 0.02, 0.5, 11, 28, 24, 3.7, 301, 3, NULL, 13000, 'kg'),
	(44, '멜론', 36, 8.9, 1.2, 0, 1, 0, 7, 0.19, 0.01, 0.3, 0, 16, 13, 1.1, 198, 20, NULL, 9000, 'kg'),
	(45, '가자미', 129, 0.3, 22.1, 3.7, 8, 8, 0, 0.18, 0.26, 4.3, 2, 40, 196, 0.7, 377, 230, NULL, 15000, 'kg'),
	(46, '바나나', 80, 21.2, 1, 0, 18, 0, 109, 0.1, 0.07, 0.4, 0, 6, 25, 0.4, 279, 1, NULL, 7000, 'kg'),
	(47, '붉은팥', 356, 68.4, 19.3, 0.1, 0, 0, 0, 0.54, 0.14, 3.3, 0, 82, 424, 5.6, 1180, 1, NULL, 15000, 'kg'),
	(48, '보리', 334, 71.1, 10.6, 1.8, 0, 0, 0, 0.31, 0.1, 5.5, 0, 43, 360, 5.4, 480, 3, NULL, 11000, 'kg'),
	(49, '갈치', 149, 0, 18.5, 7.5, 20, 20, 0, 0.13, 0.11, 2.3, 1, 46, 191, 1, 260, 100, NULL, 35000, 'kg'),
	(50, '배', 48, 12.8, 0.4, 0.1, 9, 0, 52, 0.05, 0.02, 0.3, 0, 5, 16, 0.4, 100, 0, NULL, 30000, 'kg'),
	(51, '수수', 364, 74.1, 9.5, 2.6, 0, 0, 0, 0.1, 0.03, 3, 0, 14, 290, 2.4, 410, 2, NULL, 7400, 'g'),
	(52, '복숭아', 60, 12.2, 1.4, 1.3, 2, 0, 11, 0.1, 0.07, 0.6, 0, 90, 36, 0.2, 192, 1, NULL, 15000, 'kg'),
	(53, '검정팥', 351, 64.4, 21.6, 0.3, 14, 0, 85, 0.46, 0.29, 2.3, 15, 68, 366, 7.3, 2644, 20, NULL, 16000, 'kg'),
	(54, '사과', 49, 13.1, 0.2, 0.1, 1, 0, 4, 0.05, 0.03, 0.5, 48, 6, 9, 0.3, 146, 16, NULL, 18500, 'kg'),
	(55, '고등어', 183, 0, 20.2, 10.4, 23, 23, 0, 0.18, 0.46, 8.2, 1, 26, 232, 1.6, 310, 75, NULL, 15000, 'kg'),
	(56, '개고기', 271, 0.1, 19, 20.2, 12, 12, 0, 0.12, 0.18, 1.9, 3, 9, 168, 2.8, 270, 72, NULL, 18000, 'kg'),
	(57, '콩비지 ', 74, 11.7, 3.5, 1.5, 0, 0, 0, 0.07, 0.03, 1.2, 0, 66, 25, 2.3, 113, 46, NULL, 5000, 'kg'),
	(58, '옥수수', 109, 23.4, 3.8, 0.5, 26, 0, 156, 0.23, 0.14, 2.2, 0, 21, 106, 1.8, 314, 1, NULL, 10000, 'g'),
	(59, '꽁치', 142, 0.4, 22.7, 4.7, 21, 21, 0, 0.02, 0.28, 6.4, 1, 42, 241, 1.7, 150, 80, NULL, 6900, 'kg'),
	(60, '닭고기', 180, 0.1, 19, 10.6, 50, 50, 0, 0.2, 0.21, 2.7, 0, 10, 170, 0.9, 59, 66, NULL, 6000, 'kg'),
	(61, '광어', 109, 0.3, 20.9, 2.1, 8, 8, 0, 0.1, 0.2, 6.5, 1, 21, 240, 0.6, 0, 0, NULL, 20000, 'kg'),
	(62, '율무', 377, 70.5, 15.4, 3.2, 0, 0, 0, 0.32, 0.07, 1.7, 0, 10, 290, 3.7, 324, 4, NULL, 14000, 'g'),
	(63, '목살', 180, 1.3, 20.2, 9.5, 7, 7, 0, 0.4, 0.1, 0.8, 0, 10, 163, 6.4, 366, 108, NULL, 18000, 'kg'),
	(64, '연두부', 62, 4.7, 4.2, 2.8, 0, 0, 0, 0.14, 0.02, 0.4, 0, 38, 77, 1.2, 223, 5, NULL, 6500, 'kg'),
	(65, '돼지등심', 155, 6.2, 22.2, 3.8, 6, 6, 0, 1, 0.29, 2, 0, 9, 225, 0.8, 220, 7, NULL, 18000, 'kg'),
	(66, '농어', 96, 0.2, 18.2, 1.9, 36, 36, 0, 0.18, 0.13, 3.1, 1, 58, 196, 1.5, 390, 108, NULL, 10000, 'kg'),
	(67, '조', 386, 76, 9.7, 4.2, 0, 0, 0, 0.21, 0.09, 1.5, 0, 11, 184, 2.3, 386, 3, NULL, 4000, 'g'),
	(68, '소등심', 378, 3, 15.9, 31.7, 0, 0, 0, 0.07, 0.16, 1, 0, 7, 130, 0.3, 226, 54, NULL, 120000, 'kg'),
	(69, '콩', 420, 30.7, 36.2, 17.8, 0, 0, 0, 0.53, 0.28, 2.2, 0, 245, 620, 6.5, 1340, 2, NULL, 10000, 'kg'),
	(70, '돼지안심', 186, 0.5, 14.1, 13.2, 2, 2, 0, 0.91, 0.18, 4.1, 0, 2, 227, 1.6, 117, 49, NULL, 18000, 'kg'),
	(71, '찹쌀', 361, 75.7, 7.3, 2.8, 0, 0, 0, 0.33, 0.05, 6, 0, 15, 228, 1.3, 218, 5, NULL, 5000, 'g'),
	(72, '소안심', 148, 0.2, 20.8, 6.3, 12, 12, 0, 0.08, 0.25, 5.2, 0, 23, 175, 4.7, 381, 453, NULL, 120000, 'kg'),
	(73, '대구', 86, 0.3, 19.5, 0.3, 23, 23, 0, 0.12, 0.16, 2.4, 1, 35, 193, 0.4, 0, 0, NULL, 15000, 'kg'),
	(74, '돼지갈비', 249, 11.2, 18.1, 13.4, 0, 0, 0, 0.52, 0.32, 1.3, 0, 15, 198, 1.3, 290, 20, NULL, 17000, 'kg'),
	(75, '순두부', 55, 0.7, 5.8, 3.1, 0, 0, 1, 0.15, 0.02, 0.4, 0, 40, 62, 0.9, 185, 6, NULL, 7500, 'kg'),
	(76, '호밀', 334, 70.7, 15.9, 1.5, 0, 0, 0, 0.26, 0.16, 1.8, 0, 10, 378, 6.4, 501, 2, NULL, 2000, 'mg'),
	(77, '소갈비', 307, 1.9, 16.5, 24.4, 0, 0, 0, 0.03, 0.27, 0.9, 0, 9, 110, 3, 194, 127, NULL, 170000, 'kg'),
	(78, '가리비, 관자', 105, 2.4, 20.8, 0.8, 0.8, 0.8, 0.8, 0.04, 0.1, 1.4, 3, 10, 50, 0.8, 0, 0, NULL, 44000, 'kg'),
	(79, '양갈비', 239, 0.8, 17.9, 17, 12, 12, 0, 0.06, 0.22, 3.8, 1, 5, 120, 2.3, 220, 55, NULL, 48000, 'kg'),
	(80, '돼지앞다리살', 185, 0, 16.3, 12.3, 2, 2, 0, 0.91, 0.17, 3.4, 0, 1, 239, 2, 118, 50, NULL, 12000, 'kg'),
	(81, '강낭콩', 169, 29.2, 10, 1.2, 0, 0, 0, 0.48, 0.11, 1.6, 4, 62, 97, 3.7, 732, 5, NULL, 9800, 'kg'),
	(82, '굴', 85, 1.5, 11.6, 3.2, 27, 11, 95, 0.22, 0.33, 4.2, 4, 109, 204, 3.7, 0, 0, NULL, 15000, 'kg'),
	(83, '감자', 63, 13.8, 2.4, 0, 1, 0, 3, 0.26, 0.04, 0.4, 8, 14, 117, 4.2, 558, 21, NULL, 2100, 'kg'),
	(84, '돼지뒷다리살', 235, 0.3, 18.5, 16.5, 2, 2, 0, 0.92, 0.18, 4.9, 0, 1, 179, 1.7, 300, 59, NULL, 11000, 'kg'),
	(85, '돼지사태', 120, 0, 22, 2.9, 5, 5, 0, 0.42, 0.2, 0.8, 1, 4, 166, 1.2, 326, 50, NULL, 9000, 'kg'),
	(86, '꼬막', 63, 1.6, 12.6, 0.3, 39, 39, 0, 0.03, 0.24, 3.4, 3, 83, 136, 6.8, 0, 0, NULL, 7600, 'kg'),
	(87, '고구마', 131, 31.2, 1.4, 0.2, 19, 0, 113, 0.06, 0.05, 0.7, 25, 24, 54, 0.5, 426, 15, NULL, 15000, 'kg'),
	(88, '소양지머리', 214, 4.6, 19.1, 12.2, 0, 0, 0, 0.13, 0.28, 1.4, 0, 8, 167, 2.9, 297, 75, NULL, 50000, 'kg'),
	(89, '도토리묵', 56, 13, 0.2, 0.2, 0, 0, 0, 0.01, 0.02, 0, 0, 6, 300, 0.4, 8, 2, NULL, 17000, 'kg'),
	(90, '곤악(구약나물)', 6, 3, 0.2, 0, 0, 0, 0, 0, 0, 0, 0, 75, 10, 0.5, 12, 10, NULL, 10000, 'kg'),
	(91, '백합', 74, 3.6, 11.7, 1, 0, 0, 0, 0.03, 0.22, 3.4, 3, 161, 133, 11.9, 0, 0, NULL, 5600, 'kg'),
	(92, '오리고기', 328, 0.1, 16, 27.6, 6, 6, 0, 0.21, 0.31, 3.9, 2, 15, 180, 1.7, 233, 85, NULL, 19000, 'kg'),
	(93, '돼지감자', 68, 15.1, 1.9, 0.2, 0, 0, 0, 0.07, 0.05, 1.7, 12, 12, 55, 0.2, 630, 2, NULL, 2000, 'kg'),
	(94, '바지락', 73, 2.3, 12.5, 1.2, 13, 10, 20, 0.04, 0.11, 2.8, 2, 78, 185, 3.7, 0, 0, NULL, 5900, 'kg'),
	(95, '꽃게', 74, 2, 13.7, 0.8, 0, 0, 0, 0.04, 0.07, 2.6, 0, 118, 182, 3, 360, 304, NULL, 10000, 'kg'),
	(96, '마', 67, 15, 1.7, 0.2, 0, 0, 0, 0.12, 0.01, 0.2, 6, 14, 28, 0.2, 550, 5, NULL, 5000, 'kg'),
	(97, '들깨 ', 540, 37.7, 16.9, 39.5, 3, 0, 16, 0.42, 0.16, 6, 0, 750, 527, 7.5, 580, 21, NULL, 6500, 'kg'),
	(98, '꼴뚜기', 78, 1, 13.6, 1.8, 0, 0, 0, 0.02, 0.1, 2.4, 0, 48, 166, 1, 244, 152, NULL, 15000, 'kg'),
	(99, '아피오스감자', 175, 38.2, 6.1, 0.5, 0, 0, 0, 0.19, 0.05, 2.1, 21, 67, 126, 2, 719, 31, NULL, 31000, 'kg'),
	(101, '땅콩', 568, 26, 24.5, 45.1, 5, 0, 31, 0.4, 0.1, 3, 6, 68, 409, 6.7, 898, 7, NULL, 12500, 'kg'),
	(102, '낙지', 55, 0.1, 11.5, 0.6, 0, 0, 0, 0.04, 0.05, 1.5, 0, 15, 149, 0.5, 273, 227, NULL, 15000, 'kg'),
	(103, '문어', 74, 0.2, 15.5, 0.8, 0, 0, 0, 0.03, 0.12, 2.2, 0, 31, 188, 1, 300, 211, NULL, 50000, 'kg'),
	(104, '꽃새우', 114, 0.6, 22, 2, 0, 0, 0, 0.02, 0.06, 4, 0, 48, 261, 6, 0, 0, NULL, 17000, 'kg'),
	(105, '우렁', 66, 3.1, 10.6, 0.9, 108, 13, 568, 0.16, 0.27, 3, 2, 1567, 127, 16.8, 0, 0, NULL, 9900, 'kg'),
	(106, '야콘', 62, 14.7, 0.7, 0.1, 13, 0, 80, 0.1, 0.02, 0.1, 5, 5, 12, 2.2, 199, 7, NULL, 6900, 'kg'),
	(107, '대하', 82, 0.1, 18.1, 0.6, 0, 0, 0, 0.02, 0.06, 1.9, 1, 74, 210, 1.4, 340, 120, NULL, 20000, 'kg'),
	(108, '보리새우', 71, 0.1, 15.1, 0.7, 0, 0, 0, 0.07, 0.08, 2.3, 1, 87, 240, 1.1, 450, 140, NULL, 19000, 'kg'),
	(109, '마카다미아', 720, 12.2, 8.3, 76.7, 0, 0, 0, 0.21, 0.09, 2.1, 0, 47, 140, 1.3, 300, 190, NULL, 30000, 'kg'),
	(110, '전분', 379, 93.8, 0.3, 3.6, 12, 0, 69, 0.12, 0.1, 1.2, 0, 6, 14, 0.8, 14, 8, NULL, 8000, 'kg'),
	(111, '오징어', 95, 0, 19.5, 1.3, 2, 2, 0, 0.05, 0.08, 2.5, 0, 25, 273, 0.5, 260, 181, NULL, 13000, 'kg'),
	(112, '천마', 77, 18.5, 0.9, 0, 0, 0, 0, 0.1, 0.05, 0.6, 92, 16, 21, 0.9, 332, 8, NULL, 26000, 'kg'),
	(113, '주꾸미', 52, 0.5, 10.8, 0.5, 0, 0, 0, 0.03, 0.18, 1.6, 0, 19, 129, 1.4, 0, 0, NULL, 10000, 'kg'),
	(114, '해파리', 6, 0.1, 1.3, 0, 0, 0, 0, 0, 0, 0, 0, 2, 8, 0, 0, 0, NULL, 5000, 'kg'),
	(115, '돌김', 165, 43.3, 35.5, 1.7, 4200, 0, 25200, 1.15, 2.7, 11.9, 71, 412, 472, 18.6, 0, 0, NULL, 850, 'g'),
	(116, '칡뿌리', 154, 36.1, 1.9, 0.4, 0, 0, 0, 0.12, 0.04, 0.7, 6, 15, 14, 2.6, 0, 0, NULL, 5000, 'kg'),
	(117, '토란', 124, 26.1, 2.4, 0, 1, 0, 7.7, 0.12, 0.04, 0.7, 34, 29, 130, 1.4, 921, 13, NULL, 6500, 'kg'),
	(118, '설탕', 387, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.1, 0, 0, NULL, 1700, 'kg'),
	(119, '밤', 147, 33.5, 2.9, 0.1, 3, 0, 15, 0.91, 0.06, 0.4, 2, 13, 63, 0.9, 409, 1, NULL, 7800, 'kg'),
	(120, '우유', 53, 7.3, 3.1, 1.3, 26, 24, 10, 0.06, 0.11, 0.3, 2, 300, 74, 1, 152, 60, NULL, 2500, 'L'),
	(121, '다시마, 마른것', 110, 45.2, 7.4, 1.1, 96, 0, 576, 0.22, 0.45, 4.5, 18, 708, 186, 6.3, 7500, 3100, NULL, 12900, 'kg'),
	(122, '모짜렐라치즈', 215, 12.4, 17.6, 10.1, 241, 238, 20, 0.05, 0.26, 0.4, 0, 403, 416, 0.5, 65, 654, NULL, 7000, 'kg'),
	(123, '다시마, 생것', 12, 4.2, 1.1, 0.2, 129, 0, 774, 0.03, 0.13, 1.1, 14, 103, 23, 2.4, 1242, 75, NULL, 6000, 'kg'),
	(124, '시럽', 259, 67.1, 2.1, 0.1, 0, 0, 0, 0.05, 0.17, 1.6, 0, 7, 64, 3.6, 132, 88, NULL, 9690, 'kg'),
	(125, '은행', 185, 27.4, 5.4, 1.7, 15, 0, 92, 0.4, 0.04, 1.6, 14, 5, 156, 1.1, 578, 7, NULL, 6900, 'kg'),
	(126, '매생이', 13, 6.1, 0.5, 0, 61, 0, 364, 0.17, 0.15, 0.9, 3, 56, 41, 10.1, 159, 689, NULL, 7600, 'kg'),
	(127, '간장', 39, 4.9, 7.7, 0.3, 0, 0, 0, 0.03, 0.08, 1.2, 0, 39, 155, 2.1, 400, 5858, NULL, 7000, 'L'),
	(128, '체다치즈', 236, 19.3, 17.7, 9.2, 300, 267, 200, 0.08, 0.14, 0.5, 0, 434, 645, 0.8, 98, 942, NULL, 9000, 'kg'),
	(129, '아몬드', 615, 15.8, 23.7, 56, 0, 0, 0, 0.06, 1.03, 1.4, 0, 190, 363, 4.7, 612, 256, NULL, 10000, 'kg'),
	(130, '미역, 줄기, 생것', 14, 4.6, 1.8, 0.2, 60, 0, 360, 0.03, 0.06, 1, 12, 120, 55, 0.4, 1900, 520, NULL, 11000, 'kg'),
	(131, '양갱', 286, 67.7, 0.2, 0.3, 0, 0, 0, 0.01, 0.01, 0, 0, 25, 27, 0.9, 23, 6, NULL, 4680, 'kg'),
	(132, '올리브유', 921, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.4, 0, 0, NULL, 18000, 'L'),
	(133, '해바라기유', 921, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 6000, 'L'),
	(134, '미역, 생것', 11, 5, 2.1, 0.2, 0, 0, 1845, 0.06, 0.16, 1, 18, 153, 40, 1, 0, 0, NULL, 5000, 'kg'),
	(135, '버터', 778, 0.5, 0.5, 84.5, 418, 397, 123, 0.01, 0.03, 0, 0, 22, 22, 0.1, 28, 725, NULL, 12000, 'kg'),
	(136, '검정깨', 569, 21.2, 20.5, 49.2, 3, 0, 15, 0.365, 0.15, 5.1, 0, 1060, 546, 10.5, 412, 2, NULL, 23500, 'kg'),
	(137, '유채씨기름', 921, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 7000, 'L'),
	(138, '젤라틴', 381, 90.5, 7.8, 0, 0, 0, 0, 0, 0.04, 0, 0, 3, 141, 0.1, 7, 466, NULL, 4600, 'kg'),
	(139, '참깨', 575, 20.2, 19.1, 51, 2, 0, 13, 0.56, 0, 5.4, 0, 1156, 587, 10.4, 439, 4, NULL, 22000, 'kg'),
	(140, '미역, 마른것 ', 126, 36.3, 20, 2.9, 555, 0, 3330, 0.26, 1, 4.5, 18, 959, 307, 9.1, 5500, 6100, NULL, 45000, 'kg'),
	(141, '녹차가루', 381, 50.8, 33, 5.8, 3500, 0, 21000, 1.47, 1.68, 4.7, 135, 90, 490, 6.9, 1455, 3, NULL, 19000, 'kg'),
	(142, '해바라기씨', 584, 20, 20.8, 51.5, 5, 0, 30, 1.48, 0.63, 8.3, 1, 78, 660, 5.3, 645, 9, NULL, 20000, 'kg'),
	(143, '조청', 352, 87.1, 1, 0, 0, 0, 0, 0, 0, 1.6, 0, 12, 69, 0.1, 273, 11, NULL, 6700, 'kg'),
	(144, '호두', 663, 12.6, 15.4, 66.4, 4, 0, 22, 0.24, 0.09, 1.1, 0, 92, 332, 2.2, 368, 5, NULL, 12500, 'kg'),
	(145, '월계수잎', 370, 81.8, 7.2, 7.2, 6, 0, 1, 0.33, 0.48, 1.3, 14, 836, 85, 29.6, 579, 60, NULL, 23000, 'kg'),
	(146, '포도당', 335, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.1, 0, 0, NULL, 2000, 'kg'),
	(147, '톳, 마른것 ', 81, 32, 6.6, 0.8, 0, 0, 0, 0, 0, 0, 0, 768, 118, 76.2, 0, 0, NULL, 32000, 'kg'),
	(148, '인삼', 98, 21.7, 4.5, 0.3, 0, 0, 0, 0.05, 0.14, 0.6, 15, 113, 97, 8.3, 324, 18, NULL, 78000, 'kg'),
	(149, '호박씨', 558, 9.9, 29.3, 49.7, 5, 0, 32, 0.32, 0.13, 4.9, 0, 54, 1148, 9.6, 730, 5, NULL, 8800, 'kg'),
	(150, '물엿', 293, 75.7, 0.4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1.2, 4, 2, NULL, 8000, 'kg'),
	(151, '송화가루', 400, 63.2, 17.4, 8.6, 21, 0, 128, 0.01, 0.12, 1.2, 12, 5, 489, 2, 966, 5, NULL, 6400, 'kg'),
	(152, '가지', 17, 4, 0.8, 0.1, 63, 0, 377, 0.18, 0.03, 0.4, 2, 18, 24, 0.2, 189, 0, NULL, 7000, 'kg'),
	(153, '파래, 생것 ', 11, 3, 2.4, 0.1, 105, 0, 0, 0.02, 0.11, 0.6, 15, 22, 31, 13.7, 424, 848, NULL, 3000, 'kg'),
	(154, '깨소금', 582, 13.7, 18.1, 56.7, 0, 0, 0, 0.51, 0.14, 0, 0, 1223, 640, 19, 0, 0, NULL, 1, 'kg'),
	(155, '된장', 171, 11.7, 13.6, 8.2, 0, 0, 0, 0.04, 0.12, 1.2, 0, 84, 208, 2.5, 647, 3748, NULL, 22000, 'g'),
	(156, '샐러드드레싱', 457, 15.6, 0.8, 44.8, 39, 0, 232, 0.02, 0.05, 0.2, 4, 24, 19, 0.8, 67, 836, NULL, 6000, 'kg'),
	(157, '소금', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, 0.2, 135, 33597, NULL, 17000, 'Kg'),
	(158, '식초', 19, 4.7, 0, 0, 0, 0, 0, 0.01, 0.01, 0.1, 0, 3, 6, 0.1, 8, 2, NULL, 28000, 'L'),
	(159, '파슬리', 292, 50.6, 26.6, 5.5, 192, 0, 1152, 0.2, 2.38, 9.9, 125, 1140, 436, 22, 2683, 452, NULL, 4000, 'g'),
	(160, '후추', 347, 66.3, 11.3, 4.1, 22, 0, 132, 0.11, 0.22, 1.1, 0, 281, 167, 19.5, 1103, 46, NULL, 30000, 'kg'),
	(161, '쌈장', 200, 29.6, 10.1, 4.6, 55, 0, 329, 0.18, 0.1, 1.7, 0, 68, 171, 2.1, 560, 3288, NULL, 3400, 'kg'),
	(162, '청국장', 108, 14.9, 10.2, 0.8, 13, 0, 80, 0.15, 0.29, 1.5, 0, 96, 177, 3.8, 602, 961, NULL, 13000, 'kg'),
	(163, '고사리', 19, 1.8, 4.3, 0.2, 3, 0, 18, 0.14, 0.14, 0.3, 2, 17, 59, 0.4, 374, 3, NULL, 7500, 'kg'),
	(164, '붉은고추', 57, 10.3, 2.6, 1.7, 1078, 0, 6466, 0.13, 0.21, 2.1, 116, 16, 56, 0.9, 284, 12, NULL, 10000, 'kg'),
	(165, '풋고추', 27, 4.6, 1.4, 0.8, 0, 0, 0, 0, 0, 0, 72, 14, 39, 0.9, 162, 9, NULL, 10000, 'kg'),
	(166, '굴소스', 107, 18.3, 7.7, 0.3, 0, 0, 0, 0.01, 0.07, 0.8, 0, 25, 120, 1.2, 260, 4500, NULL, 12000, 'kg'),
	(167, '돈까스소스', 119, 28.5, 1.1, 0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 34000, 'kg'),
	(168, '깻잎', 41, 7.9, 4, 0.4, 1524, 0, 9145, 0.09, 0.45, 0.9, 12, 211, 72, 2.2, 389, 1, NULL, 5600, 'kg'),
	(169, '냉이', 40, 7.8, 3.4, 1, 47, 0, 279, 0.42, 0.37, 1.1, 23, 193, 79, 4.2, 351, 7, NULL, 8000, 'kg'),
	(170, '카레가루', 356, 58.3, 10.4, 14.6, 31, 0, 187, 0.12, 0.1, 1.2, 0, 65, 132, 5.1, 531, 4705, NULL, 5400, 'kg'),
	(171, '달래', 46, 10, 3, 0.3, 0, 0, 2, 0.13, 0.11, 0.8, 8, 67, 63, 77, 359, 27, NULL, 7500, 'kg'),
	(172, '고춧가루', 324, 57.2, 14.7, 10, 3440, 0, 20640, 0.4, 1.25, 14.4, 32, 63, 214, 11, 2400, 15, NULL, 12000, 'kg'),
	(173, '당근', 37, 8.6, 1.1, 0.1, 1270, 0, 7620, 0.06, 0.05, 0.8, 8, 40, 38, 0.7, 395, 30, NULL, 15000, 'kg'),
	(174, '더덕', 78, 19.5, 2.9, 0.1, 0, 0, 0, 0.16, 0.11, 0.7, 11, 24, 130, 1.5, 308, 1, NULL, 20000, 'kg'),
	(175, '생강가루', 347, 72.7, 9.2, 5.1, 0, 0, 0, 0.06, 0.2, 7, 6, 128, 196, 15.6, 1629, 50, NULL, 55000, 'kg'),
	(176, '도라지', 74, 19.2, 2, 0.1, 2, 0, 9, 0.02, 0.06, 6, 14, 45, 70, 1.3, 302, 19, NULL, 35000, 'kg'),
	(177, '토마토케첩', 121, 32.5, 2.7, 0.1, 140, 0, 0, 0.13, 0.22, 1.5, 9, 11, 36, 3.5, 510, 1400, NULL, 4000, 'kg'),
	(178, '두릅', 26, 3.7, 3.7, 1, 67, 0, 403, 0.12, 0.25, 2, 15, 15, 103, 2.4, 446, 5, NULL, 27000, 'kg'),
	(179, '토마토소스', 44, 8.5, 2, 0.2, 80, 0, 480, 0.09, 0.08, 1.3, 0, 18, 42, 0.9, 340, 540, NULL, 7000, 'kg'),
	(180, '마늘', 40, 7, 2.4, 0.2, 21, 0, 123, 0.3, 0.11, 0.5, 48, 48, 79, 11, 435, 30, NULL, 11900, 'kg'),
	(181, '메밀', 24, 1.9, 1.9, 0.4, 3020, 0, 18118, 0.29, 0.15, 1, 1, 11, 49, 0.9, 106, 4, NULL, 11500, 'kg'),
	(182, '겨자소스', 315, 40.1, 5.9, 14.5, 1, 0, 0, 0.22, 0.07, 1.5, 0, 60, 120, 2.1, 190, 2900, NULL, 3300, 'kg'),
	(183, '순무', 33, 7, 1.4, 0, 0, 0, 0, 0.06, 0.09, 0.8, 17, 50, 39, 1.4, 350, 46, NULL, 5000, 'kg'),
	(184, '고추냉이페이스트', 262, 42.6, 3, 12.3, 1, 0, 8, 0.12, 0.03, 0.5, 0, 58, 85, 0.5, 248, 1965, NULL, 10000, 'kg'),
	(185, '무', 25, 5.2, 2, 0.2, 298, 0, 1788, 0.08, 0.33, 0.3, 18, 74, 22, 2, 230, 46, NULL, 5000, 'kg'),
	(186, '열무', 17, 2.8, 2.4, 0.1, 105, 0, 632, 0.14, 0.1, 0.7, 23, 120, 48, 2.6, 772, 36, NULL, 5000, 'kg'),
	(187, '미나리', 21, 2.2, 2.2, 0.2, 220, 0, 1320, 0.15, 0.169, 0.6, 15, 55, 50, 2, 382, 18, NULL, 12900, 'kg'),
	(188, '참기름', 456, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 9000, 'L'),
	(189, '바실', 46, 9.7, 2.6, 0.6, 72, 0, 433, 0.1, 0.01, 0.3, 32, 17, 235, 0.1, 429, 12, NULL, 25300, 'kg'),
	(190, '배추', 12, 2.4, 1.1, 0, 1, 0, 5, 0.2, 0.03, 0.4, 10, 29, 18, 0.5, 222, 15, NULL, 6000, 'kg'),
	(191, '부추', 22, 4.1, 1.8, 0.3, 15, 0, 87, 0.16, 0.08, 0.6, 5, 28, 23, 3.4, 8, 3, NULL, 8800, 'kg'),
	(192, '브로콜리', 33, 5, 5, 0.3, 128, 0, 766, 0.12, 0.26, 1.1, 98, 64, 195, 1.5, 307, 10, NULL, 7900, 'kg'),
	(193, '비트', 16, 2.8, 2.2, 0.1, 397, 0, 2379, 0.01, 0.52, 0.2, 14, 57, 54, 4, 494, 254, NULL, 10000, 'kg'),
	(194, '상추', 14, 2.4, 1.1, 0.3, 172, 0, 1034, 0.09, 0.1, 0.3, 11, 41, 20, 1.5, 379, 5, NULL, 10000, 'kg'),
	(195, '생강', 92, 0.5, 0.3, 0.3, 2, 0, 14, 0, 0, 0.5, 3, 23, 10, 1.4, 22, 29, NULL, 7500, 'kg'),
	(196, '숙주나물', 12, 1.4, 2.2, 0.1, 4, 0, 24, 0.04, 0.05, 0.5, 10, 15, 32, 0.6, 123, 3, NULL, 8800, 'kg'),
	(197, '시금치', 33, 6, 3.1, 0.5, 479, 0, 2876, 0.12, 0.34, 0.5, 60, 40, 29, 2.6, 502, 54, NULL, 15000, 'kg'),
	(198, '쑥 ', 84, 20, 5.3, 0, 664, 0, 2982, 0.12, 0.32, 0.8, 33, 230, 65, 4.3, 1103, 11, NULL, 10000, 'kg'),
	(199, '쑥갓', 26, 4.6, 3.5, 0.1, 626, 0, 3455, 0.07, 0.14, 0.3, 18, 38, 47, 2, 260, 47, NULL, 7800, 'kg'),
	(200, '아스파라거스', 15, 2.8, 1.9, 0.1, 54, 0, 321, 0.12, 0.13, 0.5, 5, 22, 61, 0.5, 220, 4, NULL, 12500, 'kg'),
	(201, '아욱', 23, 2.6, 3.6, 0.6, 1143, 0, 6559, 0.11, 0.19, 0.9, 48, 94, 66, 2, 564, 35, NULL, 8900, 'kg'),
	(202, '양배추', 20, 4.4, 1.4, 0.1, 24, 0, 141, 0.04, 0.01, 0.4, 9, 31, 29, 0.5, 206, 16, NULL, 5700, 'kg'),
	(203, '양파', 36, 8.4, 1, 0.1, 0, 0, 0, 0.04, 0.01, 0.1, 8, 16, 30, 0.4, 141, 2, NULL, 6000, 'kg'),
	(204, '연근', 70, 16.4, 2.1, 0.1, 0, 0, 0, 0.11, 0.01, 0.3, 57, 22, 67, 39, 377, 36, NULL, 12500, 'kg'),
	(205, '오이', 11, 2.3, 0.8, 0.1, 30, 0, 181, 0.03, 0.03, 0.2, 10, 26, 33, 0.2, 162, 5, NULL, 5600, 'kg'),
	(206, '옥수수', 40, 8.2, 1.7, 0.3, 0, 0, 0, 0.17, 0.1, 0.2, 22, 10, 53, 0.4, 0, 0, NULL, 7500, 'kg'),
	(207, '우엉', 69, 15, 3, 0.1, 0, 0, 0, 0.04, 0.06, 0.5, 3, 56, 72, 39, 370, 5, NULL, 12500, 'kg'),
	(208, '죽순', 23, 3.6, 3.5, 0.2, 0, 0, 0, 0.14, 0.23, 0.5, 1, 12, 68, 1, 525, 1, NULL, 23000, 'kg'),
	(209, '참나물', 35, 7.5, 3, 0.1, 234, 0, 1404, 0.04, 0.03, 0.2, 6, 46, 14, 36, 567, 24, NULL, 9750, 'kg'),
	(210, '취나물', 53, 11.3, 4.2, 0.3, 247, 0, 1483, 0.19, 0.12, 0.8, 9, 83, 73, 2.4, 661, 38, NULL, 12500, 'kg'),
	(211, '파', 29, 9.7, 1.2, 0.2, 1, 0, 8, 0.02, 0.04, 0.3, 11, 25, 26, 1, 239, 17, NULL, 15800, 'kg'),
	(212, '케일', 43, 7.3, 5, 0.6, 302, 0, 1813, 0.12, 0.23, 1.1, 80, 281, 45, 1.1, 318, 43, NULL, 7200, 'kg'),
	(213, '콩나물', 53, 4.7, 4.6, 1.8, 0, 0, 0, 0.59, 0.09, 0.8, 5, 48, 99, 0.6, 298, 3, NULL, 7500, 'kg'),
	(214, '토마토', 18, 4.5, 0.8, 0, 12, 0, 69, 0.04, 0.01, 0.5, 12, 6, 12, 0.5, 196, 16, NULL, 7800, 'kg'),
	(215, '방울토마토', 7, 3.9, 0.9, 0.1, 241, 0, 1448, 0.06, 0.03, 0.6, 21, 14, 41, 0.4, 183, 6, NULL, 8700, 'kg'),
	(216, '파슬리', 36, 6, 3.2, 0.5, 490, 0, 2941, 0.17, 0.24, 1.4, 139, 206, 60, 1.5, 680, 35, NULL, 20000, 'kg'),
	(217, '파프리카', 23, 5.2, 1.1, 0.2, 5, 0, 30, 0.04, 0.03, 1, 104, 1, 26, 0.6, 110, 10, NULL, 13900, 'kg'),
	(218, '피망', 20, 4.7, 0.7, 0.2, 64, 0, 383, 0.03, 0.04, 0.4, 53, 10, 22, 0.5, 210, 3, NULL, 7800, 'kg'),
	(219, '단호박', 70, 131, 1.9, 0.2, 670, 0, 4018, 0.03, 0.04, 0.3, 32, 4, 37, 0.4, 507, 1, NULL, 7000, 'kg'),
	(220, '애호박', 26, 5.6, 0.9, 0.1, 34, 0, 201, 0.16, 0.02, 0.4, 9, 30, 36, 0.4, 215, 17, NULL, 8700, 'kg'),
	(221, '삼치', 108, 0.6, 19, 2.7, 9, 9, 0, 0.08, 0.29, 809, 1, 9, 293, 0.5, 0, 0, NULL, 7500, 'kg'),
	(222, '밀가루', 370, 77, 11.5, 1.1, 0, 0, 0, 0.21, 0.02, 1.8, 0, 31, 78, 1.5, 108, 19, NULL, 5500, 'kg'),
	(223, '토마토소스', 44, 835, 2, 0.2, 80, 0, 480, 0.09, 0.08, 1.3, 0, 18, 42, 0.9, 340, 540, NULL, 7800, 'kg'),
	(224, '당면', 349, 86, 0.1, 0.2, 0, 0, 0, 0.03, 0.03, 0, 0, 27, 137, 3, 11, 2, NULL, 34000, 'kg'),
	(225, '북어', 290, 0, 61.4, 4.1, 0, 0, 0, 0.15, 0.22, 8.3, 0, 243, 582, 2.7, 893, 40, NULL, 11000, 'kg'),
	(226, '청주', 133, 4, 0.6, 0, 0, 0, 0, 0, 0, 0, 0, 2, 8, 0, 5, 2, NULL, 7500, 'kg'),
	(227, '성게알', 181, 7.6, 16, 8.7, 330, 120, 1260, 0.27, 0.42, 2.4, 0, 70, 306, 2.4, 0, 0, NULL, 11600, 'kg'),
	(228, '튀김가루', 350, 76.8, 7.3, 1.5, 0, 0, 0, 0.13, 0.02, 1, 0, 46, 214, 0.5, 125, 962, NULL, 5000, 'kg'),
	(229, '커피가루', 215, 42.6, 11.6, 0.2, 0, 0, 0, 0, 1.36, 28.1, 0, 140, 286, 3.8, 3501, 23, NULL, 3000, 'kg'),
	(230, '굴비', 332, 0.4, 44.4, 15.2, 0, 0, 0, 0.19, 0.18, 13.2, 0, 68, 560, 14.4, 320, 412, NULL, 7000, 'kg'),
	(231, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL),
	(232, '연어', 106, 0.2, 20.6, 1.9, 18, 18, 0, 0.19, 0.15, 7.5, 1, 24, 243, 1.1, 330, 95, NULL, 10000, 'kg'),
	(233, '꿀', 302, 81.9, 0.2, 0.1, 0, 0, 0, 0.64, 0.49, 1.6, 0, 5, 9, 0.4, 75, 21, NULL, 15000, 'kg');
/*!40000 ALTER TABLE `foodmaterial` ENABLE KEYS */;


-- 테이블 dacham.foodminven 구조 내보내기
CREATE TABLE IF NOT EXISTS `foodminven` (
  `foodMICode` int(5) NOT NULL AUTO_INCREMENT,
  `foodMCode` int(4) NOT NULL,
  `foodMName` varchar(20) COLLATE utf8_bin NOT NULL,
  `inAmount` int(5) DEFAULT NULL,
  `inDate` date DEFAULT NULL,
  `outAmount` int(5) DEFAULT NULL,
  `uint` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(8) DEFAULT NULL,
  `exDate` date DEFAULT NULL,
  PRIMARY KEY (`foodMICode`,`foodMCode`),
  KEY `FK_foodminven_foodmaterial` (`foodMCode`),
  CONSTRAINT `FK_foodminven_foodmaterial` FOREIGN KEY (`foodMCode`) REFERENCES `foodmaterial` (`foodMCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodminven:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodminven` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodminven` ENABLE KEYS */;


-- 테이블 dacham.measure 구조 내보내기
CREATE TABLE IF NOT EXISTS `measure` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `measureCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `measureDate` date DEFAULT NULL,
  `reading` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_measure_measureitem` (`measureCode`),
  CONSTRAINT `FK_measure_measureitem` FOREIGN KEY (`measureCode`) REFERENCES `measureitem` (`measureCode`),
  CONSTRAINT `FK_measure_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.measure:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `measure` DISABLE KEYS */;
/*!40000 ALTER TABLE `measure` ENABLE KEYS */;


-- 테이블 dacham.measureitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `measureitem` (
  `measureCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `measureName` varchar(20) COLLATE utf8_bin NOT NULL,
  `measureUnit` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`measureCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.measureitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `measureitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `measureitem` ENABLE KEYS */;


-- 테이블 dacham.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `passwd` varchar(20) COLLATE utf8_bin NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(20) COLLATE utf8_bin NOT NULL,
  `tel` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(20) COLLATE utf8_bin NOT NULL,
  `deptCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `gradeCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `joinDate` date NOT NULL,
  `outDate` date DEFAULT NULL,
  `photoImg` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.member:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`, `passwd`, `name`, `address`, `tel`, `email`, `deptCode`, `gradeCode`, `joinDate`, `outDate`, `photoImg`) VALUES
	('admin', '1111', '조영삼', '화원', '010-032', '032@naver.com', '관리자', '관리자', '2017-06-07', NULL, NULL),
	('cook', '1111', '양정석', '대구', '010101010', 'y@naver.com', '조리팀', '조리팀장', '2017-06-07', NULL, NULL),
	('counselor', '1111', '양정석', '대구', '010101010', 'y@naver.com', '고객대응팀', '고객대응팀장', '2017-06-07', NULL, NULL),
	('customer', '1111', '김하나', '서울 강서구', '02-764-4728', 'hana@naver.com', '회원', '일반회원', '2017-06-05', NULL, NULL),
	('deliver', '1111', '양정석', '대구', '010101010', 'y@naver.com', '배송팀', '배송팀장', '2017-06-07', NULL, NULL),
	('nutri', '1111', '황재웅', '대구', '01010444', 'h@naver.com', '영양사', '영양사장', '2017-06-07', NULL, NULL),
	('test', '1111', '김다희', '인천', '010', 'dahee@naver.com', '회원', '일반회원', '2017-06-07', NULL, NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 dacham.orderitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitem` (
  `orderItemCode` int(3) NOT NULL,
  `orderItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`orderItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderitem:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`orderItemCode`, `orderItemName`) VALUES
	(0, '미결제'),
	(1, '장바구니'),
	(2, '결제완료'),
	(3, '조리 대기'),
	(4, '조리 중'),
	(5, '조리완료'),
	(6, '환불'),
	(7, '배송중'),
	(8, '배송완료');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;


-- 테이블 dacham.orderlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderlist` (
  `orderCode` int(5) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `dietCode` int(5) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `price` int(7) NOT NULL,
  `dietAmount` int(3) DEFAULT NULL,
  `transportNum` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `orderItemCode` int(3) NOT NULL,
  `paymentItemCode` int(3) DEFAULT NULL,
  PRIMARY KEY (`orderCode`),
  KEY `FK_orderlist_member` (`id`),
  KEY `FK_orderlist_diet` (`dietCode`),
  KEY `FK_orderlist_orderitem` (`orderItemCode`),
  KEY `FK_orderlist_paymentitem` (`paymentItemCode`),
  CONSTRAINT `FK_orderlist_diet` FOREIGN KEY (`dietCode`) REFERENCES `diet` (`dietCode`),
  CONSTRAINT `FK_orderlist_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`),
  CONSTRAINT `FK_orderlist_orderitem` FOREIGN KEY (`orderItemCode`) REFERENCES `orderitem` (`orderItemCode`),
  CONSTRAINT `FK_orderlist_paymentitem` FOREIGN KEY (`paymentItemCode`) REFERENCES `paymentitem` (`paymentItemCode`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderlist:~77 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`orderCode`, `id`, `dietCode`, `orderDate`, `price`, `dietAmount`, `transportNum`, `orderItemCode`, `paymentItemCode`) VALUES
	(86, 'test', 51, '2017-06-25', 30000, 1, NULL, 1, 1);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;


-- 테이블 dacham.orderoptions 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderoptions` (
  `orderCode` int(5) DEFAULT NULL,
  `sideDCode` int(5) DEFAULT NULL,
  KEY `FK_orderoptions_orderlist` (`orderCode`),
  KEY `FK_orderoptions_sidedish` (`sideDCode`),
  CONSTRAINT `FK_orderoptions_orderlist` FOREIGN KEY (`orderCode`) REFERENCES `orderlist` (`orderCode`),
  CONSTRAINT `FK_orderoptions_sidedish` FOREIGN KEY (`sideDCode`) REFERENCES `sidedish` (`sideDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderoptions:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderoptions` DISABLE KEYS */;
INSERT INTO `orderoptions` (`orderCode`, `sideDCode`) VALUES
	(86, 19),
	(86, 49),
	(86, 29),
	(86, 36),
	(86, 16),
	(86, 21);
/*!40000 ALTER TABLE `orderoptions` ENABLE KEYS */;


-- 테이블 dacham.paymentitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `paymentitem` (
  `paymentItemCode` int(3) NOT NULL,
  `paymentItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`paymentItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.paymentitem:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `paymentitem` DISABLE KEYS */;
INSERT INTO `paymentitem` (`paymentItemCode`, `paymentItemName`) VALUES
	(1, '결제대기'),
	(2, '카드'),
	(3, '계좌이체'),
	(4, '휴대폰결제');
/*!40000 ALTER TABLE `paymentitem` ENABLE KEYS */;


-- 테이블 dacham.sidedinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `sidedinfo` (
  `sideDCode` int(5) NOT NULL,
  `foodMCode` int(4) NOT NULL,
  `foodMAmount` int(5) NOT NULL,
  PRIMARY KEY (`sideDCode`,`foodMCode`),
  KEY `FK_sidedinfo_foodmaterial` (`foodMCode`),
  CONSTRAINT `FK_sidedinfo_foodmaterial` FOREIGN KEY (`foodMCode`) REFERENCES `foodmaterial` (`foodMCode`),
  CONSTRAINT `FK_sidedinfo_sidedish` FOREIGN KEY (`sideDCode`) REFERENCES `sidedish` (`sideDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedinfo:~22 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedinfo` DISABLE KEYS */;
INSERT INTO `sidedinfo` (`sideDCode`, `foodMCode`, `foodMAmount`) VALUES
	(16, 6, 80),
	(16, 139, 3),
	(16, 173, 10),
	(16, 188, 5),
	(17, 139, 3),
	(17, 152, 80),
	(17, 164, 10),
	(18, 139, 3),
	(18, 157, 1),
	(18, 158, 5),
	(18, 185, 80),
	(19, 4, 150),
	(20, 12, 20),
	(20, 111, 100),
	(20, 127, 5),
	(20, 150, 10),
	(21, 8, 80),
	(21, 14, 10),
	(21, 139, 10),
	(21, 188, 10),
	(23, 60, 120),
	(23, 164, 20),
	(23, 185, 40),
	(23, 211, 20),
	(24, 69, 80),
	(24, 127, 30),
	(24, 139, 5),
	(24, 150, 20),
	(25, 4, 1),
	(25, 67, 10),
	(25, 97, 10),
	(25, 127, 1),
	(25, 139, 10),
	(25, 188, 10),
	(26, 127, 20),
	(26, 139, 5),
	(26, 173, 30),
	(26, 207, 100),
	(27, 127, 30),
	(27, 139, 100),
	(27, 150, 20),
	(27, 204, 80),
	(28, 14, 20),
	(28, 26, 70),
	(28, 41, 120),
	(28, 127, 10),
	(28, 158, 5),
	(29, 2, 3),
	(29, 12, 5),
	(29, 60, 150),
	(29, 83, 30),
	(29, 118, 3),
	(29, 127, 10),
	(29, 132, 2),
	(29, 139, 2),
	(29, 150, 3),
	(29, 164, 5),
	(29, 165, 5),
	(29, 172, 5),
	(29, 173, 20),
	(29, 180, 3),
	(29, 188, 2),
	(29, 203, 20),
	(30, 26, 140),
	(30, 133, 15),
	(30, 157, 1),
	(30, 173, 20),
	(30, 211, 20),
	(31, 20, 150),
	(31, 127, 15),
	(31, 137, 10),
	(31, 139, 10),
	(31, 188, 10),
	(32, 4, 12),
	(32, 67, 1),
	(32, 71, 160),
	(32, 144, 15),
	(33, 130, 80),
	(33, 158, 5),
	(33, 188, 10),
	(34, 153, 80),
	(34, 158, 10),
	(35, 14, 30),
	(35, 108, 10),
	(35, 157, 1),
	(35, 173, 20),
	(35, 190, 100),
	(35, 211, 20),
	(36, 12, 5),
	(36, 102, 100),
	(36, 118, 3),
	(36, 127, 10),
	(36, 154, 3),
	(36, 164, 3),
	(36, 165, 3),
	(36, 172, 5),
	(36, 173, 20),
	(36, 180, 3),
	(36, 203, 20),
	(36, 211, 20),
	(37, 90, 80),
	(37, 194, 30),
	(38, 4, 100),
	(38, 148, 20),
	(38, 188, 5),
	(39, 4, 20),
	(39, 21, 150),
	(39, 34, 10),
	(39, 194, 150),
	(39, 202, 10),
	(40, 26, 70),
	(40, 60, 30),
	(40, 194, 30),
	(40, 203, 50),
	(40, 205, 50),
	(40, 215, 50),
	(41, 2, 3),
	(41, 80, 100),
	(41, 118, 3),
	(41, 127, 10),
	(41, 180, 3),
	(41, 203, 15),
	(41, 211, 15),
	(42, 22, 30),
	(42, 127, 20),
	(42, 139, 10),
	(42, 173, 30),
	(42, 197, 30),
	(42, 224, 120),
	(43, 133, 20),
	(43, 157, 1),
	(43, 221, 120),
	(43, 222, 30),
	(44, 26, 120),
	(44, 157, 1),
	(44, 173, 20),
	(44, 211, 20),
	(45, 4, 150),
	(45, 71, 10),
	(45, 119, 10),
	(45, 125, 10),
	(46, 157, 1),
	(46, 164, 10),
	(46, 220, 80),
	(47, 2, 3),
	(47, 12, 15),
	(47, 80, 100),
	(47, 118, 5),
	(47, 172, 5),
	(47, 180, 5),
	(47, 188, 3),
	(47, 195, 5),
	(47, 203, 20),
	(47, 211, 20),
	(47, 226, 3),
	(48, 4, 120),
	(48, 32, 14),
	(49, 127, 1),
	(49, 157, 1),
	(49, 183, 10),
	(49, 188, 1),
	(49, 225, 10),
	(50, 127, 5),
	(50, 140, 20),
	(50, 188, 10),
	(50, 227, 20),
	(51, 14, 20),
	(51, 26, 70),
	(51, 75, 120),
	(51, 203, 30),
	(51, 211, 20),
	(52, 2, 3),
	(52, 41, 50),
	(52, 88, 30),
	(52, 110, 5),
	(52, 118, 3),
	(52, 127, 10),
	(52, 166, 10),
	(52, 180, 5),
	(52, 188, 3),
	(52, 195, 5),
	(52, 211, 10),
	(52, 218, 10),
	(52, 226, 3),
	(53, 88, 50),
	(53, 127, 5),
	(53, 140, 20),
	(53, 188, 20),
	(54, 4, 120),
	(54, 47, 50),
	(54, 157, 0),
	(55, 14, 20),
	(55, 88, 50),
	(55, 157, 1),
	(55, 196, 50),
	(55, 211, 30),
	(56, 2, 5),
	(56, 60, 30),
	(56, 83, 50),
	(56, 132, 5),
	(56, 157, 1),
	(56, 170, 15),
	(56, 173, 50),
	(56, 192, 20),
	(56, 203, 50),
	(56, 220, 20),
	(57, 14, 10),
	(57, 95, 10),
	(57, 121, 10),
	(57, 180, 10),
	(57, 185, 10),
	(57, 211, 10),
	(57, 219, 10),
	(58, 12, 10),
	(58, 26, 10),
	(58, 60, 100),
	(58, 120, 100),
	(58, 150, 5),
	(58, 157, 2),
	(58, 160, 2),
	(58, 180, 5),
	(58, 226, 5),
	(58, 228, 20),
	(59, 14, 20),
	(59, 41, 11),
	(59, 150, 10),
	(59, 155, 10),
	(60, 2, 5),
	(60, 26, 20),
	(60, 104, 100),
	(60, 120, 40),
	(60, 132, 50),
	(60, 157, 1),
	(60, 228, 40),
	(61, 80, 100),
	(61, 155, 10),
	(61, 160, 10),
	(61, 180, 20),
	(61, 195, 20),
	(61, 203, 20),
	(61, 211, 20),
	(61, 229, 10),
	(62, 132, 10),
	(62, 157, 3),
	(62, 230, 100),
	(63, 56, 200),
	(63, 150, 150),
	(63, 157, 1),
	(63, 160, 150),
	(63, 211, 100),
	(64, 8, 300),
	(64, 12, 50),
	(64, 172, 180),
	(64, 185, 150),
	(64, 211, 120),
	(64, 225, 150),
	(65, 14, 10),
	(65, 29, 30),
	(65, 50, 30),
	(65, 54, 30),
	(65, 77, 200),
	(65, 83, 30),
	(65, 87, 30),
	(65, 127, 30),
	(65, 172, 20),
	(65, 173, 30),
	(65, 180, 10),
	(65, 203, 30),
	(65, 226, 10),
	(66, 14, 100),
	(66, 85, 151),
	(66, 97, 12),
	(66, 108, 15),
	(66, 153, 100),
	(66, 155, 10),
	(66, 157, 1),
	(66, 160, 140),
	(66, 180, 14),
	(66, 195, 14),
	(66, 203, 145),
	(66, 213, 1),
	(67, 132, 10),
	(67, 157, 5),
	(67, 232, 150),
	(69, 93, 100),
	(69, 127, 30),
	(69, 132, 10),
	(69, 139, 5),
	(69, 150, 5),
	(69, 188, 5),
	(69, 233, 10);
/*!40000 ALTER TABLE `sidedinfo` ENABLE KEYS */;


-- 테이블 dacham.sidedish 구조 내보내기
CREATE TABLE IF NOT EXISTS `sidedish` (
  `sideDCode` int(5) NOT NULL AUTO_INCREMENT,
  `foodGCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `cookMCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `sideDName` varchar(20) COLLATE utf8_bin NOT NULL,
  `recipe` text COLLATE utf8_bin NOT NULL,
  `sideDImg` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sideDCode`),
  KEY `FK_sidedish_foodgroup` (`foodGCode`),
  KEY `FK_sidedish_cookmethod` (`cookMCode`),
  CONSTRAINT `FK_sidedish_cookmethod` FOREIGN KEY (`cookMCode`) REFERENCES `cookmethod` (`cookMCode`),
  CONSTRAINT `FK_sidedish_foodgroup` FOREIGN KEY (`foodGCode`) REFERENCES `foodgroup` (`foodGCode`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedish:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedish` DISABLE KEYS */;
INSERT INTO `sidedish` (`sideDCode`, `foodGCode`, `cookMCode`, `sideDName`, `recipe`, `sideDImg`) VALUES
	(16, '05', '06', '시금치 나물', '시금치와 당근을 데친 후, 참깨와 참기름을 넣고 버무린다.', 'd012017-06-25 06_38_53.JPG'),
	(17, '05', '06', '가지 무침', '가지를 데친 후, 붉은고추와 참깨를 고명으로 올린다.', 'd022017-06-25 06_47_23.JPG'),
	(18, '05', '06', '무생채', '무를 채썬 후 소금과 참깨, 식초를 뿌려서 간을 하고 버무린다.', 'd032017-06-25 06_49_15.JPG'),
	(19, '01', '04', '흰 백밥', '1. 백미를 물에 넣는다.\r\n2. 한번 끓인다.\r\n3. 물엿을 붓고 밥솥에 절인다.', 'rice2017-06-25 06_51_12.JPG'),
	(20, '05', '03', '진미채', '오징어 진미채를 고추장과 물엿을 넣고 조리면서 간장으로 간을 한다.', 'd042017-06-25 06_51_23.JPG'),
	(21, '06', '06', '콩나물 무침', '콩나물을 데친 후, 고추 참깨 참기름을 넣고 무친다.', 'd052017-06-25 06_53_18.JPG'),
	(23, '06', '07', '닭고기 뭇국', '닭과 무를 삶은 후, 닭을 손으로 잘게 썬 후, 파와 고추를 고명으로 올린다.', 'd072017-06-25 06_58_13.JPG'),
	(24, '06', '03', '콩자반', '삶은 콩을 간장과 물엿을 넣고 조린 후, 참깨를 뿌린다.', 'd082017-06-25 06_59_42.JPG'),
	(25, '01', '04', '고소 간장밥', '1.참기름을 준비한다.\r\n2. 백미를 밥솥에 끓인다. \r\n3. 들깨와 참깨를 넣어서 볶는다.\r\n4. 간장과 참기름을 비빈다.', 'rice22017-06-25 07_00_49.JPG'),
	(26, '06', '03', '우엉 조림', '우엉과 당근을 볶은 후, 간장과 참깨를 넣고 조린다.', 'd092017-06-25 07_01_35.JPG'),
	(27, '05', '03', '연근 조림', '연근을 간장과 물엿을 넣고 조린 후, 참깨를 뿌린다.', 'd112017-06-25 07_02_51.JPG'),
	(28, '05', '02', '두부 부침', '두부에 달걀을 무친 후 구운 뒤에 간장,고추,식초로 만든 장을 뿌린다.', 'd122017-06-25 07_04_25.JPG'),
	(29, '03', '07', '닭도리탕', '1.  먹기 좋은 크기로 토막 낸 닭은 씻어서 체에 밭쳐 물기를 뺀다. 감자와 양파, 당근은 큼직하게 썬다. \r\n2.  꼬꼬떼 팬에 올리브오일을 두르고 달군 후 닭을 볶는다. \r\n3.  닭에서 나온 기름기는 따라 버리고 약간의 올리브오일을 더 부은 후 감자와 양파, 당근을 넣어 더 볶는다. \r\n4.  분량의 양념장 재료를 섞은 후 ③의 냄비에 담아 뚜껑을 덮고 끓인다. \r\n5.  닭이 익으면 마지막에 참기름과 통깨를 뿌린다.', 'm012017-06-25 07_05_07.JPG'),
	(30, '05', '02', '달걀말이', '달걀을 풀어서, 당근, 파, 소금을 넣고 해바라기유를 두른 팬에 만다.', 'd132017-06-25 07_06_26.JPG'),
	(31, '05', '02', '느타리버섯 볶음', '느타리 버섯을 볶은 후 간장, 참기름, 참깨를 넣고 버무린다.', 'd152017-06-25 07_09_21.JPG'),
	(32, '01', '04', '잡곡밥', '01. 쌀과 현미, 적두, 차조는 깨끗이 씻는다. 쌀과 현미는 물에 담가 2시간 정도 불린 다음 체에 밭쳐 물기를 뺀다. 차조는 따로 물에 담가 2시간 정도 불린 다음 체에 밭쳐 물기를 뺀다.\r\n\r\n잡곡밥 요리과정\r\n02. 냄비에 팥과 잠길 만큼 물을 넣어 팥알이 터지지 않을 때까지 끓인다. 팥물은 버리고 체에 밭쳐 물기를 뺀다. 냄비(또는 압력밥솥, 전기밥솥)에 물, 불린 쌀, 현미, 팥을 넣어 끓인다.(팥을 미리 충분하게 삶아주고 밥을 지어야 나중에 팥이 푹 익는다.)\r\n\r\n잡곡밥 요리과정\r\n03. 02가 바글바글 끓어오르면 차조를 넣어 약한 불에서 밥을 짓는다.\r\n', 'rice32017-06-25 07_10_03.JPG'),
	(33, '06', '02', '미역줄기 볶음', '미역 줄기를 참기름에 살짝 볶은 후 식초를 넣는다.', 'd162017-06-25 07_10_44.JPG'),
	(34, '05', '06', '파래 무침', '파래를 데친 후, 물이 빠지면 식초를 넣어서 버무린다.', 'd172017-06-25 07_11_34.JPG'),
	(35, '06', '06', '물김치', '소금에 절인 배추에 당근,파,고추,새우젓을 넣은 후에 물을 붓는다.', 'd182017-06-25 07_13_17.JPG'),
	(36, '04', '03', '낙지볶음', '01. 낙지는 내장을 손질하여 깨끗하게 씻어 낸 뒤 한입 크기로 자릅니다\r\n02. 양파와 당근은 굵게 채를 썹니다.\r\n03. 대파, 청, 홍 고추는 어슷하게 썹니다.\r\n04. 낙지와 야채에 낙지볶음 양념을 넣어 버무려놓습니다.\r\n05. 달궈진 팬에 기름을 두르고 준비한 낙지와 야채를 넣어 센불에서 볶습니다.', 'm022017-06-25 07_13_43.JPG'),
	(37, '05', '06', '곤약', '곤약을 썰어서 상추에 놓는다.', 'd192017-06-25 07_15_02.JPG'),
	(38, '01', '04', '인삼죽', '1. 인삼을 절인다.\r\n2.참기름을 넣는다.\r\n3. 백미를 밥솥에 넣어서 밥 짓는다.\r\n4. 물엿을 첨부하여 죽처럼 만든다.', 'rice42017-06-25 07_15_18.JPG'),
	(39, '01', '04', '야채잡곡밥', '01. 쌀과 현미, 적두, 차조는 깨끗이 씻는다. 쌀과 현미는 물에 담가 2시간 정도 불린 다음 체에 밭쳐 물기를 뺀다. 차조는 따로 물에 담가 2시간 정도 불린 다음 체에 밭쳐 물기를 뺀다.\r\n\r\n잡곡밥 요리과정\r\n02. 냄비에 팥과 잠길 만큼 물을 넣어 팥알이 터지지 않을 때까지 끓인다. 팥물은 버리고 체에 밭쳐 물기를 뺀다. 냄비(또는 압력밥솥, 전기밥솥)에 물, 불린 쌀, 현미, 팥을 넣어 끓인다.(팥을 미리 충분하게 삶아주고 밥을 지어야 나중에 팥이 푹 익는다.)\r\n\r\n잡곡밥 요리과정\r\n03. 02가 바글바글 끓어오르면 차조를 넣어 약한 불에서 밥을 짓는다.\r\n4. 다 된 밥 위에 야채를 엎는다.', 'rice52017-06-25 07_17_26.JPG'),
	(40, '05', '06', '닭고기 샐러드', '삶은 댤걀과 닭고기, 채 썬 야채를 넣는다.', 'd222017-06-25 07_18_46.JPG'),
	(41, '03', '03', '간장돼지불고기', '돼지고기는 키친타월에 올려 핏물을 뺀 뒤에 30분간 재우고,  대파와 양파는 곱게 채 썰고, 오목한 팬이나 뚝배기에 고기와 대파를 올려 센 불로 볶는다', 'm042017-06-25 07_21_12.JPG'),
	(42, '06', '06', '잡채', '불린 당면에 목이버섯,당근,시금치,간장을 넣고 볶는다.', 'd242017-06-25 07_21_13.JPG'),
	(43, '05', '02', '삼치 구이', '소금 간한 삼치를 밀가루에 입혀서 굽는다.', 'd202017-06-25 07_21_59.JPG'),
	(44, '06', '04', '달걀찜', '달걀에 물, 당근, 파, 소금을 넣고 찐다.', 'd262017-06-25 07_23_23.JPG'),
	(45, '01', '04', '잡곡 밤밥', '1. 멥쌀과 찹쌀을 깨끗이 씻어서 30분 정도 소쿠리에 건져 놓는다.\r\n\r\n양주 밤밥 요리과정\r\n02. 밤은 하루 정도 미지근한 물에 충분히 불려 껍질을 벗기고 큰 것은 2등분한다.\r\n\r\n양주 밤밥 요리과정\r\n03. 껍질 벗긴 은행은 달군 팬에 기름을 약간 둘러 살짝 볶은 후 마른 수건이나 깨끗한 면보로 살살 비벼 속껍질은 벗긴다.\r\n\r\n양주 밤밥 요리과정\r\n04. 밥솥에 불린 쌀을 넣고 그 위에 밤과 은행을 얹어 물을 부어 밥을 짓는다.', 'rice62017-06-25 07_24_01.JPG'),
	(46, '05', '07', '애호박 스프', '애호박과 고추기름을 넣고 끓인 후 소금으로 간을 한다.', 'd272017-06-25 07_24_54.JPG'),
	(47, '04', '03', '돼지 고추장불고기', '돼지고기는 키친타월에 올려 핏물을 뺀 뒤에 30분간 재우고,  대파와 양파는 곱게 채 썰고, 오목한 팬이나 뚝배기에 고기와 대파를 올려 센 불로 볶는다', 'm052017-06-25 07_26_00.JPG'),
	(48, '01', '04', '완두콩밥', '잘 씻은 살을 30분정도 불려서 깨끗하게 손질한 강낭콩과 함께 압력솥에 넣어주세요. 손가락 2번째 마디가 되게 물을 붓고 소금과 올리브유를 준비한 대로 넣어주세요! 약 7분 ~ 10분 후면 꼭지가 흔들리면서 완두콩향이 집안 가득 퍼진답니다. 2~3분 정도 더 돌리고 불을 꺼주세요 김이 빠지고 열어보면 윤기나면서 색이 선명한 완두콩밥이 완성됩니다. 아주 찰지고 맛있어서 콩밥 싫어하는 아랑이들도 한그릇 뚝딱!!\r\n', 'rice72017-06-25 07_32_28.JPG'),
	(49, '02', '07', '북어국', '불린 북어를 무와 함께 참기름에 볶은 후, 물을 부어 간장, 소금을 넣고 끓인다.', 's102017-06-25 07_32_51.JPG'),
	(50, '02', '07', '성게알 미역국', '불린 미역을 참기름에 볶은 후, 물을 붓고 성게알을 넣은 뒤 끓인다.', 's092017-06-25 07_35_28.JPG'),
	(51, '02', '07', '순두부찌개', '순두부에 달걀, 파, 양파, 고춧기름을 넣고 끓인다.', 's082017-06-25 07_36_44.JPG'),
	(52, '03', '03', '마파두부', '01. 두부는 가로·세로 1.5cm로 자른다.\r\n02. 피망은 잘게 다져 놓고 대파·마늘·생강도 다진다.\r\n03. 프라이팬에 고추기름을 두르고 쇠고기 다진 것을 볶는다.\r\n04. 대파·마늘·생강과 두반장을 넣고 볶은 뒤 간장·청주·물을 넣어 끓인다.\r\n05. 두부를 넣고 굴소스·후춧가루·설탕을 넣는다.\r\n06. 간이 맞으면 피망을 넣고 물전분으로 농도를 걸쭉하게 한 뒤 참기름을 넣는다.(소스를 걸쭉하게 만들 때는 국물의 분량에 따라 녹말가루의 양도 달라지지만 대개는 녹말가루와 물을 1 : 1의 비율로 섞은 물전분을 사용한다. 물이 너무 많으면 조미료의 맛이 흐려지고 전분의 양이 너무 많으면 덩어리가 지기 쉽다.)\r\n07. 접시에 담아 낸다.', 'm062017-06-25 07_37_42.JPG'),
	(53, '02', '07', '소고기 미역국', '불린 미역과 양지머리를 참기름에 볶은 후 물을 부어 끊인다.', 's072017-06-25 07_37_57.JPG'),
	(54, '01', '04', '팥밥', '팥 절반컵을 깨끗이 씻어 하룻밤 불려 줍니다.\r\n4배 정도의 물을 붓고 10분정도 끓여 물을 모두 버려 주세요.\r\n이렇게 애벌로 한번 끓여 주어야 팥의 떫은맛을 제거할 수 있습니다.\r\n다시 물을 넉넉히 붓고 소금 약간 넣고 끓기 시작하면 약불로 줄인 후 50분 정도 끓여 주세요. 불린 쌀 4컵에 팥과 팥물을 넣어 밥물을 맞춘 후 밥을 지어 줍니다.', 'rice82017-06-25 07_38_45.JPG'),
	(55, '02', '07', '육개장', '숙주나물과 소양지머리를 넣고 끓인 후 고추,소금을 넣고 간을 한다.', 's062017-06-25 07_40_24.JPG'),
	(56, '03', '03', '카레', '01. 양파, 감자, 당근, 브로콜리, 애호박은 사방 1.5cm 크기로 썬다.\r\n02. 닭가슴살은 사방 2cm 크기로 썬 후 소금, 후춧가루, 올리브유 1큰술을 골고루 뿌려 재운다.\r\n03. 볼에 물과 카레가루를 넣고 골고루 섞어 카레물을 만든다.\r\n04. 달군 팬에 올리브유 2큰술을 두르고 감자와 당근을 넣고 볶는다.\r\n05. 감자와 당근 반쯤 익으면 닭가슴살과 양파를 넣고 볶는다.\r\n06. 닭가슴살이 익으면 애호박과 브로콜리를 넣고 볶는다.\r\n07. 카레물을 붓고 주걱으로 저어가며 걸쭉한 농도가 날 때까지 끓이다가 소금으로 간한다.', 'm072017-06-25 07_41_10.JPG'),
	(57, '02', '07', '꽂게매운탕', '1. 물 4C에 다시마를 넣어 30분 정도 담궈 놓으시면 좋아요\r\n\r\n2. 꽂게는 칫솔로 깨끗하게 닦아내고 꽂게의 배 부분의 껍데기를 떼서\r\n모래 주머니를 제거해주세요\r\n\r\n3. 1의 육수에 무와 슬라이스 한 마늘을 넣고 끓여주세요\r\n\r\n4. 3에 꽂게를 넣어 끓이다가 거품을 걷어 내주세요.\r\n\r\n5. 호박과 청양고추, 대파를 썰어주시고요', 's012017-06-25 07_47_29.JPG'),
	(58, '04', '01', '닭강정', '01. 닭다리는 우유에 10분간 담아둔다.(우유에 넣어두면 닭고기의 누린내가 제거된다.)\r\n02. 닭고기는 물에 헹군 후 한입 크기로 썰어, 소금, 후춧가루로 밑간을 한다.\r\n03. 볼에 02의 닭, 달걀 흰자, 녹말가루, 튀김가루를 넣고 골고루 섞는다.(이때, 카레가루를 넣으면 닭의 누린내를 제거하고 풍미를 높인다.)\r\n04. 냄비에 식용유를 붓고 180도로 달군다. 닭을 넣어 노릇하게 튀긴 후 식용유 온도를 180도로 높여 한번 더 튀긴다.(닭을 두번 튀기면 색이 고르게 나고 더욱 바삭한 튀김이 된다.)\r\n05. 팬에 소스 재료를 넣고 끓여 가장자리가 끓어오르면 튀긴 닭을 넣고 골고루 버무린다. 접시에 담아 다진 땅콩을 뿌린다.', 'm092017-06-25 07_48_11.JPG'),
	(59, '02', '07', '된장두부찌개', '1. 된장을 넣는다.\r\n2. 물에 절인다.\r\n3. 두부를 알맞은 크기로 잘라서 넣는다.\r\n4. 뜨거운 불에 끓인다.', 's022017-06-25 07_49_12.JPG'),
	(60, '04', '01', '새우튀김', '1. 새우를 우유에 담궈놓는다.\r\n2. 튀김가루, 우유, 달걀을 넣고 튀김 옷을 만든후 \r\n3. 올리브유 기름 180도 가량이 되면 튀겨낸다', 'm102017-06-25 07_52_51.JPG'),
	(61, '04', '04', '보쌈', '돼지 앞다리살과 함께 모든 재료를 넣어 압력 밥솥에 1시간 30분 가량 삶는다', 'm112017-06-25 07_57_27.JPG'),
	(62, '03', '02', '굴비구이', '1. 팬에 올리브유를 두른후 \r\n굴비를 넣어 소금으로 살짝 간을 한후 굽는다', 'm122017-06-25 08_00_58.JPG'),
	(63, '02', '07', '사골곰탕', '우선 사골곰탕에서 첫번째로 중요한 건 바로 핏물을 깨끗하게 제거하는 법이에요. 큰국솥에 사골뼈를 넣은 후, 물을 가득 채워 30분 정도 두면 핏물이 우러나오는데요. 핏물이 우러나오면 맑은 물이 될 때까지 약 3~5시간 정도 30분이나 한시간간격으로 핏물을 빼주셔야 해요. 한소끔 끓으면 약 5분후 물을 모두 버리고 뼈만 준비해 주세요.\r\n지방층을 모두 버리고 물에 끓인 후 후추와 소금을 뿌려서 간을 맞춥니다.', 's032017-06-25 08_00_59.JPG'),
	(64, '02', '07', '북어(동태)매운탕', '01. 동태는 해동시켜 비늘을 긁어내고 배를 갈라 내장을 빼고 나서 옅은 소금물에 흔들어 씻어 3㎝ 길이로 썬다. 동태를 손질할 때 동태 내장과 알을 따로 떼어내 옅은 소금물에 흔들어 씻어 체에 밭쳐 물기를 뺀다. 동태의 머리는 버리지 말고 아가미를 깨끗하게 씻어 놓는다.\r\n02. 냄비에 물을 넉넉하게 붓고 생강과 대파잎을 넣어 끓으면 동태살과 동태 머리를 넣어 애벌로 살짝 익혀 그대로 물기를 빼고 식힌다.\r\n03. 무는 사방 4㎝의 크기로 납작하게 썰고 두부는 큼직하게 사방 4㎝ 크기, 1㎝ 두께로 썬다.\r\n04. 콩나물은 머리와 꼬리를 떼어내고 씻어 물기를 털고 미나리는 깨끗이 다듬어 씻어서 3㎝ 길이로 썬다. 홍고추와 청양고추는 어슷하게 썰어 씨를 턴다. 대파는 큼직하고 어슷하게 채 썬다.\r\n05. 찌개 양념을 재료의 분량대로 매콤하고 칼칼하게 만든다.\r\n06. 냄비에 무와 콩나물, 동태 머리를 담고 쌀뜨물과 물을 부어서 뚜껑을 덮어 익힌다.\r\n07. ⑥의 국물이 끓으면 뚜껑을 열고 준비한 찌개 양념을 멍울 없이 풀어 끓인다.\r\n08. ⑦에 미리 애벌로 데친 동태 살을 넣고 끓이다가 동태 손질할 때 함께 손질한 내장과 알을 얹어 한소끔 끓인 후 소금으로 모자라는 간을 맞추고 두부, 미나리, 고추, 대파를 듬뿍 올려서 한소끔만 끓여 바로 먹는다.', 's042017-06-25 08_04_36.JPG'),
	(65, '03', '04', '소갈비찜', '1. 소갈비의 핏물을 뺸다.\r\n2. 양파, 사과, 배, 청주, 간장을 믹서기에 함께 갈아 소갈비와 섞어 숙성시킨다.\r\n3. 숙성시킨 갈비를 적당한 냄비에 넣고 고춧가루, 팽이버섯, 당근 , 감자를 넣고 푹 찐다.', 'm132017-06-25 08_07_46.JPG'),
	(66, '02', '07', '돼지국밥', '1. 물에 엄나무를 넣고 육수를 만든다.\r\n\r\n2. 양파는 채썰고 대파는 어슷썰고, 청양고추와 홍고추는 송송 썰어준다.\r\n\r\n그리고 콩나물 시금치도 손질하여 준비하고 마늘은 다져서 준비 해 둔다.\r\n\r\n\r\n3. 믹서에 마른고추, 생강, 물을 넣고 갈아 양념장을 만들어준다.\r\n\r\n4. 엄나무 육수에 만들어 둔 양념장을 고루게 풀어준다.\r\n\r\n5. 돼지머리 수육과 채 썬 양파를 넣어 끓여준다.\r\n\r\n5. 돼지머리 수육과 채 썬 양파를 넣어 끓여준다. \r\n6. 콩나물과 대파를 넣어 한소끔 더 끓인다.\r\n\r\n7. 한소끔 끓으면 소금, 후추, 다진마늘로 자신의 기호에 맞게 간을 해 준다.\r\n\r\n8. 그릇에 시금치를 깔고 그 위에 돼지국밥을 담아준다.\r\n\r\n9. 마지막으로 들깻가루와 청,홍고추를 얹으면 완성!', 's052017-06-25 08_10_21.JPG'),
	(67, '03', '02', '연어구이', '1. 연어에 올리브유를 골고루 발라준다.\r\n2. 팬에 넣고 소금으로 간을 하며 구워준다', 'm142017-06-25 08_11_12.JPG'),
	(69, '03', '03', '알감자조림', '깨끗이 씻은 알감자는 180℃로 달군 식용유(1컵)에 넣고 껍질이 쪼글쪼글해질 때까지 튀기듯 굽고,\r\n팬에 양념장과 알감자를 넣어 중간불로 조리고, 양념장이 거이 졸아들면 불을 끄고 깨를 뿌린다', 'm152017-06-25 08_23_11.JPG');
/*!40000 ALTER TABLE `sidedish` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
