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
CREATE TABLE IF NOT EXISTS `cookmethod` (
  `cookMCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `cookMName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cookMCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='조리방법';

-- 테이블 데이터 dacham.cookmethod:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cookmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `cookmethod` ENABLE KEYS */;


-- 테이블 dacham.counsel 구조 내보내기
CREATE TABLE IF NOT EXISTS `counsel` (
  `counselCode` int(5) NOT NULL AUTO_INCREMENT,
  `counselItemCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `customer` varchar(20) COLLATE utf8_bin NOT NULL,
  `adviser` varchar(20) COLLATE utf8_bin NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.counsel:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counsel` DISABLE KEYS */;
/*!40000 ALTER TABLE `counsel` ENABLE KEYS */;


-- 테이블 dacham.counselitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `counselitem` (
  `counselItemCode` varchar(2) COLLATE utf8_bin NOT NULL,
  `counselItemName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`counselItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.counselitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `counselitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `counselitem` ENABLE KEYS */;


-- 테이블 dacham.diet 구조 내보내기
CREATE TABLE IF NOT EXISTS `diet` (
  `dietCode` int(5) NOT NULL AUTO_INCREMENT,
  `dietName` varchar(20) COLLATE utf8_bin NOT NULL,
  `price` int(7) NOT NULL,
  `dietImg` varchar(20) COLLATE utf8_bin DEFAULT NULL,
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
CREATE TABLE IF NOT EXISTS `foodgroup` (
  `foodGCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `foodGName` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`foodGCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodgroup:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodgroup` ENABLE KEYS */;


-- 테이블 dacham.foodmaterial 구조 내보내기
CREATE TABLE IF NOT EXISTS `foodmaterial` (
  `foodMCode` int(4) NOT NULL AUTO_INCREMENT,
  `foodMName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `kcal` int(5) DEFAULT NULL,
  `carbohydrate` int(5) DEFAULT NULL,
  `protein` int(5) DEFAULT NULL,
  `fat` int(5) DEFAULT NULL,
  `vitaminA_RE` int(5) DEFAULT NULL,
  `vitaminA_retinol` int(5) DEFAULT NULL,
  `vitaminA_beta` int(5) DEFAULT NULL,
  `vitaminB1` int(5) DEFAULT NULL,
  `vitaminB2` int(5) DEFAULT NULL,
  `niacin` int(5) DEFAULT NULL,
  `vitaminC` int(5) DEFAULT NULL,
  `ca` int(5) DEFAULT NULL,
  `p` int(5) DEFAULT NULL,
  `fe` int(5) DEFAULT NULL,
  `k` int(5) DEFAULT NULL,
  `na` int(5) DEFAULT NULL,
  `foodMImg` int(5) DEFAULT NULL,
  PRIMARY KEY (`foodMCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodmaterial:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `foodmaterial` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.foodminven:~0 rows (대략적) 내보내기
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
  `photoImg` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 dacham.orderitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderitem` (
  `orderItemCode` int(3) NOT NULL,
  `orderItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`orderItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.orderlist:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;


-- 테이블 dacham.paymentitem 구조 내보내기
CREATE TABLE IF NOT EXISTS `paymentitem` (
  `paymentItemCode` int(3) NOT NULL,
  `paymentItemName` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`paymentItemCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.paymentitem:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `paymentitem` DISABLE KEYS */;
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

-- 테이블 데이터 dacham.sidedinfo:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sidedinfo` ENABLE KEYS */;


-- 테이블 dacham.sidedish 구조 내보내기
CREATE TABLE IF NOT EXISTS `sidedish` (
  `sideDCode` int(5) NOT NULL AUTO_INCREMENT,
  `foodGCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `cookMCode` varchar(20) COLLATE utf8_bin NOT NULL,
  `sideDName` varchar(20) COLLATE utf8_bin NOT NULL,
  `recipe` text COLLATE utf8_bin NOT NULL,
  `sideDImg` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sideDCode`),
  KEY `FK_sidedish_foodgroup` (`foodGCode`),
  KEY `FK_sidedish_cookmethod` (`cookMCode`),
  CONSTRAINT `FK_sidedish_cookmethod` FOREIGN KEY (`cookMCode`) REFERENCES `cookmethod` (`cookMCode`),
  CONSTRAINT `FK_sidedish_foodgroup` FOREIGN KEY (`foodGCode`) REFERENCES `foodgroup` (`foodGCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 테이블 데이터 dacham.sidedish:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sidedish` DISABLE KEYS */;
/*!40000 ALTER TABLE `sidedish` ENABLE KEYS */;


-- 테이블 dacham.wizardqna 구조 내보내기
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
