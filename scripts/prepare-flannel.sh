#!/bin/bash
if [ $HOSTNAME == "controller" ]; then
    kubectl apply -f /home/vagrant/conf/kube-flannel.yml
fi
