#FROM eclipse-temurin:17.0.8_7-jre as base
#WORKDIR /app
#
#FROM gradle:7-jdk as base
#
#ADD src src
#ADD build.gradle .
#ADD gradle/wrapper/gradle-wrapper.properties .
#
#FROM openjdk:17-jdk-alpine
#ARG BUILD_VERSION
#
#FROM base as test
#RUN gradle test
#
#FROM base as development
#CMD ["./gradle", "bootRun"]
#
#FROM base as build
#RUN ./gradle package
#
#FROM eclipse-temurin:17.0.8_7-jre as production
#EXPOSE 8080
#WORKDIR /opt/app
#COPY build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]


#FROM openjdk:11.0.7-jdk
#FROM openjdk:11.0.7-jdk
#RUN apt-get update && apt-get install -y unzip
#WORKDIR /gradle
#RUN curl -L https://services.gradle.org/distributions/gradle-6.5.1-bin.zip -o gradle-6.5.1-bin.zip
#RUN unzip gradle-6.5.1-bin.zip
#ENV GRADLE_HOME=/gradle/gradle-6.5.1
#ENV PATH=$PATH:$GRADLE_HOME/bin
#RUN gradle --version
#
#FROM eclipse-temurin:17.0.8_7-jre as production
#EXPOSE 8080
#WORKDIR /opt/app
#COPY build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]







## Set a variable that can be used in all stages.
#ARG BUILD_HOME=/gradle-docker-example
#
## Gradle image for the build stage.
#FROM gradle:7-jdk as build-image
#
## Set the working directory.
#ARG BUILD_HOME
#ENV APP_HOME=$BUILD_HOME
#WORKDIR $APP_HOME
#
## Copy the Gradle config, source code, and static analysis config
## into the build container.
#COPY --chown=gradle:gradle build.gradle settings.gradle $APP_HOME/
#COPY --chown=gradle:gradle src $APP_HOME/src
#COPY --chown=gradle:gradle config $APP_HOME/config
#
## Build the application.
#RUN gradle --no-daemon build
#
## Java image for the application to run in.
#FROM openjdk:17-jdk-alpine
#
## Copy the jar file in and name it app.jar.
#ARG BUILD_HOME
#ENV APP_HOME=$BUILD_HOME
#COPY build/libs/*.jar app.jar
#ADD gradlew .
#ADD build.gradle .
#
## The command to run when the container starts.
#ENTRYPOINT java -jar app.jar




FROM openjdk:8-jre-alpine
COPY tuneit-gradle-docker-1.0.jar /app/test_service.jar
ENTRYPOINT ["java"]
#COPY build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["-jar", "/app/test_service.jar"]
EXPOSE 8080