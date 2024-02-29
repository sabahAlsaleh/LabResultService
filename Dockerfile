FROM openjdk:17-jdk-alpine
EXPOSE 8081
COPY --from=build /home/app/target/LabResultService-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar

#COPY target/LabResultService-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]