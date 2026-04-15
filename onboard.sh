#!/bin/bash

#1. Ask the admin for the new username
echo "Enter the name of the new Technician:"
read NEW_USER

echo "Confirm: Create user '$NEW_USER'? (y/n)"
read CONFIRM

if [[ "$CONFIRM" != "y" ]]; then
    echo "Aborting. No changes made."
    exit 1
fi

# 1.1. The Check (The 'If' statement goes here)
if id "$NEW_USER" &>/dev/null; then
    # This part runs if the user IS found
    echo "⚠️  Hold on! The user '$NEW_USER' already exists in the system."
    echo "Aborting setup to prevent duplicate errors."
else
    # This part runs only if the user IS NOT found
    echo "Creating account for $NEW_USER..."
    sudo adduser --gecos "" $NEW_USER
    
    echo "Adding $NEW_USER to va_techs group..."
    sudo usermod -aG va_techs $NEW_USER
    
    echo "✅ Success! $NEW_USER is now a member of the Tech Team."
	echo "$(date): Admin created user $NEW_USER" >> onboarding_history.log
	echo "Account setup complete for $NEW_USER"
    groups $NEW_USER
fi
