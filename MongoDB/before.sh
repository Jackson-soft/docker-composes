#!/bin/bash

chmod +x scripts/setup.sh
chmod +x scripts/config.sh
chmod +x scripts/mongos.sh

chmod 400 keyfiles/primary/mongo.key
chown 999 keyfiles/primary/mongo.key

chmod 400 keyfiles/secondary0/mongo.key
chown 999 keyfiles/secondary0/mongo.key

chmod 400 keyfiles/secondary1/mongo.key
chown 999 keyfiles/secondary1/mongo.key

chmod 400 keyfiles/configsvr0/mongo.key
chown 999 keyfiles/configsvr0/mongo.key

chmod 400 keyfiles/configsvr1/mongo.key
chown 999 keyfiles/configsvr1/mongo.key

chmod 400 keyfiles/configsvr2/mongo.key
chown 999 keyfiles/configsvr2/mongo.key

chmod 400 keyfiles/mongos/mongo.key
chown 999 keyfiles/mongos/mongo.key