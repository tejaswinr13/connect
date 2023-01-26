
CREATE USER 'replicator' IDENTIFIED BY 'replpass';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'replicator';

CREATE USER 'debezium' IDENTIFIED WITH mysql_native_password BY 'dbz';

GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT  ON *.* TO 'debezium';

#ALTER USER 'debezium'@'%' IDENTIFIED WITH mysql_native_password BY 'dbz';

CREATE DATABASE destination;

GRANT ALL PRIVILEGES ON destination.* TO 'mysqluser'@'%';

GRANT FILE on *.* to mysqluser@'%';


USE destination;
