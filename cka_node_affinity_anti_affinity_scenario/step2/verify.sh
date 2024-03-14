#!/bin/bash

# Define variables
POD_NAME="anti-affinity-demo-pod"
LABEL_KEY="disktype"
LABEL_VALUE="ssd"

# Check if the pod exists and retrieve its status alongside the node affinity configuration
podStatus=$(kubectl get pod $POD_NAME -o jsonpath='{.status.phase}')
podNodeAffinity=$(kubectl get pod $POD_NAME -o jsonpath='{.spec.affinity.nodeAffinity}' 2>/dev/null)

# Verify pod existence
if [ -z "$podNodeAffinity" ]; then
  echo "Error: Pod $POD_NAME does not exist or does not have node affinity configured."
  exit 1
fi

# Verify the pod is running
if [ "$podStatus" != "Running" ]; then
  echo "Error: Pod $POD_NAME is not in a Running state, but it is in $podStatus."
  exit 1
fi

# Verify the node affinity rule is correctly configured to avoid disktype=ssd
if ! echo $podNodeAffinity | grep -q "$LABEL_KEY" && echo $podNodeAffinity | grep -q "NotIn" && echo $podNodeAffinity | grep -q "$LABEL_VALUE"; then
  echo "Error: Pod $POD_NAME does not have the correct node affinity rule to avoid nodes with $LABEL_KEY=$LABEL_VALUE."
  exit 1
fi

# The pod has the correct node affinity configuration and is running
echo "Success: Pod $POD_NAME is running and has the correct node affinity configured to avoid nodes with label $LABEL_KEY=$LABEL_VALUE."
exit 0
