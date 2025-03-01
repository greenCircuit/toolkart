# Helm
systemctl restart kubelet
kubectl get pods --all-namespaces | grep Evicted
docker system prune -a
podman system prune -a
kubectl get po -A | awk '/Evicted|Completed|ContainerStatusUnknown|Error/ {print "kubectl delete po -n ",$1,$2}'|bash -x  
systemctl restart kubelet
journalctl -u kubelet