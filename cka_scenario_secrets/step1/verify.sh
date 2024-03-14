#!/bin/bash

# Verify the secret exists with specific keys and values
username=$(kubectl get secret my-secret -o jsonpath='{.data.username}' | base64 --decode)
password=$(kubectl get secret my-secret -o jsonpath='{.data.password}' | base64 --decode)

if [ "$username" != "admin" ] || [ "$password" != "secretPassword123" ]; then
    echo "Secret 'my-secret' does not exist with the expected key-value pairs."
    exit 1
fi

# Verify the pod exists and is in a Running state
podStatus=$(kubectl get pod secret-pod -o jsonpath='{.status.phase}')
if [ "$podStatus" != "Running" ]; then
    echo "Pod 'secret-pod' is not running."
    exit 1
fi

# Verify the secret is correctly accessible from inside the pod
username_pod=$(kubectl exec secret-pod -- printenv USERNAME)
password_pod=$(kubectl exec secret-pod -- printenv PASSWORD)

if [ "$username_pod" != "admin" ] || [ "$password_pod" != "secretPassword123" ]; then
    echo "The secret values are not correctly accessible from inside the pod."
    exit 1
fi

echo "Secret and pod are correctly configured with the expected values."
exit 0
