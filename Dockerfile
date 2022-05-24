# Burayı base image olarak kullanıyoruz. Proje burada derlenir.
FROM maven:3.8.5-openjdk-17-slim as build  

# Oluşturulacak container üzerinde /app isminde bir klasör oluşturuyoruz.
WORKDIR /app

# Projemizin kaynak kodlarını bu imajın içine atıyoruz.
COPY . .

# Buradaki komut ile projemizi derliyoruz.
RUN mvn clean package 

# Burada uygulamamızın çalışacağı container imajını belirtiyoruz.
FROM openjdk:17-jdk-alpine as release

# Base imajdaki oluşan artifact dosyalarını uygulamanın çalışacağı imajın içerisine alıyoruz.
COPY --from=build /app/target/*.jar /app.jar

# container içerisinden dışarıya uygulamanın çalışacağı port numarasını belirtiyoruz.
EXPOSE 8080

# Uygulamanın ayaklanması için bu komutu veriyoruz.
ENTRYPOINT ["java","-jar","/app.jar"]