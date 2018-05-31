#!/usr/bin/bash
# How can I configure kubernetes so that it can pull images from the private registry which needs basic authentication?

# https://access.redhat.com/solutions/1329473

Step-1: echo "USERNAME:PASSWORD" | base64

Step-2:
{
     "docker-registry-url": {
             "auth": "use the string output from step 1 ",
             "email": "email@example.com"
     }
}


cat << EOF > /var/lib/kubelet/.dockercfg
{
     "docker-registry-url": {
             "auth": "dXp6YWwyazU6c2hhZmlxMms1Cg==",
             "email": "uzzal2k5@gmail.com"
     }
}
EOF