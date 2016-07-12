#!/bin/bash
UPTIME=$(cat /proc/uptime | cut -f1 -d.)
ACCESS_KEY=$(cat $HOME/.ssh/initialstate-accesskey)
KEY=$(cat $HOME/.ssh/initialstate-uptime-bucket)

echo "insert into solaruptime values(strftime('%Y-%m-%d','now'),strftime('%H:%M','now'),\"$UPTIME\");" | sqlite3 ~/Devel/Solar/uptime.db
curl 'https://groker.initialstate.com/api/events?accessKey='$ACCESS_KEY'&bucketKey='$KEY'&Uptime='$UPTIME

