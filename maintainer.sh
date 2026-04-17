#!/bin/bash

echo "--- 🛠️ SYSTEM MAINTENANCE START: $(date) ---"

# --- MISSION 1: THE DISK CLEANER ---
echo "Checking for old temp files..."
# 'find' looks in /tmp
# '-type f' looks for files
# '-mtime +7' modified more than 7 days ago
# '-delete' removes them
find /tmp -type f -mtime +7 -delete
echo "[ OK ] Cleaned /tmp of files older than 7 days."

# --- MISSION 2: THE SERVICE GUARD ---
echo "Checking Apache status..."
# 'systemctl is-active' returns a simple status
if systemctl is-active --quiet apache2; then
    echo "[ OK ] Apache is running perfectly."
else
    echo "[ALERT] Apache is DOWN! Attempting to restart..."
    sudo systemctl restart apache2
    # Checks again after restart
    if systemctl is-active --quiet apache2; then
        echo "[ FIXED ] Apache has been restored."
    else
        echo "[ CRITICAL ] Apache restart FAILED!"
    fi
fi
