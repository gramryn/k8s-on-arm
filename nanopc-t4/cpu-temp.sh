#!/bin/sh
temp=`cat /sys/devices/virtual/thermal/thermal_zone0/temp`
temp=`expr $temp / 1000`
echo "CPU_Temperature $temp" > /var/lib/node_exporter/cpu-temp.prom