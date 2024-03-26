#!/bin/bash

# Create pods in the default namespace with varying states
kubectl run nginx-running --image=nginx --restart=Never
# Simulate a pod in pending state by creating without available image
kubectl run nginx-pending --image=nginx:some-nonexistent-version --restart=Never
# Allow some time for the pods to transition states
sleep 30
