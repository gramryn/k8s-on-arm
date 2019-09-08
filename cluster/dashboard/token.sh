kubectl get secret $(kubectl get serviceaccount default -n dashboard -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n dashboard | base64 --decode
