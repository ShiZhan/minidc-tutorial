# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "envimation/ubuntu-xenial-docker"
  config.vm.box_version = "1.0.0-1501809231"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  ssh_key_public  = File.readlines("./insecure-key.pub").first.strip
  config.vm.provision 'shell', inline: "echo #{ssh_key_public} >> /home/vagrant/.ssh/authorized_keys"
  config.vm.provision "file", source: "./insecure-key", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision 'shell', inline: "chmod 400 /home/vagrant/.ssh/id_rsa"

  IP0 = 20
  (1..3).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.network "private_network", ip: "192.168.33.#{i + IP0}"
      node.vm.hostname = "node#{i}"
      node.vm.synced_folder "./data", "/vagrant_data", create: true, owner: "root", group: "root"
      node.vm.provision "shell", inline: <<-SHELL
        echo "This is node#{i}" > /etc/motd
      SHELL
    end
  end
end
