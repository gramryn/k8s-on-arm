#!/bin/bash
#kubectl create configmap prometheus-config --from-file prometheus.yaml -n kube-system
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml