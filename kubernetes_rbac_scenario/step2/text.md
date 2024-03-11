
Create a Role named `example-role` that allows reading pods in the default namespace and a RoleBinding named `example-rolebinding` that binds `example-role` to `example-sa`.

<details>
<summary>Tips</summary>

- Define a Role with resources `pods` and verbs `get`, `list`, and `watch`.
- Use `kubectl create role` to create the Role.
- Bind the Role to the Service Account using `kubectl create rolebinding`.

</details>

<details>
<summary>Solution</summary>

```yaml
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: default
  name: example-role
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
```

```bash
kubectl create role example-role --verb=get,list,watch --resource=pods
kubectl create rolebinding example-rolebinding --role=example-role --serviceaccount=default:example-sa
```

</details>
