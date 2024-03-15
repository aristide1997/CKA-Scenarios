#!/bin/bash

# Check if the nginx pod is running
POD_STATUS=$(kubectl get pods -o jsonpath='{.items[?(@.metadata.name=="nginx")].status.phase}')

# Assume kube-scheduler pod's name contains 'kube-scheduler' and is in the kube-system namespace
SCHEDULER_POD=$(kubectl get pods -n kube-system --no-headers | grep kube-scheduler | awk '{print $1}')
SCHEDULER_READY=$(kubectl get pod -n kube-system $SCHEDULER_POD -o jsonpath='{.status.conditions[?(@.type=="Ready")].status}')

# Verify both nginx pod is running and kube-scheduler is ready
if [[ "$POD_STATUS" == "Running" ]] && [[ "$SCHEDULER_READY" == "True" ]]; then 
    echo "Success: The nginx pod is running and the kube-scheduler is functioning correctly."
    exit 0
else 
    echo "Failure: Either the nginx pod is not running or the kube-scheduler is not functioning correctly."
    exit 1
fi
