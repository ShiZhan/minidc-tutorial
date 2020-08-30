#!/bin/bash
# testing container
[ -f alpine_3.12.0.tar ] && docker load -i alpine_3.12.0.tar || docker pull alpine:3.12.0

# node exporter
PREFIX="https://mirrors.aliyun.com/ubuntu/pool/universe/p/"
PACKAGES="""
    prometheus-node-exporter/prometheus-node-exporter_1.0.1+ds-1_amd64.deb
"""
for p in $PACKAGES; do
    [ -f "${p##*/}" ] || wget $PREFIX$p -nd
done

dpkg -i \
    prometheus-node-exporter_1.0.1+ds-1_amd64.deb
