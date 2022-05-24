FROM openjdk:17-jdk-alpine as build
WORKDIR /app
COPY . .
RUN ./mvnw clean package 

FROM openjdk:17-jdk-alpine as release
COPY --from=build /app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]