alter session set current_schema=KAFKA_MAIN;

CREATE TABLE ENTPR_PLACE_OB
(
ENTPR_PLACE_ID     VARCHAR2(25 CHAR)  NOT NULL ,
SOURCE             VARCHAR2(25 CHAR)  NOT NULL ,
TRANS_SEQ_NUM               NUMBER(13)         ,
REC_TYP            VARCHAR2(25 CHAR)  NOT NULL ,
STATUS                      VARCHAR2(25 CHAR)  ,
SHORT_NAME                  VARCHAR2(50 CHAR)  ,
LONG_NAME                   VARCHAR2(100 CHAR) ,
SHAPE_TYP                   VARCHAR2(25 CHAR)  ,
CREATE_SOURCE               VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER          VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS            TIMESTAMP(6)       ,
UPD_SOURCE                  VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER             VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS               TIMESTAMP(6)       ,
UPD_TS                      TIMESTAMP(6)
)
;

