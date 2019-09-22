#!/bin/bash
kubeadm config images pull
# for flannel
kubeadm init --pod-network-cidr=10.244.0.0/16 

--apiserver-cert-extra-sans=k8s.cluster.camp

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubeadm join 192.168.1.10:6443 --token uaxvcu.uas9nf757nrrezkg \
    --discovery-token-ca-cert-hash sha256:ec41f65a26a386e270623507be7d4f020ecaed14bac22b546a74b9b38998a7e7