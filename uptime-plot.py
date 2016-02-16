import datetime
import matplotlib.pyplot as plt
from matplotlib.dates import DayLocator, HourLocator, DateFormatter, drange
from numpy import arange
import time
#import numpy as np

file=open("uptime.txt")
datesDict={} # I just need an empty dictionary.
for line in file:
    dateString=" ".join(line.split()[0:6]) # My file has date and uptime. I just need the date here with whitespaces
    date=time.strptime(dateString,"%a %b %d %H:%M:%S %Z %Y") # then I convert into a properly formatted date.
    # So, the date will be a dictionary. The key will be TWO tuples: one with with year and month and day, second with hour
    # and the number of occurrences (uptime) will be the value
    dateKey=(((date[0],date[1],date[2]),date[3]))
    if not datesDict.has_key(dateKey):
        datesDict[dateKey]=1 
    else:
        datesDict[dateKey]=datesDict[dateKey]+1

# Now I 
        
datesList=datesDict.items() # I can't sort dictionaries, so I make a list out of it.
datesList.sort()

# date=datesList[x][0][0]

#for i in datesList:
date1=datetime.datetime(datesList[0][0][0][0],datesList[0][0][0][1],datesList[0][0][0][2])
date2=datetime.datetime(datesList[10][0][0][0],datesList[10][0][0][1],datesList[10][0][0][2])
date3=datetime.datetime(datesList[50][0][0][0],datesList[50][0][0][1],datesList[50][0][0][2])


#date1 = datetime.datetime(2000, 3, 2)
#date2 = datetime.datetime(2000, 3, 6)
delta = datetime.timedelta(hours=6)
dates = drange(date1, date2, delta)

y = [datesList[0][1],datesList[10][1],datesList[50][1]]

fig, ax = plt.subplots()
ax.plot_date(dates, y*y)

# this is superfluous, since the autoscaler should get it right, but
# use date2num and num2date to convert between dates and floats if
# you want; both date2num and num2date convert an instance or sequence
ax.set_xlim(dates[0], dates[-1])

# The hour locator takes the hour or sequence of hours you want to
# tick, not the base multiple

ax.xaxis.set_major_locator(DayLocator())
ax.xaxis.set_minor_locator(HourLocator(arange(0, 25, 6)))
ax.xaxis.set_major_formatter(DateFormatter('%Y-%m-%d'))

ax.fmt_xdata = DateFormatter('%Y-%m-%d %H:%M:%S')
fig.autofmt_xdate()

plt.show()
