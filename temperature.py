#!/usr/bin/python
import sys
import Adafruit_DHT

for i in range(1,10):
#while True:

    humidity, temperature = Adafruit_DHT.read_retry(11, 4)

    print 'Temp: {0:0.1f} C  Humidity: {1:0.1f} %'.format(temperature, humidity)
