# Configuring Node Affinity

In this step, you'll configure node affinity for a Kubernetes pod. Node affinity is a set of rules used to determine on which nodes a pod can be scheduled, based on labels on those nodes.

## Objective

Your task is to create a pod named `affinity-demo-pod` using the `nginx` image. This pod should only be scheduled on a node labeled with `disktype=ssd`.

First, label one of your nodes with `disktype=ssd`:

```bash
kubectl label nodes <node-name> disktype=ssd
```

Replace `<node-name>` with the actual name of your node.

<details>
<summary>Tips</summary>

- Use the `affinity` field under the `spec` section of your pod definition to specify node affinity.
- The `requiredDuringSchedulingIgnoredDuringExecution` field indicates that the scheduler must obey the affinity rules when scheduling the pod, but it may ignore them if the pod is already running and a node's labels change.
- Check the Kubernetes documentation on affinity and anti-affinity for syntax guidance.

</details>

<details>
<summary>Solution</summary>

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: affinity-demo-pod
spec:
  containers:
    - name: nginx
      image: nginx
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: "disktype"
                operator: "In"
                values:
                  - "ssd"
```

</details>
