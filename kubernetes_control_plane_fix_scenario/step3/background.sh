#!/bin/bash

# Rename the scheduler and controller manager manifest files
mv /etc/kubernetes/manifests/kube-scheduler.yaml /etc/kubernetes/manifests/kube-scheduler.yaml.bak
mv /etc/kubernetes/manifests/kube-controller-manager.yaml /etc/kubernetes/manifests/kube-controller-manager.yaml.bak