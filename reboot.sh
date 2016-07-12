#!/bin/bash
ACCESS_KEY=$(cat $HOME/.ssh/initialstate-accesskey)
KEY=$(cat $HOME/.ssh/initialstate-uptime-bucket)

curl 'https://groker.initialstate.com/api/events?accessKey='$ACCESS_KEY'&bucketKey='$KEY'&Event=Boot'

