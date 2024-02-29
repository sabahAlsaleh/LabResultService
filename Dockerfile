
# Build stage
FROM maven:3.8.1-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean install -DskipTests


# Package stage
FROM openjdk:17.0.1-jdk-slim
ENV SPRING_PROFILES_ACTIVE=docker
ENV SPRING_SERVER_PORT=8082
COPY --from=build /home/app/target/LabResultService-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]