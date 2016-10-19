#!/bin/bash
TEMP=$(/opt/vc/bin/vcgencmd measure_temp| sed 's/^temp=//' | cut -f1 -d"'")
UPTIME=$(cat /proc/uptime | cut -f1 -d.)
ACCESS_KEY=$(cat $HOME/.ssh/initialstate-accesskey)
KEY=$(cat $HOME/.ssh/initialstate-uptime-bucket)
ENV_TEMP=$(/home/pi/Devel/Solar/temperature.py | cut -f2 -d" ")
ENV_HUMIDITY=$(/home/pi/Devel/Solar/temperature.py | cut -f5 -d" ")

#date -u +"%Y-%m-%dT%H:%M:%SZ"

#http://support.initialstate.com/knowledgebase/articles/590091-how-to-stream-events-via-restful-api

echo "insert into solaruptime values(strftime('%Y-%m-%d','now'),strftime('%H:%M','now'),\"$UPTIME\");" | sqlite3 ~/Devel/Solar/uptime.db
curl 'https://groker.initialstate.com/api/events?accessKey='$ACCESS_KEY'&bucketKey='$KEY'&Uptime='$UPTIME'&Temp='$TEMP'&Env_Temp='$ENV_TEMP'&Humidity='$ENV_HUMIDITY

