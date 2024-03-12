# Create a Persistent Volume

In this step, you will create a Persistent Volume (PV) to be used in the Kubernetes cluster.

## Objective

Create a Persistent Volume with the following specifications:

- Name: `example-pv`
- Capacity: `1Gi`
- Access modes: `ReadWriteOnce`
- Host path: `/mnt/data`

<details>
<summary>Tips</summary>

- Use the `kubectl` command to create resources.
- Remember to specify the capacity and access modes in your PV configuration.
- The host path is the directory from the node's filesystem that you're exposing.

</details>

<details>
<summary>Solution</summary>

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: example-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: /mnt/data
```

Create the PV by applying the YAML file:

```bash
kubectl apply -f <filename>.yaml
```

</details>