# Retrieve Container Image Names

Your objective in this task is to list the names of all container images running in pods within the `default` namespace. Write these image names to a file named `container_images.txt`.

<details><summary>Solution</summary>

```bash
kubectl get pods -n default -o jsonpath="{.items[*].spec.containers[*].image}" > container_images.txt
```

</details>
