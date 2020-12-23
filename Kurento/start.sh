#!/bin/sh

if [ -z "$REAL_EXTERNAL_IP" ]; then
    echo "REAL_EXTERNAL_IP=\"$(curl -4 https://icanhazip.com 2>/dev/null)\"" >./.env
fi
