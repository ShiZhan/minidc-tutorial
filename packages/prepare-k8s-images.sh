#!/bin/bash
for image in `kubeadm config images list --config /home/vagrant/conf/kubeadm.conf`; do
    imageName=${image#registry.aliyuncs.com/google_containers/}
    imageFile="/packages/k8s.gcr.io_${imageName%:*}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull $image
        docker tag $image k8s.gcr.io/$imageName
        docker save k8s.gcr.io/$imageName -o $imageFile
    fi
done
