# Introduction

3 nodes cluster, node image based on [ubuntu-xenial-docker](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker)

With docker running on each node, this virtual cluster can support multiple distributed software configuration at ease.

Hosts:

1. node1: 192.168.33.21
2. node2: 192.168.33.22
3. node3: 192.168.33.23

To download base image directly:

[refernece](https://stackoverflow.com/questions/24958110/download-vagrant-box-from-vagrantcloud-com)

To manage metadata for downloaded box files:

[reference](https://stackoverflow.com/questions/32607741/vagrant-setup-virtualbox-name-with-box-version-from-json-file)

Example:

```json
{
  "name": "envimation/ubuntu-xenial-docker",
  "description": "This box contains Ubuntu 16.04 LTS 64-bit with docker.",
  "versions": [{
    "version": "1.0.0-1502068394",
    "providers": [{
      "name": "virtualbox",
      "url": "ubuntu-xenial-docker.box"
    }]
  }]
}
```

Add downloaded box by metadata:

```bash
vagrant box add foo.json
```

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
