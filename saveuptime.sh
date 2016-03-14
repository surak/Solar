#!/bin/bash
echo "insert into solaruptime values(datetime('now'),\"$(cat /proc/uptime | cut -f1 -d.)\");" | sqlite3 ~/Devel/Solar/uptime.db
