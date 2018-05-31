#!/usr/bin/env bash
ip_addr=$(ip a s | grep inet | grep eth0 | awk -F' ' '{ print $2 }' | cut -d'/' -f1)
