FROM maven:3.9.4-eclipse-temurin-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -DskipTests clean package

FROM eclipse-temurin:11-jre
WORKDIR /app
COPY --from=build /app/target/news-cms.war .
COPY --from=build /app/target/dependency/webapp-runner.jar .
EXPOSE 8080
CMD ["java", "-jar", "webapp-runner.jar", "--port", "8080", "news-cms.war"]