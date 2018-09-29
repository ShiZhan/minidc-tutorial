# -*- mode: ruby -*-
# vi: set ft=ruby :

data_host     = "./data"
data_guest    = "/vagrant_data"
pkgs_host     = "./packages"
pkgs_guest    = "/packages"
path_collectl = "#{pkgs_guest}/collectl_4.0.4-1_all.deb"
url_collectl  = "http://archive.ubuntu.com/ubuntu/pool/universe/c/collectl/collectl_4.0.4-1_all.deb"

KEY_PUB = "./insecure-key.pub"
KEY_PRV = "./insecure-key"

Vagrant.configure("2") do |config|
  config.vm.box = "envimation/ubuntu-xenial"
  config.vm.box_version = "1.0.3-1516241473"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.cpus = 1
  end

  ssh_key_public  = File.readlines(KEY_PUB).first.strip
  config.vm.provision 'shell', inline: "echo #{ssh_key_public} >> /home/vagrant/.ssh/authorized_keys"
  config.vm.provision "file", source: KEY_PRV, destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision 'shell', inline: "chmod 400 /home/vagrant/.ssh/id_rsa"

  IP0 = 20
  (1..3).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.network "private_network", ip: "192.168.33.#{i + IP0}"
      node.vm.hostname = "node#{i}"

      node.vm.synced_folder "#{data_host}", "#{data_guest}", create: true, owner: "root", group: "root"
      node.vm.synced_folder "#{pkgs_host}", "#{pkgs_guest}", create: true, owner: "root", group: "root"

      node.vm.provision "file", source: "conf/", destination: "/home/vagrant/conf"
      node.vm.provision "shell", inline: <<-SHELL
        echo "This is node#{i}" > /etc/motd

        mv /etc/hosts /etc/hosts.bak
        cp /home/vagrant/conf/hosts /etc/hosts

        mv /etc/apt/sources.list /etc/apt/sources.list.bak
        cp /home/vagrant/conf/sources.list /etc/apt/sources.list
        apt-get update && apt-get install -yq pciutils libtime-hires-perl libio-compress-perl

        set -x
        [ -f #{path_collectl} ] || wget #{url_collectl} -o #{path_collectl}
        dpkg -i #{path_collectl}

      SHELL
    end
  end
end
