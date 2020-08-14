#!/bin/bash
# dashboard daemon
[ -f grafana-7.1.3.linux-amd64.tar.gz ]     || wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
[ -f prometheus-2.20.1.linux-amd64.tar.gz ] || wget https://github.com/prometheus/prometheus/releases/download/v2.20.1/prometheus-2.20.1.linux-amd64.tar.gz
tar xzf grafana-7.1.3.linux-amd64.tar.gz     -C /home/vagrant && chown -R vagrant:vagrant grafana-7.1.3/
tar xzf prometheus-2.20.1.linux-amd64.tar.gz -C /home/vagrant && chown -R vagrant:vagrant prometheus-2.20.1.linux-amd64/
