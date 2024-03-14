#!/bin/bash

# This script verifies if the pod "anti-affinity-demo-pod" with the specified node anti-affinity is correctly created and scheduled.

# Pod names to check
FIRST_POD_NAME="affinity-demo-pod"
SECOND_POD_NAME="anti-affinity-demo-pod"

# Check if both pods exist
if ! kubectl get pod $FIRST_POD_NAME &> /dev/null; then
  echo "First pod $FIRST_POD_NAME does not exist."
  exit 1
fi

if ! kubectl get pod $SECOND_POD_NAME &> /dev/null; then
  echo "Second pod $SECOND_POD_NAME does not exist."
  exit 1
fi

# Get the nodeNames where the pods are scheduled
firstNodeName=$(kubectl get pod $FIRST_POD_NAME -o=jsonpath='{.spec.nodeName}')
secondNodeName=$(kubectl get pod $SECOND_POD_NAME -o=jsonpath='{.spec.nodeName}')

# Check if the nodeNames are not empty and not the same
if [ -z "$firstNodeName" ] || [ -z "$secondNodeName" ]; then
  echo "One or both pods are not scheduled on any node."
  exit 1
elif [ "$firstNodeName" = "$secondNodeName" ]; then
  echo "The pods are scheduled on the same node, violating the anti-affinity rule."
  exit 1
else
  echo "Success! The pods are scheduled on different nodes, adhering to the anti-affinity rule."
  exit 0
fi
