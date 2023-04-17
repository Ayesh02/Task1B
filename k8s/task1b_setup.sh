# Place your commands here
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml
kubectl cluster-info
kubectl get nodes

kubectl get nodes -L ingress-ready
kubectl apply -f k8s/manifests/k8s/backend-deployment.yaml
kubectl get deployment/backend --watch
kubectl get pods
kubectl apply -f k8s/manifests/k8s/backend-service.yaml
kubectl get svc

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl -n ingress-nginx get deploy -w
kubectl get pods -n ingress-nginx
kubectl apply -f k8s/manifests/k8s/backend-ingress.yaml
kubectl get ingress