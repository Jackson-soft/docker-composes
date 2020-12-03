#!/bin/sh

cp -r ./Crond /opt/crond

procName=cron
procNumber=$(ps -ef | grep $procName | grep -v grep | wc -l)
if [ $procNumber -le 0 ]; then
    echo "$procName is not run"
    systemctl start $procName
else
    echo "$procName is run"
fi

echo "* * * * * /bin/sh /opt/crond/service.sh" >>/var/spool/cron/root
