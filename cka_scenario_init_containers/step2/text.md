## Step 2: Verify Shared Data Access

Now that you've deployed your pod, it's time to verify that the main container can successfully access the data prepared by the init container.

Your tasks for this step are:

1. Execute a command within the main container to display the contents of `/etc/shared/hello.txt`.
2. Confirm that the output matches the text placed there by the init container.

<details>
<summary>Tips</summary>

- Use `kubectl exec [pod-name] --container myapp -- cat /etc/shared/hello.txt` to execute the command in the main container.
</details>

<details>
<summary>Solution</summary>

To verify the shared data access, run:

```bash
kubectl exec $POD_NAME --container myapp -- cat /etc/shared/hello.txt
```

You should see the output:

```
Hello from init container
```

</details>
