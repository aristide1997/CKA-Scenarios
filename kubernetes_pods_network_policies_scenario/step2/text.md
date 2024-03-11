
#### Apply a Network Policy

Create a network policy named `default-deny` that denies all ingress traffic to the pod `nginx-pod`.

**Tips:**
- Use the `kubectl apply` command to apply your network policy.
- Ensure the policy successfully restricts all ingress traffic to the pod.

<details>
<summary>Solution</summary>

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
spec:
  podSelector:
    matchLabels:
      run: nginx-pod
  policyTypes:
  - Ingress
```

</details>
