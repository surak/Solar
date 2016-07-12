#!/bin/bash
ACCESS_KEY=$(cat $HOME/.ssh/initialstate-accesskey)
KEY=$(cat $HOME/.ssh/initialstate-uptime-bucket)
REBOOT_DATE=$(date +%Y-%m-%d)
REBOOT_HOUR=$(date +%H:%M)
( sleep 30; curl 'https://groker.initialstate.com/api/events?accessKey='$ACCESS_KEY'&bucketKey='$KEY'&Event=Last%20Reboot:'$REBOOT_DATE'%20'$REBOOT_HOUR ) &
