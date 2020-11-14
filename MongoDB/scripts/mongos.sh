#!/bin/bash

mongodb1=$(getent hosts ${MONGO1} | awk '{ print $1 }')

port=${PORT:-27017}

echo "Waiting for startup.."
until mongo --host ${mongodb1}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
    printf '.'
    sleep 1
done

echo "Started.."

echo setup.sh time now: $(date +"%T")
mongo --host ${mongodb1}:${port} --eval 'sh.addShard("BigBoss/172.18.5.10:27017,172.18.5.10:27017,172.18.5.10:27017")'
