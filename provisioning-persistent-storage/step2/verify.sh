#!/bin/bash
PVC_NAME="example-pvc"
if kubectl get pvc "${PVC_NAME}" &> /dev/null; then
    STATUS=$(kubectl get pvc "${PVC_NAME}" -o=jsonpath='{.status.phase}')
    if [ "${STATUS}" = "Bound" ]; then
        echo "SUCCESS: PVC '${PVC_NAME}' is correctly bound to a PV."
        exit 0
    else
        echo "FAILURE: PVC '${PVC_NAME}' is not bound. Status is ${STATUS}."
        exit 1
    fi
else
    echo "FAILURE: PVC '${PVC_NAME}' does not exist."
    exit 1
fi
