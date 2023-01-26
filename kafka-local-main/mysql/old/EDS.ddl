-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: mspldb219    Database: EDS
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ASSIGN_MATL_PARAM_VAL`
--

DROP TABLE IF EXISTS `ASSIGN_MATL_PARAM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSIGN_MATL_PARAM_VAL` (
  `ASSIGN_MATL_PARAM_VAL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Assigned Material Parameter Value',
  `MATL_PARAM_VAL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material Parameter Value',
  `PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure',
  `DEVICE_REGIST_KEY` int DEFAULT NULL COMMENT 'The EDS primary key for Device Registration',
  `STRING_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The assigned string value for the Parameter',
  `NUM_VAL` decimal(5,0) DEFAULT NULL COMMENT 'The assigned numeric value for the Parameter',
  `TS_VAL` timestamp NULL DEFAULT NULL COMMENT 'The assigned date/time value for the Parameter',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ASSIGN_MATL_PARAM_VAL_KEY`),
  UNIQUE KEY `AK_ASSIGN_MATL_PARAM_VAL` (`MATL_PARAM_VAL_KEY`,`PROC_KEY`),
  KEY `REF_DEVICE_INSTANCE__ASSIGN_MATL_PARAM_VAL` (`DEVICE_REGIST_KEY`),
  KEY `REF_PROC__ASSIGN_MATL_PARAM_VAL` (`PROC_KEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__ASSIGN_MATL_PARAM_VAL` FOREIGN KEY (`DEVICE_REGIST_KEY`) REFERENCES `DEVICE_REGIST` (`DEVICE_REGIST_KEY`),
  CONSTRAINT `REF_MATL_PARAM_VAL__ASSIGN_MATL_PARAM_VAL` FOREIGN KEY (`MATL_PARAM_VAL_KEY`) REFERENCES `MATL_PARAM_VAL` (`MATL_PARAM_VAL_KEY`),
  CONSTRAINT `REF_PROC__ASSIGN_MATL_PARAM_VAL` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Links Parameter Value assignments to Devices/Procedures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_INSTANCE`
--

DROP TABLE IF EXISTS `DEVICE_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_INSTANCE` (
  `DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PROD_MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material (Parent Product)',
  `PURCH_HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility (Purchasing or Sold To Customer)',
  `LOT_SERIAL_NUM` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'Lot number or serial number (one or the other)',
  `UNK_SERIAL_NUM_IND` tinyint(1) NOT NULL COMMENT 'Indicates if the serial number is unknown',
  `MFG_DT` date DEFAULT NULL COMMENT 'The date of manufacture',
  `USE_BEFORE_DT` date DEFAULT NULL COMMENT 'The date before which the Device must be used',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`DEVICE_INSTANCE_KEY`),
  UNIQUE KEY `AK_DEVICE_INSTANCE` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`),
  KEY `REF_HCO_FCLTY__DEVICE_INSTANCE` (`PURCH_HCO_FCLTY_KEY`),
  KEY `REF_MATL__DEVICE_INSTANCE` (`PROD_MATL_KEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_01` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_02` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_04` (`STAT_RKEY`),
  CONSTRAINT `REF_HCO_FCLTY__DEVICE_INSTANCE` FOREIGN KEY (`PURCH_HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_MATL__DEVICE_INSTANCE` FOREIGN KEY (`PROD_MATL_KEY`) REFERENCES `MATL` (`MATL_KEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_01` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_02` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__DEVICE_INSTANCE` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The instance of a Device in the real world.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_INSTANCE_RLSHP`
--

DROP TABLE IF EXISTS `DEVICE_INSTANCE_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_INSTANCE_RLSHP` (
  `DEVICE_INSTANCE_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Relationship',
  `DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `REL_DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Device Instance (related Device Instance)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `INIT_ACTVY_DT` date NOT NULL COMMENT 'The initial date of activity for the Device',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`DEVICE_INSTANCE_RLSHP_KEY`),
  UNIQUE KEY `AK_DEVICE_INSTANCE_RLSHP` (`DEVICE_INSTANCE_KEY`,`REL_DEVICE_INSTANCE_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_DEVICE_INSTANCE__DEVICE_INSTANCE_RLSHP_01` (`REL_DEVICE_INSTANCE_KEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_01` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_04` (`STAT_RKEY`),
  KEY `REF_SOURCE__DEVICE_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__DEVICE_INSTANCE_RLSHP_01` FOREIGN KEY (`REL_DEVICE_INSTANCE_KEY`) REFERENCES `DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__DEVICE_INSTANCE_RLSHP_02` FOREIGN KEY (`DEVICE_INSTANCE_KEY`) REFERENCES `DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_01` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_RLSHP_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__DEVICE_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship of Devices to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_INSTANCE_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `DEVICE_INSTANCE_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_INSTANCE_VIRTUAL_ADDR` (
  `DEVICE_INSTANCE_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Virtual Address',
  `DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`DEVICE_INSTANCE_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_DEVICE_INSTANCE_VIRTUAL_ADDR` (`DEVICE_INSTANCE_KEY`,`VIRTUAL_ADDR_KEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_01` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_03` (`STAT_RKEY`),
  KEY `REF_VIRTUAL_ADDR__DEVICE_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__DEVICE_INSTANCE_VIRTUAL_ADDR` FOREIGN KEY (`DEVICE_INSTANCE_KEY`) REFERENCES `DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_01` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_INSTANCE_VIRTUAL_ADDR_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__DEVICE_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Devices to Virtual Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_REGIST`
--

DROP TABLE IF EXISTS `DEVICE_REGIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_REGIST` (
  `DEVICE_REGIST_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Registration',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `PROC_KEY` int DEFAULT NULL COMMENT 'The EDS primary key for Procedure',
  `DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `FOLLOWUP_HCP_KEY` int DEFAULT NULL COMMENT 'The designated Followup Healthcare Professional',
  `FOLLOWUP_ORG_KEY` int DEFAULT NULL COMMENT 'The designated Followup Healthcare Organization',
  `SALES_REP_EMPL_KEY` int DEFAULT NULL COMMENT 'The Employee who last instructed MDT to perform some action',
  `LAST_HDL_EMPL_KEY` int DEFAULT NULL COMMENT 'The Employee who last handled the Device Registration (EDS Employee Key)',
  `EXTNL_SUBMIT_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The individual who last instructed MDT to perform some action (if not an internal Sales Rep)',
  `DEVICE_DISP_RKEY` int NOT NULL COMMENT 'The Device Disposition (Reference Value)',
  `DEVICE_REGIST_CHG_TS` timestamp NOT NULL COMMENT 'The date of the initial entry or change to the Device Registration',
  `DEVICE_REGIST_CHG_REASN_RKEY` int NOT NULL COMMENT 'The reason for the change to the Registration (Reference Value)',
  `ACT_TYP_RKEY` int NOT NULL COMMENT 'The Activity Type of the action tied to the Device Registration (Reference Value)',
  `ACT_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Activity Subtype of the action tied to the Device Registration (Reference Value)',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Device Registration or Device Registration change',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`DEVICE_REGIST_KEY`),
  UNIQUE KEY `AK_DEVICE_REGIST` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`),
  KEY `REF_DEVICE_INSTANCE__DEVICE_REGIST` (`DEVICE_INSTANCE_KEY`),
  KEY `REF_EMPL__DEVICE_REGIST_01` (`SALES_REP_EMPL_KEY`),
  KEY `REF_EMPL__DEVICE_REGIST_02` (`LAST_HDL_EMPL_KEY`),
  KEY `REF_HCP__DEVICE_REGIST` (`FOLLOWUP_HCP_KEY`),
  KEY `REF_ORG__DEVICE_REGIST` (`FOLLOWUP_ORG_KEY`),
  KEY `REF_PATIENT__DEVICE_REGIST` (`PATIENT_KEY`),
  KEY `REF_PROC__DEVICE_REGIST` (`PROC_KEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_03` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_04` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_05` (`DEVICE_DISP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_06` (`ACT_TYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_07` (`ACT_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__DEVICE_REGIST_08` (`DEVICE_REGIST_CHG_REASN_RKEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__DEVICE_REGIST` FOREIGN KEY (`DEVICE_INSTANCE_KEY`) REFERENCES `DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`),
  CONSTRAINT `REF_EMPL__DEVICE_REGIST_01` FOREIGN KEY (`SALES_REP_EMPL_KEY`) REFERENCES `EMPL` (`EMPL_KEY`),
  CONSTRAINT `REF_EMPL__DEVICE_REGIST_02` FOREIGN KEY (`LAST_HDL_EMPL_KEY`) REFERENCES `EMPL` (`EMPL_KEY`),
  CONSTRAINT `REF_HCP__DEVICE_REGIST` FOREIGN KEY (`FOLLOWUP_HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_ORG__DEVICE_REGIST` FOREIGN KEY (`FOLLOWUP_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_PATIENT__DEVICE_REGIST` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_PROC__DEVICE_REGIST` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_03` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_04` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_05` FOREIGN KEY (`DEVICE_DISP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_06` FOREIGN KEY (`ACT_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_07` FOREIGN KEY (`ACT_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__DEVICE_REGIST_08` FOREIGN KEY (`DEVICE_REGIST_CHG_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__DEVICE_REGSIT` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Instances of Registration activity for a Device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DUMMY`
--

DROP TABLE IF EXISTS `DUMMY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DUMMY` (
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPL`
--

DROP TABLE IF EXISTS `EMPL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPL` (
  `EMPL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Employee',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `TITLE_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The Title for the Employee, if applicable',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`EMPL_KEY`),
  UNIQUE KEY `AK_EMPL` (`PERS_KEY`,`ORG_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_ORG__EMPL` (`ORG_KEY`),
  KEY `REF_REF_VAL__EMPL_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__EMPL_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__EMPL_03` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__EMPL_04` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__EMPL_05` (`LANG_RKEY`),
  KEY `REF_SOURCE__EMPL` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__EMPL` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_PERS__EMPL` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__EMPL_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__EMPL_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__EMPL_03` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__EMPL_04` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__EMPL_05` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__EMPL` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Persons employed by an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY`
--

DROP TABLE IF EXISTS `HCO_FCLTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY` (
  `HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `PLACE_KEY` int NOT NULL COMMENT 'The EDS primary key for Place',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `HCO_FCLTY_NM` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The name of the HCO Facility',
  `HCO_FCLTY_PREF_NM` varchar(300) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The preferred name of the HCO Facility',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` int DEFAULT NULL COMMENT 'The preferred Address Type for tor the HCO Facility (Reference Value)',
  `ORG_CUST_KEY` int DEFAULT NULL COMMENT 'The EDS primary key for Organization Customer',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Healthcare Organization Facility',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY` (`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`,`ORG_KEY`,`PLACE_KEY`,`SOURCE_KEY`),
  KEY `TEST` (`HCO_FCLTY_NM`),
  KEY `REF_ORG_CUST__HCO_FCLTY` (`ORG_CUST_KEY`),
  KEY `REF_ORG__HCO_FCLTY` (`ORG_KEY`),
  KEY `REF_PLACE__HCO_FCLTY` (`PLACE_KEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_01` (`ADDR_TYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_02` (`LANG_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_03` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_04` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_05` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_06` (`STAT_RKEY`),
  KEY `REF_SOURCE__HCO_FCLTY` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__HCO_FCLTY` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_ORG_CUST__HCO_FCLTY` FOREIGN KEY (`ORG_CUST_KEY`) REFERENCES `ORG_CUST` (`ORG_CUST_KEY`),
  CONSTRAINT `REF_PLACE__HCO_FCLTY` FOREIGN KEY (`PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_01` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_02` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_03` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_05` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_06` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__HCO_FCLTY` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=4027460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A Place that is formally or semi-formally related to an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `HCO_FCLTY_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_POSTAL_ADDR` (
  `HCO_FCLTY_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization Facility Postal Address',
  `HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `LANG_RKEY` int DEFAULT NULL COMMENT 'The language associated with this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_POSTAL_ADDR` (`POSTAL_ADDR_KEY`,`HCO_FCLTY_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_HCO_FCLTY__HCO_FCLTY_POSTAL_ADDR` (`HCO_FCLTY_KEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_03` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_04` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_05` (`LANG_RKEY`),
  CONSTRAINT `REF_HCO_FCLTY__HCO_FCLTY_POSTAL_ADDR` FOREIGN KEY (`HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__HCO_FCLTY_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_03` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_04` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_POSTAL_ADDR_05` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=4027460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates HCO Facilities to Postal Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_RLSHP`
--

DROP TABLE IF EXISTS `HCO_FCLTY_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_RLSHP` (
  `HCO_FCLTY_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization Relationship',
  `HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `REL_HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility (related Facility)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_RLSHP_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_RLSHP` (`HCO_FCLTY_KEY`,`REL_HCO_FCLTY_KEY`,`RLSHP_TYP_RKEY`,`EFF_START_TS`,`SOURCE_KEY`,`SOURCE_ID`),
  KEY `REF_HCO_FCLTY__HCO_FCLTY_RLSHP_02` (`REL_HCO_FCLTY_KEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_RLSHP_01` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_RLSHP_02` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_RLSHP_03` (`STAT_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_RLSHP_04` (`STAT_REASN_RKEY`),
  KEY `REF_SOURCE__HCO_FCLTY_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_HCO_FCLTY__HCO_FCLTY_RLSHP_01` FOREIGN KEY (`HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_HCO_FCLTY__HCO_FCLTY_RLSHP_02` FOREIGN KEY (`REL_HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_RLSHP_01` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_RLSHP_02` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_RLSHP_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_RLSHP_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__HCO_FCLTY_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Relates HCO Facilities to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `HCO_FCLTY_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_VIRTUAL_ADDR` (
  `HCO_FCLTY_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Facility Virtual Address',
  `HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`,`HCO_FCLTY_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_HCO_FCLTY__HCO_FCLTY_VIRTUAL_ADDR` (`HCO_FCLTY_KEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_01` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_03` (`STAT_REASN_RKEY`),
  CONSTRAINT `REF_HCO_FCLTY__HCO_FCLTY_VIRTUAL_ADDR` FOREIGN KEY (`HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_01` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCO_FCLTY_VIRTUAL_ADDR_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__HCO_FCLTY_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=3883967 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates HCO Facilities to Virtual Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP`
--

DROP TABLE IF EXISTS `HCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP` (
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `NO_PROC_IND` tinyint(1) NOT NULL COMMENT 'Indicates this Healthcare Professional must not be associated to Procedures',
  `NO_FOLLOWUP_IND` tinyint(1) NOT NULL COMMENT 'Indicates this Healthcare Professional must not be associated to Followup',
  `PRIM_LANG_RKEY` int NOT NULL COMMENT 'The primary Language for the HCP (Reference Value)',
  `SEC_LANG_RKEY` int DEFAULT NULL COMMENT 'The secondary Language for this record (Reference Value)',
  `ADDR_TYP_RKEY` int DEFAULT NULL COMMENT 'The preferred Address Type for tor the HCP (Reference Value)',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Healthcare Professional',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCP_KEY`),
  UNIQUE KEY `AK_HCP` (`ORG_KEY`,`PERS_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PERS__HCP` (`PERS_KEY`),
  KEY `REF_REF_VAL__HCP_01` (`ADDR_TYP_RKEY`),
  KEY `REF_REF_VAL__HCP_02` (`SEC_LANG_RKEY`),
  KEY `REF_REF_VAL__HCP_03` (`PRIM_LANG_RKEY`),
  KEY `REF_REF_VAL__HCP_04` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__HCP_05` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__HCP_06` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__HCP_07` (`STAT_RKEY`),
  KEY `REF_SOURCE__HCP` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__HCP` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_PERS__HCP` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__HCP_01` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_02` FOREIGN KEY (`SEC_LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_03` FOREIGN KEY (`PRIM_LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_04` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_05` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_06` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_07` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__HCP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A Person playing the role of HCP for an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_ALT_ID`
--

DROP TABLE IF EXISTS `HCP_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_ALT_ID` (
  `HCP_ALT_ID_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Alternate Identifier',
  `HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `ALT_ID_TYP_RKEY` int NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `ORIGIN_ORG_KEY` int DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCP_ALT_ID_KEY`),
  UNIQUE KEY `AK_HCP_ALT_ID` (`HCP_KEY`,`ALT_ID_TYP_RKEY`,`ALT_ID_VAL`),
  KEY `REF_ORG__HCP_ALT_ID` (`ORIGIN_ORG_KEY`),
  KEY `REF_REF_VAL__HCP_ALT_ID` (`ALT_ID_TYP_RKEY`),
  CONSTRAINT `REF_HCP__HCP_ALT_ID` FOREIGN KEY (`HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_ORG__HCP_ALT_ID` FOREIGN KEY (`ORIGIN_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_REF_VAL__HCP_ALT_ID` FOREIGN KEY (`ALT_ID_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Alternate Identifiers for a Healtcare Professional.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `HCP_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_POSTAL_ADDR` (
  `HCP_POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Postal Address',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `SEASON_START_MTH_RKEY` int DEFAULT NULL COMMENT 'The season start month for this record (Reference Value)',
  `SEASON_END_MTH_RKEY` int DEFAULT NULL COMMENT 'The season end month for this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCP_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCP_POSTAL_ADDR` (`POSTAL_ADDR_KEY`,`HCP_KEY`,`EFF_START_TS`),
  KEY `REF_HCP__HCP_POSTAL_ADDR` (`HCP_KEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_01` (`SEASON_END_MTH_RKEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_02` (`SEASON_START_MTH_RKEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_03` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_04` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_05` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__HCP_POSTAL_ADDR_06` (`STAT_RKEY`),
  CONSTRAINT `REF_HCP__HCP_POSTAL_ADDR` FOREIGN KEY (`HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__HCP_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_01` FOREIGN KEY (`SEASON_END_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_02` FOREIGN KEY (`SEASON_START_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_03` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_04` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_05` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_POSTAL_ADDR_06` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates HCPs to Postal Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_SPCLTY`
--

DROP TABLE IF EXISTS `HCP_SPCLTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_SPCLTY` (
  `HCP_SPCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Provider Specialty',
  `HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `SPCLTY_RKEY` int NOT NULL COMMENT 'The Specialty for this HCP (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCP_SPCLTY_KEY`),
  UNIQUE KEY `AK_HCP_SPCLTY` (`HCP_KEY`,`SPCLTY_RKEY`),
  KEY `REF_REF_VAL__HCP_SPCLTY` (`SPCLTY_RKEY`),
  CONSTRAINT `REF_HCP__HCP_SPCLTY` FOREIGN KEY (`HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_REF_VAL__HCP_SPCLTY` FOREIGN KEY (`SPCLTY_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates HCPs to Specialties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `HCP_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_VIRTUAL_ADDR` (
  `HCP_VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Virtual Address',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`HCP_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCP_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`,`HCP_KEY`,`EFF_START_TS`),
  KEY `REF_HCP__HCP_VIRTUAL_ADDR` (`HCP_KEY`),
  KEY `REF_REF_VAL__HCP_VIRTUAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__HCP_VIRTUAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__HCP_VIRTUAL_ADDR_03` (`ADDR_USAGE_TYP_RKEY`),
  CONSTRAINT `REF_HCP__HCP_VIRTUAL_ADDR` FOREIGN KEY (`HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_REF_VAL__HCP_VIRTUAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__HCP_VIRTUAL_ADDR_03` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__HCP_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates HCPs to Virtual Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL`
--

DROP TABLE IF EXISTS `MATL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL` (
  `MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `MATL_NUM` varchar(45) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The Material Number',
  `MATL_DISPL_NUM` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The display number for the Material',
  `MATL_SHORT_NM` varchar(20) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The short name for the Material',
  `MATL_LONG_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The long name for the Material',
  `MATL_DESC` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The decription of the Material',
  `LOT_SERIAL_CD_RKEY` int DEFAULT NULL COMMENT ' A code specifying if the Material is Serialized or Lot controlled (Reference Value)',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `UOM_RKEY` int DEFAULT NULL COMMENT 'The Unit of Measure for the Material (Reference Value)',
  `TRACK_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this Material is being tracked from a regulatory standpoint',
  `TRACK_METHOD_RKEY` int DEFAULT NULL COMMENT 'The Tracking Method for this Material (Reference Value)',
  `TRACK_PURP_RKEY` int DEFAULT NULL COMMENT 'The Tracking Purpose for this Material (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`MATL_KEY`),
  UNIQUE KEY `AK_MATL` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`,`MATL_NUM`),
  KEY `REF_REF_VAL__MATL_01` (`UOM_RKEY`),
  KEY `REF_REF_VAL__MATL_02` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__MATL_03` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__MATL_04` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__MATL_05` (`STAT_RKEY`),
  KEY `REF_REF_VAL__MATL_06` (`LANG_RKEY`),
  KEY `REF_REF_VAL__MATL_07` (`TRACK_PURP_RKEY`),
  KEY `REF_REF_VAL__MATL_08` (`TRACK_METHOD_RKEY`),
  KEY `REF_REF_VAL__MATL_09` (`LOT_SERIAL_CD_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_01` FOREIGN KEY (`UOM_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_02` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_03` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_05` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_06` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_07` FOREIGN KEY (`TRACK_PURP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_08` FOREIGN KEY (`TRACK_METHOD_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_09` FOREIGN KEY (`LOT_SERIAL_CD_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__MATL` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1324589 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Any thing that has extension in space and mass.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_CONFIG_RULE`
--

DROP TABLE IF EXISTS `MATL_CONFIG_RULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_CONFIG_RULE` (
  `MATL_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Configuration Rule (via Material Relationship)',
  `MIN_QTY` decimal(5,0) DEFAULT NULL COMMENT 'The minimum allowable quantity',
  `MAX_QTY` decimal(5,0) DEFAULT NULL COMMENT 'The maximum allowable quantity',
  `OPTIONAL_IND` tinyint(1) NOT NULL COMMENT 'Indicates this is an optional item',
  `ORDINAL_NUM` decimal(5,0) DEFAULT NULL COMMENT 'Designates Primary (1), Secondary (2), Tertiary (3), Quaternary (4), etc',
  `OPTION_GRP_NUM` decimal(5,0) DEFAULT NULL COMMENT 'Use number values to group Materials that can optionally be selected from only a specific group',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`MATL_RLSHP_KEY`),
  CONSTRAINT `REF_MATL_RLSHP__MATL_CONFIG_RULE` FOREIGN KEY (`MATL_RLSHP_KEY`) REFERENCES `MATL_RLSHP` (`MATL_RLSHP_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Specifies options for a given Material relationship.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_ORG`
--

DROP TABLE IF EXISTS `MATL_ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_ORG` (
  `MATL_ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Organization',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`MATL_ORG_KEY`),
  UNIQUE KEY `AK_MATL_ORG` (`ORG_KEY`,`MATL_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_MATL__MATL_ORG` (`MATL_KEY`),
  KEY `REF_REF_VAL__MATL_ORG_01` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__MATL_ORG_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__MATL_ORG_03` (`STAT_RKEY`),
  KEY `REF_REF_VAL__MATL_ORG_04` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_SOURCE__MATL_ORG` (`SOURCE_KEY`),
  CONSTRAINT `REF_MATL__MATL_ORG` FOREIGN KEY (`MATL_KEY`) REFERENCES `MATL` (`MATL_KEY`),
  CONSTRAINT `REF_ORG__MATL_ORG` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_REF_VAL__MATL_ORG_01` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_ORG_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_ORG_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_ORG_04` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__MATL_ORG` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship of Materials to Orgs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_PARAM_VAL`
--

DROP TABLE IF EXISTS `MATL_PARAM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_PARAM_VAL` (
  `MATL_PARAM_VAL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Parameter Value',
  `MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material',
  `MATL_PARAM_RKEY` int NOT NULL COMMENT 'The Material Parameter (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`MATL_PARAM_VAL_KEY`),
  UNIQUE KEY `AK_MATL_PARAM_VAL` (`MATL_KEY`,`MATL_PARAM_RKEY`),
  KEY `REF_REF_VAL__MATL_PARAM_VAL` (`MATL_PARAM_RKEY`),
  CONSTRAINT `REF_MATL__MATL_PARAM_VAL` FOREIGN KEY (`MATL_KEY`) REFERENCES `MATL` (`MATL_KEY`),
  CONSTRAINT `REF_REF_VAL__MATL_PARAM_VAL` FOREIGN KEY (`MATL_PARAM_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Parameter Values to Materials.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_RLSHP`
--

DROP TABLE IF EXISTS `MATL_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_RLSHP` (
  `MATL_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Relationship',
  `MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material',
  `REL_MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material (related Material)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`MATL_RLSHP_KEY`),
  UNIQUE KEY `AK_MATL_RLSHP` (`REL_MATL_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_MATL__MATL_RLSHP_02` (`MATL_KEY`),
  KEY `REF_REF_VAL__MATL_RLSHP_01` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__MATL_RLSHP_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__MATL_RLSHP_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__MATL_RLSHP_04` (`STAT_RKEY`),
  KEY `REF_SOURCE__MATL_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_MATL__MATL_RLSHP_01` FOREIGN KEY (`REL_MATL_KEY`) REFERENCES `MATL` (`MATL_KEY`),
  CONSTRAINT `REF_MATL__MATL_RLSHP_02` FOREIGN KEY (`MATL_KEY`) REFERENCES `MATL` (`MATL_KEY`),
  CONSTRAINT `REF_REF_VAL__MATL_RLSHP_01` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_RLSHP_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_RLSHP_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__MATL_RLSHP_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__MATL_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=5639027 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship of Materials to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_RLSHP_TEMP`
--

DROP TABLE IF EXISTS `MATL_RLSHP_TEMP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_RLSHP_TEMP` (
  `MATL_RLSHP_KEY` int NOT NULL DEFAULT '0' COMMENT 'The EDS primary key for Material Relationship',
  `MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material',
  `REL_MATL_KEY` int NOT NULL COMMENT 'The EDS primary key for Material (related Material)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG`
--

DROP TABLE IF EXISTS `ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG` (
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ORG_SHORT_NM` varchar(40) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The short name for the Organization',
  `ORG_LONG_NM` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The long name for the Organization',
  `ORG_ALT_NM` varchar(300) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The alternate name for the Organization',
  `ORG_PREF_NM` varchar(300) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Organization''s preferred name',
  `NO_PROC_IND` tinyint(1) NOT NULL COMMENT 'Indicates this HCO must not be associated to Procedures',
  `NO_FOLLOWUP_IND` tinyint(1) NOT NULL COMMENT 'Indicates this HCO must not be associated to Followup',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `SIC_RKEY` int DEFAULT NULL COMMENT 'The Standard Industrial Classification code (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_KEY`),
  UNIQUE KEY `AK_ORG` (`SOURCE_ID`,`SOURCE_KEY`,`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_02` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_03` (`LANG_RKEY`),
  KEY `REF_REF_VAL__ORG_04` (`SIC_RKEY`),
  KEY `REF_REF_VAL__ORG_05` (`STAT_RKEY`),
  KEY `REF_REF_VAL__ORG_06` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_SOURCE__ORG` (`SOURCE_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_02` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_03` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_04` FOREIGN KEY (`SIC_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_05` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_06` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__ORG` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=39020496 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A social or legal structure formed by human beings. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_ALT_ID`
--

DROP TABLE IF EXISTS `ORG_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_ALT_ID` (
  `ORG_ALT_ID` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Alternate Identifier',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `ALT_ID_TYP_RKEY` int NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The alternate identifier value for the Organization (e.g. Tax ID, DUNS Number)',
  `ORIG_ORG_KEY` int DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_ALT_ID`),
  UNIQUE KEY `AK_ORG_ALT_ID` (`ORG_KEY`,`ALT_ID_TYP_RKEY`,`ALT_ID_VAL`),
  KEY `REF_ORG__ORG_ALT_ID_02` (`ORIG_ORG_KEY`),
  KEY `REF_REF_VAL__ORG_ALT_ID` (`ALT_ID_TYP_RKEY`),
  CONSTRAINT `REF_ORG__ORG_ALT_ID_01` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_ORG__ORG_ALT_ID_02` FOREIGN KEY (`ORIG_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_ALT_ID` FOREIGN KEY (`ALT_ID_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Alternate Identifiers for an Organization.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_CUST`
--

DROP TABLE IF EXISTS `ORG_CUST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_CUST` (
  `ORG_CUST_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Customer',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `SELL_ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization (Seller Org)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ORG_CUST_SHORT_NM` varchar(40) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The Organization Customer''s short name',
  `ORG_CUST_LONG_NM` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The Organization Customer''s long name',
  `ORG_CUST_ALT_NM` varchar(300) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Organization Customer''s alternate name (in English)',
  `ORG_CUST_PREF_NM` varchar(300) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Organization Customer''s preferred name',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value) ',
  `COMPTR_IND` tinyint(1) NOT NULL COMMENT 'Indicates of this Customer relationship competes with MDT',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Organization Customer',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_CUST_KEY`),
  UNIQUE KEY `AK_ORG_CUST` (`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`,`ORG_KEY`,`SELL_ORG_KEY`,`SOURCE_KEY`),
  KEY `REF_ORG__ORG_CUST_01` (`ORG_KEY`),
  KEY `REF_ORG__ORG_CUST_02` (`SELL_ORG_KEY`),
  KEY `REF_REF_VAL__ORG_CUST_01` (`STAT_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_02` (`LANG_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_03` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_04` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_05` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_SOURCE__ORG_CUST` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__ORG_CUST_01` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_ORG__ORG_CUST_02` FOREIGN KEY (`SELL_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_01` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_02` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_03` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_05` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__ORG_CUST` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=12086566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship between a buyer and a seller (Orgs).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_CUST_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `ORG_CUST_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_CUST_POSTAL_ADDR` (
  `ORG_CUST_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Customer Postal Address',
  `ORG_CUST_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization Customer',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_CUST_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_ORG_CUST_POSTAL_ADDR` (`ORG_CUST_KEY`,`POSTAL_ADDR_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_POSTAL_ADDR__ORG_CUST_POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  KEY `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_01` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_02` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_04` (`STAT_RKEY`),
  CONSTRAINT `REF_ORG_CUST__ORG_CUST_POSTAL_ADDR` FOREIGN KEY (`ORG_CUST_KEY`) REFERENCES `ORG_CUST` (`ORG_CUST_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__ORG_CUST_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_01` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_02` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_POSTAL_ADDR_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=22306953 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Postal Addresses to Org Customers.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_CUST_RLSHP`
--

DROP TABLE IF EXISTS `ORG_CUST_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_CUST_RLSHP` (
  `ORG_CUST_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Customer Relationship',
  `ORG_CUST_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization Customer',
  `REL_ORG_CUST_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization Customer (related Org Customer)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_CUST_RLSHP_KEY`),
  UNIQUE KEY `AK_ORG_CUST_RLSHP` (`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`,`ORG_CUST_KEY`,`REL_ORG_CUST_KEY`,`SOURCE_KEY`),
  KEY `REF_ORG_CUST__ORG_CUST_RLSHP_01` (`ORG_CUST_KEY`),
  KEY `REF_ORG_CUST__ORG_CUST_RLSHP_02` (`REL_ORG_CUST_KEY`),
  KEY `REF_REF_VAL__ORG_CUST_RLSHP_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_RLSHP_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_RLSHP_03` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_RLSHP_04` (`STAT_RKEY`),
  KEY `REF_SOURCE__ORG_CUST_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG_CUST__ORG_CUST_RLSHP_01` FOREIGN KEY (`ORG_CUST_KEY`) REFERENCES `ORG_CUST` (`ORG_CUST_KEY`),
  CONSTRAINT `REF_ORG_CUST__ORG_CUST_RLSHP_02` FOREIGN KEY (`REL_ORG_CUST_KEY`) REFERENCES `ORG_CUST` (`ORG_CUST_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_RLSHP_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_RLSHP_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_RLSHP_03` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_RLSHP_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__ORG_CUST_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship between Customer Orgs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_CUST_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `ORG_CUST_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_CUST_VIRTUAL_ADDR` (
  `ORG_CUST_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Customer Virtual Address',
  `ORG_CUST_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization Customer',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_CUST_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_ORG_CUST_VIRTUAL_ADDR` (`ORG_CUST_KEY`,`VIRTUAL_ADDR_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_01` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_03` (`STAT_RKEY`),
  KEY `REF_VIRTUAL_ADDR__ORG_CUST_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`),
  CONSTRAINT `REF_ORG_CUST__ORG_CUST_VIRTUAL_ADDR` FOREIGN KEY (`ORG_CUST_KEY`) REFERENCES `ORG_CUST` (`ORG_CUST_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_01` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_CUST_VIRTUAL_ADDR_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__ORG_CUST_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=3981961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Virtual Addresses to Org Customers.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_RLSHP`
--

DROP TABLE IF EXISTS `ORG_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_RLSHP` (
  `ORG_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization Relationship',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `REL_ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization (related Org)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `HRCHY_LVL_NUM` decimal(5,0) DEFAULT NULL COMMENT 'The level within the hierarchy',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`ORG_RLSHP_KEY`),
  UNIQUE KEY `AK_ORG_RLSHP` (`ORG_KEY`,`REL_ORG_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_ORG__ORG_RLSHP_01` (`REL_ORG_KEY`),
  KEY `REF_REF_VAL__ORG_RLSHP_01` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__ORG_RLSHP_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__ORG_RLSHP_03` (`STAT_RKEY`),
  KEY `REF_REF_VAL__ORG_RLSHP_04` (`STAT_REASN_RKEY`),
  KEY `REF_SOURCE__ORG_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__ORG_RLSHP_01` FOREIGN KEY (`REL_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_ORG__ORG_RLSHP_02` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_REF_VAL__ORG_RLSHP_01` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_RLSHP_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_RLSHP_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__ORG_RLSHP_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__ORG_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Relates Organizations to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT` (
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `ORG_KEY` int NOT NULL COMMENT 'The EDS primary key for Organization',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `CONF_IND` tinyint(1) NOT NULL COMMENT 'Indicates this Patient prefers confidentiality',
  `CONF_REASN_RKEY` int DEFAULT NULL COMMENT 'The Confidential Reason (Reference Value)',
  `CONF_QUES_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'The text for the confidential question',
  `CONF_ANSWER_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'The answer text for the confidential question',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` int DEFAULT NULL COMMENT 'The preferred Address Type for tor the Patient (Reference Value)',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Patient',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_KEY`),
  UNIQUE KEY `AK_PATIENT` (`ORG_KEY`,`PERS_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PERS__PATIENT` (`PERS_KEY`),
  KEY `REF_REF_VAL__PATIENT_01` (`CONF_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_02` (`ADDR_TYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_03` (`LANG_RKEY`),
  KEY `REF_REF_VAL__PATIENT_04` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_05` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_06` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_07` (`RLSHP_TYP_RKEY`),
  KEY `REF_SOURCE__PATIENT` (`SOURCE_KEY`),
  CONSTRAINT `REF_ORG__PATIENT` FOREIGN KEY (`ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_PERS__PATIENT` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_01` FOREIGN KEY (`CONF_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_02` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_03` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_05` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_06` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_07` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__PATIENT` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A person receiving medical treatment from an HCO.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_ALT_ID`
--

DROP TABLE IF EXISTS `PATIENT_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_ALT_ID` (
  `PATIENT_ALT_ID_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Alternate Identifier',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `ALT_ID_TYP_RKEY` int NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_ALT_ID_KEY`),
  UNIQUE KEY `AK_PATIENT_ALT_ID` (`PATIENT_KEY`,`ALT_ID_TYP_RKEY`,`ALT_ID_VAL`),
  KEY `REF_REF_VAL__PATIENT_ALT_ID` (`ALT_ID_TYP_RKEY`),
  CONSTRAINT `REF_PATIENT__PATIENT_ALT_ID` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_ALT_ID` FOREIGN KEY (`ALT_ID_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Alternate Identifiers for a Patient.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_CONTACT`
--

DROP TABLE IF EXISTS `PATIENT_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_CONTACT` (
  `PATIENT_CONTACT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Contact',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `PERS_CONTACT_KEY` int NOT NULL COMMENT 'The EDS primary key for Person Contact',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `AUTH_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this Person Contact is authorized',
  `AUTH_DT` date DEFAULT NULL COMMENT 'The date on which the Patient Contact was authorized',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_CONTACT_KEY`),
  UNIQUE KEY `AK_PATIENT_CONTACT` (`PATIENT_KEY`,`PERS_CONTACT_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PERS_CONTACT__PATIENT_CONTACT` (`PERS_CONTACT_KEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_01` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_03` (`LANG_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_04` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_05` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_06` (`SOURCE_KEY`),
  CONSTRAINT `REF_PATIENT__PATIENT_CONTACT` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_PERS_CONTACT__PATIENT_CONTACT` FOREIGN KEY (`PERS_CONTACT_KEY`) REFERENCES `PERS_CONTACT` (`PERS_CONTACT_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_01` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_03` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_05` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_06` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Relates Patients to Patient Contacts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_CONTACT_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_CONTACT_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_CONTACT_POSTAL_ADDR` (
  `PATIENT_CONTACT_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Contact Postal Address',
  `PATIENT_CONTACT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient Contact',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `ID_CARD_DISPL_IND` tinyint(1) NOT NULL COMMENT 'Indicates this address should be used for Identification Cards',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `SEASON_START_MTH_RKEY` int DEFAULT NULL COMMENT 'The season start month for this record (Reference Value)',
  `SEASON_END_MTH_RKEY` int DEFAULT NULL COMMENT 'The season end month for this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_CONTACT_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_CONTACT_POSTAL_ADDR` (`PATIENT_CONTACT_KEY`,`POSTAL_ADDR_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_POSTAL_ADDR__PATIENT_CONTACT_POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_03` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_04` (`SEASON_START_MTH_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_05` (`SEASON_END_MTH_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_06` (`ADDR_VALID_OVRD_REASN_RKEY`),
  CONSTRAINT `REF_PATIENT_CONTACT__PATIENT_CONTACT_POSTAL_ADDR` FOREIGN KEY (`PATIENT_CONTACT_KEY`) REFERENCES `PATIENT_CONTACT` (`PATIENT_CONTACT_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__PATIENT_CONTACT_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_03` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_04` FOREIGN KEY (`SEASON_START_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_05` FOREIGN KEY (`SEASON_END_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_POSTAL_ADDR_06` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Postal Addresses to Patient Contacts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_CONTACT_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_CONTACT_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_CONTACT_VIRTUAL_ADDR` (
  `PATIENT_CONTACT_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Contact Virtual Address',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `PATIENT_CONTACT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient Contact',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_CONTACT_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_CONTACT_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`,`PATIENT_CONTACT_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PATIENT_CONTACT__PATIENT_CONTACT_VIRTUAL_ADDR` (`PATIENT_CONTACT_KEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_03` (`ADDR_USAGE_TYP_RKEY`),
  CONSTRAINT `REF_PATIENT_CONTACT__PATIENT_CONTACT_VIRTUAL_ADDR` FOREIGN KEY (`PATIENT_CONTACT_KEY`) REFERENCES `PATIENT_CONTACT` (`PATIENT_CONTACT_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_CONTACT_VIRTUAL_ADDR_03` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__PATIENT_CONTACT_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Virtual Addresses to Patient Contacts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_POSTAL_ADDR` (
  `PATIENT_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Postal Address',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ID_CARD_DISPL_IND` tinyint(1) NOT NULL COMMENT 'Indicates this address should be used for Identification Cards',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `SEASON_START_MTH_RKEY` int DEFAULT NULL COMMENT 'The season start month for this record (Reference Value)',
  `SEASON_END_MTH_RKEY` int DEFAULT NULL COMMENT 'The season end month for this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_POSTAL_ADDR` (`POSTAL_ADDR_KEY`,`PATIENT_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PATIENT__PATIENT_POSTAL_ADDR` (`PATIENT_KEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_03` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_04` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_05` (`SEASON_START_MTH_RKEY`),
  KEY `REF_REF_VAL__PATIENT_POSTAL_ADDR_06` (`SEASON_END_MTH_RKEY`),
  CONSTRAINT `REF_PATIENT__PATIENT_POSTAL_ADDR` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__PATIENT_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_03` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_04` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_05` FOREIGN KEY (`SEASON_START_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_POSTAL_ADDR_06` FOREIGN KEY (`SEASON_END_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Postal Addresses to Patients.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_VIRTUAL_ADDR` (
  `PATIENT_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Virtual Address',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PATIENT_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`,`PATIENT_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PATIENT__PATIENT_VIRTUAL_ADDR` (`PATIENT_KEY`),
  KEY `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_03` (`ADDR_USAGE_TYP_RKEY`),
  CONSTRAINT `REF_PATIENT__PATIENT_VIRTUAL_ADDR` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PATIENT_VIRTUAL_ADDR_03` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__PATIENT_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Virtual Addresses to Patients.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS`
--

DROP TABLE IF EXISTS `PERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS` (
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `FIRST_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The first name of the Person, in all capital letters',
  `LAST_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The last name of the Person, in all capital letters',
  `MIDDLE_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The middle name of the Person, in all capital letters',
  `PERS_PREF_NM` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Person''s preferred full name in all capital letters',
  `CASE_EXCPTN_FIRST_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Person first name, expressed with proper case',
  `CASE_EXCPTN_LAST_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Person last name, expressed with proper case',
  `CASE_EXCPTN_MIDDLE_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Person middle name, expressed with proper case',
  `CASE_EXCPTN_PERS_PREF_NM` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The Person''s preferred full name, expressed with proper case',
  `NAME_PREFIX_RKEY` int DEFAULT NULL COMMENT 'The name prefix (Reference Value)',
  `NAME_SUFFIX_RKEY` int DEFAULT NULL COMMENT 'The name suffix (Reference Value)',
  `PROF_SUFFIX_RKEY` int DEFAULT NULL COMMENT 'The Professional Suffix (Reference Value)',
  `BIRTH_DT` date DEFAULT NULL COMMENT 'Date of birth',
  `DECEASED_DT` date DEFAULT NULL COMMENT 'Date of death',
  `DECEASED_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this Person is deceased',
  `GENDER_RKEY` int DEFAULT NULL COMMENT 'The Gender of the Person (Reference Value)',
  `OTHER_GENDER_VAL` varchar(20) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'If the Person wishes a Gender that is not defined in our standard Gender codeset',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` int DEFAULT NULL COMMENT 'The preferred Address Type for tor the Person (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_KEY`),
  UNIQUE KEY `AK_PERS` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__PERS_01` (`ADDR_TYP_RKEY`),
  KEY `REF_REF_VAL__PERS_02` (`LANG_RKEY`),
  KEY `REF_REF_VAL__PERS_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PERS_04` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PERS_05` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PERS_06` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__PERS_07` (`PROF_SUFFIX_RKEY`),
  KEY `REF_REF_VAL__PERS_08` (`NAME_SUFFIX_RKEY`),
  KEY `REF_REF_VAL__PERS_09` (`NAME_PREFIX_RKEY`),
  KEY `REF_REF_VAL__PERS_10` (`GENDER_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_01` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_02` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_05` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_06` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_07` FOREIGN KEY (`PROF_SUFFIX_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_08` FOREIGN KEY (`NAME_SUFFIX_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_09` FOREIGN KEY (`NAME_PREFIX_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_10` FOREIGN KEY (`GENDER_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__PERS` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A sentient human being of the species homo sapien.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_ALT_ID`
--

DROP TABLE IF EXISTS `PERS_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_ALT_ID` (
  `PERS_ALT_ID_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person Alternate Identifier',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `ALT_ID_TYP_RKEY` int NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `ORIGIN_ORG_KEY` int DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `REFUSED_NATL_ID_VAL_IND` tinyint(1) NOT NULL COMMENT 'Indicates this Person refused to submit an identifier for their nation',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_ALT_ID_KEY`),
  UNIQUE KEY `AK_PERS_ALT_ID` (`PERS_KEY`,`ALT_ID_TYP_RKEY`,`ALT_ID_VAL`),
  KEY `REF_ORG__PERS_ALT_ID` (`ORIGIN_ORG_KEY`),
  KEY `REF_REF_VAL__PERS_ALT_ID` (`ALT_ID_TYP_RKEY`),
  CONSTRAINT `REF_ORG__PERS_ALT_ID` FOREIGN KEY (`ORIGIN_ORG_KEY`) REFERENCES `ORG` (`ORG_KEY`),
  CONSTRAINT `REF_PERS__PERS_ALT_ID` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_ALT_ID` FOREIGN KEY (`ALT_ID_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Alternate Identifiers for a Person.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_CONTACT`
--

DROP TABLE IF EXISTS `PERS_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_CONTACT` (
  `PERS_CONTACT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person Contact',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `REL_PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person (related Person)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `LANG_RKEY` int NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `AUTH_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this Person is authorized',
  `AUTH_DT` date DEFAULT NULL COMMENT 'The date on which the Person Contact was authorized',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_CONTACT_KEY`),
  UNIQUE KEY `AK_PERS_CONTACT` (`PERS_KEY`,`REL_PERS_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PERS__PERS_CONTACT_02` (`REL_PERS_KEY`),
  KEY `REF_REF_VAL__PERS_CONTACT_01` (`LANG_RKEY`),
  KEY `REF_REF_VAL__PERS_CONTACT_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PERS_CONTACT_03` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PERS_CONTACT_04` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PERS_CONTACT_05` (`RLSHP_TYP_RKEY`),
  KEY `REF_SOURCE__PERS_CONTACT` (`SOURCE_KEY`),
  CONSTRAINT `REF_PERS__PERS_CONTACT_01` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_PERS__PERS_CONTACT_02` FOREIGN KEY (`REL_PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_CONTACT_01` FOREIGN KEY (`LANG_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_CONTACT_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_CONTACT_03` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_CONTACT_04` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_CONTACT_05` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__PERS_CONTACT` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Relates Persons to designated Contact Persons.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_DEGREE`
--

DROP TABLE IF EXISTS `PERS_DEGREE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_DEGREE` (
  `PERS_DEGREE_KEY` int NOT NULL COMMENT 'The EDS primary key for Person Degree',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `DEGREE_RKEY` int NOT NULL COMMENT 'The scholarly Degree (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_DEGREE_KEY`),
  UNIQUE KEY `AK_PERS_DEGREE` (`PERS_KEY`,`DEGREE_RKEY`),
  KEY `REF_REF_VAL__PERS_DEGREE` (`DEGREE_RKEY`),
  CONSTRAINT `REF_PERS__PERS_DEGREE` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_DEGREE` FOREIGN KEY (`DEGREE_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Persons to Degrees.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `PERS_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_POSTAL_ADDR` (
  `PERS_POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Person Postal Address',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ADDR_VALID_OVRD_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` int DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `SEASON_START_MTH_RKEY` int DEFAULT NULL COMMENT 'The season start month for this record (Reference Value)',
  `SEASON_END_MTH_RKEY` int DEFAULT NULL COMMENT 'The season end month for this record (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_PERS_POSTAL_ADDR` (`PERS_KEY`,`POSTAL_ADDR_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_POSTAL_ADDR__PERS_POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  KEY `REF_REF_VAL__PERS_POSTAL_ADDR_01` (`SEASON_END_MTH_RKEY`),
  KEY `REF_REF_VAL__PERS_POSTAL_ADDR_02` (`SEASON_START_MTH_RKEY`),
  KEY `REF_REF_VAL__PERS_POSTAL_ADDR_03` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_REF_VAL__PERS_POSTAL_ADDR_04` (`ADDR_VALID_OVRD_REASN_RKEY`),
  CONSTRAINT `REF_PERS__PERS_POSTAL_ADDR` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__PERS_POSTAL_ADDR` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_POSTAL_ADDR_01` FOREIGN KEY (`SEASON_END_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_POSTAL_ADDR_02` FOREIGN KEY (`SEASON_START_MTH_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_POSTAL_ADDR_03` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_POSTAL_ADDR_04` FOREIGN KEY (`ADDR_VALID_OVRD_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Postal Addresses to Persons.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_RLSHP`
--

DROP TABLE IF EXISTS `PERS_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_RLSHP` (
  `PERS_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Person Relationship',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `REL_PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person (related Person)',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_RLSHP_KEY`),
  UNIQUE KEY `AK_PERS_RLSHP` (`PERS_KEY`,`REL_PERS_KEY`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_PERS__PERS_RLSHP_01` (`REL_PERS_KEY`),
  KEY `REF_REF_VAL__PERS_RLSHP_01` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PERS_RLSHP_02` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__PERS_RLSHP_03` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PERS_RLSHP_04` (`STAT_RKEY`),
  CONSTRAINT `REF_PERS__PERS_RLSHP_01` FOREIGN KEY (`REL_PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_PERS__PERS_RLSHP_02` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_RLSHP_01` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_RLSHP_02` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_RLSHP_03` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PERS_RLSHP_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Relates Persons to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `PERS_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_VIRTUAL_ADDR` (
  `PERS_VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Person Virtual Address',
  `PERS_KEY` int NOT NULL COMMENT 'The EDS primary key for Person',
  `VIRTUAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `ADDR_USAGE_TYP_RKEY` int NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND` tinyint(1) NOT NULL COMMENT 'Indicates the preferred record',
  `DO_NOT_USE_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address should not be used',
  `ACCEPT_VOICE_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PERS_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_PERS_VIRTUAL_ADDR` (`PERS_KEY`,`VIRTUAL_ADDR_KEY`,`ADDR_USAGE_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_REF_VAL__PERS_VIRTUAL_ADDR` (`ADDR_USAGE_TYP_RKEY`),
  KEY `REF_VIRTUAL_ADDR__PERS_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`),
  CONSTRAINT `REF_PERS__PERS_VIRTUAL_ADDR` FOREIGN KEY (`PERS_KEY`) REFERENCES `PERS` (`PERS_KEY`),
  CONSTRAINT `REF_REF_VAL__PERS_VIRTUAL_ADDR` FOREIGN KEY (`ADDR_USAGE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_VIRTUAL_ADDR__PERS_VIRTUAL_ADDR` FOREIGN KEY (`VIRTUAL_ADDR_KEY`) REFERENCES `VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Virtual Addresses to Persons.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PLACE`
--

DROP TABLE IF EXISTS `PLACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLACE` (
  `PLACE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PLACE_SHORT_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The short name for the Place',
  `PLACE_LONG_NM` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The long name for the Place',
  `SHAPE_TYP_RKEY` int NOT NULL COMMENT 'The place shape - polygon, point, or line (Reference Value)',
  `CENTROID_LAT_VAL` decimal(9,6) NOT NULL COMMENT 'Geographic latitude of the centroid of the Place, expressed in +/- decimal format',
  `CENTROID_LON_VAL` decimal(9,6) NOT NULL COMMENT 'Geographic longitude of the centroid of the Place, expressed in +/- decimal format',
  `CENTROID_ALT_VAL` decimal(7,1) DEFAULT NULL COMMENT 'Geographic altitude of the centroid of the Place, expressed in +/- decimal format',
  `MOBILE_IND` tinyint(1) NOT NULL COMMENT 'Indicates this Place is not fixed and may move (e.g. Truck bed, Ambulance, Shipping Container)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PLACE_KEY`),
  UNIQUE KEY `AK_PLACE` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`),
  KEY `IX_PLACE_01` (`PLACE_LONG_NM`),
  KEY `REF_REF_VAL__PLACE_01` (`SHAPE_TYP_RKEY`),
  KEY `REF_REF_VAL__PLACE_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PLACE_03` (`CLASS_TYP_RKEY`),
  KEY `REF_REF_VAL__PLACE_04` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PLACE_05` (`CLASS_SUBTYP_RKEY`),
  CONSTRAINT `REF_REF_VAL__PLACE_01` FOREIGN KEY (`SHAPE_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PLACE_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PLACE_03` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PLACE_04` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PLACE_05` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__PLACE` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=42307556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A physical place situated on the earth''s surface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PLACE_TEMP`
--

DROP TABLE IF EXISTS `PLACE_TEMP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLACE_TEMP` (
  `CNTRY_FID` varchar(2) COLLATE utf8mb4_0900_as_cs NOT NULL DEFAULT '',
  `PLACE_SHORT_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The short name for the Place',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `PLACE_KEY` int NOT NULL DEFAULT '0' COMMENT 'The EDS primary key for Place'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `POSTAL_ADDR`
--

DROP TABLE IF EXISTS `POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSTAL_ADDR` (
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ADDR_TYP_RKEY` int NOT NULL COMMENT 'The Type of Address (Reference Value)',
  `GEOCODE_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'A geocode assigned to this Address',
  `LN1_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The first line of the postal address',
  `LN2_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The second line of the postal address',
  `LN3_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The third line of the postal address',
  `LN4_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The fourth line of the postal address',
  `LN5_VAL` varchar(500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The fifth line of the postal address',
  `ATTN_LN_VAL` varchar(1000) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The attention line, if present, on the postal address',
  `RAW_ADDR_PART_1_VAL` varchar(1500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The "raw" address information for the Street portion of the postal address',
  `RAW_ADDR_PART_2_VAL` varchar(1500) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The "raw" address information for the City/State/Zip portion of the postal address',
  `LAT_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic latitude, expressed in +/- decimal format',
  `LON_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic longitude, expressed in +/- decimal format',
  `ALT_VAL` decimal(7,1) DEFAULT NULL COMMENT 'Geographic altitude, expressed in +/- decimal format',
  `CNTRY_PLACE_KEY` int NOT NULL COMMENT 'The Country from the Place Entity',
  `REGION_PLACE_KEY` int NOT NULL COMMENT 'The Region (State/Province) from the Place Entity',
  `COUNTY_PLACE_KEY` int DEFAULT NULL COMMENT 'The County from the Place Entity, if applicable',
  `DISTRICT_PLACE_KEY` int DEFAULT NULL COMMENT 'The District from the Place Entity, if applicable',
  `NEIGHBRHD_PLACE_KEY` int DEFAULT NULL COMMENT 'The Neighborhood from the Place Entity, if applicable',
  `CITY_PLACE_KEY` int NOT NULL COMMENT 'The City from the Place Entity',
  `POSTAL_CD_PLACE_KEY` int NOT NULL COMMENT 'The Postal Code from the Place Entity',
  `TZ_PLACE_KEY` int NOT NULL COMMENT 'The Timezone from the Place Entity',
  `ACCEPT_MAIL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts mail',
  `ACCEPT_PKG_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this address accepts packages',
  `VALID_IND` tinyint(1) NOT NULL COMMENT 'Indicates this address is valid',
  `VALID_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason tied to the Address Validation, if any (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_POSTAL_ADDR` (`SOURCE_ID`,`SOURCE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_01` (`TZ_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_02` (`POSTAL_CD_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_03` (`CNTRY_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_04` (`CITY_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_05` (`REGION_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_06` (`NEIGHBRHD_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_07` (`DISTRICT_PLACE_KEY`),
  KEY `REF_PLACE__POSTAL_ADDR_08` (`COUNTY_PLACE_KEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_03` (`VALID_REASN_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_04` (`ADDR_TYP_RKEY`),
  KEY `REF_SOURCE__POSTAL_ADDR` (`SOURCE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_01` FOREIGN KEY (`TZ_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_02` FOREIGN KEY (`POSTAL_CD_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_03` FOREIGN KEY (`CNTRY_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_04` FOREIGN KEY (`CITY_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_05` FOREIGN KEY (`REGION_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_06` FOREIGN KEY (`NEIGHBRHD_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_07` FOREIGN KEY (`DISTRICT_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_PLACE__POSTAL_ADDR_08` FOREIGN KEY (`COUNTY_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_03` FOREIGN KEY (`VALID_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_04` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__POSTAL_ADDR` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=4250236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A set of values that identify a location for mail delivery.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `POSTAL_ADDR_RLSHP`
--

DROP TABLE IF EXISTS `POSTAL_ADDR_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSTAL_ADDR_RLSHP` (
  `POSTAL_ADDR_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address Relationship',
  `POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `REL_POSTAL_ADDR_KEY` int NOT NULL COMMENT 'The EDS primary key for Postal Address (related Postal Address)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `RLSHP_TYP_RKEY` int NOT NULL COMMENT 'The Relationship Type (Reference Value)',
  `RLSHP_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Relationship Subtype (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`POSTAL_ADDR_RLSHP_KEY`),
  UNIQUE KEY `AK_POSTAL_ADDR_RLSHP` (`POSTAL_ADDR_KEY`,`REL_POSTAL_ADDR_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`RLSHP_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_POSTAL_ADDR__POSTAL_ADDR_RLSHP_01` (`REL_POSTAL_ADDR_KEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_RLSHP_01` (`STAT_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_RLSHP_02` (`RLSHP_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_RLSHP_03` (`RLSHP_TYP_RKEY`),
  KEY `REF_REF_VAL__POSTAL_ADDR_RLSHP_04` (`STAT_REASN_RKEY`),
  KEY `REF_SOURCE__POSTAL_ADDR_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__POSTAL_ADDR_RLSHP_01` FOREIGN KEY (`REL_POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__POSTAL_ADDR_RLSHP_02` FOREIGN KEY (`POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_RLSHP_01` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_RLSHP_02` FOREIGN KEY (`RLSHP_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_RLSHP_03` FOREIGN KEY (`RLSHP_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__POSTAL_ADDR_RLSHP_04` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__POSTAL_ADDR_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Postal Addresses to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC`
--

DROP TABLE IF EXISTS `PROC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC` (
  `PROC_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Procedure',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `CLASS_TYP_RKEY` int NOT NULL COMMENT 'The Entity Classification (Reference Value)',
  `CLASS_SUBTYP_RKEY` int DEFAULT NULL COMMENT 'The Entity Subclassification (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `PATIENT_KEY` int NOT NULL COMMENT 'The EDS primary key for Patient',
  `HCO_FCLTY_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `SALES_REP_EMPL_KEY` int NOT NULL COMMENT 'The Employee Sales Rep associated with the Procedure.',
  `EFF_START_TS` timestamp NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` timestamp NULL DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `EST_START_DT_IND` tinyint(1) NOT NULL COMMENT 'Indicates the Start Datetime was estimated and is not the actual date',
  `OUTSIDE_US_IND` tinyint(1) NOT NULL COMMENT 'Indicates the Procedure occured outside of the United States',
  `COMMENT_TXT` text COLLATE utf8mb4_0900_as_cs COMMENT 'General comments related to the Procedure',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PROC_KEY`),
  UNIQUE KEY `AK_PROC` (`SOURCE_KEY`,`SOURCE_ID`,`CLASS_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_EMPL__PROC` (`SALES_REP_EMPL_KEY`),
  KEY `REF_HCO_FCLTY__PROC` (`HCO_FCLTY_KEY`),
  KEY `REF_PATIENT__PROC` (`PATIENT_KEY`),
  KEY `REF_REF_VAL__PROC_01` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__PROC_02` (`STAT_RKEY`),
  KEY `REF_REF_VAL__PROC_03` (`CLASS_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__PROC_04` (`CLASS_TYP_RKEY`),
  CONSTRAINT `REF_EMPL__PROC` FOREIGN KEY (`SALES_REP_EMPL_KEY`) REFERENCES `EMPL` (`EMPL_KEY`),
  CONSTRAINT `REF_HCO_FCLTY__PROC` FOREIGN KEY (`HCO_FCLTY_KEY`) REFERENCES `HCO_FCLTY` (`HCO_FCLTY_KEY`),
  CONSTRAINT `REF_PATIENT__PROC` FOREIGN KEY (`PATIENT_KEY`) REFERENCES `PATIENT` (`PATIENT_KEY`),
  CONSTRAINT `REF_REF_VAL__PROC_01` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PROC_02` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PROC_03` FOREIGN KEY (`CLASS_SUBTYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PROC_04` FOREIGN KEY (`CLASS_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__PROC` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='An act that alters the physical state of a Patient.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_DEVICE_INSTANCE`
--

DROP TABLE IF EXISTS `PROC_DEVICE_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_DEVICE_INSTANCE` (
  `PROC_DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure Device Instance',
  `DEVICE_INSTANCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure',
  `PARTN_TYP_RKEY` int NOT NULL COMMENT 'The Participation Type for this record (Reference Value)',
  `PARTN_FUNC_RKEY` int DEFAULT NULL COMMENT 'The Participation Function for this record (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PROC_DEVICE_INSTANCE_KEY`),
  UNIQUE KEY `AK_PROC_DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`,`PROC_KEY`,`PARTN_TYP_RKEY`),
  KEY `REF_PROC__PROC_DEVICE_INSTANCE` (`PROC_KEY`),
  KEY `REF_REF_VAL__PROC_DEVICE_INSTANCE_01` (`PARTN_FUNC_RKEY`),
  KEY `REF_REF_VAL__PROC_DEVICE_INSTANCE_02` (`PARTN_TYP_RKEY`),
  CONSTRAINT `REF_DEVICE_INSTANCE__PROC_DEVICE_INSTANCE` FOREIGN KEY (`DEVICE_INSTANCE_KEY`) REFERENCES `DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`),
  CONSTRAINT `REF_PROC__PROC_DEVICE_INSTANCE` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`),
  CONSTRAINT `REF_REF_VAL__PROC_DEVICE_INSTANCE_01` FOREIGN KEY (`PARTN_FUNC_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PROC_DEVICE_INSTANCE_02` FOREIGN KEY (`PARTN_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='An instance of a Device participating in a Procedure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_HCP`
--

DROP TABLE IF EXISTS `PROC_HCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_HCP` (
  `PROC_HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure Healthcare Professional (HCP)',
  `HCP_KEY` int NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure',
  `PARTN_TYP_RKEY` int NOT NULL COMMENT 'The Participation Type for this record (Reference Value)',
  `PARTN_FUNC_RKEY` int DEFAULT NULL COMMENT 'The Participation Function for this record (Reference Value)',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PROC_HCP_KEY`),
  UNIQUE KEY `AK_PROC_HCP` (`HCP_KEY`,`PROC_KEY`,`PARTN_TYP_RKEY`),
  KEY `REF_PROC__PROC_HCP` (`PROC_KEY`),
  KEY `REF_REF_VAL__PROC_HCP_01` (`PARTN_FUNC_RKEY`),
  KEY `REF_REF_VAL__PROC_HCP_02` (`PARTN_TYP_RKEY`),
  CONSTRAINT `REF_HCP__PROC_HCP` FOREIGN KEY (`HCP_KEY`) REFERENCES `HCP` (`HCP_KEY`),
  CONSTRAINT `REF_PROC__PROC_HCP` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`),
  CONSTRAINT `REF_REF_VAL__PROC_HCP_01` FOREIGN KEY (`PARTN_FUNC_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__PROC_HCP_02` FOREIGN KEY (`PARTN_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='An instance of a HCP participating in a Procedure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_INDICATION`
--

DROP TABLE IF EXISTS `PROC_INDICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_INDICATION` (
  `PROC_INDICATION_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure Indication',
  `INDICATION_RKEY` int NOT NULL COMMENT 'The Indication or Diagnosis (Reference Value)',
  `PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PROC_INDICATION_KEY`),
  UNIQUE KEY `AK_PROC_INDICATION` (`INDICATION_RKEY`,`PROC_KEY`),
  KEY `REF_PROC__PROC_INDICATION` (`PROC_KEY`),
  CONSTRAINT `REF_PROC__PROC_INDICATION` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`),
  CONSTRAINT `REF_REF_VAL__PROC_INDICATION` FOREIGN KEY (`INDICATION_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='Associates Indications to Procedures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_RLSHP`
--

DROP TABLE IF EXISTS `PROC_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_RLSHP` (
  `PROC_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure Relationship',
  `PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure',
  `REL_PROC_KEY` int NOT NULL COMMENT 'The EDS primary key for Procedure (Related Procedure)',
  `SEQ_NUM` decimal(5,0) DEFAULT NULL COMMENT 'Allows for the sequencing of Procedures',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`PROC_RLSHP_KEY`),
  UNIQUE KEY `AK_PROC_RLSHP` (`PROC_KEY`,`REL_PROC_KEY`),
  KEY `REF_PROC__PROC_RLSHP_01` (`REL_PROC_KEY`),
  CONSTRAINT `REF_PROC__PROC_RLSHP_01` FOREIGN KEY (`REL_PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`),
  CONSTRAINT `REF_PROC__PROC_RLSHP_02` FOREIGN KEY (`PROC_KEY`) REFERENCES `PROC` (`PROC_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship of Procedures to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL`
--

DROP TABLE IF EXISTS `REF_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL` (
  `REF_VAL_RKEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REF_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The reference value or code value',
  `REF_VAL_SHORT_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'A short name for the reference value or code value',
  `REF_VAL_MEDIUM_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'A medium name for the reference value or code value',
  `REF_VAL_LONG_NM` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'A long name for the reference value or code value',
  `REF_VAL_DESC` varchar(1000) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reference value or code value description',
  `REF_VAL_SET_IND` tinyint(1) NOT NULL COMMENT 'Indicates if this record represents a Reference Value Set. If False, this record represents a member of a Reference Value Set.',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`REF_VAL_RKEY`),
  UNIQUE KEY `AK_REF_VAL` (`SOURCE_ID`,`REF_VAL`,`SOURCE_KEY`),
  KEY `REF_SOURCE__REF_VAL` (`SOURCE_KEY`),
  CONSTRAINT `REF_SOURCE__REF_VAL` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A simple lookup value.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL_RLSHP`
--

DROP TABLE IF EXISTS `REF_VAL_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL_RLSHP` (
  `REF_VAL_RLSHP_KEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship',
  `REF_VAL_RKEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value',
  `REL_REF_VAL_RKEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value (Related Reference Value)',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REF_HRCHY_KEY` int DEFAULT NULL COMMENT 'The EDS primary key for Reference Hierarchy',
  `REF_VAL_RLSHP_TYP_KEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship Type',
  `HRCHY_LVL_NUM` decimal(5,0) DEFAULT NULL COMMENT 'The level of the hierarchy, if applicable',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`REF_VAL_RLSHP_KEY`),
  UNIQUE KEY `AK_REF_VAL_RLSHP` (`REF_VAL_RKEY`,`REL_REF_VAL_RKEY`,`SOURCE_KEY`,`SOURCE_ID`),
  KEY `REF_REF_HRCHY__REF_VAL_RLSHP` (`REF_HRCHY_KEY`),
  KEY `REF_REF_VAL_RLSHP_TYP__REF_VAL_RLSHP` (`REF_VAL_RLSHP_TYP_KEY`),
  KEY `REF_REF_VAL__REF_VAL_RLSHP_02` (`REL_REF_VAL_RKEY`),
  KEY `REF_SOURCE__REF_VAL_RLSHP` (`SOURCE_KEY`),
  CONSTRAINT `REF_REF_HRCHY__REF_VAL_RLSHP` FOREIGN KEY (`REF_HRCHY_KEY`) REFERENCES `REF_HRCHY` (`REF_HRCHY_KEY`),
  CONSTRAINT `REF_REF_VAL__REF_VAL_RLSHP_01` FOREIGN KEY (`REF_VAL_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__REF_VAL_RLSHP_02` FOREIGN KEY (`REL_REF_VAL_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL_RLSHP_TYP__REF_VAL_RLSHP` FOREIGN KEY (`REF_VAL_RLSHP_TYP_KEY`) REFERENCES `REF_VAL_RLSHP_TYP` (`REF_VAL_RLSHP_TYP_KEY`),
  CONSTRAINT `REF_SOURCE__REF_VAL_RLSHP` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The relationship between Reference Values.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL_RLSHP_TYP`
--

DROP TABLE IF EXISTS `REF_VAL_RLSHP_TYP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL_RLSHP_TYP` (
  `REF_VAL_RLSHP_TYP_KEY` int NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship Type',
  `REF_VAL_RLSHP_TYP_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The name of the Reference Value Relationship Type',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`REF_VAL_RLSHP_TYP_KEY`),
  UNIQUE KEY `AK_REF_VAL_RLSHP_TYP` (`REF_VAL_RLSHP_TYP_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='The type of relationship of Reference Values.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SOURCE`
--

DROP TABLE IF EXISTS `SOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOURCE` (
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `LGCY_SOURCE_KEY` int DEFAULT NULL COMMENT 'The EDS primary key for Source (optional link to Legacy Source)',
  `SOURCE` varchar(10) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The Source system/application/authority providing this record',
  `SOURCE_SHORT_NM` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'A short name for the Source',
  `SOURCE_LONG_NM` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'A long name for the Source',
  `SOURCE_DESC` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The description of the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`SOURCE_KEY`),
  UNIQUE KEY `AK_SOURCE` (`SOURCE`),
  KEY `REF_SOURCE__SOURCE` (`LGCY_SOURCE_KEY`),
  CONSTRAINT `REF_SOURCE__SOURCE` FOREIGN KEY (`LGCY_SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='All Sources of interest to MDT.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VIRTUAL_ADDR` (
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `SOURCE_KEY` int NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `ADDR_TYP_RKEY` int NOT NULL COMMENT 'The Type of Address (Reference Value)',
  `STAT_RKEY` int NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` int DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `VIRTUAL_ADDR_VAL` varchar(100) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `VIRTUAL_ADDR_EXT_VAL` varchar(100) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'An optional extended value for the virtual address (e.g. Phone Extension)',
  `VALID_IND` tinyint(1) NOT NULL COMMENT 'Indicates this address is valid',
  `LAND_LINE_POSTAL_ADDR_KEY` int DEFAULT NULL COMMENT 'The only occurrence of a relationship between Virtual and Postal Addresses would be for land lines physically associated to a Postal Address. Address Usage can be used otherwise ("Home") for "home" cell phone numbers or email addresses, for example. ',
  `CNTRY_PLACE_KEY` int DEFAULT NULL COMMENT 'The Country from the Place Entity',
  `SOURCE_CHG_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` timestamp NULL DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_TS` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_IND` tinyint(1) NOT NULL COMMENT 'Indicates that this row is deleted',
  PRIMARY KEY (`VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_VIRTUAL_ADDR` (`SOURCE_ID`,`SOURCE_KEY`),
  KEY `IX_VIRTUAL_ADDR_01` (`VIRTUAL_ADDR_VAL`),
  KEY `REF_PLACE__VIRTUAL_ADDR` (`CNTRY_PLACE_KEY`),
  KEY `REF_POSTAL_ADDR__VIRTUAL_ADDR` (`LAND_LINE_POSTAL_ADDR_KEY`),
  KEY `REF_REF_VAL__VIRTUAL_ADDR_01` (`STAT_RKEY`),
  KEY `REF_REF_VAL__VIRTUAL_ADDR_02` (`STAT_REASN_RKEY`),
  KEY `REF_REF_VAL__VIRTUAL_ADDR_03` (`ADDR_TYP_RKEY`),
  KEY `REF_SOURCE__VIRTUAL_ADDR` (`SOURCE_KEY`),
  CONSTRAINT `REF_PLACE__VIRTUAL_ADDR` FOREIGN KEY (`CNTRY_PLACE_KEY`) REFERENCES `PLACE` (`PLACE_KEY`),
  CONSTRAINT `REF_POSTAL_ADDR__VIRTUAL_ADDR` FOREIGN KEY (`LAND_LINE_POSTAL_ADDR_KEY`) REFERENCES `POSTAL_ADDR` (`POSTAL_ADDR_KEY`),
  CONSTRAINT `REF_REF_VAL__VIRTUAL_ADDR_01` FOREIGN KEY (`STAT_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__VIRTUAL_ADDR_02` FOREIGN KEY (`STAT_REASN_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_REF_VAL__VIRTUAL_ADDR_03` FOREIGN KEY (`ADDR_TYP_RKEY`) REFERENCES `REF_VAL` (`REF_VAL_RKEY`),
  CONSTRAINT `REF_SOURCE__VIRTUAL_ADDR` FOREIGN KEY (`SOURCE_KEY`) REFERENCES `SOURCE` (`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=3981961 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_as_cs COMMENT='A string of alphanumeric values used for communication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `V_REFERENCE_VALUES`
--

DROP TABLE IF EXISTS `V_REFERENCE_VALUES`;
/*!50001 DROP VIEW IF EXISTS `V_REFERENCE_VALUES`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `V_REFERENCE_VALUES` AS SELECT 
 1 AS `SOURCE_KEY`,
 1 AS `SOURCE`,
 1 AS `REF_SET_VAL`,
 1 AS `REF_SET_DESC`,
 1 AS `REF_VAL`,
 1 AS `REF_VAL_RKEY`,
 1 AS `REF_VAL_DESC`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `V_REFERENCE_VALUES`
--

/*!50001 DROP VIEW IF EXISTS `V_REFERENCE_VALUES`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`super_user_1`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `V_REFERENCE_VALUES` AS select `s`.`SOURCE_KEY` AS `SOURCE_KEY`,`s`.`SOURCE` AS `SOURCE`,`parent_rv`.`REF_VAL` AS `REF_SET_VAL`,`parent_rv`.`REF_VAL_DESC` AS `REF_SET_DESC`,`child_rv`.`REF_VAL` AS `REF_VAL`,`child_rv`.`REF_VAL_RKEY` AS `REF_VAL_RKEY`,`child_rv`.`REF_VAL_DESC` AS `REF_VAL_DESC` from (((((`REF_VAL` `child_rv` join `SOURCE` `s` on((`child_rv`.`SOURCE_KEY` = `s`.`SOURCE_KEY`))) left join `REF_VAL_RLSHP` `rvr` on((`rvr`.`REF_VAL_RKEY` = `child_rv`.`REF_VAL_RKEY`))) left join `SOURCE` `s2` on((`rvr`.`SOURCE_KEY` = `s2`.`SOURCE_KEY`))) left join `REF_VAL_RLSHP_TYP` `rvrt` on((`rvr`.`REF_VAL_RLSHP_TYP_KEY` = `rvrt`.`REF_VAL_RLSHP_TYP_KEY`))) left join `REF_VAL` `parent_rv` on((`rvr`.`REL_REF_VAL_RKEY` = `parent_rv`.`REF_VAL_RKEY`))) order by `s`.`SOURCE_KEY`,`s`.`SOURCE`,`parent_rv`.`REF_VAL`,`parent_rv`.`REF_VAL_DESC` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-06 13:57:17
