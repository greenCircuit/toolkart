#!/bin/bash
kubectl apply -f istio-ns.yaml
kubectl apply -f bookinfo.yaml -n istio-demo
kubectl apply -f istio-hr.yaml 