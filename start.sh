#!/bin/sh

cp -r ./Crond /opt/crond
systemctl is-active cron
