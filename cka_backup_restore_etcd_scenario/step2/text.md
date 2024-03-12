
## Restore etcd Data

After successfully backing up your etcd data, you may find yourself in a situation where you need to restore from that backup. This step will guide you through the restoration process.

### Objective

Restore the etcd data from the backup file `/backup/etcd-backup.db` you created in the previous step.

<details>
<summary>Tips</summary>

- Use the `etcdctl snapshot restore` command to restore etcd data from a snapshot.
- Specify the snapshot file and the new data directory for the restored etcd data.
- Ensure etcd is not running when you attempt to restore the data.
- Update your Kubernetes static pod manifests to use the new etcd data directory.
</details>

<details>
<summary>Solution</summary>

To restore the etcd data, you can use the following command:

```shell
ETCDCTL_API=3 etcdctl snapshot restore /backup/etcd-backup.db --data-dir /var/lib/etcd-restore
```

After restoring, update your etcd static pod manifest to use `/var/lib/etcd-restore` as the data directory and restart the etcd service.
</details>
