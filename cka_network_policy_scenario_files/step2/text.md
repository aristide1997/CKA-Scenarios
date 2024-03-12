## Step 2: Implement Network Policy

In this step, you will implement a network policy to restrict traffic between the `frontend` and `backend` namespaces.

### Objectives

- Create a network policy named `backend-policy` that allows traffic from the `frontend` namespace to the `backend` namespace.
- Ensure that pods in the `backend` namespace can only receive traffic from pods in the `frontend` namespace.

<Tips>

- Use the `networking.k8s.io/v1` API version for the NetworkPolicy resource.
- Apply a pod selector that targets the pods in the `backend` namespace.
- Specify `ingress` rules to allow traffic from the `frontend` namespace.

</Tips>

<Solution>

- Network policy definition:

```yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: backend-policy
  namespace: backend
spec:
  podSelector: {}
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          name: frontend
```

- Apply the network policy with `kubectl apply -f backend-policy.yaml`.

</Solution>