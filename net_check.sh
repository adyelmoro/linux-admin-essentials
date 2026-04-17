#!/bin/bash

# 1. Defining who we are testing
TARGET="google.com"
GATEWAY="192.168.1.1"

echo "--- 🛰️ NETWORK CONNECTIVITY TEST ---"

# 2. Testing the Gateway
# Notes to self: -c 1 sending 1 packet. > /dev/null hides the messy output.
if ping -c 1 $GATEWAY > /dev/null; then
    echo "[ OK ] Local Gateway ($GATEWAY) is reachable."
else
    echo "[FAIL] Local Gateway ($GATEWAY) is DOWN!"
fi

# 3. Testing the Internet (External IP)
# Pinging 8.8.8.8 to check raw internet access.
if ping -c 1 8.8.8.8 > /dev/null; then
    echo "[ OK ] Internet Access (8.8.8.8) is active."
else
    echo "[FAIL] Internet Access is DOWN!"
fi

# 4. Testing DNS
# Checks if the server can turn 'google.com' into an IP address.
if nslookup $TARGET > /dev/null; then
    echo "[ OK ] DNS Resolution for $TARGET is working."
else
    echo "[FAIL] DNS Resolution is BROKEN!"
fi
