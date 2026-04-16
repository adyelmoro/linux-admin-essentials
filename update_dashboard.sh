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

# Getting RAM usage (Total vs Used)
MEM_USAGE=$(free -m | awk '/Mem:/ { printf("%d/%dMB", $3, $2) }')

# Getting CPU Load (1-minute average)
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)

# Getting Disk Usage of the root partition
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# Using cat <<EOF to handle the large block of HTML safely
sudo bash -c "cat <<EOF > $WEB_FILE
<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='UTF-8'>
    <meta http-equiv='refresh' content='30'> 
    <title>Systems Admin Dashboard</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #10b981; --text: #f8fafc; }
        body { background-color: var(--bg); color: var(--text); font-family: sans-serif; display: flex; justify-content: center; padding-top: 50px; margin: 0; }
        .container { width: 90%; max-width: 800px; background: var(--card); padding: 2rem; border-radius: 12px; border-top: 4px solid var(--accent); box-shadow: 0 10px 25px rgba(0,0,0,0.5); }
        
        /* Fixed Grid: This ensures 2 columns that don't break */
        .stat-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); 
            gap: 15px; 
            margin-bottom: 15px; 
        }
        
        .stat-box { background: rgba(255,255,255,0.05); padding: 15px; border-radius: 8px; border: 1px solid rgba(255,255,255,0.1); }
        .label { font-size: 0.75rem; color: #94a3b8; text-transform: uppercase; letter-spacing: 1px; }
        .value { font-size: 1.1rem; font-weight: bold; color: var(--accent); margin-top: 5px; }
        
        /* Progress Bar Styling */
        .progress-bg { background: #334155; height: 12px; border-radius: 6px; margin-top: 10px; overflow: hidden; }
        .progress-fill { background: var(--accent); height: 100%; transition: width 0.5s ease; }
    </style>
</head>
<body>
    <div class='container'>
        <h1>System Management Console</h1>
        
        <div class='stat-grid'>
            <div class='stat-box'>
                <div class='label'>Total Users</div>
                <div class='value'>$USER_COUNT</div>
            </div>
            <div class='stat-box'>
                <div class='label'>Server IP</div>
                <div class='value'>$SERVER_IP</div>
            </div>
            <div class='stat-box'>
                <div class='label'>Memory (RAM)</div>
                <div class='value'>$MEM_USAGE</div>
            </div>
            <div class='stat-box'>
                <div class='label'>CPU Load</div>
                <div class='value'>$CPU_LOAD</div>
            </div>
        </div>

        <div class='stat-box' style='margin-bottom: 15px;'>
            <div class='label'>Disk Capacity ($DISK_USAGE Used)</div>
            <div class='progress-bg'>
                <div class='progress-fill' style='width: $DISK_USAGE;'></div>
            </div>
        </div>

        <div class='stat-box'>
            <div class='label'>Latest Event</div>
            <div class='value' style='font-size: 0.9rem; font-weight: normal;'>$LAST_ENTRY</div>
        </div>

        <div style='font-size: 0.75rem; color: #64748b; margin-top: 15px; text-align: center;'>
            Live Telemetry Active • Last Sync: $(date)
        </div>
    </div>
</body>
</html>
EOF"

echo "✅ Dashboard UI upgraded successfully!"
