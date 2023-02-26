#!/bin/bash
clear
# Install lxd if necessary
if which lxd > /dev/null;then
	echo "Lxd already installed"
else
	echo "Installing lxd"
	sudo snap install lxd
fi

# Check if lxdbr0 interface exists, if not run lxd init --auto
if ip link show lxdbr0 &> /dev/null;then
	echo "Creating interface"	
	sudo lxd init --auto
else
	echo "Interface exists"
fi

# Check if container already exists, if not launch a new one
if lxc list | grep -q COMP2101-S22 &> /dev/null; then
	echo "Container exists"

else
	echo "Creating a container"
	sudo lxc launch ubuntu:20.04 COMP2101-S22	
fi

# Update /etc/hosts with container's IP address
container_ip=$(sudo lxc list | grep COMP2101-S22 | awk '{print $6}')
if grep -q "COMP2101-S22" /etc/hosts;then
	echo "$container_ip COMP2101-S22" | sudo tee -a /etc/hosts > /dev/null
else
	sudo sed -i "s/^.*COMP2101-S22.*/$container_ip COMP2101-S22/" /etc/hosts
fi

# Install Apache2 in the container if necessary
if sudo lxc exec COMP2101-S22 -- which apache2 &> /dev/null;then
	sudo lxc exec COMP2101-S22 -- sudo apt install -y apache2 > /dev/null
fi

# Test container web service
if curl http://COMP2101-S22 >/dev/null; then
	echo "Success: Default web page retrieved from container web service."
else
	echo "Error: Failed to retrieve default web page from container web service."
fi

