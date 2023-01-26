/*==============================================================*/
/* Table: SEARCH_BASE_MATL                                      */
/*==============================================================*/
create table EDS.SEARCH_BASE_MATL
(
   MATL_KEY             binary(16) not null  comment 'The EDS primary key for Material',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   MATL_NUM             varchar(45)  comment 'The Material Number',
   PROD_TYP_CD          varchar(45)  comment 'The Product Type Code assigned to the Material',
   PROD_TYP_DESC        varchar(100)  comment 'The Product Type description',
   CFN                  varchar(45)  comment 'The Customer Facing Number Number aka Model Number',
   MATL_BRAND_TXT       varchar(100)  comment 'The Brand Name of the Material',
   MPG_CD               varchar(45)  comment 'The Material Price Group assigned to the Material',
   LOT_SERIAL_CD        varchar(50)  comment 'The reference value or code value',
   TRACK_IND            varchar(50)  comment 'Indicates that this Material is being tracked from a regulatory standpoint',
   TRACK_METHOD_CD      varchar(50)  comment 'The Tracking Method for this Material (Reference Value)',
   TRACK_PURP_CD        varchar(50)  comment 'The Tracking Purpose for this Material (Reference Value)',
   PH_LVL1_CD           varchar(45)  comment 'Product Hierarchy Level 1 Code',
   PH_LVL2_CD           varchar(45)  comment 'Product Hierarchy Level 2 Code',
   PH_LVL3_CD           varchar(45)  comment 'Product Hierarchy Level 3 Code',
   PH_LVL4_CD           varchar(45)  comment 'Product Hierarchy Level 4 Code',
   PH_LVL5_CD           varchar(45)  comment 'Product Hierarchy Level 5 Code',
   PH_LVL6_CD           varchar(45)  comment 'Product Hierarchy Level 6 Code'
);

alter table EDS.SEARCH_BASE_MATL
   add primary key (MATL_KEY);

/*==============================================================*/
/* Table: SEARCH_CUST_ACCT                                      */
/*==============================================================*/
create table EDS.SEARCH_CUST_ACCT
(
   CUST_ACCT_KEY        binary(16) not null  comment 'The EDS primary key for Customer Account',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   CUST_ACCT_NUM        varchar(50)  comment 'Medtronic Customer Account Number'
);

alter table EDS.SEARCH_CUST_ACCT
   add primary key (CUST_ACCT_KEY);

/*==============================================================*/
/* Table: SEARCH_DEVICE                                         */
/*==============================================================*/
create table EDS.SEARCH_DEVICE
(
   DEVICE_INSTANCE_KEY  binary(16) not null  comment 'The EDS primary key for Device Instance',
   MATL_KEY             binary(16) not null  comment 'The EDS primary key for Material',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   LOT_SERIAL_NUM       varchar(100)  comment 'Lot number or serial number (one or the other)',
   USE_BEFORE_DT        date  comment 'The date before which the Device must be used'
);

alter table EDS.SEARCH_DEVICE
   add primary key (DEVICE_INSTANCE_KEY);

/*==============================================================*/
/* Table: SEARCH_DEVICE_REGIST                                  */
/*==============================================================*/
create table EDS.SEARCH_DEVICE_REGIST
(
   DEVICE_REGIST_KEY    binary(16) not null  comment 'The EDS primary key for Device Registration',
   DEVICE_INSTANCE_KEY  binary(16) not null  comment 'The EDS primary key for Device Instance',
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   PRIM_IMPLANT_HCP_KEY binary(16)  comment 'The EDS primary key for Healthcare Professional (HCP)',
   IMPLANT_HCO_FCLTY_KEY binary(16)  comment 'The EDS primary key for Healthcare Organization (HCO) Facility',
   FOLLOWUP_HCO_KEY     binary(16)  comment 'The EDS primary key for Organization (HCO)',
   FOLLOWUP_HCP_KEY     binary(16)  comment 'The EDS primary key for Healthcare Professional (HCP)',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   DEVICE_DISP_CD       varchar(50)  comment 'The reference value or code value',
   LAST_ACT_TYP_CD      varchar(50)  comment 'The reference value or code value',
   LAST_ACT_SUBTYP_CD   varchar(50)  comment 'The reference value or code value',
   IMPLANT_DT           date default NULL  comment 'The date of the Implant',
   EXPLANT_DT           date default NULL  comment 'The date of the Explant, if available'
);

