FROM ubuntu 
WORKDIR api/ 
COPY . . 
RUN apt update -y 
RUN apt install maven -y 
RUN apt update -y 
RUN mvn clean package
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.120/bin/apache-tomcat-9.0.120.tar.gz /api/
RUN tar -xzf apache-tomcat-9.0.120.tar.gz && \
    mv apache-tomcat-9.0.120 tomcat
COPY --from=builder /app/target/*.war /app/tomcat/webapps/
CMD ["/app/tomcat/bin/catalina.sh", "run"]
