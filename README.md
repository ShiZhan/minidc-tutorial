# Introduction

3 nodes cluster, node image based on [ubuntu-xenial-docker](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker)

With docker running on each node, this virtual cluster can support multiple distributed software configuration at ease.

Hosts:

1. node1: 192.168.33.21
2. node2: 192.168.33.22
3. node3: 192.168.33.23

To prepare or regenerate key pair:

```bash
ssh-keygen -f insecure-key -N ''
```

SSH access:

```bash
ssh -i insecure-key vagrant@{IP}
```

Ignore host checking during first time login (potential MITM attack):

```bash
ssh -i insecure-key -o StrictHostKeyChecking=no vagrant@{IP}
```

Furthermore, force no password input:

```bash
ssh -i insecure-key -o StrictHostKeyChecking=no -o PasswordAuthentication=no vagrant@{IP}
```

Then VMs should be re-created to apply new keys.

Zhan.Shi @ 2017
