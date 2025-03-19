#!/bin/sh

podman-compose -f grafana-compose.yaml up
podman-compose -f loki-promtail-stack.yaml up

