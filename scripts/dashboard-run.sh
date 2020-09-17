#!/bin/bash
(cd /home/vagrant/grafana-7.1.3/                 && nohup bin/grafana-server -config /home/vagrant/conf/defaults.ini   > /home/vagrant/grafana.log)&
(cd /home/vagrant/prometheus-2.20.1.linux-amd64/ && nohup ./prometheus --config.file /home/vagrant/conf/prometheus.yml > /home/vagrant/prometheus.log)&

