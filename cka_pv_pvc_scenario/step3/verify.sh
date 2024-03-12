#!/bin/bash

# Check if the Pod is running and using the PVC bound to the PV.
pod_status=$(kubectl get pod example-pod -o jsonpath='{.status.phase}')
pvc_status=$(kubectl get pvc example-pvc -o jsonpath='{.status.phase}')
pv_claim_ref=$(kubectl get pv --all-namespaces -o jsonpath="{.items[?(@.spec.claimRef.name=='example-pvc')].metadata.name}")

if [[ "$pod_status" == "Running" ]] && [[ "$pvc_status" == "Bound" ]] && [[ "$pv_claim_ref" == "example-pv" ]]; then
    exit 0 # Success
else
    exit 1 # Failure
fi