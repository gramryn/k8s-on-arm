#!/bin/bash

# see script.fex and board schematics for GPIO mappings
# i.e.GPIO12 = PA07 = Pin 29 on 40-pin header
GPIO=12
# "critical" temperature value, no hysteresis for simplicity
TEMP=75

echo $GPIO > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio${GPIO}/direction

while true; do
  if [[ $(cat /sys/class/thermal/thermal_zone0/temp) -gt $TEMP ]]; then
    echo 1 > /sys/class/gpio/gpio${GPIO}/value
  else
    echo 0 > /sys/class/gpio/gpio${GPIO}/value
  fi
  sleep 10
done