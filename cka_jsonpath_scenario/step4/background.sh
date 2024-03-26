#!/bin/bash

# Ensure there are a variety of pods with different images in the default namespace
kubectl run nginx-pod --image=nginx --restart=Never
kubectl run redis-pod --image=redis --restart=Never
kubectl run custom-pod --image=mycustomimage:latest --restart=Never
# Simulate a delay for pods' states to stabilize
sleep 30
