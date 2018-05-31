#!/usr/bin/env bash
# NODE [/etc/kubernetes/kubelet]
KUBELET_ADDRESS="--address=0.0.0.0"
KUBELET_PORT="--port=10205"
KUBELET_HOSTNAME="--hostname-override=kube-node1"
KUBELET_API_SERVER="--api-servers=http://kube-master:8080"
KUBELET_ARGS=""