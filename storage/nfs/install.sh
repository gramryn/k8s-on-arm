#!/bin/bash
helm install \
 --name box \
 --namespace kube-system \
 --set nfs.server=192.168.0.200 \
 --set nfs.path=/nfs-storage \
 --set image.repository=quay.io/external_storage/nfs-client-provisioner-arm \
 stable/nfs-client-provisioner