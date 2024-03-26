# Extract Pod Names

Your first task is to extract the names of all pods in the default namespace and write them to a file named `pod_names.txt`.

<details><summary>Solution</summary>

```bash
kubectl get pods -o jsonpath="{.items[*].metadata.name}" > pod_names.txt
```

</details>
