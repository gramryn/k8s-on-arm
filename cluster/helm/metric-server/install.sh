#!/bin/bash
helm install stable/metrics-server \
-n metrics-server \
--namespace kube-system \
-f values.yaml