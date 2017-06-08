-- --------------------------------------------------------
-- 호스트:                          106.249.38.73
-- 서버 버전:                        10.1.18-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- dacham 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `dacham`;
CREATE DATABASE IF NOT EXISTS `dacham` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `dacham`;

-- 테이블 dacham.cookmethod 구조 내보내기
DROP TABLE IF EXISTS `cookmethod`;
CREATE TABLE IF NOT EXISTS `cookmethod` (
  `cookMCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `cookMName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cookMCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='조리방법';

-- 테이블 데이터 dacham.cookmethod:~5 rows (대략적) 내보내기
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
DROP TABLE IF EXISTS `counsel`;
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

-- 테이블 데이터 dacham.counsel:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel` DISABLE KEYS */;
INSERT INTO `counsel` (`counselCode`, `counselItemCode`, `customer`, `adviser`, `counselTitle`, `counselDate`, `counselContent`, `counselRec`) VALUES
	(1, '4', 'customer', NULL, '기타', '2017-06-05', '된다', NULL),
	(2, '2', 'test', 'counselor', '고지혈증이', '2017-06-07', '고기좀 주세요', NULL);
/*!40000 ALTER TABLE `counsel` ENABLE KEYS */;

-- 테이블 dacham.counselitem 구조 내보내기
DROP TABLE IF EXISTS `counselitem`;
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
DROP TABLE IF EXISTS `diet`;
CREATE TABLE IF NOT EXISTS `diet` (
  `dietCode` int(5) NOT NULL AUTO_INCREMENT,
  `dietName` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(7) NOT NULL,
  `dietImg` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `diseaseCode` int(3) NOT NULL,
  `spDietItem` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `wizardCode` int(6) NOT NULL,
  PRIMARY KEY (`dietCode`),
  KEY `FK_diet_disease` (`diseaseCode`),
  KEY `FK_diet_wizardqna` (`wizardCode`),
  CONSTRAINT `FK_diet_disease` FOREIGN KEY (`diseaseCode`) REFERENCES `disease` (`diseaseCode`),
  CONSTRAINT `FK_diet_wizardqna` FOREIGN KEY (`wizardCode`) REFERENCES `wizardqna` (`wizardCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.diet:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` (`dietCode`, `dietName`, `price`, `dietImg`, `diseaseCode`, `spDietItem`, `wizardCode`) VALUES
	(1, '당뇨식1', 30000, NULL, 1, '0', 1),
	(2, '당뇨식2', 20000, NULL, 1, '0', 1),
	(3, '당뇨식3', 50000, NULL, 1, NULL, 1);
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;

-- 테이블 dacham.dietinfo 구조 내보내기
DROP TABLE IF EXISTS `dietinfo`;
CREATE TABLE IF NOT EXISTS `dietinfo` (
  `dietCode` int(5) NOT NULL,
  `sideDCode` int(5) NOT NULL,
  PRIMARY KEY (`dietCode`,`sideDCode`),
  KEY `FK_dietinfo_sidedish` (`sideDCode`),
  CONSTRAINT `FK_dietinfo_diet` FOREIGN KEY (`dietCode`) REFERENCES `diet` (`dietCode`),
  CONSTRAINT `FK_dietinfo_sidedish` FOREIGN KEY (`sideDCode`) REFERENCES `sidedish` (`sideDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.dietinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `dietinfo` DISABLE KEYS */;
INSERT INTO `dietinfo` (`dietCode`, `sideDCode`) VALUES
	(1, 8),
	(1, 9),
	(2, 4),
	(2, 8),
	(3, 3),
	(3, 4),
	(3, 8);
/*!40000 ALTER TABLE `dietinfo` ENABLE KEYS */;

-- 테이블 dacham.disease 구조 내보내기
DROP TABLE IF EXISTS `disease`;
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

-- 테이블 데이터 dacham.disease:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` (`diseaseCode`, `diseaseName`, `minAge`, `maxAge`, `minBloodS`, `maxBloodS`, `minBloodP`, `maxBloodP`, `judgement`) VALUES
	(1, '당뇨병', 10, 80, 100, 126, 0, 0, '주의'),
	(2, '당뇨병', 10, 80, 127, 200, 0, 0, '위험'),
	(3, '당뇨병', 10, 80, 201, 300, 0, 0, '고위험'),
	(4, '신부전증', 10, 80, 100, 126, 80, 120, '주의'),
	(5, '신부전증', 10, 80, 100, 126, 90, 140, '위험'),
	(6, '신부전증', 10, 80, 100, 126, 100, 160, '고위험'),
	(7, '신부전증', 10, 80, 127, 200, 80, 120, '위험'),
	(8, '신부전증', 10, 80, 127, 200, 90, 140, '위험'),
	(9, '신부전증', 10, 80, 127, 200, 100, 160, '고위험'),
	(10, '신부전증', 10, 80, 201, 300, 80, 120, '고위험'),
	(11, '신부전증', 10, 80, 201, 300, 90, 140, '고위험'),
	(12, '신부전증', 10, 80, 201, 300, 100, 160, '고위험');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;

-- 테이블 dacham.foodgroup 구조 내보내기
DROP TABLE IF EXISTS `foodgroup`;
CREATE TABLE IF NOT EXISTS `foodgroup` (
  `foodGCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `foodGName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`foodGCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodgroup:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodgroup` DISABLE KEYS */;
INSERT INTO `foodgroup` (`foodGCode`, `foodGName`) VALUES
	('01', '곡류'),
	('02', '조미류'),
	('03', '채소군'),
	('04', '생선류'),
	('05', '고기류');
/*!40000 ALTER TABLE `foodgroup` ENABLE KEYS */;

-- 테이블 dacham.foodmaterial 구조 내보내기
DROP TABLE IF EXISTS `foodmaterial`;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodmaterial:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodmaterial` DISABLE KEYS */;
INSERT INTO `foodmaterial` (`foodMCode`, `foodMName`, `kcal`, `carbohydrate`, `protein`, `fat`, `vitaminA_RE`, `vitaminA_retinol`, `vitaminA_beta`, `vitaminB1`, `vitaminB2`, `niacin`, `vitaminC`, `ca`, `p`, `fe`, `k`, `na`, `foodMImg`, `price`, `unit`) VALUES
	(1, '삼겹살', 493, 30, 22, 41, 25, 25, 0, 1, 0, 1, 0, 6, 0, 0, 0, 0, 'wher2017-06-07 07_14_28.PNG', 24000, 'kg'),
	(2, '후춧가루', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 'images2017-05-07 08_05_11.jpg', 15000, 'kg'),
	(3, '연근', 70, 16.4, 2.1, 0.1, 0, 0, 0, 0.11, 0.01, 0.3, 57, 22, 67, 0.9, 377, 36, 'o2017-06-07 08_22_15.jpg', 15000, 'kg'),
	(4, '백미', 363, 13.4, 6.4, 0.4, 1, 0, 4, 0.23, 0.02, 1.2, 0, 7, 87, 1.3, 170, 8, 'o2017-06-07 08_22_15.jpg', 1500, 'kg'),
	(5, '가지', 17, 4, 0.8, 0.1, 63, 0, 377, 0.18, 0.03, 0.4, 2, 18, 24, 0.2, 189, 0, 'o2017-06-07 08_22_15.jpg', 10000, 'kg'),
	(6, '시금치', 33, 6, 3.1, 0.5, 479, 0, 2876, 0.12, 0.34, 0.5, 60, 40, 29, 2.6, 502, 54, 'o2017-06-07 08_22_15.jpg', 8000, 'kg'),
	(7, '도라지', 74, 19.2, 2, 0.1, 2, 0, 9, 0.02, 0.06, 6, 14, 45, 70, 1.3, 302, 19, 'o2017-06-07 08_22_15.jpg', 18000, 'kg'),
	(8, '콩나물', 53, 4.7, 4.6, 1.8, 0.7, 0, 0, 0.59, 0.09, 0.8, 5, 48, 99, 0.6, 298, 3, '3', 9000, 'kg'),
	(10, '오징어', 95, 0, 19.5, 1.3, 2, 2, 0, 0.05, 0.08, 2.5, 0, 25, 273, 0.5, 260, 181, NULL, 10000, 'kg'),
	(11, '참깨', 569, 21.2, 20.5, 49.2, 3, 0, 12, 0.65, 0.15, 5.1, 0, 1060, 546, 10.4, 412, 2, NULL, 6000, 'kg'),
	(12, '고추장', 178, 43.8, 4.9, 1.1, 408, 0, 2445, 0.17, 0.52, 1.6, 5, 40, 90, 2.2, 822, 3164, NULL, 15000, 'kg'),
	(13, '땅콩기름', 884, 0, 0, 100, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, NULL, 15000, 'L'),
	(14, '고추', 57, 10.3, 2.6, 1.7, 1078, 0, 6466, 0.13, 0.21, 2.1, 116, 16, 56, 0.9, 284, 12, NULL, 7900, 'kg');
/*!40000 ALTER TABLE `foodmaterial` ENABLE KEYS */;

-- 테이블 dacham.foodminven 구조 내보내기
DROP TABLE IF EXISTS `foodminven`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodminven:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodminven` DISABLE KEYS */;
INSERT INTO `foodminven` (`foodMICode`, `foodMCode`, `foodMName`, `inAmount`, `inDate`, `outAmount`, `uint`, `price`, `exDate`) VALUES
	(1, 5, '가지', 0, '2017-06-08', 0, 'kg', 5000, '2017-06-11');
/*!40000 ALTER TABLE `foodminven` ENABLE KEYS */;

-- 테이블 dacham.measure 구조 내보내기
DROP TABLE IF EXISTS `measure`;
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
DROP TABLE IF EXISTS `measureitem`;
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
DROP TABLE IF EXISTS `member`;
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
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE IF NOT EXISTS `orderitem` (
  `orderItemCode` int(3) NOT NULL,
  `orderItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`orderItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` (`orderItemCode`, `orderItemName`) VALUES
	(1, '장바구니'),
	(2, '결제완료'),
	(3, '조리 대기'),
	(4, '조리 중'),
	(5, '조리완료'),
	(6, '환불');
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;

-- 테이블 dacham.orderlist 구조 내보내기
DROP TABLE IF EXISTS `orderlist`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderlist:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`orderCode`, `id`, `dietCode`, `orderDate`, `price`, `dietAmount`, `transportNum`, `orderItemCode`, `paymentItemCode`) VALUES
	(1, 'customer', 1, '2017-06-08', 30000, NULL, '', 6, 1),
	(2, 'customer', 1, '2017-06-08', 30000, NULL, NULL, 1, 1),
	(3, 'counselor', 1, '2017-06-09', 50000, NULL, NULL, 2, 3);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;

