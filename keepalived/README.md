# Load-balancing using Ansible

This lab uses Ansible to deploy three Web servers, front-ended with a cluster of two HAproxy load-balancers in front configured in active/passive (shared VIP managed with keepalived).

Vagrant is used to spawn two Ubuntu virtual machines which handle the load-balancing. Each virtual machine hosts a keepalived and a HAproxy service. In order to bring these two instances up:

```
$ vagrant up
```

Docker is used to spawn three containers where the Web servers are hosted. The first two containers are CentOS-7 while the last container is Ubuntu 14.04.3 LTS. All containers host a very simple Apache2 service. In order to start these containers:

```
$ ../docker/start_containers.sh
```

To deploy the entire service using Ansible:

```
$ ansible-playbook -i inv deploy.yml
```
