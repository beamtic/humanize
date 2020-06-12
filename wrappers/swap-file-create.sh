#!/bin/sh

# Format the swap file with zeros
sudo dd if=/dev/zero of=/swapfile bs=1024 count=8388608 status=progress

# Set permissions for the swapfile to prevent other users from reading it
sudo chmod 600 /swapfile

# Make the swap file
sudo mkswap /swapfile

# Enable the newly created swap file
sudo swapon /swapfile

# Show the status of the swap
swapon -s
