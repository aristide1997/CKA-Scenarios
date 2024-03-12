#!/bin/bash

# Check if the etcd data has been restored correctly
if [ -d "/var/lib/etcd-restore" ] && grep -q '/var/lib/etcd-restore' /etc/kubernetes/manifests/etcd.yaml; then
    echo "Etcd data restoration verified."
    exit 0
else
    echo "Etcd data restoration not verified."
    exit 1
fi