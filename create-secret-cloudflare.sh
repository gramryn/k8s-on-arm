#!/bin/bash

echo "Please enter your CloudFlare Key";
read key;

echo "Please enter your CloudFlare Email";
read email;

echo "Creating secret"
kubectl create secret generic cloudflare -n kube-system --from-literal=key=${key} --from-literal=email=${email}
