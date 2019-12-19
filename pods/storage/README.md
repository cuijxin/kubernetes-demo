## Storage

### Configure a Pod to Use a Volume for storage

In this exercise, you create a Pod that runs one Container. This Pod has a Volume of type emptyDir that lasts for the life of the Pod, even if the Container terminates and restarts.

与Docker不同，Kubernetes Volume的生命周期与Pod绑定。

* 容器挂掉后Kubelet再次重启容器时，Volume的数据依然存在。
* 而Pod删除时，Volume才会清理。数据是否丢失取决于具体的Volume类型，比如emptyDir的数据会丢失，而PV的数据则不会。

#### 示例

1. Create the Pod:
```
kubectl apply -f https://k8s.io/example/pods/storage/redis.yaml
```

2. Verify that the Pod's Container is running, and then watch for changes to the Pod:
```
kubectl get pod redis --watch
```
The output looks like this:
```
NAME    READY   STATUS  RESTARTS    AGE
redis   1/1     Running 0           13s
```

3. In another terminal, get a shell to the running Container:
```
kubectl exec -it redis -- /bin/bash
```

4. In you shell, go to /data/redis, and then create a file:
```
root@redis:/data# cd /data/redis
root@redis:/data/redis# echo Hello > test-file
```

5. In your shell, list the running processes:
```
root@redis:/data/redis# apt-get update
root@redis:/data/redis# apt-get install procps
root@redis:/data/redis# ps aux
```
The output is similar to this:
```
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
redis        1  0.1  0.1  33308  3828 ?        Ssl  00:46   0:00 redis-server *:6379
root        12  0.0  0.0  20228  3020 ?        Ss   00:47   0:00 /bin/bash
root        15  0.0  0.0  17500  2072 ?        R+   00:48   0:00 ps aux
```

6. In your shell, kill the Redis process:
```
root@redis:/data/redis# kill <pid>
```

where <pid> is the Redis process ID(PID).

7. In your original terminal, watch for changes to the Redis Pod. Eventually, you will see something like this:
```
NAME      READY     STATUS     RESTARTS   AGE
redis     1/1       Running    0          13s
redis     0/1       Completed  0         6m
redis     1/1       Running    1         6m
```

At this point, the Container has terminated and restarted. This is because the Redis Pod has a *restartPolicy* of ```Always```.

1. Get a shell into the restarted Container:
```
kubectl exec -it redis -- /bin/bash
```

2. In your shell, go to /data/redis, and verify that ```test-file``` is still there.
```
root@redis:/data/redis# cd /data/redis/
root@redis:/data/redis# ls
test-file
```

3. Delete the Pod that you created for this exercise:
```
kubectl delete pod redis
```

### Configure a Pod to Use a PersistentVolume for Storage

1. You, as cluster adminstrator, create a PersistentVolume backed by physical storage. You do not associate the volume with any Pod.

2. You, now taking the role of a developer / cluster user, create a PersistentVolumeClaim that is automatically bound to a suitable PersistentVolume.

3. You create a Pod that uses the above PersistentVolumeClaim for storage.

### Configure a Pod to Use a Projected Volume for Storage

1. Create the Secrets:
```
# Create files containing the username and password:
echo -n "admin" > ./username.txt
echo -n "1f2d1e2e67df" > ./password.txt

# Package these files into secrets:
kubectl create secret generic user --from-file=./username.txt
kubectl create secret generic pass --from-file=./password.txt
```
