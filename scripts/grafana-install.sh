#!/bin/bash
if [ $HOSTNAME == "controller" ]; then
    # Grafana + Prometheus daemon
    PACKAGES="""
        https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
        https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz
    """
    # package cache
    for p in $PACKAGES; do
        pf="/vagrant/packages/${p##*/}" # get package file name
        [ -f $pf ] || wget $p -O $pf    # download package
        tar xzf $pf -C /home/vagrant    # extract package into home directory
    done
    # fix ownership
    chown -R vagrant:vagrant /home/vagrant/grafana-7.1.3 /home/vagrant/prometheus-2.20.1.linux-amd64
else
    # Prometheus node exporter
    PACKAGES="""
        https://mirrors.aliyun.com/ubuntu/pool/universe/p/prometheus-node-exporter/prometheus-node-exporter_1.0.1+ds-1_amd64.deb
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
fi
