#!/usr/bin/env bash

for SERVICES in kube-proxy  kubelet flanneld docker;
do
    systemctl restart $SERVICES
    systemctl enable $SERVICES
    systemctl status -l $SERVICES
done

#kubectl config set-cluster default-cluster --server=http://kube-master:8080
#kubectl config set-context default-context --cluster=default-cluster --user=defaut-admin
#kubectl config use-context default-context