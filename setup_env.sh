#!/bin/bash

# --- Data Center Lab Setup Script ---
# This script automates the creation of groups and workspaces 
# practiced during Day 1 of Linux Essentials.

echo "🚀 Starting environment setup..."

# Created the technical groups
sudo groupadd -f va_techs
sudo groupadd -f va_interns

# Created the shared workspace
WORKSPACE="/opt/va_workspace"
sudo mkdir -p $WORKSPACE

# Applied Permissions: Owner=Full, Group=Full, Others=None
sudo chgrp va_techs $WORKSPACE
sudo chmod 770 $WORKSPACE

echo "✅ Lab environment is ready at $WORKSPACE"
ls -ld $WORKSPACE
