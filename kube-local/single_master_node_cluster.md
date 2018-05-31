### K8S Single Master Node Cluster

Follow Some steps to Install and Configure K8s cluster 

####PREPARATION FACE
##### Step-1:
* Install or build    2 fresh Centos 7 minimal VM. 
    *   One Master VM With 2 NIC 
    *   One Node VM   2 NIC

##### Step-2:
* Run hosts.sh scripts on both to configure hostname dns entry on /etc/hosts  file

##### Step-3 :
* Run preconfig.sh on both master and node to disable followings  -
    *   NetworkManager
    *   SELinux
    *   Firewalld

######Note :  
Look at on_master folder under configuration to complete all steps on master and on_nodes for nodes configuration
 
####INSTALL AND CONFIGURE  MASTER
##### Step-1:
* Install Package on Master
    * Run master_install.sh from install directory. This will do -
        *   Configure yum repository
        *   Install kubernetes package
        *   Install Etcd Package
        *   Install Red Hat Subscription Manager (rhsm)

##### Step-2:
* Configure Master
    * vi  /etc/etcd/etcd.conf
        
            # [member]
            ETCD_NAME=default
            ETCD_DATA_DIR="/var/lib/etcd/default.etcd"
            ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"

            #[cluster]
            ETCD_ADVERTISE_CLIENT_URLS="http://0.0.0.0:2379"   
    
    *  vi /etc/kubernetes/apiserver
            
            KUBE_API_ADDRESS="--address=0.0.0.0"
            KUBE_API_PORT="--port=8080"
            KUBELET_PORT="--kubelet_port=10250"
            KUBE_ETCD_SERVERS="--etcd_servers=http://kube-master:2379"
            KUBE_SERVICE_ADDRESSES="--service-cluster-ip-range=10.254.0.0/16"
            KUBE_ADMISSION_CONTROL=""
            KUBE_API_ARGS="--service_account_key_file=/etc/kubernetes/ca/ca.key" 
            
            *   Note: If you don't have ca.key file , you have to create it 
    
    *   vi /etc/kubernetes/config
            
            KUBE_LOGTOSTDERR="--logtostderr=true"
            KUBE_LOG_LEVEL="--v=0"
            KUBE_ALLOW_PRIV="--allow-privileged=false"
            KUBE_MASTER="--master=http://kube-master:8080"
            
            
            * Note: Change 'kube-master' according to your master node hostname

    *   vi /etc/kubernetes/controller-manager
            
            KUBE_CONTROLLER_MANAGER_ARGS="--service_account_private_key_file=/etc/kubernetes/ca/ca.key"
            
            
            
            * Note: If you do not use ca.key at apiserver
                KUBE_API_ARGS="--service_account_key_file=/etc/kubernetes/ca/ca.key" 
                then you can leave controller-manager as default

##### Step-3 :
*   Configure etcd network for PODS
    
    *   Run etcd_network.sh on master

##### Step-4 :
* Finalize Master Service
    *   Run start-master.sh and Cheers!  



####INSTALL AND CONFIGURE  NODES
##### Step-1 :
* Install Package on Master
    * Run node_install.sh from install directory. This will do -
        *   Configure yum repository
        *   Install kubernetes package
        *   Install Flanneld Package
        *   Install Docker Package
##### Step-2:
* Configure Master
      
    *   vi /etc/kubernetes/config
            
            KUBE_LOGTOSTDERR="--logtostderr=true"
            KUBE_LOG_LEVEL="--v=0"
            KUBE_ALLOW_PRIV="--allow-privileged=false"
            KUBE_MASTER="--master=http://kube-master:8080"
            
            
            * Note: Change 'kube-master' according to your master node hostname

    *   vi /etc/kubernetes/kubelet
            
                KUBELET_ADDRESS="--address=0.0.0.0"
                KUBELET_PORT="--port=10250"
                KUBELET_HOSTNAME="--hostname-override=kube-node1"
                KUBELET_API_SERVER="--api-servers=http://kube-master:8080"
                #KUBELET_POD_INFRA_CONTAINER="--pod-infra-container-image=registry.access.redhat.com/rhel7/pod-infrastructure:latest"
                KUBELET_ARGS=""            
                
                *   Note: Change 'kube-master' according to your master node hostname.If not set host name yet, then set it before startting service
    
    *    vi /etc/sysconfig/flanneld
               
                FLANNEL_ETCD_ENDPOINTS="http://kube-master:2379"
                FLANNEL_ETCD_PREFIX="/kube-centos/network"
                FLANNEL_OPTIONS="--iface=eth0"
                
                  * Note: Change 'eth0' if needed. This interface will be on that which one you want to use for PODs internal Networking
     
##### Step-4 :
* Finalize Nodes Service
    *   Run start-nodes.sh and Cheers!  
    


####TEST CLUSTER
* To check node availability on master run -
    *   kubectl get nodes
        *   OutComes you see
        
                [root@kube-master ~]# kubectl get nodes
                NAME         STATUS    AGE
                kube-node1   Ready     157d
                



####SCALE OUT NODES INTO CLUSTER
*   You can add more node following the steps on node section
 
            Follow: INSTALL AND CONFIGURE  NODES  