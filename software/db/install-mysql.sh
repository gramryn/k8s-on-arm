kubectl apply -f mysql-claim.yaml -n springcloud
helm install --name mysql --namespace springcloud -f mysql.yaml stable/mysql