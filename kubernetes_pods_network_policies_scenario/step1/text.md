
#### Deploy a Pod

Deploy a pod named `nginx-pod` using the `nginx` image.

**Tips:**
- Use the `kubectl run` command to deploy your pod.
- Make sure the pod is running by using `kubectl get pods`.

<details>
<summary>Solution</summary>

```bash
kubectl run nginx-pod --image=nginx
```

</details>
