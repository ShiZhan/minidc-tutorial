#!/bin/bash
IMAGES=""

if [ $HOSTNAME == "controller" ]; then
    IMAGES="`kubeadm config images list --config kubeadm.conf` quay.io/coreos/flannel:v0.12.0-amd64"
else
    IMAGES="""
        registry.aliyuncs.com/google_containers/kube-proxy:v1.18.4
        registry.aliyuncs.com/google_containers/pause:3.2
        quay.io/coreos/flannel:v0.12.0-amd64
    """
fi

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

cat << EOF > /run/flannel/subnet.env
FLANNEL_NETWORK=10.244.0.0/16
FLANNEL_SUBNET=10.244.0.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true
EOF
