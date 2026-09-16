FROM ubuntu 
WORKDIR api/ 
COPY . . 
RUN apt update -y 
RUN apt install maven -y 
RUN apt update -y 
RUN mvn clean package
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.122/bin/apache-tomcat-9.0.122.tar.gz /api/
RUN tar -xzf apache-tomcat-9.0.122.tar.gz && \
    mv apache-tomcat-9.0.122 tomcat
RUN cp /api/target/*.war /api/tomcat/webapps/
CMD ["/api/tomcat/bin/catalina.sh", "run"]
