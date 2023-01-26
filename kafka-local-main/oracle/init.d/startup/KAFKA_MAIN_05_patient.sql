alter session set current_schema=KAFKA_MAIN;

CREATE TABLE ENTPR_PATIENT_OB
(
ENTPR_PATIENT_ID         VARCHAR2(25 CHAR)  NOT NULL,
SOURCE                   VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                    NUMBER(13)         ,
ENTPR_ORG_ID                     VARCHAR2(50 CHAR)  ,
MASTER_ENTPR_PATIENT_ID          VARCHAR2(25 CHAR)  ,
INT_MDM_ID                       VARCHAR2(25 CHAR)  ,
INT_ROLE_MDM_ID                  VARCHAR2(25 CHAR)  ,
INT_PREF_MDM_ID                  VARCHAR2(25 CHAR)  ,
REC_TYP                          VARCHAR2(25 CHAR)  ,
PERS_REC_TYP                     VARCHAR2(25 CHAR)  ,
STATUS                           VARCHAR2(25 CHAR)  ,
FIRST_NAME                       VARCHAR2(100 CHAR) ,
MIDDLE_NAME                      VARCHAR2(100 CHAR) ,
LAST_NAME                        VARCHAR2(100 CHAR) ,
PREF_NAME                        VARCHAR2(100 CHAR) ,
EXCEPT_FIRST_NAME                VARCHAR2(100 CHAR) ,
EXCEPT_MIDDLE_NAME               VARCHAR2(100 CHAR) ,
EXCEPT_LAST_NAME                 VARCHAR2(100 CHAR) ,
EXCEPT_PREF_NAME                 VARCHAR2(100 CHAR) ,
PREFIX_CD                        VARCHAR2(25 CHAR)  ,
PRSNL_SUFFIX_CD                  VARCHAR2(25 CHAR)  ,
PROF_SUFFIX_CD                   VARCHAR2(25 CHAR)  ,
GENDER_CD                        VARCHAR2(25 CHAR)  ,
GENDER_OTHER_TXT                 VARCHAR2(100 CHAR) ,
BIRTH_DATE                       DATE               ,
DEATH_DATE                       DATE               ,
DECEASED_IND                     VARCHAR2(25 CHAR)  ,
CONF_IND                         VARCHAR2(25 CHAR)  ,
CONF_RSN_TYP_CD                  VARCHAR2(25 CHAR)  ,
PREF_CNTCT_MTD_TYP_CD            VARCHAR2(25 CHAR)  ,
LANG_CD                          VARCHAR2(25 CHAR)  ,
REC_ORG_CNTRY_CD                 VARCHAR2(25 CHAR)  ,
SEC_ANS_TXT                      VARCHAR2(500 CHAR) ,
SEC_QUES_TXT                     VARCHAR2(500 CHAR) ,
EFF_START_DT                     DATE               ,
EFF_END_DT                       DATE               ,
MDM_GOV_STAT_CD                  VARCHAR2(25 CHAR)  ,
CREATE_SOURCE                    VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER               VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS                 TIMESTAMP(6)       ,
UPD_SOURCE                       VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER                  VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                    TIMESTAMP(6)       ,
UPD_TS                           TIMESTAMP(6)
)
;