alter table EDS.SEARCH_DEVICE_REGIST
   add primary key (DEVICE_REGIST_KEY);

/*==============================================================*/
/* Table: SEARCH_HCO_FCLTY                                      */
/*==============================================================*/
create table EDS.SEARCH_HCO_FCLTY
(
   HCO_FCLTY_KEY        binary(16) not null  comment 'The EDS primary key for Healthcare Organization (HCO) Facility',
   ORG_KEY              binary(16) not null  comment 'The EDS primary key for Organization',
   CUST_ACCT_KEY        binary(16)  comment 'The EDS primary key for Customer Account',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   FCLTY_NM             varchar(100)  comment 'The name of the HCO Facility',
   FCLTY_PREF_NM        varchar(300) default NULL  comment 'The preferred name of the HCO Facility',
   FCLTY_REC_TYP_CD     varchar(50)  comment 'The reference value or code value',
   FCLTY_REC_SUBTYP_CD  varchar(50)  comment 'The reference value or code value',
   FCLTY_REC_STAT_CD    varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_HCO_FCLTY
   add primary key (HCO_FCLTY_KEY);

/*==============================================================*/
/* Table: SEARCH_HCO_FCLTY_POSTAL_ADDR                          */
/*==============================================================*/
create table EDS.SEARCH_HCO_FCLTY_POSTAL_ADDR
(
   HCO_FCLTY_POSTAL_ADDR_KEY binary(16) not null  comment 'The EDS primary key for Healthcare Organization Facility Postal Address',
   HCO_FCLTY_KEY        binary(16) not null  comment 'The EDS primary key for Healthcare Organization (HCO) Facility',
   POSTAL_ADDR_TYP_CD   varchar(50)  comment 'The reference value or code value',
   POSTAL_ADDR_USAGE_CD varchar(50)  comment 'The reference value or code value',
   POSTAL_ADDR_PREF_IND varchar(50)  comment 'The reference value or code value',
   LN1_VAL              varchar(500)  comment 'The first line of the postal address',
   LN2_VAL              varchar(500) default NULL  comment 'The second line of the postal address',
   LN3_VAL              varchar(500) default NULL  comment 'The third line of the postal address',
   LN4_VAL              varchar(500) default NULL  comment 'The fourth line of the postal address',
   LN5_VAL              varchar(500) default NULL  comment 'The fifth line of the postal address',
   CITY_NM              varchar(50)  comment 'The name of the City used on the Postal Address',
   POSTAL_CD            varchar(20)  comment 'The Postal Code used on the Postal Address',
   CNTRY_CD             varchar(50)  comment 'The short name for the Place',
   CNTRY_NM             varchar(100) default NULL  comment 'The long name for the Place',
   REGION_CD            varchar(50) default NULL  comment 'The short name for the Place',
   REGION_NM            varchar(100) default NULL  comment 'The long name for the Place'
);

alter table EDS.SEARCH_HCO_FCLTY_POSTAL_ADDR
   add primary key (HCO_FCLTY_POSTAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_HCO_FCLTY_VIRTUAL_ADDR                         */
/*==============================================================*/
create table EDS.SEARCH_HCO_FCLTY_VIRTUAL_ADDR
(
   HCO_FCLTY_VIRTUAL_ADDR_KEY binary(16) not null  comment 'The EDS primary key for Healthcare Facility Virtual Address',
   HCO_FCLTY_KEY        binary(16) not null  comment 'The EDS primary key for Healthcare Organization (HCO) Facility',
   VIRTUAL_ADDR_TYP_CD  varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_REC_STAT_CD varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_USAGE_CD varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_VAL     varchar(100)  comment 'The value for the Virtual Address',
   VIRTUAL_ADDR_EXT_VAL varchar(100) default NULL  comment 'An optional extended value for the virtual address (e.g. Phone Extension)'
);

alter table EDS.SEARCH_HCO_FCLTY_VIRTUAL_ADDR
   add primary key (HCO_FCLTY_VIRTUAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_HCO_SPCLTY                                     */
/*==============================================================*/
create table EDS.SEARCH_HCO_SPCLTY
(
   HCO_SPCLTY_KEY       binary(16) not null  comment 'The EDS primary key for Healthcare Organization Specialty',
   ORG_KEY              binary(16) not null  comment 'The EDS primary key for Organization',
   SPCLTY_CD            varchar(50)  comment 'The reference value or code value',
   SPCLTY_DESC          varchar(1000) default NULL  comment 'The reference value or code value description'
);

alter table EDS.SEARCH_HCO_SPCLTY
   add primary key (HCO_SPCLTY_KEY);

/*==============================================================*/
/* Table: SEARCH_HCP                                            */
/*==============================================================*/
create table EDS.SEARCH_HCP
(
   HCP_KEY              binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP)',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   HCP_FULL_NM          varchar(100)  comment 'The full name for the Healthcare Professional',
   FIRST_NM             varchar(50)  comment 'The first name of the Person, in all capital letters',
   MIDDLE_NM            varchar(50)  comment 'The middle name of the Person, in all capital letters',
   LAST_NM              varchar(50)  comment 'The last name of the Person, in all capital letters',
   NM_SUFFIX_VAL        varchar(20)  comment 'The suffix used for the Person',
   NPI_VAL              varchar(50) default NULL  comment 'The alternate identifier value for the Healthcare Professional',
   REC_TYP_CD           varchar(50)  comment 'The reference value or code value',
   REC_SUBTYP_CD        varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_HCP
   add primary key (HCP_KEY);

/*==============================================================*/
/* Table: SEARCH_HCP_POSTAL_ADDR                                */
/*==============================================================*/
create table EDS.SEARCH_HCP_POSTAL_ADDR
(
   HCP_POSTAL_ADDR_KEY  binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP) Postal Address',
   HCP_KEY              binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP)',
   CITY_NM              varchar(50)  comment 'The name of the City used on the Postal Address',
   POSTAL_CD            varchar(20)  comment 'The Postal Code used on the Postal Address',
   CNTRY_CD             varchar(50)  comment 'The short name for the Place',
   REGION_CD            varchar(50) default NULL  comment 'The short name for the Place'
);

alter table EDS.SEARCH_HCP_POSTAL_ADDR
   add primary key (HCP_POSTAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_HCP_SPCLTY                                     */
/*==============================================================*/
create table EDS.SEARCH_HCP_SPCLTY
(
   HCP_SPCLTY_KEY       binary(16) not null  comment 'The EDS primary key for Healthcare Provider Specialty',
   HCP_KEY              binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP)',
   SPCLTY_CD            varchar(50)  comment 'The reference value or code value',
   SPCLTY_DESC          varchar(1000) default NULL  comment 'The reference value or code value description'
);

alter table EDS.SEARCH_HCP_SPCLTY
   add primary key (HCP_SPCLTY_KEY);

/*==============================================================*/
/* Table: SEARCH_HCP_VIRTUAL_ADDR                               */
/*==============================================================*/
create table EDS.SEARCH_HCP_VIRTUAL_ADDR
(
   HCP_VIRTUAL_ADDR_KEY binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP) Virtual Address',
   HCP_KEY              binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP)',
   VIRTUAL_ADDR_TYP_CD  varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_VAL     varchar(100)  comment 'The value for the Virtual Address',
   VIRTUAL_ADDR_EXT_VAL varchar(100)  comment 'An optional extended value for the virtual address (e.g. Phone Extension)'
);

