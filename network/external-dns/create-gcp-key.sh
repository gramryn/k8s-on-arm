kubectl create secret generic cloud-dns-key -n kube-system --from-file=key.json=$HOME/Development/Camp/clouds-secrets/clustercamp-dynamic-dns.json