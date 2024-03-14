#!/bin/bash

# Misconfigure the API server's secure port
sed -i 's/secure-port=6443/secure-port=16443/g' /etc/kubernetes/manifests/kube-apiserver.yaml
systemctl restart kubelet