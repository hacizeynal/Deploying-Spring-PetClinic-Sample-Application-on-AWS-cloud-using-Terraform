#!/bin/bash
hostname APPLICATION
apt-get update
apt-get upgrade -y
apt-get install default-jre -y
apt-get install maven -y
apt-get install git -y
cd home/ubuntu 
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
sudo sed -i "s/localhost/10.20.15.200:3306/g" src/main/resources/application-mysql.properties
# sudo sh -c "echo 'management.endpoint.health.group.custom.include=diskSpace,ping' >> src/main/resources/application.properties"
sudo sh -c "echo 'management.endpoint.health.group.custom.status.http-mapping.up=207' >> src/main/resources/application.properties"
mvn spring-boot:run -Dspring-boot.run.profiles=mysql
