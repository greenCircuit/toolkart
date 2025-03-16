#!/bin/bash
podman run --rm -p 9090:9090 --network=host -v $(pwd)/prometheus-config.yaml:/etc/prometheus/prometheus.yml docker.io/prom/prometheus
