kubectl create ns network
kubectl create secret generic cloud-dns-key -n network --from-file=key.json=$HOME/Development/Home/clouds-secrets/clustercamp-dynamic-dns.json