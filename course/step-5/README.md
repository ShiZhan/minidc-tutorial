# Public Network

Check host network configuration:

```bash
ifconfig                # active interfaces
lspci | grep -i network # all network interface cards
lshw -class network     # detailed information on hardware and interfaces
```

Bashed on [step-4](../step-4/README.md), change the network configuration to:

```Ruby
    demo.vm.network "public_network", ip: "192.168.100.100", :netmask => "255.255.255.0", :bridge => 'eth2'
```

[Result](./Vagrantfile), the values in *ip* and *netmask* shoule be set according to chosen *bridge* interface.

Then, try to ping/ssh this IP address from other hosts in the same network.

Zhan.Shi @ 2017
