# Filter Pods by Status

In this task, your goal is to list the names of all pods in the `default` namespace that are in a `Running` state. Write the names of these pods to a file named `running_pods.txt`.

**Hint:** Use a JSONPath query with the `kubectl get pods` command to filter pods by their status.

<details><summary>Solution</summary>

```bash
kubectl get pods -n default -o jsonpath="{.items[?(@.status.phase=='Running')].metadata.name}" > running_pods.txt
```

</details>
