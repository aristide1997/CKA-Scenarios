
#### Diagnose Pod Health Issues

1. Verify if the pod is running.
2. Check the pod's logs for any errors.
3. Ensure the pod's health checks are passing.

<Tips>
- Use `kubectl get pods` to check pod status.
- Use `kubectl logs <pod_name>` to view logs.
- Use `kubectl describe pod <pod_name>` to check health checks.

<Solution>
Ensure that the pod is in a running state, logs do not show any critical errors, and health checks are passing.
