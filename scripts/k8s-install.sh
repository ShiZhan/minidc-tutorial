#!/bin/bash

# docker packages
PACKAGES="""
    https://mirrors.aliyun.com/docker-ce/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.2.13-2_amd64.deb
    https://mirrors.aliyun.com/docker-ce/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_19.03.11~3-0~ubuntu-focal_amd64.deb
    https://mirrors.aliyun.com/docker-ce/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_19.03.11~3-0~ubuntu-focal_amd64.deb
"""

# k8s packages
PACKAGES+="""
    https://mirrors.aliyun.com/ubuntu/pool/main/s/socat/socat_1.7.3.4-1_amd64.deb
    https://mirrors.aliyun.com/ubuntu/pool/main/e/ebtables/ebtables_2.0.11-4_amd64.deb
    https://mirrors.aliyun.com/ubuntu/pool/main/c/conntrack-tools/conntrack_1.4.6-1_amd64.deb
    https://mirrors.aliyun.com/ubuntu/pool/main/libn/libnetfilter-conntrack/libnetfilter-conntrack3_1.0.8-1_amd64.deb
    https://mirrors.aliyun.com/ubuntu/pool/main/n/netbase/netbase_6.1_all.deb
    https://mirrors.aliyun.com/kubernetes/apt/pool/cri-tools_1.13.0-01_amd64_4ff4588f5589826775f4a3bebd95aec5b9fb591ba8fb89a62845ffa8efe8cf22.deb
    https://mirrors.aliyun.com/kubernetes/apt/pool/kubernetes-cni_0.8.7-00_amd64_ca2303ea0eecadf379c65bad855f9ad7c95c16502c0e7b3d50edcb53403c500f.deb
    https://mirrors.aliyun.com/kubernetes/apt/pool/kubeadm_1.18.9-00_amd64_428b0a63954c4577635daeea9c6fb179747c082ef7a2c51b9826b1258575665c.deb
    https://mirrors.aliyun.com/kubernetes/apt/pool/kubectl_1.18.9-00_amd64_3804ac2fe51f09c5d2fae15ab3c39abf2beb6babdb6e45d811a32100a5e24fdb.deb
    https://mirrors.aliyun.com/kubernetes/apt/pool/kubelet_1.18.9-00_amd64_1d0a5c210dbcacac78e06b91469abf4c7acaf81042d5480f172784346888d6ad.deb
"""

# package cache
all_packages=""
for p in $PACKAGES; do
    pf="/vagrant/packages/${p##*/}" # get package file name
    [ -f $pf ] || wget $p -O $pf    # download package
    all_packages+="$pf "            # gather file names
done

# install packages from local cache
dpkg -i $all_packages
