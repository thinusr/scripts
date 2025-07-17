#!/bin/bash

launch_matrix() {
  local ws=$1
  local title="cmatrix-ws$ws"

  # Kill any window on the target workspace
  i3-msg "workspace $ws; kill"
  sleep 0.5

  # Launch kitty with a unique title and shell that just waits
  i3-msg "workspace $ws; exec kitty --title $title zsh -c 'sleep 2 && cmatrix'"
  sleep 1.0

  # Fullscreen the kitty window (once it's visible)
  i3-msg "[title=$title] fullscreen enable"
}

launch_matrix 10
launch_matrix 20

echo "✅ cmatrix running fullscreen in kitty on workspaces 10 and 20."
