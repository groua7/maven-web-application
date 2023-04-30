#!/bin/bash
# ubuntu 18.04
sudo apt update -y
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
sudo docker network create -d bridge mynw
sudo docker run -d -p 8080:8080 --name springapp  \
-e MONGO_DB_HOSTNAME=mongo -e MONGO_DB_USERNAME=devdb \
-e MONGO_DB_PASSWORD=devdb1234 --network mynw  mylandmarktech/spring-boot-mongo 
sudo docker run -d --name mongo -e MONGO_INITDB_ROOT_USERNAME=devdb \
-e MONGO_INITDB_ROOT_PASSWORD=devdb1234  --network mynw mongo

