# Create and Deploy a Secret with a Pod

In this exercise, you'll securely manage sensitive information in Kubernetes using secrets. Specifically, you'll create a secret to store a username and password, then deploy a pod that utilizes this secret.

## Objectives

- Create a Kubernetes secret named `my-secret` containing the following key-value pairs:
  - `username` with the value `admin`
  - `password` with the value `secretPassword123`
- Deploy a pod named `secret-pod` that uses `my-secret` to set environment variables `USERNAME` and `PASSWORD`.
- Verify that the pod can access the data stored in `my-secret`.

<details>
<summary>🔎 Tips on Creating a Secret</summary>

- To create a secret from literals, use the `kubectl create secret generic` command with `--from-literal` flags for each key-value pair.
- Make sure to match the exact names and values specified in the objectives to ensure your solution passes verification.

</details>

<details>
<summary>🔎 Tips on Deploying a Pod Using the Secret</summary>

- In the pod definition, reference the secret in the `env` section of your container spec.
- Use the `valueFrom.secretKeyRef` field to specify both the name of the secret and the key whose value you want to assign to the environment variable.

</details>

<details>
<summary>✅ Solution: Creating and Using the Secret</summary>

1. **Create the Secret**:

   ```
   kubectl create secret generic my-secret --from-literal=username='admin' --from-literal=password='secretPassword123'
   ```

2. **Pod Definition Example** (`pod.yaml`):

   ```yaml
   apiVersion: v1
   kind: Pod
   metadata:
     name: secret-pod
     labels:
       app: my-secret-app
   spec:
     containers:
       - name: secret-container
         image: nginx
         env:
           - name: USERNAME
             valueFrom:
               secretKeyRef:
                 name: my-secret
                 key: username
           - name: PASSWORD
             valueFrom:
               secretKeyRef:
                 name: my-secret
                 key: password
   ```

3. **Deploy the Pod**:

   ```
   kubectl apply -f pod.yaml
   ```

4. **Verify Secret Access in Pod**:
   ```
   kubectl exec secret-pod -- env | grep USERNAME
   kubectl exec secret-pod -- env | grep PASSWORD
   ```

This solution guides you through creating a secret with specific key-value pairs, deploying a pod that uses this secret, and verifying the secret's use within the pod.

</details>

Follow the objectives to create a secret and a pod that utilizes it. Use the tips and solutions for guidance if needed.
