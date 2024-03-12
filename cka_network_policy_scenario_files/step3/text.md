## Step 3: Test Network Policy

In this step, you'll test the network policy's effectiveness in allowing traffic from the `frontend` namespace to the `backend` namespace, and ensuring that other traffic is blocked.

### Objectives

1. **Verify Connectivity**: Confirm that a pod in the `frontend` namespace can successfully connect to the `nginx-backend` pod in the `backend` namespace.
2. **Verify Isolation**: Ensure that pods in other namespaces (not `frontend`) cannot connect to the `nginx-backend` pod.

<details>
<summary>Tips</summary>

- Deploy a temporary pod for testing: `kubectl run tmp-busybox --rm -ti --namespace=<namespace-name> --image=busybox -- sh`
- Test connectivity with `wget` (e.g., `wget -qO- <nginx-backend-pod-ip>`). Replace `<nginx-backend-pod-ip>` with the actual IP address of the `nginx-backend` pod.

</details>

<details>
<summary>Solution</summary>

1. From a pod in the `frontend` namespace:

```bash
kubectl run tmp-busybox --rm -ti --namespace=frontend --image=busybox -- sh
# Inside the pod
wget -qO- <nginx-backend-pod-ip>
```

2. From a pod in a different namespace:

```bash
kubectl run tmp-busybox --rm -ti --namespace=default --image=busybox -- sh
# Inside the pod, attempt to connect to the backend pod. It should fail.
wget -qO- <nginx-backend-pod-ip>
```

</details>
