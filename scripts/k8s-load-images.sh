#!/bin/bash
IMAGES=""

# Prepare different image sets for controller and worker node
if [ $HOSTNAME == "controller" ]; then
    # "kubeadm config images list --config kubeadm.conf" & "quay.io/coreos/flannel:v0.12.0-amd64"
    IMAGES="""
        registry.aliyuncs.com/google_containers/coredns:1.6.7
        registry.aliyuncs.com/google_containers/etcd:3.4.3-0
        registry.aliyuncs.com/google_containers/kube-apiserver:v1.18.9
        registry.aliyuncs.com/google_containers/kube-controller-manager:v1.18.9
        registry.aliyuncs.com/google_containers/kube-scheduler:v1.18.9
        registry.aliyuncs.com/google_containers/kube-proxy:v1.18.9
        registry.aliyuncs.com/google_containers/pause:3.2
        quay.io/coreos/flannel:v0.12.0-amd64
    """
else
    # worker node images and test images (alpine and nginx)
    IMAGES="""
        registry.aliyuncs.com/google_containers/kube-proxy:v1.18.9
        registry.aliyuncs.com/google_containers/pause:3.2
        quay.io/coreos/flannel:v0.12.0-amd64
        alpine:3.12.0
        nginx:1.19.2-alpine
        busybox:1.32.0
    """
fi

# Pull images with local cache
for image in $IMAGES; do
    _image=${image//\//_}
    imageFile="/vagrant/packages/${_image//:/\~}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull $image
        docker save $image -o $imageFile
    fi
done
