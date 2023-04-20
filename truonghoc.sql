DROP DATABASE IF EXISTS TRUONGHOC;
CREATE DATABASE TRUONGHOC;
USE TRUONGHOC;

DROP TABLE IF EXISTS cap_truong;
CREATE TABLE `cap_truong` (
  `id_ct` varchar(10) NOT NULL,
  `ten_captrg` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS loai_hinh;
CREATE TABLE `loai_hinh` (
  `id_lhinh` int NOT NULL,
  `ten_lhinh` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_lhinh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS loai_truong;
CREATE TABLE `loai_truong` (
  `id_ltrg` int NOT NULL,
  `ten_ltrg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ltrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS phong_gd;
CREATE TABLE `phong_gd` (
  `id_ten` varchar(20) NOT NULL,
  `ten_phgd` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_ten`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS schools;
CREATE TABLE `schools` (
  `ma_truong` varchar(20) NOT NULL,
  `ten_truong` varchar(100) NOT NULL,
  `dia_chi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ma_truong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS school_stages;
CREATE TABLE `school_stages` (
  `ma_truong` varchar(20) NOT NULL,
  `phong_gddt` varchar(20) NOT NULL,
  `loai_hinh` int NOT NULL,
  `loai_truong` int NOT NULL,
  `cap_truong` varchar(10) NOT NULL,
  PRIMARY KEY (`ma_truong`, `cap_truong`),
  KEY `phong_gddt` (`phong_gddt`),
  KEY `loai_hinh` (`loai_hinh`),
  KEY `loai_truong` (`loai_truong`),
  KEY `cap_truong` (`cap_truong`),
  CONSTRAINT `fk_phong_gd` FOREIGN KEY (`phong_gddt`) REFERENCES `phong_gd` (`id_ten`) ON DELETE CASCADE,
  CONSTRAINT `fk_loai_hinh` FOREIGN KEY (`loai_hinh`) REFERENCES `loai_hinh` (`id_lhinh`),
  CONSTRAINT `fk_loai_truong` FOREIGN KEY (`loai_truong`) REFERENCES `loai_truong` (`id_ltrg`),
  CONSTRAINT `fk_cap_truong` FOREIGN KEY (`cap_truong`) REFERENCES `cap_truong` (`id_ct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

