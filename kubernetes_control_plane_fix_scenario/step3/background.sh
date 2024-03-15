#!/bin/bash

# Create a kube-scheduler issue by using an incorrect scheduler image
kubectl get pod -n kube-system | grep kube-scheduler | awk '{print $1}' | xargs -I {} kubectl delete pod {} -n kube-system
sed -i 's|image: k8s.gcr.io/kube-scheduler:v1.20.0|image: k8s.gcr.io/kube-scheduler:invalid|g' /etc/kubernetes/manifests/kube-scheduler.yaml
