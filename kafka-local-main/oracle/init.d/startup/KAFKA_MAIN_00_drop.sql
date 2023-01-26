alter session set current_schema=KAFKA_MAIN;

BEGIN
    FOR cur_rec IN (SELECT object_name, object_type FROM all_objects WHERE OWNER = 'KAFKA_MAIN' AND object_type IN ('TABLE', 'VIEW', 'MATERIALIZED VIEW', 'PACKAGE', 'PROCEDURE', 'FUNCTION', 'SEQUENCE', 'SYNONYM', 'PACKAGE BODY' ))
   LOOP
BEGIN
    IF cur_rec.object_type = 'TABLE'
         THEN
EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '" CASCADE CONSTRAINTS';
ELSE
EXECUTE IMMEDIATE 'DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"';
END IF;
EXCEPTION
         WHEN OTHERS
         THEN
            DBMS_OUTPUT.put_line ('FAILED: DROP ' || cur_rec.object_type || ' "' || cur_rec.object_name || '"' );
END;
END LOOP;
FOR cur_rec IN (SELECT * FROM all_synonyms WHERE table_owner = 'KAFKA_MAIN')
   LOOP
BEGIN
EXECUTE IMMEDIATE 'DROP PUBLIC SYNONYM ' || cur_rec.synonym_name;
END;
END LOOP;
END;
/