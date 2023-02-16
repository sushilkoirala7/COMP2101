#!/bin/bash

hostname=$(hostname)        #The hostname of the current system can be obtained with the command $(hostname).
OS_Name=$(lsb_release -d | grep Description | cut -f2)  #This command is used to obatin description of the current operating system distribution.
IP=$(ip route | grep -w default | cut -d' ' -f3)  # This command helps to get the ip address of the default gateway.
Free_Space=$(df -h / | awk 'NR==2 {print $4}')   #The root partition's available disc space can be obtained with this command.

cat<<EOF

 Report for $hostname
  ====================
 FQDN: $hostname
 Operating System name and version:$OS_Name
 IP Address:$IP
 Root Filesystem Free Space:$Free_Space
  ======================
 
EOF