-- 테이블 dacham.paymentitem 구조 내보내기
DROP TABLE IF EXISTS `paymentitem`;
CREATE TABLE IF NOT EXISTS `paymentitem` (
  `paymentItemCode` int(3) NOT NULL,
  `paymentItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`paymentItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.paymentitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `paymentitem` DISABLE KEYS */;
INSERT INTO `paymentitem` (`paymentItemCode`, `paymentItemName`) VALUES
	(1, '결제대기'),
	(2, '카드'),
	(3, '계좌이체'),
	(4, '휴대폰결제');
/*!40000 ALTER TABLE `paymentitem` ENABLE KEYS */;

-- 테이블 dacham.sidedinfo 구조 내보내기
DROP TABLE IF EXISTS `sidedinfo`;
CREATE TABLE IF NOT EXISTS `sidedinfo` (
  `sideDCode` int(5) NOT NULL,
  `foodMCode` int(4) NOT NULL,
  `foodMAmount` int(5) NOT NULL,
  PRIMARY KEY (`sideDCode`,`foodMCode`),
  KEY `FK_sidedinfo_foodmaterial` (`foodMCode`),
  CONSTRAINT `FK_sidedinfo_foodmaterial` FOREIGN KEY (`foodMCode`) REFERENCES `foodmaterial` (`foodMCode`),
  CONSTRAINT `FK_sidedinfo_sidedish` FOREIGN KEY (`sideDCode`) REFERENCES `sidedish` (`sideDCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedinfo:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedinfo` DISABLE KEYS */;
INSERT INTO `sidedinfo` (`sideDCode`, `foodMCode`, `foodMAmount`) VALUES
	(3, 3, 114),
	(5, 2, 41),
	(6, 1, 24),
	(6, 2, 24),
	(6, 3, 24),
	(8, 4, 200),
	(9, 6, 50),
	(9, 13, 1);
/*!40000 ALTER TABLE `sidedinfo` ENABLE KEYS */;

-- 테이블 dacham.sidedish 구조 내보내기
DROP TABLE IF EXISTS `sidedish`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedish:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedish` DISABLE KEYS */;
INSERT INTO `sidedish` (`sideDCode`, `foodGCode`, `cookMCode`, `sideDName`, `recipe`, `sideDImg`) VALUES
	(3, '02', '03', '2', '442', 'abc2017-06-07 08_37_24.png'),
	(4, '01', '04', '77', '42', 'abc2017-06-07 08_39_40.png'),
	(5, '02', '02', '4', '41', 'abc2017-06-07 08_40_04.png'),
	(6, '04', '01', '456', '004', 'abc2017-06-08 09_10_51.png'),
	(8, '01', '04', '밥', '쌀 넣고 밥하면 됨', 'rice2017-06-08 10_47_35.JPG'),
	(9, '03', '03', '시금치 무침', '시금치를 데친 후 무침', 'd012017-06-08 10_52_38.JPG');
/*!40000 ALTER TABLE `sidedish` ENABLE KEYS */;

-- 테이블 dacham.wizardqna 구조 내보내기
DROP TABLE IF EXISTS `wizardqna`;
CREATE TABLE IF NOT EXISTS `wizardqna` (
  `QA` text COLLATE utf8_bin,
  `wizardCode` int(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`wizardCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.wizardqna:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `wizardqna` DISABLE KEYS */;
INSERT INTO `wizardqna` (`QA`, `wizardCode`) VALUES
	('1', 1);
/*!40000 ALTER TABLE `wizardqna` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
