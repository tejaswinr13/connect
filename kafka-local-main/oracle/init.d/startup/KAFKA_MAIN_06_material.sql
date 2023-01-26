alter session set current_schema=KAFKA_MAIN;

CREATE TABLE ENTPR_MATL_OB (
ENTPR_MATL_ID     VARCHAR2(50 CHAR)  ,
SOURCE            VARCHAR2(25 CHAR)  ,
TRANS_SEQ_NUM               NUMBER(13)     ,        
REC_TYP                     VARCHAR2(25 CHAR)  ,
REC_SUBTYP                  VARCHAR2(25 CHAR)  ,
STATUS                      VARCHAR2(25 CHAR)  ,
MATL_NUM                    VARCHAR2(50 CHAR)  ,
MATL_DISPL_NUM              VARCHAR2(100 CHAR) ,
MATL_DESC                   VARCHAR2(100 CHAR) ,
MATL_TYP                    VARCHAR2(25 CHAR)  ,
MATL_STATUS                 VARCHAR2(25 CHAR)  ,
LOT_SERIAL_CD               VARCHAR2(10 CHAR)  ,
LANG_CD                     VARCHAR2(10 CHAR)  ,
UOM_CD                      VARCHAR2(10 CHAR)  ,
MATL_BRAND_TXT              VARCHAR2(100 CHAR) ,
TRACK_IND                   VARCHAR2(11 CHAR)  ,
TRACK_METHOD_CD             VARCHAR2(25 CHAR)  ,
TRACK_PURPOSE_CD            VARCHAR2(25 CHAR) ,
CREATE_SOURCE               VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER          VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS            TIMESTAMP(6)       ,
UPD_SOURCE                  VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER             VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS               TIMESTAMP(6)       ,
UPD_TS                      TIMESTAMP(6)   
);

CREATE TABLE ENTPR_MATL_UOM_OB (
ENTPR_MATL_UOM_ID  VARCHAR2(100 CHAR) ,
SOURCE             VARCHAR2(25 CHAR)  ,
TRANS_SEQ_NUM               NUMBER(13)     ,        
ENTPR_MATL_ID      VARCHAR2(50 CHAR)  ,
REC_TYP                     VARCHAR2(25 CHAR)  ,
UOM_CD                      VARCHAR2(10 CHAR)  ,
STATUS                      VARCHAR2(25 CHAR)  ,
GTIN_VAL                    VARCHAR2(100 CHAR) ,
CREATE_SOURCE               VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER          VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS            TIMESTAMP(6)       ,
UPD_SOURCE                  VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER             VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS               TIMESTAMP(6)       ,
UPD_TS                      TIMESTAMP(6)  
);

CREATE TABLE ENTPR_MATL_ORG_OB (
ENTPR_MATL_ORG_ID  VARCHAR2(50 CHAR) ,
SOURCE             VARCHAR2(25 CHAR) ,
TRANS_SEQ_NUM               NUMBER(13)    ,        
ENTPR_MATL_ID      VARCHAR2(50 CHAR) ,
ENTPR_ORG_ID                VARCHAR2(50 CHAR) ,
REC_TYP                     VARCHAR2(25 CHAR) ,
REC_SUBTYP                  VARCHAR2(25 CHAR) ,
STATUS                      VARCHAR2(25 CHAR) ,
EFF_START_DT                DATE              ,
EFF_END_DT                  DATE              ,
CREATE_SOURCE               VARCHAR2(25 CHAR) ,
SOURCE_CREATE_USER          VARCHAR2(25 CHAR) ,
SOURCE_CREATE_TS            TIMESTAMP(6)      ,
UPD_SOURCE                  VARCHAR2(25 CHAR) ,
SOURCE_UPD_USER             VARCHAR2(25 CHAR) ,
SOURCE_UPD_TS               TIMESTAMP(6)      ,
UPD_TS                      TIMESTAMP(6)
);

CREATE TABLE ENTPR_MATL_RLSHP_OB (
ENTPR_MATL_RLSHP_ID VARCHAR2(50 CHAR) ,
SOURCE              VARCHAR2(25 CHAR) ,
TRANS_SEQ_NUM                NUMBER(13)    ,        
ENTPR_MATL_ID       VARCHAR2(50 CHAR) ,
ENTPR_MATL_REL_ID   VARCHAR2(50 CHAR) ,
REC_TYP                      VARCHAR2(25 CHAR) ,
REC_SUBTYP                   VARCHAR2(25 CHAR) ,
STATUS                       VARCHAR2(25 CHAR) ,
PRIORITY_VAL                 NUMBER            ,
EFF_START_DT                 DATE              ,
EFF_END_DT                   DATE              ,
CREATE_SOURCE                VARCHAR2(25 CHAR) ,
SOURCE_CREATE_USER           VARCHAR2(25 CHAR) ,
SOURCE_CREATE_TS             TIMESTAMP(6)      ,
UPD_SOURCE                   VARCHAR2(25 CHAR) ,
SOURCE_UPD_USER              VARCHAR2(25 CHAR) ,
SOURCE_UPD_TS                TIMESTAMP(6)      ,
UPD_TS                       TIMESTAMP(6)   
);
