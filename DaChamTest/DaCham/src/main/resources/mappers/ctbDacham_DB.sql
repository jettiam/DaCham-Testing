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
	('05', '초벌');
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

-- 테이블 데이터 dacham.counsel:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel` DISABLE KEYS */;
INSERT INTO `counsel` (`counselCode`, `counselItemCode`, `customer`, `adviser`, `counselTitle`, `counselDate`, `counselContent`, `counselRec`) VALUES
	(1, '4', 'customer', NULL, '기타', '2017-06-05', '된다', NULL),
	(2, '2', 'test', NULL, '고지혈증이', '2017-06-07', '고기좀 주세요', NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.diet:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.disease:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
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
  PRIMARY KEY (`foodMCode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodmaterial:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodmaterial` DISABLE KEYS */;
INSERT INTO `foodmaterial` (`foodMCode`, `foodMName`, `kcal`, `carbohydrate`, `protein`, `fat`, `vitaminA_RE`, `vitaminA_retinol`, `vitaminA_beta`, `vitaminB1`, `vitaminB2`, `niacin`, `vitaminC`, `ca`, `p`, `fe`, `k`, `na`, `foodMImg`) VALUES
	(1, '삼겹살', 493, 3, 22, 41, 25, 25, 0, 1, 0, 1, 0, 6, NULL, NULL, NULL, NULL, NULL),
	(2, '후춧가루', 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 4, 4, 4, 4, 4, 'images2017-05-07 08_05_11.jpg'),
	(3, 'qwewe', 1.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodminven:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodminven` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderlist:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
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
	(5, 2, 41);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedish:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedish` DISABLE KEYS */;
INSERT INTO `sidedish` (`sideDCode`, `foodGCode`, `cookMCode`, `sideDName`, `recipe`, `sideDImg`) VALUES
	(3, '02', '03', '2', '442', 'abc2017-06-07 08_37_24.png'),
	(4, '01', '04', '77', '42', 'abc2017-06-07 08_39_40.png'),
	(5, '02', '02', '4', '41', 'abc2017-06-07 08_40_04.png');
/*!40000 ALTER TABLE `sidedish` ENABLE KEYS */;


-- 테이블 dacham.wizardqna 구조 내보내기
DROP TABLE IF EXISTS `wizardqna`;
CREATE TABLE IF NOT EXISTS `wizardqna` (
  `QA` text COLLATE utf8_bin,
  `wizardCode` int(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`wizardCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.wizardqna:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `wizardqna` DISABLE KEYS */;
/*!40000 ALTER TABLE `wizardqna` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
