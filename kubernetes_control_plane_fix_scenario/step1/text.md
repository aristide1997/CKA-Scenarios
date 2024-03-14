> **Progress: 1/3**

## Fix the API Server Connectivity

The Kubernetes API server is currently unresponsive. Diagnose the issue and restore its functionality.

<details>
<summary>Tips</summary>

- Use `journalctl -u kube-apiserver` to review the API server logs.
- Inspect the kube-apiserver manifest at `/etc/kubernetes/manifests/kube-apiserver.yaml`.
</details>

<details>
<summary>Solution</summary>

The API server's secure port has been misconfigured. Correct the `secure-port` setting in `/etc/kubernetes/manifests/kube-apiserver.yaml` back to `6443`, then restart the kubelet to apply the change.

```bash
sudo sed -i 's/secure-port=16443/secure-port=6443/g' /etc/kubernetes/manifests/kube-apiserver.yaml
```

</details>
