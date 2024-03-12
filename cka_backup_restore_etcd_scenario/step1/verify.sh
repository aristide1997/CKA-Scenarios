
#!/bin/bash

# Check if the etcd backup file exists
if [ -f "/backup/etcd-backup.db" ]; then
    echo "Etcd data backup found."
    exit 0
else
    echo "Etcd data backup not found."
    exit 1
fi
