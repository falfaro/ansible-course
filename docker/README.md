# Emulating a full operating system in Docker

Two Docker images are used, one which emulates a full CentOS 7 system, and another one which emulates a full Ubuntu 14.04.03 LTS system.

To build the Docker images:

```
$ ./build_containers.sh
```

There is a script that brings up three Web servers and two MySQL servers:

```
$ ./start_containers.sh
```

The containers export an SSH service over IPv4 via an internal interface in the container that is bridged to the "docker0" interface of the host. One can inspect each container to figure out which IPv4 the container is attached to, or "ps" on the host looking for "docker-proxy" processes and looking at their "-container-ip" command-line argument.

To destroy the containers:

```
$ ./stop_containers.sh
```
