#!/bin/bash

# Check kube-apiserver configuration and ensure it's running without errors by performing a kubectl operation
if grep -q 'secure-port=6443' /etc/kubernetes/manifests/kube-apiserver.yaml; then
    # Attempt to list nodes as a simple operation to verify API server responsiveness
    if kubectl get nodes > /dev/null 2>&1; then
        echo "API server is operational."
        exit 0
    else
        echo "API server might be running, but there's an issue with handling requests."
        exit 1
    fi
else
    echo "API server secure port is not configured as expected."
    exit 1
fi
