#!/bin/bash

# Check if the Persistent Volume exists and meets the specified criteria.
if kubectl get pv example-pv -o jsonpath='{.spec.capacity.storage}' | grep -q '1Gi'; then
    if kubectl get pv example-pv -o jsonpath='{.spec.accessModes}' | grep -q 'ReadWriteOnce'; then
        if kubectl get pv example-pv -o jsonpath='{.spec.hostPath.path}' | grep -q '/mnt/data'; then
            exit 0 # Success
        fi
    fi
fi
exit 1 # Failure