# Private Network

The following line has been added to Vagrantfile from [step-3](../step-3/README.md).

In virtual machine specific section.

```Ruby
    demo.vm.network "private_network", ip: "192.168.33.2"
```

Use ssh to connect from host:

```bash
ssh vagrant@192.168.33.2
```

Default password: *vagrant*.

Zhan.Shi @ 2017
