#!/bin/bash
for i in `kubeadm config images list`; do
    imageName=${i#k8s.gcr.io/}
    imageFile="/packages/k8s.gcr.io_${imageName%:*}.tar"
    if [ -f $imageFile ]; then
        docker load -i $imageFile
    else
        docker pull registry.aliyuncs.com/google_containers/$imageName
        docker tag registry.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
        docker rmi registry.aliyuncs.com/google_containers/$imageName
        docker save k8s.gcr.io/$imageName -o $imageFile
    fi
done
