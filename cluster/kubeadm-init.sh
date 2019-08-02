#!/bin/bash
kubeadm config images pull
# for flannel
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-cert-extra-sans=api.cluster.camp
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubeadm join 192.168.0.10:6443 --token rwd2k0.xkhca9cs0dkkg5ub \
    --discovery-token-ca-cert-hash sha256:7c5e0d1c47768bec6ee57d3f86f467feaaa972dd1dc40474cb15d131565b8417