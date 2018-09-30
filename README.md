# Introduction

3+1 nodes cluster, node image based on [ubuntu-xenial](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial)

Hosts:

0. controller: 192.168.33.127
1. node1:      192.168.33.21
2. node2:      192.168.33.22
3. node3:      192.168.33.23

All machines are connected by a host-only network.

## Get and Manage Boxes

To download base image directly:

[refernece](https://stackoverflow.com/questions/24958110/download-vagrant-box-from-vagrantcloud-com)

Example, the one used in this Vagrant project:

[Download URL](https://app.vagrantup.com/envimation/boxes/ubuntu-xenial-docker/versions/1.0.0-1516241473/providers/virtualbox.box)

To manage metadata for downloaded box files:

[reference](https://stackoverflow.com/questions/32607741/vagrant-setup-virtualbox-name-with-box-version-from-json-file)

Example:

```json
{
  "name": "envimation/ubuntu-xenial",
  "description": "This box contains Ubuntu 16.04 LTS 64-bit.",
  "versions": [{
    "version": "1.0.0-1516241473",
    "providers": [{
      "name": "virtualbox",
      "url": "ubuntu-xenial.box"
    }]
  }]
}
```

Add downloaded box using metadata file with box version (without this file, all imported box will begin versioning from 0):

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

## A Small cluster of virtual machines

All 3 VMs reside in current directory, refer to [Vagrantfile](./Vagrantfile).

1 controller VM locates in [Vagrantfile](controller/Vagrantfile).

## Scale Out to multiple physical hosts with 120 Virtual Machines

Refer to [swarm120/Vagrantfile](swarm120/Vagrantfile).

All machines are connected through bridged network, thus became public accessible.

Use `start-vm.sh` to bring up corresponding guests.

E.g.: Allocate first group of 30 guests to host1, run `./start-vm {1..30}`. Then, for host2, allocate next 30 guests by `./start-vm {31..60}`.

Zhan.Shi @ 2017, 2018
