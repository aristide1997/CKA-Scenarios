# List Namespaces with Labels

In this task, you are required to list all namespaces that are labeled with `env=production` and write their names to a file named `namespaces_with_labels.txt`.

<details><summary>Solution</summary>

```bash
kubectl get namespaces -l env=production -o jsonpath="{.items[*].metadata.name}" > namespaces_with_labels.txt
```

OR

```bash
kubectl get namespaces --all-namespaces -o jsonpath="{.items[?(@.metadata.labels.env=='production')].metadata.name}" > namespaces_with_labels.txt
```

</details>
