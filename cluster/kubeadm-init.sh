#!/bin/bash
kubeadm config images pull
# for flannel
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-cert-extra-sans=api.cluster.camp
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubeadm join 192.168.0.10:6443 --token s73xhw.o2va5r2s0umlpfen \
    --discovery-token-ca-cert-hash sha256:4f7507934d426e02319db398fa018640f23436e57349cb6bc39533b27621289a