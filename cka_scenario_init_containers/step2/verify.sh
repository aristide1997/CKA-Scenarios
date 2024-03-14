#!/bin/bash

# Verify the shared data access
POD_NAME=$(kubectl get pods --selector=app=shared-data-pod -o jsonpath='{.items[0].metadata.name}')
SHARED_DATA=$(kubectl exec "$POD_NAME" --container myapp -- cat /etc/shared/hello.txt)

if [[ "$SHARED_DATA" == "Hello from init container" ]]; then
    exit 0
else
    exit 1
fi