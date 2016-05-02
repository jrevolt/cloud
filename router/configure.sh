#!/bin/bash

echo "Installing components..."
dnf install -y dnsmasq squid httpd haproxy

echo "Copying configuration..."
cp -rfv $basedir/etc /

echo "Initializing squid cache..."
squid -z

systemctl enable dnsmasq squid
systemctl start dnsmasq squid
