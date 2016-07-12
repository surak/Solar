#!/bin/bash
UPTIME=$(cat /proc/uptime | cut -f1 -d.)
ACCESS_KEY=$(cat $HOME/.ssh/initialstate-accesskey)
KEY=$(cat $HOME/.ssh/initialstate-uptime-bucket)

echo "insert into solaruptime values(strftime('%Y-%m-%d','now'),strftime('%H:%M','now'),\"$UPTIME\");" | sqlite3 ~/Devel/Solar/uptime.db
curl 'https://groker.initialstate.com/api/events?accessKey=S1yBbnK5usBUo2TXErEmIs89bfBq62Bj&bucketKey='$KEY'&Uptime='$UPTIME

