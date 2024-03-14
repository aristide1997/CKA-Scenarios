#!/bin/bash

# Verify the scheduler and controller manager are correctly configured and running
if [ -f /etc/kubernetes/manifests/kube-scheduler.yaml ] && [ -f /etc/kubernetes/manifests/kube-controller-manager.yaml ]; then
    # Test scheduler by creating a test pod
    kubectl run test-scheduler --restart=Never --image=busybox -- /bin/sleep 1000
    sleep 5 # Give it time to schedule
    if kubectl get pod test-scheduler | grep -q 'Running'; then
        kubectl delete pod test-scheduler
    else
        kubectl delete pod test-scheduler
        exit 1
    fi
    
    # Test controller manager by creating a replicaset
    kubectl create deployment test-controller --image=busybox
    sleep 5 # Give it time for ReplicaSet controller to act
    if [[ $(kubectl get rs -l app=test-controller -o jsonpath='{.items[0].status.readyReplicas}') -ge 1 ]]; then
        kubectl delete deployment test-controller
        exit 0
    else
        kubectl delete deployment test-controller
        exit 1
    fi
else
    exit 1
fi
