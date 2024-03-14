#!/bin/bash

echo "Starting ETCD configuration and health verification..."

# Path to the ETCD manifest
ETCD_MANIFEST="/etc/kubernetes/manifests/etcd.yaml"

# Verify if the ETCD peer certificate path is correctly configured
if grep -q "/etc/kubernetes/pki/etcd/peer.crt" "$ETCD_MANIFEST"; then
    echo "ETCD peer certificate path is correctly configured in $ETCD_MANIFEST."

    # Verify ETCD cluster health
    if ETCDCTL_API=3 etcdctl endpoint health \
        --endpoints=https://127.0.0.1:2379 \
        --cert=/etc/kubernetes/pki/etcd/server.crt \
        --key=/etc/kubernetes/pki/etcd/server.key \
        --cacert=/etc/kubernetes/pki/etcd/ca.crt; then
        echo "ETCD cluster is healthy."
        exit 0
    else
        echo "ETCD cluster health check failed. Please check ETCD cluster status and configuration."
        exit 1
    fi
else
    echo "ETCD peer certificate path is NOT correctly configured in $ETCD_MANIFEST. Please correct the path to /etc/kubernetes/pki/etcd/peer.crt."
    exit 1
fi
