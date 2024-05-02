FROM eclipse-temurin:21-jre-jammy
COPY target/app-spring-boot2-0.0.1-SNAPSHOT.jar ./spring-app.jar
ENTRYPOINT ["java", "-jar","spring-app.jar"]
