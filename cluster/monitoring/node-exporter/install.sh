helm install --name metric -f values.yaml stable/prometheus-node-exporter


cat /sys/devices/virtual/thermal/thermal_zone0/temp