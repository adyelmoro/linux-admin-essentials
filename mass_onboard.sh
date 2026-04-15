#!/bin/bash

# The file containing our names
LIST="technicians.txt"

# Checking if the file actually exists
if [ ! -f "$LIST" ]; then
    echo "Error: $LIST not found!"
    exit 1
fi

echo "🚀 Starting mass onboarding..."

# The Loop: For every 'USER' found in the 'LIST'
for USER in $(cat $LIST); do
    echo "------------------------------"
    echo "Processing: $USER"

    sudo adduser --gecos "" --disabled-password $USER
    sudo usermod -aG va_techs $USER
    
    echo "✅ $USER is set up."
    echo "$(date): [MASS ONBOARD] Admin created user $USER" >> onboarding_history.log

done

echo "------------------------------"
echo "All users from $LIST have been processed!"
