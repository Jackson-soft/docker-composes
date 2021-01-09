#!/bin/sh

docker-compose -p etcd -f docker-compose-etcd.yml up -d

docker-compose -p dashboard -f docker-compose-dashboard.yml up -d

docker-compose -p apisix -f docker-compose.yml up -d
