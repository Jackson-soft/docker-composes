#!/bin/sh

if [ -z "$REAL_EXTERNAL_IP" ]; then
    echo "export REAL_EXTERNAL_IP=\"$(curl -4 https://icanhazip.com 2>/dev/null)\"" >>/etc/profile
fi

docker-compose up -d
