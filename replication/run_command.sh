#!/usr/bin/env bash

# kubectl run now produces Deployments (instead of ReplicationControllers) and Jobs (instead of Pods) by default.
kubectl run [name] --image=[name] --port=[port] --replicas=1

Example:
kubectl run web --image=gcr.io/google-samples/hello-app:1.0 \
     --replicas=1 --limits='cpu=100m,memory=80Mi'



kubectl get Deployment
kubectl delete Deployment/web