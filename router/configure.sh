#!/bin/bash

dnf install -y dnsmasq squid httpd haproxy

cp -rfv $basedir/etc /
