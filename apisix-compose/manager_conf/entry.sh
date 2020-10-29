#!/bin/sh

pwd=`pwd`

# config
cp ${pwd}/api/conf/conf_preview.json ${pwd}/conf.json

export APIX_ETCD_ENDPOINTS="192.17.5.11:2379"

export SYSLOG_HOST=127.0.0.1

if [[ "$unamestr" == 'Darwin' ]]; then
	sed -i '' -e "s%#syslogAddress#%`echo $SYSLOG_HOST`%g" ${pwd}/conf.json
else
	sed -i -e "s%#syslogAddress#%`echo $SYSLOG_HOST`%g" ${pwd}/conf.json
fi

cp ${pwd}/conf.json ${pwd}/api/conf/conf.json

cd /go/manager-api
exec ./manager-api