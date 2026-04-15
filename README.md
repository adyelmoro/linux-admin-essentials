# Linux System Administration Essentials (Day 1)

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
