#!/bin/bash

echo "Removing unnecesary components..."
dnf remove -y salt-cloud vim git
pip uninstall pyvmomi

echo "Delegating to SaltStack Bootstrap..."
curl -sL http://bootstrap.saltstack.com | sh

echo "Removing eth1 interface (leaving single eth0/DHCP)..."
rm -fv /etc/systemd/network/eth1.network

echo "Prepare the system for cloning..."
curl -sL -o /var/tmp/sysprep.sh https://raw.githubusercontent.com/ifireball/linux-sysprep/master/sysprep.sh
/var/tmp/sysprep.sh -f
sys-unconfig

