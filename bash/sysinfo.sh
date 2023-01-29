#!/bin/bash

echo  "FQDN:$(hostname) "
echo  "Host Information: "
hostnamectl status
echo  "IP Address:$(hostname -I) $(ip addr | grep -w inet6 | awk '{print $2}' | grep -v ::1/128
)"
echo  "Root Filesystem Status: "
df -h /boot/efi
