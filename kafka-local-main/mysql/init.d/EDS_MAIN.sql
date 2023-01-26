
CREATE USER IF NOT EXISTS 'super_user_1' IDENTIFIED BY 'super_user_1_password';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'super_user_1';

CREATE DATABASE EDS;
GRANT ALL PRIVILEGES ON EDS.* TO 'mysqluser'@'%';
GRANT ALL PRIVILEGES ON EDS.* TO 'super_user_1'@'%';

USE EDS;

-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: 10.51.240.41    Database: EDS2
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ASSIGN_DEVICE_PARAM_VAL`
--

DROP TABLE IF EXISTS `ASSIGN_DEVICE_PARAM_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSIGN_DEVICE_PARAM_VAL` (
  `ASSIGN_DEVICE_PARAM_VAL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Assigned Device Parameter Value',
  `DEVICE_REGIST_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Registration',
  `PARAM_RKEY` binary(16) NOT NULL COMMENT 'The Parameter being set (Reference Value)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STRING_VAL` varchar(250) DEFAULT NULL COMMENT 'The assigned string value for the Parameter',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`ASSIGN_DEVICE_PARAM_VAL_KEY`),
  UNIQUE KEY `AK_ASSIGN_DEVICE_PARAM_VAL` (`DEVICE_REGIST_KEY`,`PARAM_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_STRING_VAL` (`STRING_VAL`),
  KEY `FK_DEVICE_REGIST_KEY` (`DEVICE_REGIST_KEY`),
  KEY `FK_PARAM_RKEY` (`PARAM_RKEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Links Parameter Value assignments to Devices.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUST_ACCT`
--

DROP TABLE IF EXISTS `CUST_ACCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUST_ACCT` (
  `CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `CUST_ACCT_NUM` varchar(50) NOT NULL COMMENT 'Medtronic Customer Account Number',
  `CUST_SHORT_NM` varchar(50) NOT NULL COMMENT 'The Customer''s short name',
  `CUST_LONG_NM` varchar(100) NOT NULL COMMENT 'The Customer''s long name',
  `CUST_ALT_NM` varchar(300) DEFAULT NULL COMMENT 'The Customer''s alternate name (in English)',
  `CUST_PREF_NM` varchar(300) DEFAULT NULL COMMENT 'The Customer''s preferred name',
  `LANG_RKEY` binary(16) NOT NULL COMMENT 'The language associated with this record (Reference Value) ',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`CUST_ACCT_KEY`),
  UNIQUE KEY `AK_CUST_ACCT` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `IX_CUST_ACCT_NUM` (`CUST_ACCT_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A Medtronic customer account.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUST_ACCT_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `CUST_ACCT_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUST_ACCT_POSTAL_ADDR` (
  `CUST_ACCT_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account Postal Address',
  `CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account',
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_VALID_OVRD_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  PRIMARY KEY (`CUST_ACCT_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_CUST_ACCT_POSTAL_ADDR` (`CUST_ACCT_KEY`,`POSTAL_ADDR_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_CUST_ACCT_KEY` (`CUST_ACCT_KEY`),
  KEY `FK_POSTAL_ADDR_KEY` (`POSTAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_IND_RKEY` (`ADDR_VALID_OVRD_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_REASN_RKEY` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Postal Addresses to Customer Accounts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUST_ACCT_RLSHP`
--

DROP TABLE IF EXISTS `CUST_ACCT_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUST_ACCT_RLSHP` (
  `CUST_ACCT_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account Relationship',
  `CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account',
  `REL_CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account (related Customer Account)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`CUST_ACCT_RLSHP_KEY`),
  UNIQUE KEY `AK_CUST_ACCT_RLSHP` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_CUST_ACCT_KEY` (`CUST_ACCT_KEY`),
  KEY `FK_REL_CUST_ACCT_KEY` (`REL_CUST_ACCT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relates Customer Accounts to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CUST_ACCT_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `CUST_ACCT_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUST_ACCT_VIRTUAL_ADDR` (
  `CUST_ACCT_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account Virtual Address',
  `CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account',
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ACCEPT_VOICE_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`CUST_ACCT_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_CUST_ACCT_VIRTUAL_ADDR` (`CUST_ACCT_KEY`,`VIRTUAL_ADDR_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_CUST_ACCT_KEY` (`CUST_ACCT_KEY`),
  KEY `FK_VIRTUAL_ADDR_KEY` (`VIRTUAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ACCEPT_VOICE_MSG_IND_RKEY` (`ACCEPT_VOICE_MSG_IND_RKEY`),
  KEY `FK_ACCEPT_TXT_MSG_IND_RKEY` (`ACCEPT_TXT_MSG_IND_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Virtual Addresses to Customer Accounts.';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `DEVICE_INSTANCE`
--

DROP TABLE IF EXISTS `DEVICE_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_INSTANCE` (
  `DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PROD_MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material (Parent Product)',
  `DEVICE_MFG_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Device Manufacturer (Organization)',
  `LOT_SERIAL_NUM` varchar(100) DEFAULT NULL COMMENT 'Lot number or serial number (one or the other)',
  `UNK_SERIAL_NUM_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates if the serial number is unknown',
  `MFG_DT` date DEFAULT NULL COMMENT 'The date of manufacture',
  `USE_BEFORE_DT` date DEFAULT NULL COMMENT 'The date before which the Device must be used',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`DEVICE_INSTANCE_KEY`),
  UNIQUE KEY `AK_DEVICE_INSTANCE` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_LOT_SERIAL_NUM` (`LOT_SERIAL_NUM`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ENT_KEY` (`ENT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_PROD_MATL_KEY` (`PROD_MATL_KEY`),
  KEY `FK_DEVICE_MFG_ORG_KEY` (`DEVICE_MFG_ORG_KEY`),
  KEY `FK_UNK_SERIAL_NUM_IND_RKEY` (`UNK_SERIAL_NUM_IND_RKEY`),
  KEY `FK_MDM_GOV_STAT_RKEY` (`MDM_GOV_STAT_RKEY`),
  KEY `IX_USE_BEFORE_DT` (`USE_BEFORE_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The instance of a Device in the real world.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_INSTANCE_RLSHP`
--

DROP TABLE IF EXISTS `DEVICE_INSTANCE_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_INSTANCE_RLSHP` (
  `DEVICE_INSTANCE_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Relationship',
  `DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `REL_DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance (related Device Instance)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `INIT_ACTVY_DT` date NOT NULL COMMENT 'The initial date of activity for the Device',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`DEVICE_INSTANCE_RLSHP_KEY`),
  UNIQUE KEY `AK_DEVICE_INSTANCE_RLSHP` (`DEVICE_INSTANCE_KEY`,`REL_DEVICE_INSTANCE_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_DEVICE_INSTANCE_KEY` (`DEVICE_INSTANCE_KEY`),
  KEY `FK_REL_DEVICE_INSTANCE_KEY` (`REL_DEVICE_INSTANCE_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship of Devices to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEVICE_REGIST`
--

DROP TABLE IF EXISTS `DEVICE_REGIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEVICE_REGIST` (
  `DEVICE_REGIST_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Registration',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `PATIENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Patient',
  `DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `FOLLOWUP_HCP_KEY` binary(16) DEFAULT NULL COMMENT 'The designated Followup Healthcare Professional',
  `FOLLOWUP_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The designated Followup Healthcare Organization',
  `DEVICE_DISP_RKEY` binary(16) DEFAULT NULL COMMENT 'The Device Disposition (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`DEVICE_REGIST_KEY`),
  UNIQUE KEY `AK_DEVICE_REGIST` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_DEVICE_INSTANCE_KEY` (`DEVICE_INSTANCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_FOLLOWUP_HCP_KEY` (`FOLLOWUP_HCP_KEY`),
  KEY `FK_FOLLOWUP_ORG_KEY` (`FOLLOWUP_ORG_KEY`),
  KEY `FK_DEVICE_DISP_RKEY` (`DEVICE_DISP_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The current Registration for a Device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMPL`
--

DROP TABLE IF EXISTS `EMPL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPL` (
  `EMPL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Employee',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `TITLE_NM` varchar(50) NOT NULL COMMENT 'The Title for the Employee, if applicable',
  `LANG_RKEY` binary(16) NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`EMPL_KEY`),
  UNIQUE KEY `AK_EMPL` (`PERS_KEY`,`ORG_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ENT_KEY` (`ENT_KEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `FK_MDM_GOV_STAT_RKEY` (`MDM_GOV_STAT_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Persons employed by an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY`
--

DROP TABLE IF EXISTS `HCO_FCLTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY` (
  `HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `PLACE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `HCO_FCLTY_NM` varchar(100) NOT NULL COMMENT 'The name of the HCO Facility',
  `HCO_FCLTY_PREF_NM` varchar(300) DEFAULT NULL COMMENT 'The preferred name of the HCO Facility',
  `LANG_RKEY` binary(16) NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The preferred Address Type for tor the HCO Facility (Reference Value)',
  `CUST_ACCT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Customer Account',
  `COMMENT_TXT` text COMMENT 'General comments related to the Healthcare Organization Facility',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY` (`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`,`ORG_KEY`,`PLACE_KEY`,`SOURCE_KEY`),
  KEY `IX_HCO_FCLTY_NM` (`HCO_FCLTY_NM`),
  KEY `IX_HCO_FCLTY_PREF_NM` (`HCO_FCLTY_PREF_NM`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_PLACE_KEY` (`PLACE_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`),
  KEY `FK_CUST_ACCT_KEY` (`CUST_ACCT_KEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A Place that is formally or semi-formally related to an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `HCO_FCLTY_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_POSTAL_ADDR` (
  `HCO_FCLTY_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization Facility Postal Address',
  `HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_VALID_OVRD_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_POSTAL_ADDR` (`HCO_FCLTY_KEY`,`POSTAL_ADDR_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCO_FCLTY_KEY` (`HCO_FCLTY_KEY`),
  KEY `FK_POSTAL_ADDR_KEY` (`POSTAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_IND_RKEY` (`ADDR_VALID_OVRD_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_REASN_RKEY` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCO Facilities to Postal Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_RLSHP`
--

DROP TABLE IF EXISTS `HCO_FCLTY_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_RLSHP` (
  `HCO_FCLTY_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization Relationship',
  `HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `REL_HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility (related Facility)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_RLSHP_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_RLSHP` (`HCO_FCLTY_KEY`,`REL_HCO_FCLTY_KEY`,`REC_TYP_RKEY`,`EFF_START_TS`,`SOURCE_KEY`,`SOURCE_ID`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCO_FCLTY_KEY` (`HCO_FCLTY_KEY`),
  KEY `FK_REL_HCO_FCLTY_KEY` (`REL_HCO_FCLTY_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relates HCO Facilities to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_FCLTY_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `HCO_FCLTY_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_FCLTY_VIRTUAL_ADDR` (
  `HCO_FCLTY_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Facility Virtual Address',
  `HCO_FCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ACCEPT_VOICE_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCO_FCLTY_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCO_FCLTY_VIRTUAL_ADDR` (`HCO_FCLTY_KEY`,`VIRTUAL_ADDR_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCO_FCLTY_KEY` (`HCO_FCLTY_KEY`),
  KEY `FK_VIRTUAL_ADDR_KEY` (`VIRTUAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ACCEPT_VOICE_MSG_IND_RKEY` (`ACCEPT_VOICE_MSG_IND_RKEY`),
  KEY `FK_ACCEPT_TXT_MSG_IND_RKEY` (`ACCEPT_TXT_MSG_IND_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCO Facilities to Virtual Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCO_SPCLTY`
--

DROP TABLE IF EXISTS `HCO_SPCLTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCO_SPCLTY` (
  `HCO_SPCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Organization Specialty',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `SPCLTY_RKEY` binary(16) NOT NULL COMMENT 'The Specialty for this HCO (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCO_SPCLTY_KEY`),
  UNIQUE KEY `AK_HCO_SPCLTY` (`ORG_KEY`,`SPCLTY_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_SPCLTY_RKEY` (`SPCLTY_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCOs to Specialties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP`
--

DROP TABLE IF EXISTS `HCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP` (
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `NO_PROC_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Healthcare Professional must not be associated to Procedures',
  `NO_FOLLOWUP_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Healthcare Professional must not be associated to Followup',
  `PRIM_LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The primary Language for the HCP (Reference Value)',
  `SEC_LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The secondary Language for this record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The preferred Address Type for tor the HCP (Reference Value)',
  `ORIGIN_NATION_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The Nation that originated this Healthcare Professional record (Organization)',
  `HCP_ORIG_RKEY` binary(16) DEFAULT NULL COMMENT 'The party which originated this Healthcare Professional record (Reference Value)',
  `COMMENT_TXT` text COMMENT 'General comments related to the Healthcare Professional',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`HCP_KEY`),
  UNIQUE KEY `AK_HCP` (`ORG_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ENT_KEY` (`ENT_KEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_STAT_REASN_RKEY` (`STAT_REASN_RKEY`),
  KEY `FK_NO_PROC_IND_RKEY` (`NO_PROC_IND_RKEY`),
  KEY `FK_NO_FOLLOWUP_IND_RKEY` (`NO_FOLLOWUP_IND_RKEY`),
  KEY `FK_PRIM_LANG_RKEY` (`PRIM_LANG_RKEY`),
  KEY `FK_SEC_LANG_RKEY` (`SEC_LANG_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`),
  KEY `FK_ORIGIN_NATION_ORG_KEY` (`ORIGIN_NATION_ORG_KEY`),
  KEY `FK_HCP_ORIG_RKEY` (`HCP_ORIG_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `FK_MDM_GOV_STAT_RKEY` (`MDM_GOV_STAT_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A Person playing the role of HCP for an Org.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_ALT_ID`
--

DROP TABLE IF EXISTS `HCP_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_ALT_ID` (
  `HCP_ALT_ID_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Alternate Identifier',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `ALT_ID_TYP_RKEY` binary(16) NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ALT_ID_VAL` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `ORIGIN_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCP_ALT_ID_KEY`),
  UNIQUE KEY `AK_HCP_ALT_ID` (`SOURCE_KEY`,`SOURCE_ID`,`ALT_ID_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_HCP_KEY` (`HCP_KEY`),
  KEY `FK_ALT_ID_TYP_RKEY` (`ALT_ID_TYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_ALT_ID_VAL` (`ALT_ID_VAL`),
  KEY `FK_ORIGIN_ORG_KEY` (`ORIGIN_ORG_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Alternate Identifiers for a Healtcare Professional.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `HCP_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_POSTAL_ADDR` (
  `HCP_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Postal Address',
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_VALID_OVRD_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `ADDR_CHG_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Reason for the change in Address, if applicable (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCP_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCP_POSTAL_ADDR` (`POSTAL_ADDR_KEY`,`HCP_KEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCP_KEY` (`HCP_KEY`),
  KEY `FK_POSTAL_ADDR_KEY` (`POSTAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_IND_RKEY` (`ADDR_VALID_OVRD_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_REASN_RKEY` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `FK_ADDR_CHG_REASN_RKEY` (`ADDR_CHG_REASN_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCPs to Postal Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_SPCLTY`
--

DROP TABLE IF EXISTS `HCP_SPCLTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_SPCLTY` (
  `HCP_SPCLTY_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Provider Specialty',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `SPCLTY_RKEY` binary(16) NOT NULL COMMENT 'The Specialty for this HCP (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCP_SPCLTY_KEY`),
  UNIQUE KEY `AK_HCP_SPCLTY` (`SPCLTY_RKEY`,`SOURCE_KEY`,`SOURCE_ID`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCP_KEY` (`HCP_KEY`),
  KEY `FK_SPCLTY_RKEY` (`SPCLTY_RKEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCPs to Specialties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HCP_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `HCP_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HCP_VIRTUAL_ADDR` (
  `HCP_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP) Virtual Address',
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ACCEPT_VOICE_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`HCP_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_HCP_VIRTUAL_ADDR` (`VIRTUAL_ADDR_KEY`,`HCP_KEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_HCP_KEY` (`HCP_KEY`),
  KEY `FK_VIRTUAL_ADDR_KEY` (`VIRTUAL_ADDR_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ACCEPT_VOICE_MSG_IND_RKEY` (`ACCEPT_VOICE_MSG_IND_RKEY`),
  KEY `FK_ACCEPT_TXT_MSG_IND_RKEY` (`ACCEPT_TXT_MSG_IND_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates HCPs to Virtual Addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL`
--

DROP TABLE IF EXISTS `MATL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL` (
  `MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `MATL_TYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The Material Type of this Material record (Reference Value)',
  `MATL_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Material Status of this Material record (Reference Value)',
  `MATL_NUM` varchar(45) NOT NULL COMMENT 'The Material Number',
  `MATL_DISPL_NUM` varchar(100) DEFAULT NULL COMMENT 'The display number for the Material',
  `MATL_SHORT_NM` varchar(20) DEFAULT NULL COMMENT 'The short name for the Material',
  `MATL_LONG_NM` varchar(50) DEFAULT NULL COMMENT 'The long name for the Material',
  `MATL_DESC` varchar(100) DEFAULT NULL COMMENT 'The decription of the Material',
  `MATL_BRAND_TXT` varchar(100) DEFAULT NULL COMMENT 'The Brand Name of the Material',
  `LOT_SERIAL_CD_RKEY` binary(16) DEFAULT NULL COMMENT ' A code specifying if the Material is Serialized or Lot controlled (Reference Value)',
  `LANG_RKEY` binary(16) NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `UOM_RKEY` binary(16) DEFAULT NULL COMMENT 'The Unit of Measure for the Material (Reference Value)',
  `TRACK_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this Material is being tracked from a regulatory standpoint',
  `TRACK_METHOD_RKEY` binary(16) DEFAULT NULL COMMENT 'The Tracking Method for this Material (Reference Value)',
  `TRACK_PURP_RKEY` binary(16) DEFAULT NULL COMMENT 'The Tracking Purpose for this Material (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`MATL_KEY`),
  UNIQUE KEY `AK_MATL` (`SOURCE_ID`,`SOURCE_KEY`,`REC_TYP_RKEY`,`MATL_NUM`),
  KEY `IX_MATL_NUM` (`MATL_NUM`),
  KEY `FK_TRACK_IND_RKEY` (`TRACK_IND_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_UOM_RKEY` (`UOM_RKEY`),
  KEY `FK_TRACK_METHOD_RKEY` (`TRACK_METHOD_RKEY`),
  KEY `FK_TRACK_PURP_RKEY` (`TRACK_PURP_RKEY`),
  KEY `FK_MATL_TYP_RKEY` (`MATL_TYP_RKEY`),
  KEY `FK_MATL_STAT_RKEY` (`MATL_STAT_RKEY`),
  KEY `IX_MATL_BRAND_TXT` (`MATL_BRAND_TXT`),
  KEY `FK_LOT_SERIAL_CD_RKEY` (`LOT_SERIAL_CD_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Any thing that has extension in space and mass.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_ORG`
--

DROP TABLE IF EXISTS `MATL_ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_ORG` (
  `MATL_ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Organization',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MATL_ORG_KEY`),
  UNIQUE KEY `AK_MATL_ORG` (`ORG_KEY`,`MATL_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_MATL_KEY` (`MATL_KEY`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship of Materials to Orgs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_RLSHP`
--

DROP TABLE IF EXISTS `MATL_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_RLSHP` (
  `MATL_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Relationship',
  `MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material',
  `REL_MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material (related Material)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MATL_RLSHP_KEY`),
  UNIQUE KEY `AK_MATL_RLSHP` (`REL_MATL_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_MATL_KEY` (`MATL_KEY`),
  KEY `FK_REL_MATL_KEY` (`REL_MATL_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship of Materials to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MATL_UOM`
--

DROP TABLE IF EXISTS `MATL_UOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATL_UOM` (
  `MATL_UOM_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material Unit of Measure',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `MATL_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Material',
  `UOM_RKEY` binary(16) NOT NULL COMMENT 'The Unit of Measure for the Material (Reference Value)',
  `GTIN_VAL` varchar(14) NOT NULL COMMENT 'Global Trade Item Number',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MATL_UOM_KEY`),
  UNIQUE KEY `AK_MATL_UOM` (`SOURCE_KEY`,`SOURCE_ID`,`GTIN_VAL`,`MATL_KEY`,`UOM_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_MATL_KEY` (`MATL_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_UOM_RKEY` (`UOM_RKEY`),
  KEY `IX_GTIN_VAL` (`GTIN_VAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Material Unit of Measure; Global Trade Item Numbers.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MEDL_EVNT`
--

DROP TABLE IF EXISTS `MEDL_EVNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDL_EVNT` (
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `HCO_FCLTY_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Healthcare Organization (HCO) Facility',
  `DIV_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Organization (Division)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MEDL_EVNT_KEY`),
  UNIQUE KEY `AK_MEDL_EVNT` (`SOURCE_KEY`,`SOURCE_ID`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_HCO_FCLTY_KEY` (`HCO_FCLTY_KEY`),
  KEY `FK_DIV_ORG_KEY` (`DIV_ORG_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='An interaction between a Patient and Provider(s).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MEDL_EVNT_RLSHP`
--

DROP TABLE IF EXISTS `MEDL_EVNT_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDL_EVNT_RLSHP` (
  `MEDL_EVNT_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event Relationship',
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `REL_MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event (related Medical Event)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `SEQ_NUM` decimal(5,0) NOT NULL COMMENT 'Allows for the sequencing of Procedures',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MEDL_EVNT_RLSHP_KEY`),
  UNIQUE KEY `AK_MEDL_EVNT_RLSHP` (`MEDL_EVNT_KEY`,`REL_MEDL_EVNT_KEY`,`SEQ_NUM`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_MEDL_EVNT_KEY` (`MEDL_EVNT_KEY`),
  KEY `FK_REL_MEDL_EVNT_KEY` (`REL_MEDL_EVNT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_SEQ_NUM` (`SEQ_NUM`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship of Medical Events to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG`
--

DROP TABLE IF EXISTS `ORG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG` (
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `STAT_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Reason for the Status, if applicable (Reference Value)',
  `ORG_SHORT_NM` varchar(50) NOT NULL COMMENT 'The short name for the Organization',
  `ORG_LONG_NM` varchar(100) NOT NULL COMMENT 'The long name for the Organization',
  `ORG_ALT_NM` varchar(300) DEFAULT NULL COMMENT 'The alternate name for the Organization',
  `ORG_PREF_NM` varchar(300) DEFAULT NULL COMMENT 'The Organization''s preferred name',
  `NO_PROC_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this HCO must not be associated to Procedures',
  `NO_FOLLOWUP_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this HCO must not be associated to Followup',
  `LANG_RKEY` binary(16) NOT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ORIGIN_NATION_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The Nation that originated this Organization (HCO) record (Organization)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`ORG_KEY`),
  UNIQUE KEY `AK_ORG` (`SOURCE_ID`,`SOURCE_KEY`,`REC_TYP_RKEY`),
  KEY `IX_ORG_LONG_NM` (`ORG_LONG_NM`),
  KEY `IX_ORG_PREF_NM` (`ORG_PREF_NM`),
  KEY `IX_ORG_SHORT_NM` (`ORG_SHORT_NM`),
  KEY `IX_ORG_ALT_NM` (`ORG_ALT_NM`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_ENT_KEY` (`ENT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_STAT_REASN_RKEY` (`STAT_REASN_RKEY`),
  KEY `FK_NO_PROC_IND_RKEY` (`NO_PROC_IND_RKEY`),
  KEY `FK_NO_FOLLOWUP_IND_RKEY` (`NO_FOLLOWUP_IND_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_ORIGIN_NATION_ORG_KEY` (`ORIGIN_NATION_ORG_KEY`),
  KEY `FK_MDM_GOV_STAT_RKEY` (`MDM_GOV_STAT_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A social or legal structure formed by human beings. ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_ALT_ID`
--

DROP TABLE IF EXISTS `ORG_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_ALT_ID` (
  `ORG_ALT_ID` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Alternate Identifier',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `ALT_ID_TYP_RKEY` binary(16) NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Organization (e.g. Tax ID, DUNS Number)',
  `ORIGIN_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `REFUSED_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Person refused to submit an identifier',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`ORG_ALT_ID`),
  UNIQUE KEY `AK_ORG_ALT_ID` (`SOURCE_KEY`,`SOURCE_ID`,`ORG_KEY`,`ALT_ID_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_ALT_ID_TYP_RKEY` (`ALT_ID_TYP_RKEY`),
  KEY `IX_ALT_ID_VAL` (`ALT_ID_VAL`),
  KEY `FK_ORIGIN_ORG_KEY` (`ORIGIN_ORG_KEY`),
  KEY `FK_REFUSED_IND_RKEY` (`REFUSED_IND_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Alternate Identifiers for an Organization.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORG_RLSHP`
--

DROP TABLE IF EXISTS `ORG_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORG_RLSHP` (
  `ORG_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization Relationship',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `REL_ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization (related Org)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `HRCHY_LVL_NUM` decimal(5,0) DEFAULT NULL COMMENT 'The level within the hierarchy',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`ORG_RLSHP_KEY`),
  UNIQUE KEY `AK_ORG_RLSHP` (`ORG_KEY`,`REL_ORG_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_REL_ORG_KEY` (`REL_ORG_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relates Organizations to one another.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT`
--

DROP TABLE IF EXISTS `PATIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT` (
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `ENT_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `CONF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Patient prefers confidentiality',
  `CONF_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Confidential Reason (Reference Value)',
  `CONF_QUES_TXT` text COMMENT 'The text for the confidential question',
  `CONF_ANSWER_TXT` text COMMENT 'The answer text for the confidential question',
  `LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The preferred Address Type for tor the Patient (Reference Value)',
  `ORIGIN_NATION_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The Nation that originated this Patient record (Organization)',
  `COMMENT_TXT` text COMMENT 'General comments related to the Patient',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  `MDM_GOV_STAT_RKEY` binary(16) DEFAULT NULL COMMENT 'The Master Data Management and Data Governance Status for this record',
  PRIMARY KEY (`PATIENT_KEY`),
  UNIQUE KEY `AK_PATIENT` (`ORG_KEY`,`PERS_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_ENT_KEY` (`ENT_KEY`),
  KEY `FK_ORG_KEY` (`ORG_KEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_CONF_IND_RKEY` (`CONF_IND_RKEY`),
  KEY `FK_CONF_REASN_RKEY` (`CONF_REASN_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`),
  KEY `FK_ORIGIN_NATION_ORG_KEY` (`ORIGIN_NATION_ORG_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A person receiving medical treatment from an HCO.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_ALT_ID`
--

DROP TABLE IF EXISTS `PATIENT_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_ALT_ID` (
  `PATIENT_ALT_ID_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Alternate Identifier',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `ALT_ID_TYP_RKEY` binary(16) NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `ORIGIN_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `REFUSED_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Person refused to submit an identifier',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PATIENT_ALT_ID_KEY`),
  UNIQUE KEY `AK_PATIENT_ALT_ID` (`SOURCE_ID`,`SOURCE_KEY`,`PATIENT_KEY`,`ALT_ID_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_ALT_ID_VAL` (`ALT_ID_VAL`),
  KEY `FK_ALT_ID_TYP_RKEY` (`ALT_ID_TYP_RKEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_ORIGIN_ORG_KEY` (`ORIGIN_ORG_KEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_REFUSED_IND_RKEY` (`REFUSED_IND_RKEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Alternate Identifiers for a Patient.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_CONTACT`
--

DROP TABLE IF EXISTS `PATIENT_CONTACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_CONTACT` (
  `PATIENT_CONTACT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Contact',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The language associated with this record (Reference Value)',
  `AUTH_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this Person Contact is auEDSized',
  `AUTH_DT` date DEFAULT NULL COMMENT 'The date on which the Patient Contact was auEDSized',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PATIENT_CONTACT_KEY`),
  UNIQUE KEY `AK_PATIENT_CONTACT` (`PATIENT_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_AUTH_IND_RKEY` (`AUTH_IND_RKEY`),
  KEY `IX_AUTH_DT` (`AUTH_DT`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relates Patients to Patient Contacts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_ELASTIC_SEARCH`
--

DROP TABLE IF EXISTS `PATIENT_ELASTIC_SEARCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_ELASTIC_SEARCH` (
  `patientKey` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `enterprisePatientKey` binary(16) DEFAULT NULL COMMENT 'The EDS Enterprise Key pointer',
  `patientEnterpriseID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `lastName` varchar(50) DEFAULT NULL COMMENT 'The last name of the Person, in all capital letters',
  `firstName` varchar(50) DEFAULT NULL COMMENT 'The first name of the Person, in all capital letters',
  `middleName` varchar(50) DEFAULT NULL COMMENT 'The middle name of the Person, in all capital letters',
  `dateOfBirth` date DEFAULT NULL COMMENT 'Date of birth',
  `ssn` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `partialSSN` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `addressLine1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs DEFAULT NULL COMMENT 'The long name for the Place',
  `regionAbbrev` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `postalCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs DEFAULT NULL,
  `originNation` varchar(250) COMMENT 'The unique identifier for this record from the Source',
  `originNationName` varchar(100) COMMENT 'The long name for the Organization',
  `virtualAddressType` varchar(50) COMMENT 'The reference value or code value',
  `virtualAddressValue` varchar(100) COMMENT 'The value for the Virtual Address',
  `virtualAddressExtension` varchar(100) DEFAULT NULL COMMENT 'An optional extended value for the virtual address (e.g. Phone Extension)',
  `deviceLotSerialNumber` binary(0) DEFAULT NULL,
  `divisionCode` binary(0) DEFAULT NULL,
  KEY `IX_SOURCE_ID` (`patientEnterpriseID`),
  KEY `IX_ENT_KEY` (`enterprisePatientKey`),
  KEY `IX_FIRST_NM` (`firstName`),
  KEY `IX_LAST_NM` (`lastName`),
  KEY `IX_MIDDLE_NM` (`middleName`),
  KEY `IX_SSN` (`ssn`),
  KEY `IX_SSN4` (`partialSSN`),
  KEY `IX_ADDR_LN1` (`addressLine1`),
  KEY `IX_CITY_NM` (`city`),
  KEY `IX_REG` (`region`),
  KEY `IX_REG_ABBREV` (`regionAbbrev`),
  KEY `IX_POSTAL_CD` (`postalCode`),
  KEY `IX_NATION_CD` (`originNation`),
  KEY `IX_NATION_NM` (`originNationName`),
  KEY `IX_ADDR_TYP_CD` (`virtualAddressType`),
  KEY `IX_VIRTUAL_ADDR_VAL` (`virtualAddressValue`),
  KEY `IX_VIRTUAL_ADDR_VAL_EXT` (`virtualAddressExtension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_FUNC`
--

DROP TABLE IF EXISTS `PATIENT_FUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_FUNC` (
  `PATIENT_FUNC_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Function',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `FUNC_RKEY` binary(16) NOT NULL COMMENT 'The Function (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `FUNC_EXCPTN_DT` date DEFAULT NULL COMMENT 'The Function Exception date, if applicable',
  `EXCPTN_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates an exception for the Patient Function',
  `EXCPTN_COMMENT_TXT` text COMMENT 'Comments related to the Patient Function exception',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PATIENT_FUNC_KEY`),
  UNIQUE KEY `AK_PATIENT_FUNC` (`SOURCE_KEY`,`SOURCE_ID`,`PATIENT_KEY`,`FUNC_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_FUNC_RKEY` (`FUNC_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_EXCPTN_IND_RKEY` (`EXCPTN_IND_RKEY`),
  KEY `IX_FUNC_EXCPTN_DT` (`FUNC_EXCPTN_DT`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Specifies relevence for a given Function.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_POSTAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_POSTAL_ADDR` (
  `PATIENT_POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Postal Address',
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `PATIENT_CONTACT_PERS_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Person for the Patient Contact',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `ADDR_CHG_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Reason for the change in Address, if applicable (Reference Value)',
  `ADDR_VALID_OVRD_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this validated address has been overridden',
  `ADDR_VALID_OVRD_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The reason for the override of the validated address (Reference Value)',
  `SEASON_START_MTH_RKEY` binary(16) DEFAULT NULL COMMENT 'The season start month for this record (Reference Value)',
  `SEASON_END_MTH_RKEY` binary(16) DEFAULT NULL COMMENT 'The season end month for this record (Reference Value)',
  `ID_CARD_DISPL_IND_RKEY` binary(16) DEFAULT NULL COMMENT 'Indicates that this Address is displayed on the Patient ID Card (Reference Value)',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PATIENT_POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_POSTAL_ADDR` (`POSTAL_ADDR_KEY`,`PATIENT_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_POSTAL_ADDR_KEY` (`POSTAL_ADDR_KEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `FK_ADDR_CHG_REASN_RKEY` (`ADDR_CHG_REASN_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_IND_RKEY` (`ADDR_VALID_OVRD_IND_RKEY`),
  KEY `FK_ADDR_VALID_OVRD_REASN_RKEY` (`ADDR_VALID_OVRD_REASN_RKEY`),
  KEY `FK_SEASON_START_MTH_RKEY` (`SEASON_START_MTH_RKEY`),
  KEY `FK_SEASON_END_MTH_RKEY` (`SEASON_END_MTH_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Postal Addresses to Patients.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATIENT_VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `PATIENT_VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PATIENT_VIRTUAL_ADDR` (
  `PATIENT_VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient Virtual Address',
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `PATIENT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Patient',
  `PATIENT_CONTACT_PERS_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Person for the Patient Contact',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `PREF_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the preferred record',
  `ADDR_USAGE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The manner by which this address is used (Reference Value)',
  `ACCEPT_VOICE_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts voice messages',
  `ACCEPT_TXT_MSG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts text messages',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PATIENT_VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_PATIENT_VIRTUAL_ADDR` (`PATIENT_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`,`VIRTUAL_ADDR_KEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_VIRTUAL_ADDR_KEY` (`VIRTUAL_ADDR_KEY`),
  KEY `FK_PATIENT_KEY` (`PATIENT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `FK_PREF_IND_RKEY` (`PREF_IND_RKEY`),
  KEY `FK_ADDR_USAGE_TYP_RKEY` (`ADDR_USAGE_TYP_RKEY`),
  KEY `FK_ACCEPT_VOICE_MSG_IND_RKEY` (`ACCEPT_VOICE_MSG_IND_RKEY`),
  KEY `FK_ACCEPT_TXT_MSG_IND_RKEY` (`ACCEPT_TXT_MSG_IND_RKEY`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Virtual Addresses to Patients.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS`
--

DROP TABLE IF EXISTS `PERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS` (
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `FIRST_NM` varchar(50) DEFAULT NULL COMMENT 'The first name of the Person, in all capital letters',
  `LAST_NM` varchar(50) DEFAULT NULL COMMENT 'The last name of the Person, in all capital letters',
  `MIDDLE_NM` varchar(50) DEFAULT NULL COMMENT 'The middle name of the Person, in all capital letters',
  `PERS_PREF_NM` varchar(100) DEFAULT NULL COMMENT 'The Person''s preferred full name in all capital letters',
  `CASE_EXCPTN_FIRST_NM` varchar(50) DEFAULT NULL COMMENT 'The Person first name, expressed with proper case',
  `CASE_EXCPTN_LAST_NM` varchar(50) DEFAULT NULL COMMENT 'The Person last name, expressed with proper case',
  `CASE_EXCPTN_MIDDLE_NM` varchar(50) DEFAULT NULL COMMENT 'The Person middle name, expressed with proper case',
  `CASE_EXCPTN_PERS_PREF_NM` varchar(100) DEFAULT NULL COMMENT 'The Person''s preferred full name, expressed with proper case',
  `NAME_PREFIX_RKEY` binary(16) DEFAULT NULL COMMENT 'The name prefix (Reference Value)',
  `NAME_SUFFIX_RKEY` binary(16) DEFAULT NULL COMMENT 'The name suffix (Reference Value)',
  `PROF_SUFFIX_RKEY` binary(16) DEFAULT NULL COMMENT 'The Professional Suffix (Reference Value)',
  `BIRTH_DT` date DEFAULT NULL COMMENT 'Date of birth',
  `DECEASED_DT` date DEFAULT NULL COMMENT 'Date of death',
  `DECEASED_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this Person is deceased',
  `GENDER_RKEY` binary(16) DEFAULT NULL COMMENT 'The Gender of the Person (Reference Value)',
  `OTHER_GENDER_VAL` varchar(20) DEFAULT NULL COMMENT 'If the Person wishes a Gender that is not defined in our standard Gender codeset',
  `LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The language associated with this record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The preferred Address Type for tor the Person (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PERS_KEY`),
  UNIQUE KEY `AK_PERS` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`),
  KEY `IX_FIRST_NM` (`FIRST_NM`),
  KEY `IX_LAST_NM` (`LAST_NM`),
  KEY `IX_MIDDLE_NM` (`MIDDLE_NM`),
  KEY `IX_PERS_PREF_NM` (`PERS_PREF_NM`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `IX_BIRTH_DT` (`BIRTH_DT`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_DECEASED_IND_RKEY` (`DECEASED_IND_RKEY`),
  KEY `FK_GENDER_RKEY` (`GENDER_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A sentient human being of the species homo sapien.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_ALT_ID`
--

DROP TABLE IF EXISTS `PERS_ALT_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_ALT_ID` (
  `PERS_ALT_ID_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person Alternate Identifier',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `ALT_ID_TYP_RKEY` binary(16) NOT NULL COMMENT 'The type of Alternate Identifier (Reference Value)',
  `ALT_ID_VAL` varchar(250) DEFAULT NULL COMMENT 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)',
  `ORIGIN_ORG_KEY` binary(16) DEFAULT NULL COMMENT 'The related Organization that originates this identifier, if applicable',
  `REFUSED_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Person refused to submit an identifier',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PERS_ALT_ID_KEY`),
  UNIQUE KEY `AK_PERS_ALT_ID` (`SOURCE_KEY`,`SOURCE_ID`,`PERS_KEY`,`ALT_ID_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_ALT_ID_TYP_RKEY` (`ALT_ID_TYP_RKEY`),
  KEY `IX_ALT_ID_VAL` (`ALT_ID_VAL`),
  KEY `FK_ORIGIN_ORG_KEY` (`ORIGIN_ORG_KEY`),
  KEY `FK_REFUSED_IND_RKEY` (`REFUSED_IND_RKEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Alternate Identifiers for a Person.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PERS_DEGREE`
--

DROP TABLE IF EXISTS `PERS_DEGREE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERS_DEGREE` (
  `PERS_DEGREE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person Degree',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PERS_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Person',
  `DEGREE_RKEY` binary(16) NOT NULL COMMENT 'The scholarly Degree (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PERS_DEGREE_KEY`),
  UNIQUE KEY `AK_PERS_DEGREE` (`PERS_KEY`,`DEGREE_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_PERS_KEY` (`PERS_KEY`),
  KEY `FK_DEGREE_RKEY` (`DEGREE_RKEY`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Persons to Degrees.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PLACE`
--

DROP TABLE IF EXISTS `PLACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLACE` (
  `PLACE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PLACE_SHORT_NM` varchar(50) NOT NULL COMMENT 'The short name for the Place',
  `PLACE_LONG_NM` varchar(100) DEFAULT NULL COMMENT 'The long name for the Place',
  `SHAPE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The place shape - polygon, point, or line (Reference Value)',
  `CENTROID_LAT_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic latitude of the centroid of the Place, expressed in +/- decimal format',
  `CENTROID_LON_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic longitude of the centroid of the Place, expressed in +/- decimal format',
  `CENTROID_ALT_VAL` decimal(7,1) DEFAULT NULL COMMENT 'Geographic altitude of the centroid of the Place, expressed in +/- decimal format',
  `MOBILE_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this Place is not fixed and may move (e.g. Truck bed, Ambulance, Shipping Container)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PLACE_KEY`),
  UNIQUE KEY `AK_PLACE` (`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`),
  KEY `IX_PLACE_LONG_NM` (`PLACE_LONG_NM`),
  KEY `IX_PLACE_SHORT_NM` (`PLACE_SHORT_NM`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_SHAPE_TYP_RKEY` (`SHAPE_TYP_RKEY`),
  KEY `IX_CENTROID_LAT_VAL` (`CENTROID_LAT_VAL`),
  KEY `IX_CENTROID_LON_VAL` (`CENTROID_LON_VAL`),
  KEY `IX_CENTROID_ALT_VAL` (`CENTROID_ALT_VAL`),
  KEY `FK_MOBILE_IND_RKEY` (`MOBILE_IND_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A physical place situated on the earth''s surface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PLACE_RLSHP`
--

DROP TABLE IF EXISTS `PLACE_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLACE_RLSHP` (
  `PLACE_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place Relationship',
  `PLACE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place',
  `REL_PLACE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Place (related Place)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PLACE_RLSHP_KEY`),
  UNIQUE KEY `AK_PLACE_RLSHP` (`PLACE_KEY`,`REL_PLACE_KEY`,`SOURCE_KEY`,`SOURCE_ID`,`EFF_START_TS`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_PLACE_KEY` (`PLACE_KEY`),
  KEY `FK_REL_PLACE_KEY` (`REL_PLACE_KEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `IX_EFF_START_TS` (`EFF_START_TS`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship between Places.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `POSTAL_ADDR`
--

DROP TABLE IF EXISTS `POSTAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSTAL_ADDR` (
  `POSTAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Postal Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) NOT NULL COMMENT 'The Type of Address (Reference Value)',
  `GEOCODE_VAL` varchar(500) DEFAULT NULL COMMENT 'A geocode assigned to this Address',
  `LN1_VAL` varchar(500) DEFAULT NULL,
  `LN2_VAL` varchar(500) DEFAULT NULL COMMENT 'The second line of the postal address',
  `LN3_VAL` varchar(500) DEFAULT NULL COMMENT 'The third line of the postal address',
  `LN4_VAL` varchar(500) DEFAULT NULL COMMENT 'The fourth line of the postal address',
  `LN5_VAL` varchar(500) DEFAULT NULL COMMENT 'The fifth line of the postal address',
  `COUNTY_NM` varchar(50) DEFAULT NULL COMMENT 'The name of the County used on the Postal Address, if applicable',
  `CITY_NM` varchar(50) DEFAULT NULL,
  `DISTRICT_NM` varchar(50) DEFAULT NULL COMMENT 'The name of the District used on the Postal Address, if applicable',
  `NEIGHBRHD_NM` varchar(50) DEFAULT NULL COMMENT 'The name of the Neighborhood used on the Postal Address, if applicable',
  `POSTAL_CD_VAL` varchar(20) DEFAULT NULL,
  `ATTN_LN_VAL` varchar(1000) DEFAULT NULL COMMENT 'The attention line, if present, on the postal address',
  `LAT_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic latitude, expressed in +/- decimal format',
  `LON_VAL` decimal(9,6) DEFAULT NULL COMMENT 'Geographic longitude, expressed in +/- decimal format',
  `ALT_VAL` decimal(7,1) DEFAULT NULL COMMENT 'Geographic altitude, expressed in +/- decimal format',
  `CNTRY_PLACE_KEY` binary(16) DEFAULT NULL,
  `REGION_PLACE_KEY` binary(16) DEFAULT NULL,
  `TZ_PLACE_KEY` binary(16) DEFAULT NULL COMMENT 'The Timezone from the Place Entity',
  `TZ_TXT` varchar(50) DEFAULT NULL COMMENT 'A non-standard Timezone value coming from the source',
  `ACCEPT_MAIL_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts mail',
  `ACCEPT_PKG_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates that this address accepts packages',
  `VALID_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this address is valid',
  `VALID_REASN_RKEY` binary(16) DEFAULT NULL COMMENT 'The Reason tied to the Address Validation, if any (Reference Value)',
  `LANG_RKEY` binary(16) DEFAULT NULL COMMENT 'The Language spoken at this Postal Address (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`POSTAL_ADDR_KEY`),
  UNIQUE KEY `AK_POSTAL_ADDR` (`SOURCE_ID`,`SOURCE_KEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`),
  KEY `IX_LN1_VAL` (`LN1_VAL`),
  KEY `IX_LN2_VAL` (`LN2_VAL`),
  KEY `IX_LN3_VAL` (`LN3_VAL`),
  KEY `IX_LN4_VAL` (`LN4_VAL`),
  KEY `IX_LN5_VAL` (`LN5_VAL`),
  KEY `IX_POSTAL_CD_VAL` (`POSTAL_CD_VAL`),
  KEY `FK_CNTRY_PLACE_KEY` (`CNTRY_PLACE_KEY`),
  KEY `FK_REGION_PLACE_KEY` (`REGION_PLACE_KEY`),
  KEY `IX_TX_TXT` (`TZ_TXT`),
  KEY `FK_ACCEPT_MAIL_RKEY` (`ACCEPT_MAIL_IND_RKEY`),
  KEY `FK_ACCEPT_PKG_RKEY` (`ACCEPT_PKG_IND_RKEY`),
  KEY `FK_VALID_IND_RKEY` (`VALID_IND_RKEY`),
  KEY `FK_VALID_REASN_RKEY` (`VALID_REASN_RKEY`),
  KEY `FK_LANG_RKEY` (`LANG_RKEY`),
  KEY `IX_CITY_NM` (`CITY_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A set of values that identify a location for mail delivery.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC`
--

DROP TABLE IF EXISTS `PROC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC` (
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `EST_START_DT_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the Start Datetime was estimated and is not the actual date',
  `OUTSIDE_US_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates the Procedure occured outside of the United States',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`MEDL_EVNT_KEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_EST_START_DT_IND_RKEY` (`EST_START_DT_IND_RKEY`),
  KEY `FK_OUTSIDE_US_IND_RKEY` (`OUTSIDE_US_IND_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A Medical Event that alters the physical state of a Patient.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_DEVICE_INSTANCE`
--

DROP TABLE IF EXISTS `PROC_DEVICE_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_DEVICE_INSTANCE` (
  `PROC_DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Procedure Device Instance',
  `DEVICE_INSTANCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Device Instance',
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ACT_TYP_RKEY` binary(16) NOT NULL COMMENT 'The Activity Type of the action tied to the Device Registration (Reference Value)',
  `ACT_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The Activity Subtype of the action tied to the Device Registration (Reference Value)',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PROC_DEVICE_INSTANCE_KEY`),
  UNIQUE KEY `AK_PROC_DEVICE_INSTANCE` (`DEVICE_INSTANCE_KEY`,`REC_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ACT_TYP_RKEY` (`ACT_TYP_RKEY`),
  KEY `FK_ACT_SUBTYP_RKEY` (`ACT_SUBTYP_RKEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`),
  KEY `FK_DEVICE_INSTANCE_KEY` (`DEVICE_INSTANCE_KEY`),
  KEY `FK_MEDL_EVNT_KEY` (`MEDL_EVNT_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='An instance of a Device participating in a Procedure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_HCP`
--

DROP TABLE IF EXISTS `PROC_HCP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_HCP` (
  `PROC_HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Procedure Healthcare Professional (HCP)',
  `HCP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Healthcare Professional (HCP)',
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PROC_HCP_KEY`),
  UNIQUE KEY `AK_PROC_HCP` (`HCP_KEY`,`REC_TYP_RKEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `FK_HCP_KEY` (`HCP_KEY`),
  KEY `FK_MEDL_EVNT_KEY` (`MEDL_EVNT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_REC_TYP_RKEY` (`REC_TYP_RKEY`),
  KEY `FK_REC_SUBTYP_RKEY` (`REC_SUBTYP_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='An instance of a HCP participating in a Procedure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROC_INDICATION`
--

DROP TABLE IF EXISTS `PROC_INDICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROC_INDICATION` (
  `PROC_INDICATION_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Procedure Indication',
  `MEDL_EVNT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Medical Event',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `INDICATION_RKEY` binary(16) NOT NULL COMMENT 'The Indication or Diagnosis (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`PROC_INDICATION_KEY`),
  UNIQUE KEY `AK_PROC_INDICATION` (`INDICATION_RKEY`,`MEDL_EVNT_KEY`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `FK_MEDL_EVNT_KEY` (`MEDL_EVNT_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_INDICATION_RKEY` (`INDICATION_RKEY`),
  KEY `IX_PRIORITY_VAL` (`PRIORITY_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Associates Indications to Procedures.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL`
--

DROP TABLE IF EXISTS `REF_VAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL` (
  `REF_VAL_RKEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REF_VAL` varchar(50) NOT NULL COMMENT 'The reference value or code value',
  `REF_VAL_SHORT_NM` varchar(50) DEFAULT NULL COMMENT 'A short name for the reference value or code value',
  `REF_VAL_MEDIUM_NM` varchar(50) DEFAULT NULL COMMENT 'A medium name for the reference value or code value',
  `REF_VAL_LONG_NM` varchar(50) DEFAULT NULL COMMENT 'A long name for the reference value or code value',
  `REF_VAL_DESC` varchar(1000) DEFAULT NULL COMMENT 'The reference value or code value description',
  `REF_VAL_SET_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this record represents a Reference Value Set. If False, this record represents a member of a Reference Value Set.',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`REF_VAL_RKEY`),
  UNIQUE KEY `AK_REF_VAL` (`SOURCE_ID`,`REF_VAL`,`SOURCE_KEY`),
  KEY `IX_REF_VAL` (`REF_VAL`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `IX_REF_VAL_SHORT_NM` (`REF_VAL_SHORT_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A simple lookup value.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL_RLSHP`
--

DROP TABLE IF EXISTS `REF_VAL_RLSHP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL_RLSHP` (
  `REF_VAL_RLSHP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship',
  `REF_VAL_RKEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value',
  `REL_REF_VAL_RKEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value (Related Reference Value)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REF_HRCHY_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Reference Hierarchy',
  `REF_VAL_RLSHP_TYP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship Type',
  `HRCHY_LVL_NUM` decimal(5,0) DEFAULT NULL COMMENT 'The level of the hierarchy, if applicable',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`REF_VAL_RLSHP_KEY`),
  UNIQUE KEY `AK_REF_VAL_RLSHP` (`REF_VAL_RKEY`,`REL_REF_VAL_RKEY`,`SOURCE_KEY`,`SOURCE_ID`),
  KEY `FK_REL_REF_VAL_RKEY` (`REL_REF_VAL_RKEY`),
  KEY `FK_REF_VAL_RLSHP_TYP_KEY` (`REF_VAL_RLSHP_TYP_KEY`),
  KEY `FK_REF_VAL_RKEY` (`REF_VAL_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The relationship between Reference Values.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REF_VAL_RLSHP_TYP`
--

DROP TABLE IF EXISTS `REF_VAL_RLSHP_TYP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REF_VAL_RLSHP_TYP` (
  `REF_VAL_RLSHP_TYP_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Reference Value Relationship Type',
  `REF_VAL_RLSHP_TYP_NM` varchar(50) NOT NULL COMMENT 'The name of the Reference Value Relationship Type',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`REF_VAL_RLSHP_TYP_KEY`),
  UNIQUE KEY `AK_REF_VAL_RLSHP_TYP` (`REF_VAL_RLSHP_TYP_NM`),
  KEY `IX_REF_VAL_RLSHP_TYP_NM` (`REF_VAL_RLSHP_TYP_NM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The type of relationship of Reference Values.';
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `SALES_ORG_STRUCT`
--

CREATE TABLE `SALES_ORG_STRUCT` (
  `SALES_ORG_STRUCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Sales Organization Structure',
  `ORG_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Organization',
  `CUST_ACCT_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Customer Account',
  `RLSHP_ROLE_TYP_RKEY` binary(16) NOT NULL COMMENT 'The Role the Customer is playing with this component of the Sales Structure (Reference Value)',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `REC_TYP_RKEY` binary(16) NOT NULL COMMENT 'The EDS Record Type (Reference Value)',
  `REC_SUBTYP_RKEY` binary(16) DEFAULT NULL COMMENT 'The EDS Record Subtype (Reference Value)',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `PRIORITY_VAL` tinyint DEFAULT NULL COMMENT 'The relative priority or rank of this item amongst other like items',
  `EFF_START_TS` datetime NOT NULL COMMENT 'The effectivity start date/time for this record',
  `EFF_END_TS` datetime DEFAULT NULL COMMENT 'The effectivity end date/time for this record',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`SALES_ORG_STRUCT_KEY`),
  UNIQUE KEY `AK_SALES_ORG_STRUCT` (`ORG_KEY`,`CUST_ACCT_KEY`,`RLSHP_ROLE_TYP_RKEY`,`SOURCE_KEY`,`SOURCE_ID`,`REC_TYP_RKEY`,`EFF_START_TS`),
  KEY `REF_REF_VAL__SALES_ORG_STRUCT_01` (`RLSHP_ROLE_TYP_RKEY`),
  KEY `REF_REF_VAL__SALES_ORG_STRUCT_02` (`REC_TYP_RKEY`),
  KEY `REF_REF_VAL__SALES_ORG_STRUCT_03` (`REC_SUBTYP_RKEY`),
  KEY `REF_REF_VAL__SALES_ORG_STRUCT_04` (`STAT_RKEY`),
  KEY `REF_SOURCE__SALES_ORG_STRUCT` (`SOURCE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relates Customer Accounts to Orgs.';

--
-- Table structure for table `SOURCE`
--

DROP TABLE IF EXISTS `SOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SOURCE` (
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `LGCY_SOURCE_KEY` binary(16) DEFAULT NULL COMMENT 'The EDS primary key for Source (optional link to Legacy Source)',
  `SOURCE` varchar(25) NOT NULL COMMENT 'The Source system/application/auEDSity providing this record',
  `SOURCE_SHORT_NM` varchar(50) NOT NULL COMMENT 'A short name for the Source',
  `SOURCE_LONG_NM` varchar(100) NOT NULL COMMENT 'A long name for the Source',
  `SOURCE_DESC` varchar(100) NOT NULL COMMENT 'The description of the Source',
  `SMART_KEY_PREFIX_VAL` varchar(20) DEFAULT NULL COMMENT 'The prefix used for the EDS Smart Key',
  `EDS_INTERACTION_METH_VAL` varchar(20) DEFAULT NULL COMMENT 'The method by which this Source interacts with the EDS',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`SOURCE_KEY`),
  UNIQUE KEY `AK_SOURCE` (`SOURCE`,`SOURCE_KEY`),
  KEY `IX_SOURCE` (`SOURCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='All Sources of interest to MDT.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `VIRTUAL_ADDR`
--

DROP TABLE IF EXISTS `VIRTUAL_ADDR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VIRTUAL_ADDR` (
  `VIRTUAL_ADDR_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Virtual Address',
  `SOURCE_KEY` binary(16) NOT NULL COMMENT 'The EDS primary key for Source',
  `SOURCE_ID` varchar(250) NOT NULL COMMENT 'The unique identifier for this record from the Source',
  `STAT_RKEY` binary(16) NOT NULL COMMENT 'The Status of the record (Reference Value)',
  `ADDR_TYP_RKEY` binary(16) NOT NULL COMMENT 'The Type of Address (Reference Value)',
  `VIRTUAL_ADDR_PREFIX_VAL` varchar(100) DEFAULT NULL COMMENT 'An optional prefix value for the virtual address',
  `VIRTUAL_ADDR_VAL` varchar(100) NOT NULL COMMENT 'The value for the Virtual Address',
  `VIRTUAL_ADDR_EXT_VAL` varchar(100) DEFAULT NULL COMMENT 'An optional extended value for the virtual address (e.g. Phone Extension)',
  `VALID_IND_RKEY` binary(16) NOT NULL COMMENT 'Indicates this address is valid',
  `LAND_LINE_POSTAL_ADDR_KEY` binary(16) DEFAULT NULL COMMENT 'The only occurrence of a relationship between Virtual and Postal Addresses would be for land lines physically associated to a Postal Address. Address Usage can be used otherwise ("Home") for "home" cell phone numbers or email addresses, for example. ',
  `CNTRY_PLACE_KEY` binary(16) DEFAULT NULL COMMENT 'The Country from the Place Entity',
  `SOURCE_CREATE_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created this row in the Source',
  `SOURCE_CHG_USER_VAL` varchar(50) DEFAULT NULL COMMENT 'The user that created or altered this row in the Source',
  `SOURCE_CHG_PRCS_VAL` varchar(50) DEFAULT NULL COMMENT 'The process that created or altered this row in the Source',
  `SOURCE_CHG_REASN_VAL` varchar(250) DEFAULT NULL COMMENT 'The reason for the change to this row from the perspective of the Source',
  `SOURCE_CREATE_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the creation of the row in the Source',
  `SOURCE_UPD_TS` datetime DEFAULT NULL COMMENT 'The timestamp of the update to the row in the Source',
  `CREATE_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The timestamp of the creation of the row',
  `CREATE_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that created this row e.g. Informatica mapping, Kafka topic, etc',
  `CREATE_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that created this row.',
  `UPD_TS` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The timestamp of the update to the row',
  `UPD_PRCS_VAL` varchar(50) NOT NULL COMMENT 'The process that updated this row e.g. Informatica mapping, Kafka topic, etc',
  `UPD_SOURCE_VAL` varchar(25) DEFAULT NULL COMMENT 'The Source that updated this row.',
  `DEL_FLAG` tinyint(1) NOT NULL COMMENT 'Determines if this row is deleted',
  PRIMARY KEY (`VIRTUAL_ADDR_KEY`),
  UNIQUE KEY `AK_VIRTUAL_ADDR` (`SOURCE_ID`,`SOURCE_KEY`),
  KEY `IX_VIRTUAL_ADDR_VAL` (`VIRTUAL_ADDR_VAL`),
  KEY `IX_SOURCE_CREATE_USER_VAL` (`SOURCE_CREATE_USER_VAL`),
  KEY `IX_SOURCE_ID` (`SOURCE_ID`),
  KEY `IX_VIRTUAL_ADDR_EXT_VAL` (`VIRTUAL_ADDR_EXT_VAL`),
  KEY `FK_VALID_IND_RKEY` (`VALID_IND_RKEY`),
  KEY `FK_LAND_LINE_POSTAL_ADDR_KEY` (`LAND_LINE_POSTAL_ADDR_KEY`),
  KEY `FK_CNTRY_PLACE_KEY` (`CNTRY_PLACE_KEY`),
  KEY `FK_SOURCE_KEY` (`SOURCE_KEY`),
  KEY `FK_STAT_RKEY` (`STAT_RKEY`),
  KEY `FK_ADDR_TYP_RKEY` (`ADDR_TYP_RKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A string of alphanumeric values used for communication.';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19  8:18:00
