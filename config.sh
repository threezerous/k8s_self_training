#!/usr/bin/env bash
# Master & Nodes
# /etc/kubernetes/config

KUBE_LOGTOSTDEER="--logtostdeer=true"
KUBE_LOG_LEVEL="--v=0"
KUBE_ALLOW_PRIV="--allow_privileged=false"
KUBE_MASTER="--master=http://kube-master:8080"