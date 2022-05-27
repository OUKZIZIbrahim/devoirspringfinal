FROM openjdk:17-alpine
COPY *.jar app.jar
EXPOSE 8088
ENTRYPOINT ["java", "-jar", "app.jar"]