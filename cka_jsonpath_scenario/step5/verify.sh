#!/bin/bash

# Construct the expected string format: "<pod_name>,<node_name>"
expected_output=$(kubectl get pods -n delta -l app=frontend -o jsonpath="{.items[?(@.status.phase=='Running')].metadata.name},{.items[?(@.status.phase=='Running')].spec.nodeName}" | tr ' ' '\n')

# Read user's output, assuming they've followed the format "<pod_name>,<node_name>" per line
user_output=$(cat filtered_pods_nodes.txt | sort)

# Check if the user's output matches the expected output (considering sorting)
if [ "$(echo "$user_output" | xargs)" == "$(echo "$expected_output" | xargs)" ]; then
  exit 0
else
  exit 1
fi
