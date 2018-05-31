#!/usr/bin/env bash

# On Master
yum install -y  --enablerepo=virt7-docker-common-release kubernetes etcd
yum install -y *rhsm*

systemctl restart  etcd kube-apiserver kube-controller-manager kube-scheduler
systemctl status -l   etcd kube-apiserver kube-controller-manager kube-scheduler 


# ON nodes

yum install -y --enablerepo=virt7-docker-common-release kubernetes flannel docker
