
alter session set "_ORACLE_SCRIPT"=true;

commit;

create user RPL_MAIN identified by "RPL_MAIN_PASS";

GRANT CONNECT TO RPL_MAIN;
GRANT CONNECT, RESOURCE, DBA TO RPL_MAIN;
GRANT UNLIMITED TABLESPACE TO RPL_MAIN;

alter session set current_schema=RPL_MAIN;
alter session set nls_date_format='yyyy-mm-dd';
alter session set nls_timestamp_format='yyyy-mm-dd HH24:MI:SS.FF';
alter session set nls_timestamp_tz_format = 'YYYY-MM-DD HH24:MI:SS.FF';
