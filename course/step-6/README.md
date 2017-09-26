# Provision

In virtual machine dedicated section, add:

```bash
    demo.vm.provision "shell", inline: <<-SHELL
      echo "This is course demo project" > /etc/motd
    SHELL
```

Then, use ssh to login, in the welcome screen, you'll see *This is course demo project*.

For more information, this is the [portal](https://www.vagrantup.com/docs/) leads to official site.

Zhan.Shi @ 2017
