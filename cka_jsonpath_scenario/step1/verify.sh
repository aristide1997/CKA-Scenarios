#!/bin/bash

# Expected pod names (sorted and newline separated)
expected_names="nginx-pod
redis-pod"

# User's output
user_output=$(cat pod_names.txt | tr ' ' '\n' | sort)

# Check if the output matches the expected names
if [ "$user_output" == "$expected_names" ]; then
  exit 0
else
  exit 1
fi