#### If you do not specify a memory limit


* * *
If you do not specify a memory limit for a Gontainer, one of the following situations applies:

* The Container has no upper bound on the amount of memory it uses. The Container could use all of the memory available on the Node where it is running which in turn could invoke the OOM Killer. ***Further, in case of an OOM Kill, acontainer with no resource limits will have a greater chance of being killed.***
* The Container is running in a namespace that has a default memory limit, and the Container is automatically assigned the default limit. Cluster administrators can use a [LimitRange](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.17/#limitrange-v1-core) to specify a default value for the memory limit.