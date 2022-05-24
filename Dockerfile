FROM maven:3.8.5-openjdk-17-slim as build
WORKDIR /app
COPY . .
RUN mvn clean package 

FROM openjdk:17-jdk-alpine as release
COPY --from=build /app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]