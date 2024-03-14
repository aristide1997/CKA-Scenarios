#!/bin/bash

if kubectl describe networkpolicy default-deny | grep -q 'PodSelector:.*run=nginx-pod'; then exit 0; else exit 1; fi
