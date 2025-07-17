# 📦 notify-updates

**Hourly Arch + AUR update notifier with Dunst integration**

This script checks for available system updates on an Arch Linux system using `checkupdates` (official repos) and `yay` (AUR), and notifies the user via `dunst`. If updates are available, a persistent notification is shown until dismissed. If the system is up to date, a short-lived confirmation is displayed.

---

## 🔧 Requirements

- `checkupdates` (from `pacman-contrib`)
- `yay` (or another AUR helper with `-Qum` support)
- `dunst` (for notifications)
- Systemd (user timers enabled)

---

## 🚀 How It Works

1. A **bash script** runs once per hour via a systemd timer.
2. It checks for:
   - Arch repo updates via `checkupdates`
   - AUR updates via `yay -Qum`
3. If updates are found:
   - A **critical urgency** Dunst notification is sent (stays until dismissed)
4. If no updates are found:
   - A low urgency "system is up to date" notification is shown briefly

---

## 📜 Script

Path: `~/scripts/updates-notify-send/notify-send.sh`

```bash
#!/bin/bash

# Check for updates
updates_arch=0
updates_aur=0

if command -v checkupdates &>/dev/null; then
    updates_arch=$(checkupdates 2>/dev/null | wc -l)
fi

if command -v yay &>/dev/null; then
    updates_aur=$(yay -Qum 2>/dev/null | wc -l)
fi

total_updates=$((updates_arch + updates_aur))

if [ "$total_updates" -gt 0 ]; then
    notify-send -u critical "🔔 Updates Available" "Arch: $updates_arch\nAUR: $updates_aur"
else
    notify-send -u low "✅ System is up to date"
fi
```

---

## 🔄 Systemd Setup

### 📄 `~/.config/systemd/user/notify-updates.service`

```ini
[Unit]
Description=Check for system updates and notify via Dunst

[Service]
ExecStart=/home/YOUR_USERNAME/scripts/updates-notify-send/notify-send.sh
```

### ⏰ `~/.config/systemd/user/notify-updates.timer`

```ini
[Unit]
Description=Run update notifier every hour

[Timer]
OnBootSec=5min
OnUnitActiveSec=1h
Unit=notify-updates.service

[Install]
WantedBy=default.target
```

> Replace `YOUR_USERNAME` with your actual username and ensure paths match your setup.

---

## 🛠 Dunst Configuration

To ensure persistent notifications for critical updates, your `~/.config/dunst/dunstrc` should contain:

```ini
[urgency_critical]
timeout = 0
```

Restart Dunst after changes:

```bash
pkill dunst && dunst &
```

---

## ✅ Enabling the Timer

```bash
systemctl --user daemon-reload
systemctl --user enable --now notify-updates.timer
```

To test immediately:

```bash
systemctl --user start notify-updates.service
```

---

## 📌 Optional Improvements

- Add a clickable action to launch a terminal update.
- Log update history to a file.
- Add icon or sound support via Dunst.
