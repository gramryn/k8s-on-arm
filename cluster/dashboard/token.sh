#kubectl get secret $(kubectl get serviceaccount kubernetes-dashboard -n kubernetes-dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kubernetes-dashboard | base64 --decode
kubectl describe secret/$(kubectl get secret -n kubernetes-dashboard |grep admin|awk '{print $1}') -n kubernetes-dashboard
