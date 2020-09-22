# Introduction

2+1 nodes cluster, node image based on [ubuntu-focal](http://cloud-images.ubuntu.com/focal/20200618/focal-server-cloudimg-amd64-vagrant.box).

Hosts:

0. controller: 192.168.33.20
1. node1:      192.168.33.21
2. node2:      192.168.33.22

All machines are connected by a host-only network.

Each with 1GB memory and 2 cores, for 4 core hosts, the minimal setup could be controller + node1. 

## Get and Manage Boxes

To manage metadata for downloaded box files:

[reference](https://stackoverflow.com/questions/32607741/vagrant-setup-virtualbox-name-with-box-version-from-json-file)

Example:

```json
{
    "name": "ubuntu/focal64",
    "versions": [{
        "version": "20200618.0.0",
        "providers": [{
            "name": "virtualbox",
            "url": "focal-server-cloudimg-amd64-vagrant.box"
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

## A Brief Course on Vagrant

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

Zhan.Shi @ 2017-2020
