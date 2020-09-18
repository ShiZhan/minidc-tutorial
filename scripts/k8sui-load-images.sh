#!/bin/bash
if [ $HOSTNAME == "controller" ]; then
    # Prepare image sets for kubernetes dashboard
    IMAGES="""
        kubernetesui/dashboard:v2.0.4
        kubernetesui/metrics-scraper:v1.0.4
    """

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
fi
