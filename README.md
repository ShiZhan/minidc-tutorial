# Introduction

3 nodes cluster, node image based on [ubuntu-xenial-docker](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker)

With docker running on each node, this virtual cluster can support multiple distributed software configuration at ease.

Hosts:

1. node1: 192.168.33.21
2. node2: 192.168.33.22
3. node3: 192.168.33.23

All machines are connected by a host-only network.

## Get and Manage Boxes

To download base image directly:

[refernece](https://stackoverflow.com/questions/24958110/download-vagrant-box-from-vagrantcloud-com)

Example, the one used in this Vagrant project:

[Download URL](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker/versions/1.0.0-1502068394/providers/virtualbox.box)

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

Check it out:

```bash
vagrant box list
```

## A Brief Course for Newbies

### Hello World!

The 1st run [step-1](course/step-1/README.md).

### Name it!

Name the virtual machine [step-2](course/step-2/README.md).

### CPU and Memory

Set CPU cores and memory (using VirtualBox provider) [step-3](course/step-3/README.md).

### Private Network

Add a host-only network [step-4](course/step-4/README.md).

### Public Network

Bridge to chosen host network [step-5](course/step-5/README.md).

### Provision

Do something more to prepare the virtual machine [step-6](course/step-6/README.md).

## SSH Made Easy

To prepare or regenerate your own key pair:

```bash
ssh-keygen -f insecure-key -N ''
```

SSH access by key pair:

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

## 3 Virtual Machine Cluster

Project resides in current directory, refer to [Vagrantfile](./Vagrantfile).

## Scale Out to 4 Physical Hosts with 120 Virtual Machines

Refer to [cluster-120/Vagrantfile-00{1..4}](cluster-120/).

All machines are connected through bridged network, thus became public accessible.

TODO: use command line augments to unify physical cluster configuration.

Zhan.Shi @ 2017
