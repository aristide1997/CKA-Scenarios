#!/bin/bash

# Get the IP address of the nginx-backend pod
backend_pod_ip=$(kubectl get pod -n backend nginx-backend -o jsonpath='{.status.podIP}')
echo "nginx-backend pod IP: $backend_pod_ip"

# Define a short timeout for wget (e.g., 5 seconds)
wget_timeout=5

# Test connectivity from the frontend namespace and capture the output
echo "Testing connectivity from frontend namespace..."
if ! output=$(kubectl run tmp-busybox-frontend --rm --attach --namespace=frontend --image=busybox --restart=Never -- sh -c "wget -T $wget_timeout -qO- $backend_pod_ip" 2>&1); then
    echo "Connectivity test from frontend namespace: FAILURE"
    echo "$output"
    exit 1
else
    echo "Connectivity test from frontend namespace: SUCCESS"
fi

# Test connectivity from the default namespace and capture the output
echo "Testing connectivity from default namespace..."
if ! output=$(kubectl run tmp-busybox-default --rm --attach --namespace=default --image=busybox --restart=Never -- sh -c "wget -T $wget_timeout -qO- $backend_pod_ip" 2>&1); then
    echo "Connectivity test from default namespace: SUCCESS (communication blocked as expected)"
else
    echo "Connectivity test from default namespace: FAILURE (expected to fail)"
    echo "$output"
    exit 1
fi

exit 0
