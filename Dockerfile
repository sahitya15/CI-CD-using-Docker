FROM tomcat:latest

LABEL maintainer="sahitya"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

