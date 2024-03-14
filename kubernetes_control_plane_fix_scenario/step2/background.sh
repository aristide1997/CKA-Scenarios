#!/bin/bash

# Introduce a misconfiguration in the etcd manifest
sed -i 's+/etc/kubernetes/pki/etcd/peer.crt+/etc/kubernetes/file/pki/etcd/peer.crt+' /etc/kubernetes/manifests/etcd.yaml
systemctl restart kubelet