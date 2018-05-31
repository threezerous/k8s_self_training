#!/usr/bin/env bash

DOCKER_REGISTRY_SERVER=https://index.docker.io/v1/
DOCKER_USER=Type your dockerhub username, same as when you `docker login`
DOCKER_EMAIL=Type your dockerhub email, same as when you `docker login`
DOCKER_PASSWORD=Type your dockerhub pw, same as when you `docker login`

kubectl create secret docker-registry myregistrykey \
  --docker-server=$DOCKER_REGISTRY_SERVER \
  --docker-username=$DOCKER_USER \
  --docker-password=$DOCKER_PASSWORD \
  --docker-email=$DOCKER_EMAIL


DOCKER_REGISTRY_SERVER=https://index.docker.io/v1/
DOCKER_USER=uzzal2k5
DOCKER_EMAIL=uzzal2k5@gmail.com
DOCKER_PASSWORD=pass


kubectl create secret docker-registry regsecret \
 --docker-server=hub.docker.com \
 --docker-username=uzzal2k5 \
 --docker-password=pass \
 --docker-email=uzzal2k5@gmail.com


kubectl create secret docker-registry regsecretPublic \
 --docker-server=hub.docker.com \
 --auth="dXp6YWwyazU6c2hhZmlxMms1Cg==" \
 --docker-email=uzzal2k5@gmail.com