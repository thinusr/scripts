# Matrix Screensaver for i3

A simple, eye-catching "screensaver" for the i3 window manager using `cmatrix` in fullscreen terminals. Trigger it manually with a keyboard shortcut to instantly create a retro Matrix vibe across multiple workspaces.

## Features

- 🟩 Fullscreen `cmatrix` on workspaces 10 and 20
    
- ⚡ Snappy startup with no tiling conflicts
    
- 🔒 Manual start and stop via keybindings
    
- 🧼 Lightweight and minimal — no background daemons required
    

---

## Requirements

- i3 window manager
    
- `cmatrix`
    
- kitty terminal emulator
    

Install on Arch-based systems:

```bash
sudo pacman -S cmatrix kitty
```

## Scripts

### `cmatrix.sh`

Launches fullscreen terminals running `cmatrix` on workspaces 10 and 20:

```bash
#!/bin/bash

launch_matrix() {
  local ws=$1
  local title="cmatrix-ws$ws"

  # Kill any window on the target workspace
  i3-msg "workspace $ws; kill"
  sleep 0.5

  # Launch kitty with a unique title and shell that runs cmatrix after a delay
  i3-msg "workspace $ws; exec kitty --title $title zsh -c 'sleep 1.2 && cmatrix'"
  sleep 1.0

  # Fullscreen the kitty window (once it’s visible)
  i3-msg "[title=$title] fullscreen enable"
}

launch_matrix 10
launch_matrix 20

echo "✅ cmatrix running fullscreen in kitty on workspaces 10 and 20."
```

### `kill-cmatrix.sh`

Kills all running `cmatrix` processes and closes their terminal windows:

```bash
#!/bin/bash

# Kill all running cmatrix processes directly
pkill -f cmatrix

echo "🛑 cmatrix processes killed cleanly."
```

## i3 Keybindings

Add these to your `~/.config/i3/config`:

```i3
# Screensaver
bindsym $mod+x exec --no-startup-id ~/scripts/cmatrix/cmatrix.sh
bindsym $mod+Shift+x exec --no-startup-id ~/scripts/cmatrix/kill-cmatrix.sh
```

Reload i3:

```bash
Mod+Shift+R
```

---

## Customization

- Change the terminal emulator in `cmatrix.sh` if you prefer another (e.g., `wezterm` or `xfce4-terminal`).
    
- Adjust sleep durations if `cmatrix` fails to start in fullscreen.
    
- Tweak workspace numbers to suit your layout.
    

---

## Future Development

- 🔄 **Auto-start when idle**:  
    In future updates, this project may include optional integration with `xss-lock` or `xidlehook` to automatically launch the Matrix screensaver after a period of inactivity.
    
- 🖥️ **Multi-monitor awareness**:  
    Potential improvements could include detecting multiple monitors and adjusting the workspace assignment dynamically.
    
- ⚙️ **Configuration options**:  
    A simple config file could allow you to set custom workspaces, terminals, or animation speed for `cmatrix`.
    

### How the auto-start might work

Once implemented, you'd be able to install and configure `xss-lock` to run the screensaver automatically after X minutes of inactivity:

```bash
xss-lock -- ~/scripts/cmatrix/cmatrix.sh &
```

You could add that to your i3 config or `~/.xprofile` to run on startup.

---

## License

MIT — Free to use, modify, and share.
