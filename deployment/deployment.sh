kubectl run http --image=katacoda/docker-http-server:latest --replicas=1
kubectl get deployments
kubectl describe deployment http
kubectl expose deployment http --external-ip="172.17.0.58" --port=8000 --target-port=80
curl http://172.17.0.58:8000
kubectl run httpexposed --image=katacoda/docker-http-server:latest --replicas=1 --port=80 --hostport=8001
docker ps | grep httpexposed
kubectl scale --replicas=3 deployment http
kubectl get pods
kubectl describe svc http
curl http://172.17.0.58:8000

