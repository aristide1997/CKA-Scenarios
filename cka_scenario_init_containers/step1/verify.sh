#!/bin/bash

# Script to verify the pod named init-pod has its init and main containers ready

# Set the pod name
POD_NAME="init-pod"

# Fetch the pod's status to ensure it exists
POD_EXISTS=$(kubectl get pod "$POD_NAME" --ignore-not-found)
if [ -z "$POD_EXISTS" ]; then
    echo "Pod '$POD_NAME' does not exist. Please check your deployment."
    exit 1
fi

# Check init container status
INIT_CONTAINER_STATUS=$(kubectl get pod "$POD_NAME" -o jsonpath='{.status.initContainerStatuses[0].ready}')

# Check main container status
MAIN_CONTAINER_STATUS=$(kubectl get pod "$POD_NAME" -o jsonpath='{.status.containerStatuses[0].ready}')

# Validate both init and main container are ready
if [ "$INIT_CONTAINER_STATUS" == "true" ] && [ "$MAIN_CONTAINER_STATUS" == "true" ]; then
    echo "Both init and main containers in '$POD_NAME' are ready."
    exit 0
else
    echo "Either the init container or the main container in '$POD_NAME' is not ready. Please check the pod's container statuses."
    exit 1
fi
