**Step: 2/3**

## Restore etcd Cluster Health

The etcd cluster is in an unhealthy state due to a configuration issue. Diagnose and fix the issue to restore etcd cluster health.

<details>
<summary>Tips</summary>

- Check the etcd pod log at `/var/log/pods`
- Inspect the etcd manifest at `/etc/kubernetes/manifests/etcd.yaml` for misconfigurations.

</details>

<details>
<summary>Solution</summary>

The etcd peer certificate path has been misconfigured. Correct the path in `/etc/kubernetes/manifests/etcd.yaml` back to `/etc/kubernetes/file/pki/etcd/peer.crt`, then restart the kubelet to apply the change.

```bash
sudo sed -i 's+/etc/kubernetes/file/pki/etcd/peer.crt+/etc/kubernetes/pki/etcd/peer.crt+' /etc/kubernetes/manifests/etcd.yaml
```

</details>
