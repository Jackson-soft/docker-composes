#!/bin/bash

## Start the whole stack
docker-compose up -d

docker exec -it mongodb sh -c "mongo --port 27017 -uroot -p12^xH0 --authenticationDatabase admin < /scripts/auth.js"
