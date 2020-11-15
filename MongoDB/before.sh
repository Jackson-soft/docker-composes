#!/bin/bash

## Generate global auth key between cluster nodes
openssl rand -base64 756 > keyfile/mongo.key
chmod 400 keyfile/mongo.key
chown 999 keyfile/mongo.key

## Start the whole stack
docker-compose up -d 

## Config servers setup
docker exec -it mongo-configsvr0 sh -c "mongo --port 27017 < /scripts/configserver.js"

## Shard servers setup
docker exec -it mongodb-primary sh -c "mongo --port 27018 < /scripts/shard.js"

## Apply sharding configuration
sleep 15
docker exec -it mongos sh -c "mongo --port 27017 < /scripts/mongos.js"

## Enable admin account
#docker exec -it mongodbdocker_mongo-router-01_1 sh -c "mongo --port 27017 < /mongo-auth.init.js"