#!/bin/sh
cpu=`cat /sys/devices/virtual/thermal/thermal_zone0/temp`
cpu=`expr $cpu / 1000`
gpu=`cat /sys/devices/virtual/thermal/thermal_zone1/temp`
gpu=`expr $gpu / 1000`

echo "node_cpu_temperature $cpu\nnode_gpu_temperature $gpu" > /var/lib/node_exporter/node_temperature.prom