#!/bin/bash
echo "install tools"
apt install -y wget git vim bash-completion curl htop net-tools dnsutils \
               atop sudo software-properties-common telnet axel jq iotop

echo "Remove all unused packages"
apt autoremove -y
