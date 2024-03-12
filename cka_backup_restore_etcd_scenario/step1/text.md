
## Backup etcd Data

In this step, you will perform a backup of your etcd cluster data. Ensuring you have a backup of your etcd data is crucial for disaster recovery and cluster maintenance.

### Objective

Create a backup of the etcd data stored in your Kubernetes cluster to a specific file: `/backup/etcd-backup.db`.

<details>
<summary>Tips</summary>

- Use the `etcdctl snapshot save` command to save a snapshot of the etcd database.
- Make sure to specify the correct etcd API version.
- Remember to include flags for specifying the etcd API version, endpoints, and the snapshot file name.
- The path for the backup will be `/backup/etcd-backup.db`. Ensure the `/backup` directory exists or create it before running the backup command.
</details>

<details>
<summary>Solution</summary>

To backup the etcd data, you can use the following command:

```shell
ETCDCTL_API=3 etcdctl snapshot save /backup/etcd-backup.db --endpoints=https://[YOUR_ETCD_ENDPOINT]:2379 --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt
```

Replace `[YOUR_ETCD_ENDPOINT]` with your etcd endpoint. Ensure you have the `/backup` directory created before running this command.
</details>
