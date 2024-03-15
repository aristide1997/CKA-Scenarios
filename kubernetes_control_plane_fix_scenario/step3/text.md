## Step 3: Investigate and Resolve Pod Scheduling Issue

In this step, your task is to deploy an `nginx` pod with image `nginx`. After deployment, you might notice that the pod is not running as expected. Investigate and understand why, then resolve any issues to get the pod running.

**Important:** Deploying the pod is the first step. The crucial part is figuring out why it might not be running and fixing the issue.

<details>
<summary>Tip</summary>

Utilize `kubectl` commands to inspect pods and other resources within your cluster. Investigate any component that is not running correctly.

</details>

<details>
<summary>Solution</summary>

1. Correct the kube-scheduler's configuration by editing `/etc/kubernetes/manifests/kube-scheduler.yaml` on the control plane node, ensuring the image version is correct (v1.20.0)

</details>
