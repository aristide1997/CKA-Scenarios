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

2. Find the IP Address of nginx-pod:
   ```bash
   NGINX_POD_IP=$(kubectl get pod nginx-pod -o jsonpath='{.status.podIP}')
   ```
3. Attempt to Connect to nginx-pod on Port 80 from test-pod:
   ```bash
   kubectl exec test-pod -- wget -qO- --timeout=2 http://${NGINX_POD_IP}:80
   ```

If the network policy is enforced correctly, the request should timeout or fail.

</details>
