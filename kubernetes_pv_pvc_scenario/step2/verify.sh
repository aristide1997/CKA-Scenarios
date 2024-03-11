#!/bin/bash

if [[ $(kubectl get pvc example-pvc -o=jsonpath='{.status.phase}') == "Bound" ]]; then exit 0; else exit 1; fi
