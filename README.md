# Linux System Administration Essentials

This repository documents the foundational skills required for a Data Center Technician role, specifically modeled after workflows found in enterprise facilities like Google Skien.

## 🛠 Skills Demonstrated
- **User & Group Management**: Automated creation of specialized department groups (`va_techs`).
- **Security & Permissions**: Implemented the `770` permission model for internal workspaces.
- **Process Troubleshooting**: Proficient in PID identification and process signaling (`kill`).
- **System Auditing**: Log analysis using `grep` and `tail` within `/var/log/auth.log`.

## 📂 Project Structure
- `setup_env.sh`: Bash script to automate the lab environment setup.
- `cheatsheet.md`: Rapid-reference guide for administrative commands.

## 🚀 How to use the Lab Script
1. Clone the repo.
2. Run `chmod +x setup_env.sh`.
3. Execute with `sudo ./setup_env.sh`.

## 🤖 Automation Tools
- `onboard.sh`: An intelligent onboarding script that:
  - Checks for existing users to prevent duplicates.
  - Automatically assigns users to the `va_techs` group.
  - Logs all administrative actions to `onboarding_history.log`.
  - `mass_onboard.sh`: A bulk automation tool that:
  - Reads a list of usernames from an external text file (`technicians.txt`).
  - Iterates through the list using a `for` loop to create accounts.
  - Logs mass-onboarding events with a specialized `[MASS ONBOARD]` tag.

## 🌐 Project: Live System Monitoring Dashboard
Successfully deployed a professional-grade monitoring interface to visualize administrative actions in real-time.

### 🛠️ Technology Stack
- **Web Server:** Apache2 (HTTP)
- **Front-end:** HTML5 & Modern CSS (Dark Mode / NOC-style UI)
- **Back-end:** Bash Scripting with `cat <<EOF` (Here Documents)
- **Automation:** Cron (Scheduled tasks for 60-second refreshes)

### 🚀 Key Features
- **Dynamic Data Extraction:** Automatically parses `onboarding_history.log` to track total user counts and the latest admin events.
- **System Telemetry:** Real-time display of Server IP and System Uptime.
- **Automated Deployment:** A custom script (`update_dashboard.sh`) that rebuilds the web interface whenever the background data changes.
- **Mobile-Responsive Design:** Used a CSS grid layout for cross-device compatibility.

## 🛡️ Project: Server Hardening & Secure Access
Implemented industry-standard security protocols to protect the infrastructure from unauthorized access.

### 🔐 Security Implementations
- **Firewall Management (UFW):** Configured a "Default Deny" policy, explicitly allowing only Port 80 (Web) and Port 22 (SSH).
- **SSH Key Authentication:** Transitioned from insecure password-based logins to Ed25519 Cryptographic Key Pairs.
- **Service Hardening:** Installed and configured `openssh-server` with proper directory permissions (`700` for `.ssh` and `600` for `authorized_keys`).
- **Host Verification:** Established a trusted `known_hosts` baseline for secure remote management.

## 📦 Project: Data Persistence & Recovery
Established a robust backup protocol to ensure business continuity and protect system integrity.

### 💾 Storage Management
- **Archiving:** Utilized `tar` (Tape Archive) with Gzip compression to bundle system files and web content.
- **Dynamic Versioning:** Engineered a timestamping logic (`date +%Y-%m-%d`) to prevent file overwrites and allow for point-in-time recovery.
- **Automated Maintenance:** (Optional) Prepared for Cron integration to perform nightly headless backups.
- **Disaster Recovery Testing:** Verified 100% data integrity through successful restoration drills using tar -C / logic.

### 🛡️ Repository Integrity
- **Security Guardrails:** Implemented a `.gitignore` policy to prevent sensitive data (SSH keys, private logs) from ever reaching the public cloud.
