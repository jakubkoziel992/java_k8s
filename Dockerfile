FROM maven:3.9-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY . .
RUN mvn clean package
RUN mv ./target/*.jar ./target/spring-app.jar


FROM eclipse-temurin:21-jre-jammy AS runner

RUN addgroup -g 500 myjavaapp &&  adduser -D  -u 501 -G myjavaapp myjavaapp
USER myjavaapp:myjavaapp

COPY --from=builder /app/target/spring-app.jar .
ENTRYPOINT ["java", "-jar","spring-app.jar"]
