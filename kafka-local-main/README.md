# Introduction

* This project is to provide a complete ecosystem to do local Kafka development w/out the need to connect to external systems.

* There are around 20 containers that can be started, but you can pick and choose what you need to start.

* Scripts

  * `bin/up.sh` will start everything.

  * `bin/stop.sh` will shutdown everything.

* Each directory has its own `docker-compose.yml` and its own docker-compose project defined in the `.env` property file.

  * this makes it easy to start/stop only what you need.
  
  * the `network` project establishes a shared network that is used by all of the compose files.
  
  * to start a specific module
  
    * `cd ./{directory}`
    * `docker-compose up -d`
  
# network

  * This project creates a common network that all docker images will use. This allows them to be able to network together. 

  * Run `docker network create kafka-local` before starting everything in order to create a network.
  
  * the network can only be stopped if no containers are up and using it.
  
# cluster

  * This is the `Apache Kafka Cluster` and is the core pieces needed for working with Kafka Brokers
  
  * 1 Zookeeper
  
  * 4 Brokers
  
  * 1 Schema Registry
  
  * If you are running on a machine with limited resources, removing of `broker-4` is fine.
  
  * Having 4 brokers showcases how Kafka works better, in that most topics have a replication factor of 3,
  and this showcases that some brokers do not have any data for a given partition of a topic.
  
  * Only one zookeeper is provided, in an actual setup we would have 3 or 5 zookeepers.
  
  * Only one schema registry is provided, in an actual setup we would have 2 for high-availability reasons.
  
# monitoring

  * this is an optional set of containers to monitor the health of Kafka
  
  * Grafana provides a dashboard to monitoring the Kafka metrics.
  
    * `http://localhost:3000`
    
    * username: `admin`
    
    * password: `grafana`
  
  * AKHQ provides a UI to Kafka for viewing and editing configurations and even publishing and consuming
  messages.
  
    * `http://localhost:3000`
    
    * username: `admin`
    
    * password: `akhq`
  
# connect

 * connect is a 2 container distributed cluster.
 
 * the image is a a custom-built image extending from the confluent base image. It removes that connectors not of interest,
 so improve startup time.  It also adds in the mysql and oracle drivers to the jdbc connector.
 
# ksqlDB

 * a single KSQL Server and KSQL Command Line Container
 
 * to access the command line interface
 
   ```
   docker exec -it kl_ksql-client bash
   % ksql http://ksql-server:8088
   ```

# elasticsearch

 * provides elasticsearch and kibana containers

# mysql

 * provides a MySQL database with bin-log enabled
  
 * see Debeizum connector in connectors for accessing data with CDC.

# oracle

 * provides an Oracle database with logminer enabled
 
 * see kafka-connect-logminer in connectors for accessing data with CDC.
 
 * the Oracle container must be built, see [README](./oracle/README.md). Oracle licensing prevents a container from being
 pre-built.

# connectors

 * the connector project provides command line access to create/delete connectors.
 
 * connector must be built within the _connect container_ or provided in the `connect-lib` directory.
 
 * currently, the connector has the jdbc connectors with mysql and oracle drivers added,
 elastic search, and debezium CDC connector.
 
 * use confluent-hub to install additional connectors, or have them build and placed in the `connect-lib` directory.
 
 
