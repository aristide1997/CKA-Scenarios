#### Exercise - eg. Apply a Network Policy

Exercise Description - Create a network policy named `default-deny` that denies all ingress traffic to the pod `nginx-pod`.

<details>
<summary>Tips</summary>

Tips go here, eg.

- Use the `kubectl apply` command to apply your network policy.
- Ensure the policy successfully restricts all ingress traffic to the pod.

</details>

<details>
<summary>Solution</summary>

Solution goes here, eg:

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
