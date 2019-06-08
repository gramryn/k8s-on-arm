#!/bin/bash 
kubectl create serviceaccount clustercamp -n kube-system
kubectl create clusterrolebinding clustercamp -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:clustercamp
kubectl get secret $(kubectl get serviceaccount clustercamp -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kube-system | base64 --decode
