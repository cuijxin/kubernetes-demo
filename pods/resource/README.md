### Assign Memory Resources to Containers and Pods

#### If you do not specify a memory limit
* * *
If you do not specify a memory limit for a Gontainer, one of the following situations applies:

* The Container has no upper bound on the amount of memory it uses. The Container could use all of the memory available on the Node where it is running which in turn could invoke the OOM Killer. ***Further, in case of an OOM Kill, acontainer with no resource limits will have a greater chance of being killed.***
* The Container is running in a namespace that has a default memory limit, and the Container is automatically assigned the default limit. Cluster administrators can use a [LimitRange](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.17/#limitrange-v1-core) to specify a default value for the memory limit.

#### Motivation for memory requests and limits
***
By configuration memory requests and limits for the Containers that run in your cluster, you can make efficient use of the memory resources available on your cluster's Nodes. By keeping a Pod's memory request low, you give the Pod a good chance of being scheduled. By having a memory limit that is greater than the memory request, you accomplish two things:
* The Pod can have bursts of activity where it makes use of memory that happens to be available.
* The amount of memory a Pod can use during a burst is limited to some reasonable amount.

### Assign CPU Resources to Containers and Pods

#### If you do not specify a CPU limit
***
If you do not specify a CPU limit for a Container, then one of these situations applies:
* The Container has no upper bound on the CPU resources it can use. The Container could use all of the CPU resources available on the Node where it is running.
* The Container is running in a namespace that has a default CPU limit, and the Container is automatically assigned the default limit. Cluster administrators can use a [LimitRange](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.17/#limitrange-v1-core/) to specify a default value for the CPU limit.

#### Motivation for CPU requests and limits
***
By configuring the CPU requests and limits of the Containers that run in your cluster, you can make efficient use of the CPU resources available on your cluster Nodes. By keeping a Pod CPU request low, you give the Pod a good chance of being scheduled. By having a CPU limit that is greater than the CPU request, you accomplish two things:
* The Pod can have bursts of activity where it makes use of CPU resources that happen to be available.
* The amount of CPU resources a Pod can use during a burst is limited to some reasonable amount.