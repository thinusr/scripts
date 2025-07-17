#!/bin/bash

# Prompt for the webapp name (strip .desktop if included)
read -p "Enter the WebApp name (exact name, no need for .desktop): " NAME
NAME="${NAME%.desktop}"

# Paths
DESKTOP_FILE="$HOME/.local/share/applications/${NAME}.desktop"
PROFILE_DIR="$HOME/.local/share/webapps/${NAME}"

# Delete .desktop file
if [[ -f "$DESKTOP_FILE" ]]; then
    rm "$DESKTOP_FILE"
    echo "✓ Removed desktop launcher: $DESKTOP_FILE"
else
    echo "✗ Desktop file not found: $DESKTOP_FILE"
fi

# Delete profile directory
if [[ -d "$PROFILE_DIR" ]]; then
    rm -r "$PROFILE_DIR"
    echo "✓ Removed profile directory: $PROFILE_DIR"
else
    echo "✗ Profile directory not found: $PROFILE_DIR"
fi

# Refresh desktop database
update-desktop-database ~/.local/share/applications &>/dev/null
echo "✓ Desktop database updated."

echo "✅ Done."

