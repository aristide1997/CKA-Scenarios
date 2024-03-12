#!/bin/bash

# Get the IP address of the nginx-backend pod
backend_pod_ip=$(kubectl get pod -n backend nginx-backend -o jsonpath='{.status.podIP}')
echo "nginx-backend pod IP: $backend_pod_ip"

# Test connectivity from the frontend namespace
echo "Testing connectivity from frontend namespace..."
kubectl run tmp-busybox-frontend --namespace=frontend --image=busybox --restart=Never -- sh -c "wget -qO- $backend_pod_ip"
result_frontend=$?

# Clean up the temporary pod in the frontend namespace
kubectl delete pod tmp-busybox-frontend --namespace=frontend --wait=false

# Test connectivity from the default namespace
echo "Testing connectivity from default namespace..."
kubectl run tmp-busybox-default --namespace=default --image=busybox --restart=Never -- sh -c "wget -qO- $backend_pod_ip"
result_default=$?

# Clean up the temporary pod in the default namespace
kubectl delete pod tmp-busybox-default --namespace=default --wait=false

# Check results and exit
if [ $result_frontend -eq 0 ]; then
    echo "Connectivity test from frontend namespace: SUCCESS"
else
    echo "Connectivity test from frontend namespace: FAILURE"
    exit 1
fi

if [ $result_default -eq 0 ]; then
    echo "Connectivity test from default namespace: FAILURE (expected to fail)"
else
    echo "Connectivity test from default namespace: SUCCESS (unexpected success, should fail)"
    exit 1
fi

exit 0