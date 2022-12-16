#!/bin/bash
sudo hostname APPLICATION
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install default-jre -y
sudo apt-get install maven -y
sudo apt-get install git -y
cd home/ubuntu
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic


# ./mvnw package
# CMD ["java", "-Dspring.profiles.active=mysql", "-jar", "/spring-petclinic.jar"]