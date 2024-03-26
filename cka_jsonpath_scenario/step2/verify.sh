#!/bin/bash

# Expected namespace names, unsorted
expected_names="production-1 production-2"

# User's output, convert newlines to spaces for direct comparison with expected output
user_output=$(cat namespaces_with_labels.txt | tr '\n' ' ' | xargs)

# Sort both expected names and user's output for a fair comparison
sorted_expected_names=$(echo $expected_names | tr ' ' '\n' | sort | tr '\n' ' ')
sorted_user_output=$(echo $user_output | tr ' ' '\n' | sort | tr '\n' ' ')

# Check if the sorted output matches the sorted expected names (trimming is used to remove any trailing spaces)
if [ "$(echo $sorted_user_output | xargs)" == "$(echo $sorted_expected_names | xargs)" ]; then
  exit 0
else
  exit 1
fi
