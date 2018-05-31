#!/usr/bin/env bash
#Flanneld location : /etc/syscnfig/flanneld
# MASTER & NODE (Where you want to active flanneld)
FLANNEL_ETCD_ENDPOINT="http://kube-master:2379"
FLANNEL_ETCD_PREFIX="/kube-centos/network"
FLANNEL_OPTION="--iface=eth1"




# eth1: Which Interface you want to assign for flanneld network communication; You can use eth0 rather than eth1