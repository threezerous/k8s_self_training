#!/usr/bin/env bash

# Step 1: Disable SELinux & configure firewall rules on both the nodes
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=6783/tcp
firewall-cmd  --reload
modprobe br_netfilter 
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables


 # Step 2: Configure Kubernetes Repositories on both worker nodes

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
     https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF


# Step 3: Install kubeadm and docker package on both nodes
yum  install kubeadm docker -y
systemctl restart docker && systemctl enable docker

# Step 4: Disable swap and start kubelet service
swapoff -a
systemctl enable kubelet.service

# Step 5: Now Join worker nodes to master node

kubeadm join --token xxxxxxxxxxxxxx 192.168.1.30:6443