CREATE TABLE ENTPR_PATIENT_POSTAL_ADDR_OB
(
ENTPR_PATIENT_ADDR_ID    VARCHAR2(50 CHAR)  NOT NULL,
SOURCE                   VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                    NUMBER(13)         ,
ENTPR_PATIENT_ID                 VARCHAR2(25 CHAR)  ,
ENTPR_CNTCT_ID                   VARCHAR2(25 CHAR)  ,
INT_MDM_ID                       VARCHAR2(25 CHAR)  ,
INT_CNTCT_MDM_ID                 VARCHAR2(25 CHAR)  ,
STATUS                           VARCHAR2(25 CHAR)  ,
ADDR_USAGE_TYP_CD                VARCHAR2(25 CHAR)  ,
ADDR_TYP_CD                      VARCHAR2(50 CHAR)  ,
LANG_CD                          VARCHAR2(25 CHAR)  ,
ADDR_LINE1                       VARCHAR2(255 CHAR) ,
ADDR_LINE2                       VARCHAR2(255 CHAR) ,
ADDR_LINE3                       VARCHAR2(255 CHAR) ,
ADDR_LINE4                       VARCHAR2(255 CHAR) ,
CITY_NAME                        VARCHAR2(100 CHAR) ,
REGION_CD                        VARCHAR2(25 CHAR)  ,
POSTAL_CD                        VARCHAR2(25 CHAR)  ,
CNTRY_CD                         VARCHAR2(10 CHAR)  ,
LATITUDE                         NUMBER             ,
LONGITUDE                        NUMBER             ,
LOCAL_TIME_ZONE                  VARCHAR2(10 CHAR)  ,
PREF_IND                         VARCHAR2(25 CHAR)  ,
PRIORITY_VAL                     NUMBER             ,
SEASNL_START_MONTH_CD            VARCHAR2(25 CHAR)  ,
SEASNL_END_MONTH_CD              VARCHAR2(25 CHAR)  ,
ADDR_VLD_TYP_CD                  VARCHAR2(25 CHAR)  ,
VERF_OVERIDE_IND                 VARCHAR2(25 CHAR)  ,
VERF_OVERIDE_RSN_TYP_CD          VARCHAR2(25 CHAR)  ,
ADDR_CHG_RSN_TYP_CD              VARCHAR2(25 CHAR)  ,
ID_CARD_DISPLAY_IND              VARCHAR2(25 CHAR)  ,
ACCEPT_MAIL_IND                  VARCHAR2(25 CHAR)  ,
ACCEPT_PACKAGE_IND               VARCHAR2(25 CHAR)  ,
ADDR_ATTN_LINE                   VARCHAR2(255 CHAR) ,
ADDR_VALID_IND                   VARCHAR2(25 CHAR)  ,
EFF_START_DT                     DATE               ,
EFF_END_DT                       DATE               ,
CREATE_SOURCE                    VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER               VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS                 TIMESTAMP(6)       ,
UPD_SOURCE                       VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER                  VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                    TIMESTAMP(6)       ,
UPD_TS                           TIMESTAMP(6)
)
;

CREATE TABLE ENTPR_PATIENT_VIRT_ADDR_OB
(
ENTPR_PATIENT_VIRT_ADDR_ID  VARCHAR2(100 CHAR) NOT NULL,
SOURCE                      VARCHAR2(25 CHAR) NOT NULL,
TRANS_SEQ_NUM                       NUMBER(13),
ENTPR_PATIENT_ID                    VARCHAR2(25 CHAR) ,
ENTPR_CNTCT_ID                      VARCHAR2(25 CHAR),
INT_MDM_ID                          VARCHAR2(25 CHAR),
INT_CNTCT_MDM_ID                    VARCHAR2(25 CHAR),
STATUS                              VARCHAR2(25 CHAR),
VIRTUAL_PREFIX_VAL                  VARCHAR2(100 CHAR),
VIRTUAL_VAL                         VARCHAR2(255 CHAR),
VIRTUAL_EXTEND_VAL                  VARCHAR2(100 CHAR),
ADDR_TYP_CD                         VARCHAR2(25 CHAR),
ADDR_USAGE_TYP_CD                   VARCHAR2(25 CHAR),
PREF_IND                            VARCHAR2(25 CHAR),
PRIORITY_VAL                        NUMBER,
ACCEPT_VOICE_MSG_IND                VARCHAR2(25 CHAR),
ACCEPT_TXT_MSG_IND                  VARCHAR2(25 CHAR),
ADDR_VALID_IND                      VARCHAR2(25 CHAR),
EFF_START_DT                        DATE,
EFF_END_DT                          DATE,
CREATE_SOURCE                       VARCHAR2(25 CHAR),
SOURCE_CREATE_USER                  VARCHAR2(25 CHAR),
SOURCE_CREATE_TS                    TIMESTAMP(6),
UPD_SOURCE                          VARCHAR2(25 CHAR),
SOURCE_UPD_USER                     VARCHAR2(25 CHAR),
SOURCE_UPD_TS                       TIMESTAMP(6),
UPD_TS                              TIMESTAMP(6)
)
;

