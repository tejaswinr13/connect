alter session set current_schema=KAFKA_MAIN;

CREATE TABLE ENTPR_DEVICE_OB
(
ENTPR_DEVICE_ID         VARCHAR2(100 CHAR) NOT NULL,
SOURCE                  VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                   NUMBER(13)         ,
ENTPR_MATL_ID                   VARCHAR2(50 CHAR)  ,
ENTPR_ORG_ID                    VARCHAR2(50 CHAR)  ,
REC_TYP                         VARCHAR2(25 CHAR)  ,
REC_SUBTYP                      VARCHAR2(25 CHAR)  ,
STATUS                          VARCHAR2(25 CHAR)  ,
LOT_SERIAL_NUM                  VARCHAR2(100 CHAR) ,
UNKNOWN_SERIAL_NUM_IND          VARCHAR2(10 CHAR)  ,
MANUFACTURED_DATE               DATE               ,
USE_BEFORE_DATE                 DATE               ,
CREATE_SOURCE                   VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER              VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS                TIMESTAMP(6)       ,
UPD_SOURCE                      VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER                 VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                   TIMESTAMP(6)       ,
UPD_TS                          TIMESTAMP(6)
)
;