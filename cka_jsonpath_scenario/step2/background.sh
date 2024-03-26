#!/bin/bash

# Create namespaces with and without the specific label for the user to filter
kubectl create namespace production-1
kubectl create namespace production-2
kubectl create namespace development-1
kubectl label namespace production-1 env=production
kubectl label namespace production-2 env=production
