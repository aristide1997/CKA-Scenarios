#!/bin/bash

# Example verification script
if [[ $(kubectl get pod <pod_name> -o=jsonpath='{.status.phase}') == "Running" ]] && [[ $(kubectl describe pod <pod_name> | grep 'Liveness Probe' | grep 'Success') ]]; then exit 0; else exit 1; fi
