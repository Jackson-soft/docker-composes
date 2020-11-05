#!/bin/bash

chmod +x scripts/setup.sh

chmod 400 keyfiles/primary/mongo.key
chown 999 keyfiles/primary/mongo.key

chmod 400 keyfiles/secondary0/mongo.key
chown 999 keyfiles/secondary0/mongo.key

chmod 400 keyfiles/secondary1/mongo.key
chown 999 keyfiles/secondary1/mongo.key
