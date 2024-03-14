## Restore etcd Cluster Health

The etcd cluster is in an unhealthy state due to a configuration issue. Diagnose and fix the issue to restore etcd cluster health.

<details>
<summary>Tips</summary>

- Inspect the etcd manifest at `/etc/kubernetes/manifests/etcd.yaml` for misconfigurations.
- Use `journalctl -u etcd` to review the etcd service logs for errors.
</details>

<details>
<summary>Solution</summary>

The etcd service's client URL has been misconfigured. Correct the `--listen-client-urls` setting in `/etc/kubernetes/manifests/etcd.yaml` back to `https://127.0.0.1:2379`, then restart the kubelet to apply the change.

</details>
