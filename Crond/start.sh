#!/bin/sh

mkdir -p /opt/crond
cp -r ./docker.sh /opt/crond/docker.sh
chmod +x /opt/crond/docker.sh

procName=cron
procNumber=$(ps -ef | grep $procName | grep -v grep | wc -l)
if [ $procNumber -le 0 ]; then
    echo "$procName is not run"
    systemctl start $procName
else
    echo "$procName is run"
fi

crontab rootcron
