# CPU and Memory

Check Vagrantfile, compare to [step-2](../step-2/README.md), the following lines have been added.

```Ruby
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end
```

Which tells the virtualbox provider to allocate just 1 CPU core and 1GB main memory for every virtual machine.

Zhan.Shi @ 2017
