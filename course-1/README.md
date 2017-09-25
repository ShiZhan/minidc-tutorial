# Introduction

1. Ensure the required box is installed.

```bash
vagrant box list # 'envimation/ubuntu-xenial-docker' should appear.
```

2. Ensure you are in directory *course-1*.

```bash
pwd # check current directory
ls  # and it should contain just the README.md
```

3. Generate Vagrantfile.

```bash
vagrant init
```

4. Check before firing up.

```bash
vagrant status # status should be "not created"
```

5. Bring it on.

```bash
vagrant up
vagrant status # status change to "running"
```

6. Connect into it.

```bash
vagrant ssh default
```

7. Do something with the machine.

```bash
# ... do something ...
exit
```

8. Halt it.

```bash
vagrant halt
vagrant status # status change to "poweroff"
```

9. Clean up when not needed anymore, free up space.

```bash
vagrant destroy
vagrant status # status change back to "not created"
```

Zhan.Shi @ 2017
