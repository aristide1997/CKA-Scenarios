#!/bin/bash

# Check kube-apiserver configuration and ensure it's running without errors by performing a kubectl operation
if grep -q 'secure-port=6443' /etc/kubernetes/manifests/kube-apiserver.yaml; then
    if systemctl is-active --quiet kube-apiserver && kubectl get nodes > /dev/null 2>&1; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi
