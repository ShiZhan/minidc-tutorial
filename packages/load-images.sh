#!/bin/bash
if [ $HOST == "controller" ]; then
    docker load grafana_grafana_7.0.4.tar
    docker load prom_prometheus_v2.19.2.tar
else
    docker load alpine_3.12.0.tar
fi
