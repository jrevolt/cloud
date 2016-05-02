#!/bin/bash

echo "Installing components..."
dnf install -y dnsmasq squid httpd haproxy

echo "Copying configuration..."
cp -rfv $basedir/etc /

echo "Configuring router firewall.."
firewall-cmd --zone=internal --change-interface=eth0
firewall-cmd --zone=external --change-interface=eth1
firewall-cmd --zone=internal \
    --add-service=ntp --add-service=dns --add-service=dhcp \
    --add-service=squid \
    --add-service=http --add-service=https
firewall-cmd --zone=external --add-service=http --add-service=https
firewall-cmd --runtime-to-permanent

echo "Initializing squid cache..."
squid -z

systemctl enable dnsmasq squid
systemctl start dnsmasq squid
