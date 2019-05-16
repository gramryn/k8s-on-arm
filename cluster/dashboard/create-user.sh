#!/bin/bash 
kubectl create serviceaccount leonardo -n kube-system
kubectl create clusterrolebinding leonardo -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:leonardo
kubectl get secret $(kubectl get serviceaccount leonardo -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kube-system | base64 --decode
