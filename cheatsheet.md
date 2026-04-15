### 🔑 User Management
- `sudo adduser [name]` - Create user
- `sudo usermod -aG [group] [user]` - Add user to group
- `sudo usermod -L [user]` - Lock account

### 📂 Permissions
- `chmod 750 [file]` - Owner(Full), Group(Read/Exec), Others(None)
- `chown [user]:[group] [file]` - Change ownership

### 🚦 Diagnostics
- `htop` - Interactive process viewer
- `ip addr` - Check network interfaces
- `tail -f /var/log/syslog` - Live system logs
