# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn More About ](https://github.com/uzzal2k5)
* [ Follow Me LinkedIn ](https://www.linkedin.com/in/uzzal2k5)

### How do I get set up? [Kubernetes](https://kubernetes.io/)

* #####On the Master Node following components will be installed

     * API Server   – It provides kubernetes API using Jason / Yaml over http, states of API objects are stored in etcd
     * Scheduler  – It is a program on master node which performs the scheduling tasks like launching containers in worker nodes based on resource availability
     * Controller Manager – Main Job of Controller manager is to monitor replication controllers and create pods to maintain desired state.
     * etcd – It is a Key value pair data base. It stores configuration data of cluster and cluster state.
     * Kubectl utility – It is a command line utility which connects to API Server on port 6443. It is used by administrators to create pods, services etc.

* #####On Worker Nodes following components will be installed
    * Kubelet  – It is an agent which runs on every worker node, it connects to docker  and takes care of creating, starting, deleting containers.
    * Kube-Proxy – It routes the traffic to appropriate containers based on ip address and port number of the incoming request. In other words we can say it is used for port translation.
    * Pod – Pod can be defined as a multi-tier or group of containers that are deployed on a single worker node or docker host.

* #####Dependencies
* #####Configure Kubernetes Repository and Install
     Kubernetes packages are not available in the default CentOS 7  repositories, Use below command to configure its package repositories.
     
     *  Install and Configure [K8S Single Master Node Cluster](https://bitbucket.org/uzzal2k5/kubernetes_training/src/e4ba9591b822ab227a0c07659ddb509c548e7f2c/kube-local/single_master_node_cluster.md?at=master) Uploaded to google drive
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* [Learn More](https://github.com/uzzal2k5) 
