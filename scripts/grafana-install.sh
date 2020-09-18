#!/bin/bash
# Dashboard installation
(cd /vagrant/packages && if [ $HOSTNAME == "controller" ]; then
    # Grafana + Prometheus daemon
    [ -f grafana-7.1.3.linux-amd64.tar.gz ]     || wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
    [ -f prometheus-2.20.1.linux-amd64.tar.gz ] || wget https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz
    tar xzf grafana-7.1.3.linux-amd64.tar.gz     -C /home/vagrant && chown -R vagrant:vagrant /home/vagrant/grafana-7.1.3/
    tar xzf prometheus-2.20.1.linux-amd64.tar.gz -C /home/vagrant && chown -R vagrant:vagrant /home/vagrant/prometheus-2.20.1.linux-amd64/
else
    # Prometheus node exporter
    PREFIX="https://mirrors.aliyun.com/ubuntu/pool/universe/p/"
    PACKAGES="""
        prometheus-node-exporter/prometheus-node-exporter_1.0.1+ds-1_amd64.deb
    """
    for p in $PACKAGES; do
        [ -f "${p##*/}" ] || wget $PREFIX$p -nd
    done

    dpkg -i \
        prometheus-node-exporter_1.0.1+ds-1_amd64.deb
fi)
