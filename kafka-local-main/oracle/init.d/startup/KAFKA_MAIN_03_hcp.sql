alter session set current_schema=KAFKA_MAIN;

CREATE TABLE ENTPR_HCP_OB
(
  ENTPR_HCP_ID        VARCHAR2(50 CHAR)  NOT NULL,
  SOURCE              VARCHAR2(25 CHAR)  NOT NULL,
  TRANS_SEQ_NUM               NUMBER(13)         ,
  ENTPR_ORG_ID                VARCHAR2(50 CHAR)  ,
  REC_TYP                     VARCHAR2(25 CHAR)  ,
  REC_SUBTYP                  VARCHAR2(25 CHAR)  ,
  PERS_REC_TYP                VARCHAR2(25 CHAR)  ,
  STATUS                      VARCHAR2(25 CHAR)  ,
  FIRST_NAME                  VARCHAR2(100 CHAR) ,
  MIDDLE_NAME                 VARCHAR2(100 CHAR) ,
  LAST_NAME                   VARCHAR2(100 CHAR) ,
  NAME_PREFIX                 VARCHAR2(25 CHAR)  ,
  NAME_SUFFIX                 VARCHAR2(25 CHAR)  ,
  PROF_SUFFIX                 VARCHAR2(25 CHAR)  ,
  NO_PROC_IND                 VARCHAR2(25 CHAR)  ,
  NO_FOLLOWUP_IND             VARCHAR2(25 CHAR)  ,
  LANG_CD                     VARCHAR2(50 CHAR)  ,
  COMMENTS                    VARCHAR2(500 CHAR) ,
  ADDR_TYP_CD                 VARCHAR2(25 CHAR)  ,
  HCP_ORIG_CD                 VARCHAR2(25 CHAR)  ,
  EFF_START_DT                DATE               ,
  EFF_END_DT                  DATE               ,
  CREATE_SOURCE               VARCHAR2(25 CHAR)  ,
  SOURCE_CREATE_USER          VARCHAR2(25 CHAR)  ,
  SOURCE_CREATE_TS            TIMESTAMP(6)       ,
  UPD_SOURCE                  VARCHAR2(25 CHAR)  ,
  SOURCE_UPD_USER             VARCHAR2(25 CHAR)  ,
  SOURCE_UPD_TS               TIMESTAMP(6)       ,
  UPD_TS                      TIMESTAMP(6)
);


CREATE TABLE ENTPR_HCP_POSTAL_ADDR_OB
(
ENTPR_HCP_POSTAL_ADDR_ID  VARCHAR2(100 CHAR) NOT NULL,
SOURCE                    VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                     NUMBER(13)         ,
ENTPR_HCP_ID                      VARCHAR2(50 CHAR)  ,
STATUS                            VARCHAR2(25 CHAR)  ,
ADDR_LINE_1                       VARCHAR2(255 CHAR) ,
ADDR_LINE_2                       VARCHAR2(100 CHAR) ,
ADDR_LINE_3                       VARCHAR2(100 CHAR) ,
ADDR_LINE_4                       VARCHAR2(100 CHAR) ,
ADDR_LINE_5                       VARCHAR2(100 CHAR) ,
CITY_NAME                         VARCHAR2(100 CHAR) ,
REGION_CD                         VARCHAR2(25 CHAR)  ,
COUNTRY_CD                        VARCHAR2(50 CHAR)  ,
POSTAL_CD                         VARCHAR2(50 CHAR)  ,
LATITUDE                          NUMBER(22,7)       ,
LONGITUDE                         NUMBER(22,7)       ,
ADDR_USAGE_TYP_CD                 VARCHAR2(25 CHAR)  ,
ADDR_TYP_CD                       VARCHAR2(25 CHAR)  ,
ADDR_VALID_OVRD_IND               VARCHAR2(25 CHAR)  ,
ADDR_VALID_OVRD_REASN_CD          VARCHAR2(25 CHAR)  ,
ADDR_CHG_REASN_CD                 VARCHAR2(25 CHAR)  ,
PREF_IND                          VARCHAR2(25 CHAR)  ,
PRIORITY_VAL                      NUMBER             ,
ACCEPT_MAIL_IND                   VARCHAR2(25 CHAR)  ,
ACCEPT_PKG_IND                    VARCHAR2(25 CHAR)  ,
ADDR_VALID_IND                    VARCHAR2(25 CHAR)  ,
LANG_CD                           VARCHAR2(10 CHAR)  ,
EFF_START_DT                      DATE               ,
EFF_END_DT                        DATE               ,
CREATE_SOURCE                     VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER                VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS                  TIMESTAMP(6)       ,
UPD_SOURCE                        VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER                   VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                     TIMESTAMP(6)       ,
UPD_TS                            TIMESTAMP(6)
);


