#!/bin/bash

# Verify etcd is correctly configured and healthy
if grep -q "/etc/kubernetes/file/pki/etcd/peer.crt" /etc/kubernetes/manifests/etcd.yaml; then
    if systemctl is-active --quiet etcd && ETCDCTL_API=3 etcdctl endpoint health > /dev/null 2>&1; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi
