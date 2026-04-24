#!/bin/bash

# Navigate to the training directory
cd /home/tekavogtil/va-tech-training/linux-admin-essentials

# Add all changes (respecting your .gitignore)
git add .

# Commit with a dynamic timestamp
git commit -m "auto: Watchtower backup $(date +'%Y-%m-%d %H:%M')"

# Push to the cloud
git push origin main
