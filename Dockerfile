FROM tomcat:9.0-jdk17-temurin
LABEL maintainer="hieutoyhb@gmail.com"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/spring-boot-1.0.war /usr/local/tomcat/webapps/ROOT.war