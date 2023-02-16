#!/bin/bash

hostname=$(hostname)
OS_Name=$(lsb_release -d | grep Description | cut -f2)
IP=$(ip route | grep -w default | cut -d' ' -f3)
Free_Space=$(df -h / | awk 'NR==2 {print $4}')

cat<<EOF

 Report for $hostname
  ====================
 FQDN: $hostname
 Operating System name and version:$OS_Name
 IP Address:$IP
 Root Filesystem Free Space:$Free_Space
  ======================
 
EOF
