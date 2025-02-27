FROM openjdk:8
WORKDIR /app
COPY target/*.jar /app/jenkins-test.jar
EXPOSE 8088
ENTRYPOINT ["java", "-jar", "jenkins-test-0.0.1-SNAPSHOT.jar"]