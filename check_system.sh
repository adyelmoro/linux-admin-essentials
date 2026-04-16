#!/bin/bash

echo "--- 🛡️ SECURITY & ERROR REPORT: $(date) ---"

# 1. Who is trying to get in? (Top 5 Failed Login IPs)
echo "Top 5 Suspicious IPs:"
sudo grep "Failed password" /var/log/auth.log | grep "from" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -5

# 2. Who is using 'sudo'? (Accountability)
echo -e "\nRecent Sudo Usage:"
sudo grep "COMMAND=" /var/log/auth.log | tail -n 5

# 3. Hardware/Kernel health check
echo -e "\nRecent System/Kernel Errors:"
dmesg | grep -i "error" | tail -n 3
