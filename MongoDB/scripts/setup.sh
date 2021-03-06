#!/bin/bash

mongodb=$(getent hosts ${MONGO} | awk '{ print $1 }')
ehost=${EHOST}
eport=${EPORT}
port=${PORT:-27017}

echo "Waiting for startup.."
until mongo --host ${mongodb}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
    printf '.'
    sleep 1
done

echo "Started.."

echo setup.sh time now: $(date +"%T")
mongo --host ${mongodb}:${port} -uroot -p${PASSWORD} --authenticationDatabase admin <<EOF
   var cfg = {
        "_id": "${RS}",
        "members": [
            {
                "_id": 0,
                "host": "${ehost}:${eport}"
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });
    use admin;
    db.createUser({user: "sa", pwd: "f9bd44806614!", roles: [{role: "root", db: "admin"}]});
EOF
