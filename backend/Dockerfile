FROM maven:3.8 AS maven

WORKDIR /app

COPY ./app /app

RUN mvn package

FROM adoptopenjdk:11-jdk-hotspot

WORKDIR /app
COPY --from=maven /app/target/letscodebyada-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "letscodebyada-0.0.1-SNAPSHOT.jar"]