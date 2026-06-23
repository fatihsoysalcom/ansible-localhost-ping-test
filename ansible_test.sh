#!/bin/bash

# This script demonstrates a basic Ansible ad-hoc command to verify installation.
# It requires Ansible to be installed on the system where this script is run.
# The accompanying article explains how to install Ansible on Rocky Linux 9.

echo "--- Ansible Basic Connectivity Test ---"
echo "Attempting to ping localhost using Ansible..."

# Check if Ansible is installed and available in the PATH
if ! command -v ansible &> /dev/null
then
    echo "Error: Ansible is not installed or not found in your system's PATH."
    echo "Please follow the article's instructions to install Ansible on Rocky Linux 9 first."
    exit 1
fi

# Run an ad-hoc Ansible command to ping localhost.
# -i localhost,  : Specifies the inventory. 'localhost,' makes it a list of one host.
# -m ping        : Uses the 'ping' module to test connectivity and verify Ansible's functionality.
# -c local       : Tells Ansible to connect to localhost using a local connection plugin.
#                  This is crucial for testing the local machine without requiring SSH setup.
ansible -i localhost, -c local -m ping localhost

if [ $? -eq 0 ]; then
    echo "\n--- Ping successful! Ansible is working correctly. ---"
    echo "This confirms your basic Ansible setup is functional."
else
    echo "\n--- Ping failed. Please check your Ansible installation and configuration. ---"
    exit 1
fi

echo "\n--- Gathering facts from localhost (another basic Ansible task) ---"
# Run another ad-hoc command to gather system facts from localhost.
# -m setup       : Uses the 'setup' module to collect detailed system information.
#                  This demonstrates Ansible's ability to retrieve data from managed hosts.
ansible -i localhost, -c local -m setup localhost

if [ $? -eq 0 ]; then
    echo "\n--- Facts gathered successfully! ---"
    echo "You can now start exploring more advanced Ansible playbooks and modules."
else
    echo "\n--- Failed to gather facts. Please investigate. ---"
    exit 1
fi
