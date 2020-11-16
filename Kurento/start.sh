#!/bin/sh

if [ -z "$REAL_EXTERNAL_IP" ]; then
	export REAL_EXTERNAL_IP="$(curl -4 https://icanhazip.com 2>/dev/null)"
fi

docker-compose up -d
