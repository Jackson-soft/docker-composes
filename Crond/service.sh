#!/bin/sh

#检查进程是否存在
server=$(ps -ef | grep dockerd | grep -v grep)
if [ ! "$server" ]; then
    #如果不存在就重新启动
    echo 'docker service is down, restart'
    systemctl start docker
else
    echo 'docker service is ok'
fi
