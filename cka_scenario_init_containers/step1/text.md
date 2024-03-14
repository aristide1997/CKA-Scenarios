## Step 1: Deploy a Pod with an Init Container

Deploy a pod `init-pod` that includes both an init container and a main application container. The init container will create a simple text file in a shared volume, which the main container will then access.

Create a YAML definition for a pod that includes:

- An init container named `init-myservice` that uses the `busybox` image to create a file `/etc/shared/hello.txt` in a shared volume.
- File `/etc/shared/hello.txt` contains string `Hello from init container`
- A main container named `myapp` that uses the `nginx` image and displays the contents of `/etc/shared/hello.txt` when accessed.

<details>
<summary>Tips</summary>

- Remember to define an emptyDir volume that both containers can access.
- Use `echo "Hello from init container" > /etc/shared/hello.txt` in the init container to create the file.
- To display the file contents in the main container, you can use a command override to `cat /etc/shared/hello.txt` and keep the container running.
</details>

<details>
<summary>Solution</summary>

Your YAML file should look similar to this:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: init-pod
spec:
  volumes:
    - name: shared-data
      emptyDir: {}
  initContainers:
    - name: init-myservice
      image: busybox
      command:
        ["sh", "-c", 'echo "Hello from init container" > /etc/shared/hello.txt']
      volumeMounts:
        - name: shared-data
          mountPath: /etc/shared
  containers:
    - name: myapp
      image: nginx
      volumeMounts:
        - name: shared-data
          mountPath: /etc/shared
      command: ["/bin/sh"]
      args: ["-c", "cat /etc/shared/hello.txt; while true; do sleep 30; done;"]
```

Deploy the pod using:

```bash
kubectl apply -f <your-yaml-file>.yaml
```

</details>
