**Step: 2/3**

## Correct Scheduler and Controller Manager Misconfigurations

The Kubernetes Scheduler and Controller Manager are not functioning correctly. Investigate and resolve any configuration issues to ensure proper cluster operation.

<details>
<summary>Tips</summary>

- Double check the manifest files located in `/etc/kubernetes/manifests/`.
- Inspect the kubelet logs for errors related to these components.
</details>

<details>
<summary>Solution</summary>

The manifest files for both the scheduler and controller manager have been renamed. Restore their original filenames in `/etc/kubernetes/manifests/` to ensure they are correctly managed by the kubelet.

```bash
sudo mv /etc/kubernetes/manifests/kube-scheduler.yaml.bak /etc/kubernetes/manifests/kube-scheduler.yaml
sudo mv /etc/kubernetes/manifests/kube-controller-manager.yaml.bak /etc/kubernetes/manifests/kube-controller-manager.yaml
```

</details>
