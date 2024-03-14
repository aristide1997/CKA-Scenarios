#!/bin/bash

# Script to verify that the main container in the 'init-pod' can access the shared data

# Set the pod name
POD_NAME="init-pod"

# Command to execute in the main container to check the data
COMMAND="cat /etc/shared/hello.txt"

# Expected data that was written by the init container
EXPECTED_OUTPUT="Hello from init container"

# Execute the command in the main container and capture the output
ACTUAL_OUTPUT=$(kubectl exec "$POD_NAME" --container myapp -- $COMMAND)

# Check if the actual output matches the expected output
if [[ "$ACTUAL_OUTPUT" == "$EXPECTED_OUTPUT" ]]; then
    echo "Success: The main container in '$POD_NAME' can access the shared data."
    exit 0
else
    echo "Failure: The main container in '$POD_NAME' cannot access the shared data as expected."
    exit 1
fi