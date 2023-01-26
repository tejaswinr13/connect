
alter session set "_ORACLE_SCRIPT"=true;

commit;

create user KAFKA_MAIN identified by "KAFKA_MAIN_PASS";

GRANT CONNECT TO KAFKA_MAIN;
GRANT CONNECT, RESOURCE, DBA TO KAFKA_MAIN;
GRANT UNLIMITED TABLESPACE TO KAFKA_MAIN;

alter session set current_schema=KAFKA_MAIN;
alter session set nls_date_format='yyyy-mm-dd';
alter session set nls_timestamp_format='yyyy-mm-dd HH24:MI:SS.FF';
alter session set nls_timestamp_tz_format = 'YYYY-MM-DD HH24:MI:SS.FF';
