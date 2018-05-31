#!/usr/bin/env bash
kubectl get nodes
kubectl create -f mysql.yml
kubectl get pods
kubectl get pods -o wide
kubectl delete pod mysql

kubectl describe pod mysql
kubectl get pods --all-namespaces



etcdctl get /kube-centos/network/config
etcdctl ls /kube-centos/network/subnets



kubectl get all -o name
kubectl delete $(kubectl get all -o name)
kubectl delete pods nginx-3393035838-9c259 --grace-period=0 --force
kubectl delete pods $(kubectl get all -o name) --grace-period=0 --force

kubectl get events



Examples:
  # List all pods in ps output format.
  kubectl get pods

  # List all pods in ps output format with more information (such as node name).
  kubectl get pods -o wide

  # List a single replication controller with specified NAME in ps output format.
  kubectl get replicationcontroller web

  # List a single pod in JSON output format.
  kubectl get -o json pod web-pod-13je7

  # List a pod identified by type and name specified in "pod.yaml" in JSON output format.
  kubectl get -f pod.yaml -o json

  # Return only the phase value of the specified pod.
  kubectl get -o template pod/web-pod-13je7 --template={{.status.phase}}

  # List all replication controllers and services together in ps output format.
  kubectl get rc,services

  # List one or more resources by their type and names.
  kubectl get rc/web service/frontend pods/web-pod-13je7


Examples
# Scale replication controller named 'foo' to 3.
kubectl scale --replicas=3 rc/foo

# Scale a resource identified by type and name specified in "foo.yaml" to 3.
kubectl scale --replicas=3 -f foo.yaml

# If the deployment named mysql's current size is 2, scale mysql to 3.
kubectl scale --current-replicas=2 --replicas=3 deployment/mysql

# Scale multiple replication controllers.
kubectl scale --replicas=5 rc/foo rc/bar rc/baz

# Scale job named 'cron' to 3.
kubectl scale --replicas=3 job/cron
