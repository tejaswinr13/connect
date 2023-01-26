#FROM ${BASE_IMAGE} as base
#COPY . .
#RUN ./gradlew assemble --no-daemon
FROM openjdk:11-jdk-slim AS build

WORKDIR /app

RUN \
    apt-get update && \
    apt-get install -y curl && \
    curl -k -l -o jmx_prometheus_javaagent.jar https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.14.0/jmx_prometheus_javaagent-0.14.0.jar


FROM openjdk:11-jdk-slim


# copy jar from build image
#COPY --from=base /centevent-router/build/libs/-1.0.0.jar /app/app.jar
#COPY ../../enterprise-streams/streams-mulesoft-ingestion/build/libs/streams-mulesoft-ingestion-1.0.0-SNAPSHOT.jar /app.jar
COPY ./streams-mulesoft-ingestion-1.0.0-SNAPSHOT.jar /app.jar
#COPY ./jmx_prometheus_javaagent.jar /
COPY ./streams-config.yml /

#https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.14.0/jmx_prometheus_javaagent-0.14.0.jar

COPY --from=build /app/jmx_prometheus_javaagent.jar /
ENTRYPOINT ["java"]
CMD ["-javaagent:/jmx_prometheus_javaagent.jar=7071:/streams-config.yml", "-jar", "/app.jar", "--spring.profiles.active=local-docker"]
