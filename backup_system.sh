#!/bin/bash

# Backup Destination
DEST="/home/$(whoami)/backups"
mkdir -p $DEST

# The Backup
TARGET="/var/www/html /home/$(whoami)/va-tech-training/linux-admin-essentials"

# Filename with the current date
TIME=$(date +%Y-%m-%d_%H%M)
FILENAME="backup-$TIME.tar.gz"

echo "📦 Starting backup of $TARGET..."

# Note to self: -c: create, -z: compress (gzip), -f: filename
sudo tar -czf $DEST/$FILENAME $TARGET

echo "✅ Backup completed: $DEST/$FILENAME"
