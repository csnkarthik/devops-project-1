FROM openjdk:11-jdk-alpline
WORKDIR /app
COPY ./target/*.jar /app.jar

CMD ["java", "-jar", "app.jar"]