#!/bin/bash

# Fetch the running pods directly for comparison, ensuring formatting matches the expected output from the user
expected_running_pods=$(kubectl get pods -n default -o jsonpath="{.items[?(@.status.phase=='Running')].metadata.name}" | tr ' ' '\n' | sort | tr '\n' ' ')

# User's output, normalize spaces to handle varying outputs
user_output=$(cat running_pods.txt | tr -s ' ' | tr ' ' '\n' | sort | tr '\n' ' ')

# Check if the user's output matches the expected running pods (trimming to remove any trailing spaces)
if [ "$(echo $user_output | xargs)" == "$(echo $expected_running_pods | xargs)" ]; then
  exit 0
else
  exit 1
fi
