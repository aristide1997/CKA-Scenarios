## Step 1: Create Namespaces and Deploy Pods

In this step, you will create two namespaces, `frontend` and `backend`, and deploy a pod in each namespace.

### Objectives

- Create a namespace named `frontend`.
- Create a namespace named `backend`.
- Deploy a pod named `nginx-frontend` in the `frontend` namespace using the `nginx` image.
- Deploy a pod named `nginx-backend` in the `backend` namespace using the `nginx` image.

<details>
<summary>Tips</summary>

- Use `kubectl create namespace <namespace-name>` to create a new namespace.
- Use `kubectl run <pod-name> --image=<image-name> --namespace=<namespace>` to deploy a pod in a specific namespace.

</details>

<details>
<summary>Solution</summary>

- `kubectl create namespace frontend`
- `kubectl create namespace backend`
- `kubectl run nginx-frontend --image=nginx --namespace=frontend`
- `kubectl run nginx-backend --image=nginx --namespace=backend`

</details>
