#!/bin/sh

source /etc/profile

#添加本地执行路径
ttime=`date +"%Y-%m-%d %H:%M:%S"`
echo "detect process" $ttime

#启动一个循环，定时检查进程是否存在
server=`ps -ef | grep dockerd | grep -v grep`
if [ ! "$server" ]; then
        #如果不存在就重新启动
        echo 'server is down , restart'
        ps -ef | grep dockerd | grep -v grep | awk -F ' ' '{print "kill -9 " $2}' | sh
        sleep 3
        systemctl start docker
        #启动后沉睡10s
else
        echo 'server is ok'
fi