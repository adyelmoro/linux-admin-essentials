#!/bin/bash

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# Path Definitions
LOG_FILE="$SCRIPT_DIR/onboarding_history.log"
WEB_FILE="/var/www/html/index.html"

# Data Extraction
USER_COUNT=$(wc -l < "$LOG_FILE")
LAST_ENTRY=$(tail -n 1 "$LOG_FILE" | cut -d':' -f4-)
SERVER_IP=$(hostname -I | awk '{print $1}')
UPTIME=$(uptime -p)

# We use cat <<EOF to handle the large block of HTML safely
sudo bash -c "cat <<EOF > $WEB_FILE
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <title>Systems Admin Dashboard</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #10b981; --text: #f8fafc; }
        body { background-color: var(--bg); color: var(--text); font-family: sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .container { width: 90%; max-width: 600px; background: var(--card); padding: 2rem; border-radius: 12px; border-top: 4px solid var(--accent); }
        .stat-box { background: rgba(255,255,255,0.05); padding: 15px; border-radius: 8px; margin-bottom: 10px; }
        .label { font-size: 0.8rem; color: #94a3b8; }
        .value { font-size: 1.2rem; font-weight: bold; color: var(--accent); }
    </style>
</head>
<body>
    <div class='container'>
        <h1>System Management Console</h1>
        <div class='stat-box'>
            <div class='label'>Total Onboarded</div>
            <div class='value'>$USER_COUNT Users</div>
        </div>
        <div class='stat-box'>
            <div class='label'>Server IP</div>
            <div class='value'>$SERVER_IP</div>
        </div>
        <div class='stat-box'>
            <div class='label'>Latest Event</div>
            <div class='value'>$LAST_ENTRY</div>
        </div>
        <div style='font-size: 0.8rem; color: #64748b; margin-top: 10px;'>
            Last Refresh: \$(date)
        </div>
    </div>
</body>
</html>
EOF"

echo "✅ Dashboard UI upgraded successfully!"
