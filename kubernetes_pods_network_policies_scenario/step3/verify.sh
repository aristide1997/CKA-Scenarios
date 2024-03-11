#!/bin/bash

# Variables
NAMESPACE=default
POD_LABEL="run=nginx-pod"
TEST_POD_NAME="network-policy-test-pod"
NGINX_POD_IP=$(kubectl get pod -l ${POD_LABEL} -n ${NAMESPACE} -o jsonpath='{.items[0].status.podIP}')

# Create a temporary test pod
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: ${TEST_POD_NAME}
  namespace: ${NAMESPACE}
spec:
  containers:
  - name: busybox
    image: busybox
    command:
      - sleep
      - "3600"
  restartPolicy: Always
EOF

# Wait for the test pod to be running
echo "Waiting for ${TEST_POD_NAME} to be running..."
kubectl wait --for=condition=Ready pod/${TEST_POD_NAME} -n ${NAMESPACE} --timeout=60s

# Test 1: Ping the nginx-pod
echo "Testing ping to ${NGINX_POD_IP}..."
kubectl exec ${TEST_POD_NAME} -n ${NAMESPACE} -- ping -c 3 ${NGINX_POD_IP}

# Test 2: Attempt to connect to nginx-pod on port 80
echo "Testing connection to ${NGINX_POD_IP} on port 80..."
kubectl exec ${TEST_POD_NAME} -n ${NAMESPACE} -- wget -O- ${NGINX_POD_IP}:80

# Clean up
echo "Cleaning up..."
kubectl delete pod ${TEST_POD_NAME} -n ${NAMESPACE}

echo "Test completed."
