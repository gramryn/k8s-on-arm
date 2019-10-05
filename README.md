# kubernetes-arm64

Install kubernetes on sbc

## Work on linux 

### Change Machine Id
rm -f /etc/machine-id && rm /var/lib/dbus/machine-id && dbus-uuidgen --ensure=/etc/machine-id

### Change MAC
https://www.miniwebtool.com/mac-address-generator/
ifconfig eth0 down
ifconfig eth0 hw ether [mac]
ifconfig eth0 up

## All Node





### Docker 

```bash
apt-get update && apt-get install apt-transport-https ca-certificates curl software-properties-common

### Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

### Add Docker apt repository.
add-apt-repository \
  "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

## Install Docker CE.
apt-get update && apt-get install docker-ce

# Setup daemon.
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

mkdir -p /etc/systemd/system/docker.service.d

# Restart docker.
systemctl daemon-reload
systemctl restart docker
```

### Kube Component

```bash
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
```

* /var/lib/kubelet/kubeadm-flags.env
remove cni option 

systemctl daemon-reload
systemctl restart kubelet

## Setup Kubernetes Cluster

### Install Master

```bash
# kubeadm config images pull
# kubeadm init --pod-network-cidr=10.244.0.0/16 
# mkdir -p $HOME/.kube
# cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# chown $(id -u):$(id -g) $HOME/.kube/config
```

### Install Node



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
