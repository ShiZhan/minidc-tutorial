#!/bin/bash

# get docker packages
PREFIX="https://mirrors.aliyun.com/docker-ce/linux/ubuntu/dists/focal/pool/stable/amd64/"
PACKAGES="""
    containerd.io_1.2.13-2_amd64.deb
    docker-ce-cli_19.03.11~3-0~ubuntu-focal_amd64.deb
    docker-ce_19.03.11~3-0~ubuntu-focal_amd64.deb
"""
for p in $PACKAGES; do
    [ -f "/vagrant/packages/$p" ] || wget $PREFIX$p -O "/vagrant/packages/$p"
done

# get k8s packages
PREFIX="https://mirrors.aliyun.com/"
PACKAGES="""
    ubuntu/pool/main/s/socat/socat_1.7.3.4-1_amd64.deb
    ubuntu/pool/main/e/ebtables/ebtables_2.0.11-4_amd64.deb
    ubuntu/pool/main/c/conntrack-tools/conntrack_1.4.6-1_amd64.deb
    ubuntu/pool/main/libn/libnetfilter-conntrack/libnetfilter-conntrack3_1.0.8-1_amd64.deb
    ubuntu/pool/main/n/netbase/netbase_6.1_all.deb
    kubernetes/apt/pool/cri-tools_1.13.0-00_amd64_6930e446a683884314deef354fbd8a7c5fc2be5c69c58903ad83b69b42529da4.deb
    kubernetes/apt/pool/kubelet_1.18.4-00_amd64_b240a3c0686125ac16c2fc4fd333c135a69b7b2b167345f2d45c4707411f9068.deb
    kubernetes/apt/pool/kubectl_1.18.4-00_amd64_cc334c76c233820fd27906a86bb64fe7f833a629f6a08303f344dc7e76c0d66c.deb
    kubernetes/apt/pool/kubeadm_1.18.4-00_amd64_9c3d8514120d62b90e19d8ec13947fcbc9d56bed21d36dd3d2d314a4cd13f6bb.deb
"""
for p in $PACKAGES; do
    [ -f "/vagrant/packages/${p##*/}" ] || wget $PREFIX$p -O "/vagrant/packages/${p##*/}"
done

# install local packages
(cd /vagrant/packages && dpkg -i \
    containerd.io_1.2.13-2_amd64.deb \
    docker-ce-cli_19.03.11~3-0~ubuntu-focal_amd64.deb \
    docker-ce_19.03.11~3-0~ubuntu-focal_amd64.deb \
    socat_1.7.3.4-1_amd64.deb \
    ebtables_2.0.11-4_amd64.deb \
    conntrack_1.4.6-1_amd64.deb \
    libnetfilter-conntrack3_1.0.8-1_amd64.deb \
    netbase_6.1_all.deb \
    cri-tools_1.13.0-00_amd64_6930e446a683884314deef354fbd8a7c5fc2be5c69c58903ad83b69b42529da4.deb \
    kubeadm_1.18.4-00_amd64_9c3d8514120d62b90e19d8ec13947fcbc9d56bed21d36dd3d2d314a4cd13f6bb.deb \
    kubectl_1.18.4-00_amd64_cc334c76c233820fd27906a86bb64fe7f833a629f6a08303f344dc7e76c0d66c.deb \
    kubelet_1.18.4-00_amd64_b240a3c0686125ac16c2fc4fd333c135a69b7b2b167345f2d45c4707411f9068.deb
)