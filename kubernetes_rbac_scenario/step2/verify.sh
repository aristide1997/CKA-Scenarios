#!/bin/bash

role=$(kubectl get role example-role -o=jsonpath='{.metadata.name}')
rolebinding=$(kubectl get rolebinding example-rolebinding -o=jsonpath='{.metadata.name}')
if [[ "$role" == "example-role" && "$rolebinding" == "example-rolebinding" ]]; then exit 0; else exit 1; fi
