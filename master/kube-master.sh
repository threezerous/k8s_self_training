# Ensure swap is turned off (swapoff -a)
# Ensure the host has minimum 2 CPUs

#!/usr/bin/env bash
# Step 1: Disable SELinux & setup firewall rules

hostnamectl set-hostname 'k8s-master'
exec bash
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# Firewall rules
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=2379-2380/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10251/tcp
firewall-cmd --permanent --add-port=10252/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --reload
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

# update /ect/hosts for DNS
192.168.1.30 k8s-master
192.168.1.40 worker-node1
192.168.1.50 worker-node2

# Step 2: Configure Kubernetes Repository

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

# Step 3: Install Kubeadm and Docker

yum install kubeadm docker etcd -y
systemctl restart docker && systemctl enable docker
systemctl  restart kubelet && systemctl enable kubelet

# Step 4: Initialize Kubernetes Master with ‘kubeadm init’
kubeadm config images pull
kubeadm init OR
kubeadm init --apiserver-advertise-address 192.168.101.3

# Copy the [token] Using token: xxxxxxxxxxx
# This will need to join node with master


# run following as regular user

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Step 5: Deploy pod network to the cluster
kubectl get nodes
kubectl get pods --all-namespaces

# Run the beneath command to deploy network.
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"

# get nodes status
kubectl get nodes


