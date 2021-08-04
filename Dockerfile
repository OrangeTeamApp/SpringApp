FROM maven:3.6.0-jdk-8 AS builder
COPY pom.xml /tmp/
COPY src /tmp/src
WORKDIR /tmp
RUN mvn clean package

FROM openjdk:8-jdk-alpine
COPY --from=builder "/tmp/target/SpringApp-1.0-SNAPSHOT.jar" /tmp/app.jar
WORKDIR /tmp
ENTRYPOINT ["java","-jar","/tmp/app.jar"]