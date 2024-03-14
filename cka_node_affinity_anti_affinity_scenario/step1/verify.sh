#!/bin/bash

# Define variables
POD_NAME="affinity-demo-pod"
LABEL_KEY="disktype"
LABEL_VALUE="ssd"

# Check if the pod exists and retrieve its affinity configuration
podAffinity=$(kubectl get pod $POD_NAME -o jsonpath='{.spec.affinity.nodeAffinity}' 2>/dev/null)

# Verify pod existence
if [ -z "$podAffinity" ]; then
  echo "Error: Pod $POD_NAME does not exist or does not have node affinity configured."
  exit 1
fi

# Check for the required affinity rule
hasAffinityRule=$(echo $podAffinity | grep -o "$LABEL_KEY" | wc -l)
hasAffinityValue=$(echo $podAffinity | grep -o "$LABEL_VALUE" | wc -l)

if [ $hasAffinityRule -eq 0 ] || [ $hasAffinityValue -eq 0 ]; then
  echo "Error: Pod $POD_NAME does not have the correct node affinity rule for $LABEL_KEY=$LABEL_VALUE."
  exit 1
fi

# The pod has the correct affinity configuration; now check if scheduled on a node with the correct label
nodeName=$(kubectl get pod $POD_NAME -o jsonpath='{.spec.nodeName}')
if [ -z "$nodeName" ]; then
  echo "Error: Pod $POD_NAME is not scheduled on any node."
  exit 1
fi

nodeLabel=$(kubectl get node "$nodeName" -o jsonpath="{.metadata.labels['$LABEL_KEY']}")
if [ "$nodeLabel" == "$LABEL_VALUE" ]; then
  echo "Success: Pod $POD_NAME is correctly scheduled on a node with label $LABEL_KEY=$LABEL_VALUE and has the correct node affinity configured."
  exit 0
else
  echo "Error: Pod $POD_NAME is not scheduled on a node with the required label $LABEL_KEY=$LABEL_VALUE."
  exit 1
fi
