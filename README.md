# kubernetes-arm64

Install k3s cluster on nanopi t4

## Operating System

### Initial Node Network

```bash
$ sudo cp network/99-wlan /etc/NetworkManager/dispatcher.d/
$ mkdir -p /var/k3s
$ sudo cp network/resolv.conf /var/k3s/
```

## Setup Kubernetes Cluster

### Install Master

```bash
$ curl -sfL https://get.k3s.io | K3S_NAME=amazon sh -
```

### Install Node

- Get Token on Master

```bash
$ sudo cat /var/lib/rancher/k3s/server/node-token
```

```bash
$ curl -sfL https://get.k3s.io | K3S_URL=https://192.168.0.10:6443 K3S_TOKEN=<<token>> sh -
```

### Install Dashboard

```bash
$ kubectl create serviceaccount leonardo -n kube-system
$ kubectl create clusterrolebinding leonardo -n kube-system --clusterrole=cluster-admin --serviceaccount=kube-system:leonardo
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended/kubernetes-dashboard.yaml
$ kubectl patch deployment kubernetes-dashboard -n kube-system — patch ‘{“spec”: {“template”: {“spec”: {“nodeSelector”: {“beta.kubernetes.io/arch”: “arm64”}}}}}’
$ kubectl proxy
$ open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
```

### Staorage Class

#### NFS-Client Provisioner

- Install nfs-common on all node

```bash
$ sudo apt-get install nfs-common
```

- Deploy

```bash
$ git clone https://github.com/kubernetes-incubator/external-storage.git
# Set the subject of the RBAC objects to the current namespace where the provisioner is being deployed
$ NS=$(kubectl config get-contexts|grep -e "^\*" |awk '{print $5}')
$ NAMESPACE=${NS:-default}
$ sed -i'' "s/namespace:.*/namespace: $NAMESPACE/g" ./deploy/rbac.yaml
$ kubectl create -f deploy/rbac.yaml
```

#### local-path Provisioner

```bash
$ storage-class/install-localpath.sh
```
