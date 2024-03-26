#!/bin/bash

# Create new namespace for this task
kubectl create namespace delta

# Create pods with varying states and labels to ensure a mixed environment for the user to query
kubectl run -n delta frontend-running --image=nginx --labels="app=frontend" --restart=Never

kubectl run -n delta backend-running --image=redis --labels="app=backend" --restart=Never