CREATE TABLE ENTPR_PATIENT_CNTCT_OB
(
ENTPR_PATIENT_CNTCT_ID  VARCHAR2(25 CHAR)  NOT NULL,
SOURCE                 VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                   NUMBER(13),
ENTPR_CNTCT_ID         VARCHAR2(25 CHAR)  NOT NULL,
ENTPR_PATIENT_ID       VARCHAR2(25 CHAR)  NOT NULL ,
INT_MDM_ID                      VARCHAR2(25 CHAR),
INT_CNTCT_MDM_ID                VARCHAR2(25 CHAR),
REC_TYP                         VARCHAR2(25 CHAR),
REC_SUBTYP                      VARCHAR2(25 CHAR),
PERS_REC_TYP                    VARCHAR2(25 CHAR),
STATUS                          VARCHAR2(25 CHAR),
PREF_NAME                       VARCHAR2(100 CHAR),
AUTH_IND                        VARCHAR2(25 CHAR),
AUTH_DT                         TIMESTAMP(6),
EFF_START_DT                    DATE,
EFF_END_DT                      DATE,
CREATE_SOURCE                   VARCHAR2(25 CHAR),
SOURCE_CREATE_USER              VARCHAR2(25 CHAR),
SOURCE_CREATE_TS                TIMESTAMP(6),
UPD_SOURCE                      VARCHAR2(25 CHAR),
SOURCE_UPD_USER                 VARCHAR2(25 CHAR),
SOURCE_UPD_TS                   TIMESTAMP(6),
UPD_TS                          TIMESTAMP(6)
)
;


CREATE TABLE ENTPR_PATIENT_ID_TYP_OB
(
ENTPR_PATIENT_ALT_ID  VARCHAR2(100 CHAR) NOT NULL,
SOURCE                VARCHAR2(25 CHAR)  NOT NULL,
TRANS_SEQ_NUM                 NUMBER(13)         ,
ENTPR_PATIENT_ID              VARCHAR2(25 CHAR)  ,
INT_MDM_ID                    VARCHAR2(25 CHAR)  ,
STATUS                        VARCHAR2(25 CHAR)  ,
ALT_ID_TYP                    VARCHAR2(100 CHAR) ,
ALT_ID_VAL                    VARCHAR2(100 CHAR) ,
REFUSED_IND                   VARCHAR2(25 CHAR)  ,
CREATE_SOURCE                 VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_USER            VARCHAR2(25 CHAR)  ,
SOURCE_CREATE_TS              TIMESTAMP(6)       ,
UPD_SOURCE                    VARCHAR2(25 CHAR)  ,
SOURCE_UPD_USER               VARCHAR2(25 CHAR)  ,
SOURCE_UPD_TS                 TIMESTAMP(6)       ,
UPD_TS                        TIMESTAMP(6)
)
;

CREATE TABLE ENTPR_PATIENT_FUNC_OB
(
ENTPR_PATIENT_FUNC_ID VARCHAR2(100 CHAR)  NOT NULL ,
SOURCE                VARCHAR2(25 CHAR)   NOT NULL ,
TRANS_SEQ_NUM                  NUMBER(13)          ,
ENTPR_PATIENT_ID               VARCHAR2(25 CHAR)   ,
INT_MDM_ID                     VARCHAR2(25 CHAR)   ,
STATUS                         VARCHAR2(25 CHAR)   ,
FUNC_TYP                       VARCHAR2(255 CHAR)  ,
FUNC_EXCPTN_IND                VARCHAR2(25 CHAR)   ,
FUNC_EXCPTN_COMMENT            VARCHAR2(2000 CHAR) ,
FUNC_EXCPTN_DATE               TIMESTAMP(6)        ,
CREATE_SOURCE                  VARCHAR2(25 CHAR)   ,
SOURCE_CREATE_USER             VARCHAR2(25 CHAR)   ,
SOURCE_CREATE_TS               TIMESTAMP(6)        ,
UPD_SOURCE                     VARCHAR2(25 CHAR)   ,
SOURCE_UPD_USER                VARCHAR2(25 CHAR)   ,
SOURCE_UPD_TS                  TIMESTAMP(6)        ,
UPD_TS                         TIMESTAMP(6)
)
;



