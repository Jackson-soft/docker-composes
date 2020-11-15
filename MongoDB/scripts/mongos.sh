#!/bin/bash

mongodb1=$(getent hosts ${MONGO1} | awk '{ print $1 }')

port=${PORT:-27018}

echo "Waiting for startup.."
until mongo --port ${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
    printf '.'
    sleep 1
done

echo "Started.."

echo setup.sh time now: $(date +"%T")
mongo --port ${port} <<EOF
    sh.addShard("BigBoss/mongodb-primary:27017,mongodb-secondary1:27017,mongodb-secondary1:27017");
    sh.status();
EOF
