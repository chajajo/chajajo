FROM adoptopenjdk/openjdk11
ARG JAR_FILE=target/*.war
COPY ${JAR_FILE} /app.war
ENTRYPOINT ["java","-jar","/app.war"]
EXPOSE 8080