CREATE TABLE ENTPR_HCP_VIRT_ADDR_OB
(
ENTPR_HCP_VIRT_ADDR_ID  VARCHAR2(100 CHAR) NOT NULL,
SOURCE                  VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                   NUMBER(13)         ,
ENTPR_HCP_ID                    VARCHAR2(50 CHAR)  ,
STATUS                          VARCHAR2(25 CHAR)  ,
VIRTUAL_PREFIX_VAL              VARCHAR2(100 CHAR) ,
VIRTUAL_VAL                     VARCHAR2(255 CHAR) ,
VIRTUAL_EXTEND_VAL              VARCHAR2(100 CHAR) ,
PREF_IND                        VARCHAR2(25 CHAR)  ,
ADDR_TYP_CD                     VARCHAR2(25 CHAR)  ,
ADDR_USAGE_TYP_CD               VARCHAR2(25 CHAR)  ,
PRIORITY_VAL                    NUMBER             ,
ACCEPT_VOICE_MSG_IND            VARCHAR2(25 CHAR)  ,
ACCEPT_TXT_MSG_IND              VARCHAR2(25 CHAR)  ,
ADDR_VALID_IND                  VARCHAR2(25 CHAR)  ,
EFF_START_DT                    DATE               ,
EFF_END_DT                      DATE               ,
CREATE_SOURCE                   VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER              VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS                TIMESTAMP(6)       ,
UPD_SOURCE                      VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER                 VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                   TIMESTAMP(6)       ,
UPD_TS                          TIMESTAMP(6)
);

CREATE TABLE ENTPR_HCP_SPCLTY_OB
(
  ENTPR_HCP_SPCLTY_ID  VARCHAR2(50 CHAR) NOT NULL,
  SOURCE               VARCHAR2(25 CHAR) NOT NULL,
  TRANS_SEQ_NUM                NUMBER(13)        ,
  ENTPR_HCP_ID                 VARCHAR2(50 CHAR) ,
  STATUS                       VARCHAR2(25 CHAR) ,
  SPCLTY_CD                    VARCHAR2(25 CHAR) ,
  PRIORITY_VAL                 NUMBER            ,
  CREATE_SOURCE                VARCHAR2(25 CHAR) ,
  SOURCE_CREATE_USER           VARCHAR2(25 CHAR) ,
  SOURCE_CREATE_TS             TIMESTAMP(6)      ,
  UPD_SOURCE                   VARCHAR2(25 CHAR) ,
  SOURCE_UPD_USER              VARCHAR2(25 CHAR) ,
  SOURCE_UPD_TS                TIMESTAMP(6)      ,
  UPD_TS                       TIMESTAMP(6)
);


CREATE TABLE ENTPR_HCP_ID_TYP_OB
(
ENTPR_HCP_ALT_ID_TYP  VARCHAR2(100 CHAR) NOT NULL,
SOURCE                VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                 NUMBER(13)         ,
ENTPR_HCP_ID                  VARCHAR2(50 CHAR)  ,
ALT_ID_TYP                    VARCHAR2(100 CHAR) ,
STATUS                        VARCHAR2(25 CHAR)  ,
ALT_ID_VAL                    VARCHAR2(100 CHAR) ,
CREATE_SOURCE                 VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER            VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS              TIMESTAMP(6)       ,
UPD_SOURCE                    VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER               VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                 TIMESTAMP(6)       ,
UPD_TS                        TIMESTAMP(6)
);
