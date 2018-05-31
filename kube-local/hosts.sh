#!/usr/bin/env bash
# Change ip address and hostname according to your settings

hosts='10.10.0.100     kube-master
10.10.0.101     kube-node1
10.10.0.102     kube-node2
'

if grep -Fxq "$hosts" /etc/hosts
then
    echo "Host names already exist"
else
    echo "$hosts">>/etc/hosts
fi


