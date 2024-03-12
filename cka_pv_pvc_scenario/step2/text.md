# Create a Persistent Volume Claim

In this step, you will create a Persistent Volume Claim (PVC) that will request storage from a Persistent Volume.

## Objective

Create a Persistent Volume Claim with the following specifications:

- Name: `example-pvc`
- Requested storage: `1Gi`
- Access modes: `ReadWriteOnce`

<details>
<summary>Tips</summary>

- Ensure your PVC requests storage that matches the specifications of an available PV.
- Use the `kubectl` command to create the PVC.

</details>

<details>
<summary>Solution</summary>

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: example-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

Create the PVC by applying the YAML file:

```bash
kubectl apply -f <filename>.yaml
```

</details>