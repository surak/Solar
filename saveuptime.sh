#!/bin/bash
echo "insert into solaruptime values(strftime('%Y-%m-%d','now'),strftime('%H:%M','now'),\"$(cat /proc/uptime | cut -f1 -d.)\");" | sqlite3 ~/Devel/Solar/uptime.db
