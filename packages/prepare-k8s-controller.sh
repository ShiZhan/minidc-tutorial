#!/bin/bash
for image in `kubeadm config images list --config kubeadm.conf`; do
    _image=${image//\//_}
    imageFile="/packages/${_image//:/\~}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull $image
        docker save $image -o $imageFile
    fi
done
