#!/bin/bash

# Check for updates
updates_arch=0
updates_aur=0

# Check pacman updates
if command -v checkupdates &>/dev/null; then
    updates_arch=$(checkupdates 2>/dev/null | wc -l)
fi

# Check AUR updates
if command -v yay &>/dev/null; then
    updates_aur=$(yay -Qum 2>/dev/null | wc -l)
fi

total_updates=$((updates_arch + updates_aur))

# Send notification if updates are available
if [ "$total_updates" -gt 0 ]; then
    notify-send -u critical "🔔 Updates Available" "Arch: $updates_arch\nAUR: $updates_aur"

else
    notify-send -u low "✅ System is up to date"
fi

