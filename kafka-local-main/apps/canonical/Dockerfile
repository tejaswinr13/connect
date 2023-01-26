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

COPY ./streams-*-SNAPSHOT.jar /app.jar
COPY ./streams-config.yml /

COPY --from=build /app/jmx_prometheus_javaagent.jar /
ENTRYPOINT ["java"]
CMD ["-javaagent:/jmx_prometheus_javaagent.jar=7071:/streams-config.yml", "-jar", "/app.jar", "--spring.profiles.active=local-docker"]
