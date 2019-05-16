kubeadm config images pull
# for flannel
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-cert-extra-sans=k8s.cluster.camp,api.k8s.cluster.camp
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config