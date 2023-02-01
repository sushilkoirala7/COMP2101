#!/bin/bash

echo  "FQDN:$(hostname) "  #echo command prints or displays the value of variables.
echo  "Host Information: " # host information refers to the name assigned to a computer on a network, which is used to identify the machine.
hostnamectl status #hostnamectl used to manage the system hostname.
echo  "IP Address:$(hostname -I)"
echo  "Root Filesystem Status: "
df -h /boot/efi # df -h commands produces output that lists all files that are currently mounted on system, along with information about the total size, used and available space. 
