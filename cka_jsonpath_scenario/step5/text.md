# Complex JSONPath Query

For this advanced task, you need to identify all running pods in the `delta` namespace with the label `app=frontend`, and extract both the pod names and the names of the nodes they are assigned to. Write this information to `filtered_pods_nodes.txt`, with each pod name and its node name on a new line, separated by a comma.

**Example Output in `filtered_pods_nodes.txt`:**
frontend-running,node01
another-frontend-pod,node02

**Hint:** Use kubectl to get pods by label, and then JSONPath to format the output.

<details><summary>Solution</summary>

```bash
kubectl get pods -n delta -l app=frontend -o jsonpath="{range .items[?(@.status.phase=='Running')]}{.metadata.name},{.spec.nodeName}{'\n'}{end}" > filtered_pods_nodes.txt
```

</details>
