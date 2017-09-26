# Private Network

The following line has been added to Vagrantfile from [step-3](../step-3/README.md).

In virtual machine specific section.

```Ruby
    demo.vm.network "private_network", ip: "192.168.33.2"
```

[Result](./Vagrantfile)

Use ssh or any typical terminal software (putty, xshell) to connect this IP address from host:

```bash
ssh vagrant@192.168.33.2
```

Default password: *vagrant*.

Zhan.Shi @ 2017
