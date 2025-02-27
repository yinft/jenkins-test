FROM openjdk:8
WORKDIR /app
COPY target/*.jar /app/jenkins-test.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "jenkins-test.jar"]