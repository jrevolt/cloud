#!/bin/bash

echo "Removing unnecesary components..."
dnf remove -y salt-cloud vim git
pip uninstall pyvmomi

echo "Delegating to SaltStack Bootstrap..."
curl -sL http://bootstrap.saltstack.com | sh
