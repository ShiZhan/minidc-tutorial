#!/bin/bash
if [ `id -u` != "0" ]; then
    echo "Please re-run `basename $0` as root."
    exit 1
fi
kubeadm init --config=/home/vagrant/conf/kubeadm.conf
