FROM ubuntu 
WORKDIR api/ 
COPY . . 
RUN apt update -y 
RUN apt install maven -y 
RUN apt update -y 
RUN mvn clean package
CMD ["java", "-jar", "target/webapp-0.1.war"]
