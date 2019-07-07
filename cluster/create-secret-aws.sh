#!/bin/bash

echo "Please enter your AWS Key";
read key;

echo "Please enter your AWS Secret";
read secret;

echo "Creating secret"
kubectl create secret generic aws -n kube-system --from-literal=key=${key} --from-literal=secret=${secret}
