#!/bin/bash

# Prompt for details
read -p "Webapp name (no spaces): " NAME
read -p "URL: " URL

# Paths
APP_DIR="$HOME/.local/share/webapps"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_DIR="$APP_DIR/icons"

# Create folders
mkdir -p "$APP_DIR/$NAME"
mkdir -p "$ICON_DIR"

# Optional: Download favicon for icon
ICON_PATH="$ICON_DIR/$NAME.png"
wget -qO "$ICON_PATH" "https://www.google.com/s2/favicons?domain=$(echo $URL | awk -F/ '{print $3}')&sz=128"

# Create Chromium app command
cat > "$APP_DIR/$NAME/$NAME.sh" <<EOF
#!/bin/bash
chromium --app="$URL" --class=$NAME --user-data-dir="$APP_DIR/$NAME/profile"
EOF

chmod +x "$APP_DIR/$NAME/$NAME.sh"

# Create .desktop file
cat > "$DESKTOP_DIR/$NAME.desktop" <<EOF
[Desktop Entry]
Name=$NAME
Exec=$APP_DIR/$NAME/$NAME.sh
Icon=$ICON_PATH
Type=Application
StartupWMClass=$NAME
Categories=WebApp;
EOF

echo "✅ Webapp '$NAME' created. You’ll find it in your app launcher or with dmenu."
