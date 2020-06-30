#!/bin/bash
if [ $HOSTNAME = "controller" ]; then
    docker load -i grafana_grafana_7.0.4.tar
    docker load -i prom_prometheus_v2.19.2.tar
else
    docker load -i alpine_3.12.0.tar
fi
