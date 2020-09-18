#!/bin/bash
if [ $HOSTNAME == "controller" ]; then
    kubectl create -f admin-user.yaml
    kubectl create -f admin-user-role-binding.yaml
    kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
fi
