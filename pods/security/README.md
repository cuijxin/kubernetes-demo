## Pod Security

### Configure a Security Context for a Pod or Container

A security context defines privilege and access control settings for a Pod or Container. Security context settings include:

* Discretionary Access Control: Permission to access an object, like a file, is based on user ID(UID) and group ID(GID).
* Security Enhanced Linux(SELinux): Objects are assigned security labels.
* Running as privileged or unprivileged.
* Linux Capabilities: Give a process some privileges, but not all the privileges of the root user.
* AppArmor: Use program profiles to restrict the capabilities of individual programs.
* Seccomp: Filter a process's system calls.
* AllowPrivilegeEscalation: Controls whether a process can gain more privileges than its parent process. This bool directly controls whether the no_new_privs flag gets set on the container process.
AllowPrivilegeEscalation is true always when the container is:1) run as Privileged OR 2) has CAP_SYS_ADMIN.
