#!/bin/bash
for image in `kubeadm config images list --config kubeadm.conf` quay.io/coreos/flannel:v0.12.0-amd64; do
    _image=${image//\//_}
    imageFile="/packages/${_image//:/\~}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull $image
        docker save $image -o $imageFile
    fi
done
