# Name It!

Simply use the current one [here](./Vagrantfile), or DIY:

1. Minimalized Vagrantfile.

Refer to [step-1](../step-1/README.md), prepare a default Vagrantfile, then:

```bash
sed -e '/^ *#/d' -e '/^$/d' ../course-1/Vagrantfile
```

Expected content:

```Ruby
Vagrant.configure("2") do |config|
  config.vm.box = "envimation/ubuntu-xenial-docker"
end
```

2. Put above content into a local Vagrantfile.

```bash
pwd # ensure you are in directory *course-2*
sed -e '/^ *#/d' -e '/^$/d' ../course-1/Vagrantfile > Vagrantfile
```

3. Add the following line before 'end'.

```Ruby
  config.vm.define "course2demo"
```

4. Check it out.

```bash
vagrant status # status report: not created
```

Zhan.Shi @ 2017
