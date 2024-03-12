#!/bin/bash

# Check for the network policy
if ! kubectl get networkpolicy -n backend | grep -q 'backend-policy'; then
  echo "Network policy 'backend-policy' in namespace 'backend' not found."
  exit 1
fi

echo "Network policy 'backend-policy' exists."
exit 0