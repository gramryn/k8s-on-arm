#!/bin/bash 
kubectl create serviceaccount spark -n kubernetes-dashboard
kubectl create clusterrolebinding spark-admin -n kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:spark
kubectl get secret $(kubectl get serviceaccount spark -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kubernetes-dashboard | base64 --decode
