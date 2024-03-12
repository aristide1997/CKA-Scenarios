#!/bin/bash

# Function to get pod IP
get_pod_ip() {
  kubectl get pod -n backend nginx-backend -o jsonpath='{.status.podIP}'
}

# Test connectivity from frontend namespace
frontend_connectivity=$(kubectl run tmp-busybox-frontend --rm -ti --namespace=frontend --image=busybox --restart=Never -- sh -c "wget -qO- $(get_pod_ip) && echo 'success'" | grep success)

# Test connectivity from default namespace (expected to fail)
default_connectivity=$(kubectl run tmp-busybox-default --rm -ti --namespace=default --image=busybox --restart=Never -- sh -c "wget -qO- $(get_pod_ip) && echo 'success'" | grep success)

# Cleanup temporary pods
kubectl delete pod tmp-busybox-frontend --namespace=frontend
kubectl delete pod tmp-busybox-default --namespace=default

# Check results
if [[ "$frontend_connectivity" == "success" ]] && [[ -z "$default_connectivity" ]]; then
  echo "Network policy verification passed."
  exit 0
else
  echo "Network policy verification failed."
  exit 1
fi