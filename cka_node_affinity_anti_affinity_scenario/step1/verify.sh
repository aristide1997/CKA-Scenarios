#!/bin/bash

# This script verifies if the pod "affinity-demo-pod" with the specified node affinity is correctly created.

# Pod name and label to check
POD_NAME="affinity-demo-pod"
LABEL_KEY="disktype"
LABEL_VALUE="ssd"

# Check if the pod exists
if ! kubectl get pod $POD_NAME &> /dev/null; then
  echo "Pod $POD_NAME does not exist."
  exit 1
fi

# Get the nodeName where the pod is scheduled
nodeName=$(kubectl get pod $POD_NAME -o=jsonpath='{.spec.nodeName}')

# Check if the nodeName is not empty
if [ -z "$nodeName" ]; then
  echo "The pod $POD_NAME is not scheduled on any node."
  exit 1
fi

# Check if the node has the correct label
if kubectl get node $nodeName -o=jsonpath="{.metadata.labels[$LABEL_KEY]}" | grep -q "^$LABEL_VALUE$"; then
  echo "Success! The pod $POD_NAME is correctly scheduled on a node with label $LABEL_KEY=$LABEL_VALUE."
  exit 0
else
  echo "The pod $POD_NAME is not scheduled on a node with the required label $LABEL_KEY=$LABEL_VALUE."
  exit 1
fi
