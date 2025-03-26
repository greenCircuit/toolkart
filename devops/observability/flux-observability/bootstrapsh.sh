#!/bin/bash
# Will deploy all resources inside flux monitoring resources

flux create source git flux-monitoring \
  --interval=30m \
  --url=https://github.com/fluxcd/flux2-monitoring-example \
  --branch=main

flux create kustomization config \
  --interval=1h \
  --prune \
  --source=flux-monitoring \
  --path="./monitoring/configs" \
  --health-check-timeout=5m \

flux create kustomization kube-prometheus-stack \
  --interval=1h \
  --prune \
  --source=flux-monitoring \
  --path="./monitoring/controllers/kube-prometheus-stack" \
  --health-check-timeout=5m \

flux create kustomization loki-stack \
  --interval=1h \
  --prune \
  --source=flux-monitoring \
  --path="./monitoring/controllers/loki-stack" \
  --health-check-timeout=5m \
