#!/bin/bash

# Check if the Persistent Volume Claim exists and meets the specified criteria.
if kubectl get pvc example-pvc -o jsonpath='{.spec.resources.requests.storage}' | grep -q '1Gi'; then
    if kubectl get pvc example-pvc -o jsonpath='{.spec.accessModes}' | grep -q 'ReadWriteOnce'; then
        exit 0 # Success
    fi
fi
exit 1 # Failure