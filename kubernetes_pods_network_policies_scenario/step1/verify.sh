#!/bin/bash

if kubectl get pods nginx-pod -o=jsonpath='{.status.phase}' | grep -q 'Running'; then exit 0; else exit 1; fi
