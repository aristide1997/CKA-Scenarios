#!/bin/bash

# Prepare the expected list of container images, sorted and unique
expected_images=$(kubectl get pods -n default -o jsonpath="{.items[*].spec.containers[*].image}")

# Fetch user's output, normalize spaces, and prepare for comparison
user_output=$(cat container_images.txt | tr -s ' ' | tr ' ' '\n' | sort -u | tr '\n' ' ')

# Check if the user's output matches the expected list of images (trimming to remove any trailing spaces)
if [ "$(echo $user_output | xargs)" == "$(echo $expected_images | xargs)" ]; then
  exit 0
else
  exit 1
fi
