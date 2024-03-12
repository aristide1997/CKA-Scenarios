# Bind PVC to PV Using a Pod

In this step, you will deploy a Pod that uses the Persistent Volume Claim (PVC) you created. This will demonstrate the PVC binding to the Persistent Volume (PV).

## Objective

Deploy a Pod with the following specifications:

- Name: `example-pod`
- Image: `nginx`
- Volume:
  - Name: `example-volume`
  - PVC: `example-pvc`

<details>
<summary>Tips</summary>

- Define a volume in your Pod specification that references the PVC.
- Use the volume by mounting it inside the Pod's container.

</details>

<details>
<summary>Solution</summary>

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: nginx
    image: nginx
    volumeMounts:
    - name: example-volume
      mountPath: "/usr/share/nginx/html"
  volumes:
  - name: example-volume
    persistentVolumeClaim:
      claimName: example-pvc
```

Deploy the Pod by applying the YAML file:

```bash
kubectl apply -f <filename>.yaml
```

</details>