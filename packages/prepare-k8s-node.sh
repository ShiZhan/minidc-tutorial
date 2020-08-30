#!/bin/bash
IMAGES="""
    registry.aliyuncs.com/google_containers/kube-proxy:v1.18.4
    registry.aliyuncs.com/google_containers/pause:3.2
    quay.io/coreos/flannel:v0.12.0-amd64
"""

for image in $IMAGES; do
    _image=${image//\//_}
    imageFile="/packages/${_image//:/\~}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull $image
        docker save $image -o $imageFile
    fi
done
