#!/bin/bash

# Remove the taint from the control plane node to allow pod scheduling
kubectl taint nodes --all node-role.kubernetes.io/control-plane:NoSchedule- 2>/dev/null || true

echo "Taint removed from the control plane node to allow pod scheduling."