alter table EDS.SEARCH_HCP_VIRTUAL_ADDR
   add primary key (HCP_VIRTUAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_MATL_ORG                                       */
/*==============================================================*/
create table EDS.SEARCH_MATL_ORG
(
   MATL_ORG_KEY         binary(16) not null  comment 'The EDS primary key for Material Organization',
   MATL_KEY             binary(16) not null  comment 'The EDS primary key for Material',
   ORG_KEY              binary(16) not null  comment 'The EDS primary key for Organization',
   REC_TYP_CD           varchar(50)  comment 'The EDS Record Type (Reference Value)',
   REC_SUBTYP_CD        varchar(50)  comment 'The EDS Record Subtype (Reference Value)'
);

alter table EDS.SEARCH_MATL_ORG
   add primary key (MATL_ORG_KEY);

/*==============================================================*/
/* Table: SEARCH_MATL_UOM                                       */
/*==============================================================*/
create table EDS.SEARCH_MATL_UOM
(
   MATL_UOM_KEY         binary(16) not null  comment 'The EDS primary key for Material Unit of Measure',
   MATL_KEY             binary(16) not null  comment 'The EDS primary key for Material',
   UOM_CD               varchar(50)  comment 'The Unit of Measure for the Material (Reference Value)',
   GTIN_VAL             varchar(14)  comment 'Global Trade Item Number'
);

alter table EDS.SEARCH_MATL_UOM
   add primary key (MATL_UOM_KEY);

/*==============================================================*/
/* Table: SEARCH_ORG                                            */
/*==============================================================*/
create table EDS.SEARCH_ORG
(
   ORG_KEY              binary(16) not null  comment 'The EDS primary key for Organization',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   ORG_LONG_NM          varchar(100)  comment 'The long name for the Organization',
   NPI_VAL              varchar(250) default NULL  comment 'The alternate identifier value for the Organization (e.g. Tax ID, DUNS Number)',
   REC_TYP_CD           varchar(50)  comment 'The reference value or code value',
   REC_SUBTYP_CD        varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_ORG
   add primary key (ORG_KEY);

/*==============================================================*/
/* Table: SEARCH_PATIENT                                        */
/*==============================================================*/
create table EDS.SEARCH_PATIENT
(
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   FIRST_NM             varchar(50) default NULL  comment 'The first name of the Person, in all capital letters',
   MIDDLE_NM            varchar(50) default NULL  comment 'The middle name of the Person, in all capital letters',
   LAST_NM              varchar(50) default NULL  comment 'The last name of the Person, in all capital letters',
   ORIG_NATION_CD       varchar(250)  comment 'The unique identifier for this record from the Source',
   BIRTH_DT             date default NULL  comment 'Date of birth',
   DECEASED_IND_CD      varchar(50)  comment 'The reference value or code value',
   GENDER_CD            varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_PATIENT
   add primary key (PATIENT_KEY);

/*==============================================================*/
/* Index: IDX_SOURCE_ID                                         */
/*==============================================================*/
create index IDX_SOURCE_ID on EDS.SEARCH_PATIENT
(
   SOURCE_ID
);

/*==============================================================*/
/* Index: IDX_FIRST_NM                                          */
/*==============================================================*/
create index IDX_FIRST_NM on EDS.SEARCH_PATIENT
(
   FIRST_NM
);

/*==============================================================*/
/* Index: IDX_LAST_NM                                           */
/*==============================================================*/
create index IDX_LAST_NM on EDS.SEARCH_PATIENT
(
   LAST_NM
);

/*==============================================================*/
/* Index: IDX_MIDDLE_NM                                         */
/*==============================================================*/
create index IDX_MIDDLE_NM on EDS.SEARCH_PATIENT
(
   MIDDLE_NM
);

/*==============================================================*/
/* Index: IDX_ORIG_NATION_CD                                    */
/*==============================================================*/
create index IDX_ORIG_NATION_CD on EDS.SEARCH_PATIENT
(
   ORIG_NATION_CD
);

/*==============================================================*/
/* Index: IDX_BIRTH_DT                                          */
/*==============================================================*/
create index IDX_BIRTH_DT on EDS.SEARCH_PATIENT
(
   BIRTH_DT
);

/*==============================================================*/
/* Index: IDX_DECEASED_IND_CD                                   */
/*==============================================================*/
create index IDX_DECEASED_IND_CD on EDS.SEARCH_PATIENT
(
   DECEASED_IND_CD
);

/*==============================================================*/
/* Index: IDX_GENDER_CD                                         */
/*==============================================================*/
create index IDX_GENDER_CD on EDS.SEARCH_PATIENT
(
   GENDER_CD
);

/*==============================================================*/
/* Table: SEARCH_PATIENT_ALT_ID                                 */
/*==============================================================*/
create table EDS.SEARCH_PATIENT_ALT_ID
(
   PATIENT_ALT_ID_KEY   binary(16) not null  comment 'The EDS primary key for Patient Alternate Identifier',
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   ALT_ID_TYP_CD        varchar(50)  comment 'The reference value or code value',
   ALT_ID_VAL           varchar(250) default NULL  comment 'The alternate identifier value for the Person (e.g. SSN, Drivers License Number)'
);

alter table EDS.SEARCH_PATIENT_ALT_ID
   add primary key (PATIENT_ALT_ID_KEY);

/*==============================================================*/
/* Table: SEARCH_PATIENT_POSTAL_ADDR                            */
/*==============================================================*/
create table EDS.SEARCH_PATIENT_POSTAL_ADDR
(
   PATIENT_POSTAL_ADDR_KEY binary(16) not null  comment 'The EDS primary key for Patient Postal Address',
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   LN1_VAL              varchar(500)  comment 'The first line of the postal address',
   LN2_VAL              varchar(500) default NULL  comment 'The second line of the postal address',
   LN3_VAL              varchar(500) default NULL  comment 'The third line of the postal address',
   LN4_VAL              varchar(500) default NULL  comment 'The fourth line of the postal address',
   LN5_VAL              varchar(500) default NULL  comment 'The fifth line of the postal address',
   CITY_NM              varchar(50)  comment 'The name of the City used on the Postal Address',
   POSTAL_CD            varchar(20)  comment 'The Postal Code used on the Postal Address',
   CNTRY_CD             varchar(50)  comment 'The short name for the Place',
   CNTRY_NM             varchar(100) default NULL  comment 'The long name for the Place',
   REGION_CD            varchar(50) default NULL  comment 'The short name for the Place',
   REGION_NM            varchar(100) default NULL  comment 'The long name for the Place'
);

alter table EDS.SEARCH_PATIENT_POSTAL_ADDR
   add primary key (PATIENT_POSTAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_PATIENT_VIRTUAL_ADDR                           */
/*==============================================================*/
create table EDS.SEARCH_PATIENT_VIRTUAL_ADDR
(
   PATIENT_VIRTUAL_ADDR_KEY binary(16) not null  comment 'The EDS primary key for Patient Virtual Address',
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   VIRTUAL_ADDR_TYP_CD  varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_USAGE_CD varchar(50)  comment 'The reference value or code value',
   VIRTUAL_ADDR_VAL     varchar(100)  comment 'The value for the Virtual Address',
   VIRTUAL_ADDR_EXT_VAL varchar(100) default NULL  comment 'An optional extended value for the virtual address (e.g. Phone Extension)'
);

alter table EDS.SEARCH_PATIENT_VIRTUAL_ADDR
   add primary key (PATIENT_VIRTUAL_ADDR_KEY);

/*==============================================================*/
/* Table: SEARCH_PROC                                           */
/*==============================================================*/
create table EDS.SEARCH_PROC
(
   MEDL_EVNT_KEY        binary(16) not null  comment 'The EDS primary key for Medical Event',
   PATIENT_KEY          binary(16) not null  comment 'The EDS primary key for Patient',
   HCO_FCLTY_KEY        binary(16)  comment 'The EDS primary key for Healthcare Organization (HCO) Facility',
   DIV_ORG_KEY          binary(16)  comment 'The EDS primary key for Organization (Division)',
   SOURCE_ID            varchar(250)  comment 'The unique identifier for this record from the Source',
   SOURCE_CREATE_USER_VAL varchar(50) default NULL  comment 'The user that created this row in the Source',
   PROC_START_DT        date default NULL  comment 'The effectivity start date/time for this record'
);

alter table EDS.SEARCH_PROC
   add primary key (MEDL_EVNT_KEY);

/*==============================================================*/
/* Table: SEARCH_PROC_DEVICE                                    */
/*==============================================================*/
create table EDS.SEARCH_PROC_DEVICE
(
   PROC_DEVICE_INSTANCE_KEY binary(16) not null  comment 'The EDS primary key for Procedure Device Instance',
   MEDL_EVNT_KEY        binary(16) not null  comment 'The EDS primary key for Medical Event',
   DEVICE_INSTANCE_KEY  binary(16) not null  comment 'The EDS primary key for Device Instance',
   REC_TYP_CD           varchar(50)  comment 'The reference value or code value',
   REC_SUBTYP_CD        varchar(50)  comment 'The reference value or code value',
   ACT_TYP_CD           varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_PROC_DEVICE
   add primary key (PROC_DEVICE_INSTANCE_KEY);

/*==============================================================*/
/* Table: SEARCH_PROC_HCP                                       */
/*==============================================================*/
create table EDS.SEARCH_PROC_HCP
(
   PROC_HCP_KEY         binary(16) not null  comment 'The EDS primary key for Procedure Healthcare Professional (HCP)',
   MEDL_EVNT_KEY        binary(16) not null  comment 'The EDS primary key for Medical Event',
   HCP_KEY              binary(16) not null  comment 'The EDS primary key for Healthcare Professional (HCP)',
   REC_TYP_CD           varchar(50)  comment 'The reference value or code value'
);

alter table EDS.SEARCH_PROC_HCP
   add primary key (PROC_HCP_KEY);


