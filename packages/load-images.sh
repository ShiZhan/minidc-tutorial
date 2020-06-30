#!/bin/bash
if [ $HOSTNAME = "controller" ]; then
    [ -f grafana_grafana_7.0.4.tar ]   && docker load -i grafana_grafana_7.0.4.tar   || docker pull grafana/grafana:7.0.4
    [ -f prom_prometheus_v2.19.2.tar ] && docker load -i prom_prometheus_v2.19.2.tar || docker pull prom/prometheus:v2.19.2
else
    [ -f alpine_3.12.0.tar ] && docker load -i alpine_3.12.0.tar || docker pull alpine:3.12.0
fi
