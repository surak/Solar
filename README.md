# Solar
My rig is:
 - 1x 180W 36V trina solar panel
 - 1x 180W 36V broken solar panel (I have no idea how much it generates)
 - Buck converter from 36V to 12V
 - Solar charger controller (12v)
 - 7amps 12v battery
 - Buck from 12v to usb
 - Raspberry Pi 2

I have been monitoring the uptime of the Raspberry PI 2 for half a year now, and the results are in the uptime.txt and uptime.db files. The uptime.db is a sqlite3 database with the table "solaruptime". It's a one-liner script that gets uptime and the current date, and adds to it. The uptime.txt is just some "echo date ; echo uptime" or something like that.
