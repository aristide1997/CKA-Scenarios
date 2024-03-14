# Configuring Node Anti-affinity

This step involves applying node anti-affinity to ensure that a new pod, `anti-affinity-demo-pod`, does not get scheduled on the same node as another pod due to specific labeling criteria.

## Objective

Create a pod named `anti-affinity-demo-pod` using the `nginx` image, ensuring it employs node anti-affinity to avoid being scheduled on the same node as the `affinity-demo-pod`.

<details>
<summary>Tips</summary>

- Construct a pod definition for `anti-affinity-demo-pod` that includes node anti-affinity rules to avoid scheduling on the node with `disktype=ssd`.
- The "anti-affinity" rule doesn't explicitly exist, you can use a "NotIn" operator instead.

</details>

<details>
<summary>Solution</summary>

Below is an example approach for your pod's anti-affinity rule:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: anti-affinity-demo-pod
spec:
  containers:
    - name: nginx
      image: nginx
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: disktype
                operator: NotIn
                values:
                  - ssd
```

This example ensures your pod does not schedule on nodes with the `disktype=ssd` label.

</details>
