#!/bin/bash
POD_NAME="storage-pod"
if kubectl get pod "${POD_NAME}" &> /dev/null; then
    STATUS=$(kubectl get pod "${POD_NAME}" -o=jsonpath='{.status.phase}')
    MOUNT=$(kubectl get pod "${POD_NAME}" -o=jsonpath='{.spec.volumes[?(@.persistentVolumeClaim.claimName=="example-pvc")].persistentVolumeClaim.claimName}')
    if [ "${STATUS}" = "Running" ] && [ "${MOUNT}" = "example-pvc" ]; then
        echo "SUCCESS: Pod '${POD_NAME}' is running and PVC is correctly attached."
        exit 0
    else
        echo "FAILURE: Pod '${POD_NAME}' is not running or PVC is not attached."
        exit 1
    fi
else
    echo "FAILURE: Pod '${POD_NAME}' does not exist."
    exit 1
fi
