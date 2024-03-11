#!/bin/bash

# Switch to use the example-sa Service Account
# This is a placeholder, actual command to switch contexts may vary
# and needs proper setup to test Service Account permissions.

if kubectl --as=system:serviceaccount:default:example-sa get pods; then exit 0; else exit 1; fi
