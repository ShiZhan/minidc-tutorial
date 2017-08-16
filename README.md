# Introduction

3 nodes cluster, node image based on [ubuntu-xenial-docker](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker)

With docker running on each node, this virtual cluster can support multiple distributed software configuration at ease.

Hosts:

1. node1: 192.168.33.21
2. node2: 192.168.33.22
3. node3: 192.168.33.23

SSH access:

```bash
ssh -i insecure-key vagrant@{IP}
```

To regenerate key pair:

```bash
ssh-keygen -f insecure-key
```

Then VMs should be re-created to apply new keys.

Zhan.Shi @ 2017
