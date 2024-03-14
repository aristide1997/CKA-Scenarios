#!/bin/bash

# Check if the pod with the init container is running
POD_NAME=$(kubectl get pods --selector=app=shared-data-pod -o jsonpath='{.items[0].metadata.name}')
INIT_CONTAINER_STATUS=$(kubectl get pod "$POD_NAME" -o jsonpath='{.status.initContainerStatuses[0].ready}')
MAIN_CONTAINER_STATUS=$(kubectl get pod "$POD_NAME" -o jsonpath='{.status.containerStatuses[0].ready}')

if [ "$INIT_CONTAINER_STATUS" == "true" ] && [ "$MAIN_CONTAINER_STATUS" == "true" ]; then
    exit 0
else
    exit 1
fi