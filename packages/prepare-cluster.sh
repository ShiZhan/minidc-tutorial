#!/bin/bash
if [ `id -u` == "0" ]; then
    echo "Please re-run `basename $0` as regular user."
    exit 1
fi
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

