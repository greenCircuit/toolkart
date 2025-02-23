# determine how to access gateway
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingress -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingress -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingress -o jsonpath='{.spec.ports[?(@.name=="tcp")].nodePort}')
export INGRESS_HOST=$(kubectl get po -l app=istio-ingress -n istio-system -o jsonpath='{.items[0].status.hostIP}')



echo http://127.0.0.1:30180/kiali/
kubectl get node -o wide | awk '{print $6}'