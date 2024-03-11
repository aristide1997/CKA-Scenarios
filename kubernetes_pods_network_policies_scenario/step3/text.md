
#### Test Network Policy Enforcement

Verify that the network policy `default-deny` is effectively denying all ingress traffic to `nginx-pod`.

**Tips:**
- Attempt to access `nginx-pod` from another pod within the cluster.
- Use `kubectl exec` to simulate network traffic to `nginx-pod`.

<details>
<summary>Solution</summary>

1. Deploy a temporary pod to test network access:
   ```bash
   kubectl run temp-pod --image=busybox --restart=Never -- sleep 3600
   ```

2. Attempt to access `nginx-pod` from `temp-pod`:
   ```bash
   kubectl exec temp-pod -- wget -qO- --timeout=2 http://nginx-pod
   ```

If the network policy is enforced correctly, the request should timeout or fail.

</details>
