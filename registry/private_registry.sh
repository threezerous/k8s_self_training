#!/usr/bin/env bash
# Kubernetes Private Registry Create
kubectl create secret docker-registry regsecret --docker-server=hub.docker.com --docker-username=uzzal2k5 --docker-password=pass --docker-email=uzzal2k5@gmail.com
kubectl get secret regsecret --output=yaml
# base64 -d secret64