
SELECT SUPPLEMENTAL_LOG_DATA_MIN, SUPPLEMENTAL_LOG_DATA_ALL, FORCE_LOGGING FROM V$DATABASE;

SHUTDOWN IMMEDIATE

STARTUP MOUNT

ALTER DATABASE ARCHIVELOG;

ALTER DATABASE OPEN;

ALTER DATABASE ADD SUPPLEMENTAL LOG DATA (ALL) COLUMNS;

SELECT SUPPLEMENTAL_LOG_DATA_MIN, SUPPLEMENTAL_LOG_DATA_ALL, FORCE_LOGGING FROM V$DATABASE;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE ROLE LOGMNR_ROLE;
GRANT CREATE SESSION TO LOGMNR_ROLE;
GRANT  EXECUTE_CATALOG_ROLE,SELECT ANY TRANSACTION ,SELECT ANY DICTIONARY TO LOGMNR_ROLE;

CREATE USER C_USER IDENTIFIED BY C_PASS;
GRANT  LOGMNR_ROLE TO C_USER;
ALTER USER C_USER QUOTA UNLIMITED ON USERS;

ALTER DATABASE ADD SUPPLEMENTAL LOG DATA;
ALTER SYSTEM ARCHIVE LOG CURRENT;

ALTER SESSION SET CONTAINER = CDB$ROOT;
GRANT SELECT ON SYS.USER$ TO C_USER;
