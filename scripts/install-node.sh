#!/bin/bash
# node exporter (work with prometheus on controller)
PREFIX="https://mirrors.aliyun.com/ubuntu/pool/universe/p/"
PACKAGES="""
    prometheus-node-exporter/prometheus-node-exporter_1.0.1+ds-1_amd64.deb
"""
for p in $PACKAGES; do
    [ -f "${p##*/}" ] || wget $PREFIX$p -nd
done

dpkg -i \
    prometheus-node-exporter_1.0.1+ds-1_amd64.deb
