#!/bin/bash

# Introduce a misconfiguration in the etcd manifest
sed -i 's/--listen-client-urls=https:\/\/127.0.0.1:2379/--listen-client-urls=https:\/\/127.0.0.1:12379/g' /etc/kubernetes/manifests/etcd.yaml
systemctl restart kubelet