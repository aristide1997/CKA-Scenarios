#!/bin/bash

# Check for namespaces
if ! kubectl get ns | grep -q 'frontend'; then
  echo "Namespace 'frontend' not found."
  exit 1
fi

if ! kubectl get ns | grep -q 'backend'; then
  echo "Namespace 'backend' not found."
  exit 1
fi

# Check for pods
if ! kubectl get pods -n frontend | grep -q 'nginx-frontend'; then
  echo "Pod 'nginx-frontend' in namespace 'frontend' not found."
  exit 1
fi

if ! kubectl get pods -n backend | grep -q 'nginx-backend'; then
  echo "Pod 'nginx-backend' in namespace 'backend' not found."
  exit 1
fi

echo "All checks passed!"
exit 0