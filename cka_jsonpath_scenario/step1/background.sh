#!/bin/bash

# Create a few pods in the default namespace for the user to investigate
kubectl run nginx-pod --image=nginx --restart=Never
kubectl run redis-pod --image=redis --restart=Never