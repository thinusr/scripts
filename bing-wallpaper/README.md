# Bing Daily Wallpaper Script (i3 + Nitrogen)

This script automatically downloads the daily Bing wallpaper and applies
it **separately to each monitor** using Nitrogen. It is designed for
**i3 window manager** setups and runs silently without opening any GUI
windows.

Built to be simple, reliable, and completely under your control.

------------------------------------------------------------------------

## ✅ Features

-   Downloads the **latest Bing daily wallpaper**
-   Applies the image **independently to each monitor**
-   Uses **Nitrogen** for wallpaper setting
-   Runs **silently** (no GUI pop-ups)
-   Saves the wallpaper for automatic restore on login
-   Keeps a local **archive of downloaded images**
-   Works perfectly with **cron**

------------------------------------------------------------------------

## 📁 Default Paths

-   Script location:

        ~/scripts/bing-wallpaper.sh

-   Wallpaper archive:

        ~/Pictures/Bing/

------------------------------------------------------------------------

## 📦 Dependencies

Make sure these are installed:

    curl
    wget
    nitrogen

On Arch:

    sudo pacman -S curl wget nitrogen

------------------------------------------------------------------------

## ⚙️ Script Contents

``` bash
#!/bin/bash

DIR="$HOME/Pictures/Bing"
mkdir -p "$DIR"

DATA=$(curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US")
URL=$(echo "$DATA" | grep -oP '"url":"\K[^"]+')
FILENAME=$(basename "$URL")
FULL_URL="https://www.bing.com$URL"

wget -q -O "$DIR/$FILENAME" "$FULL_URL"

# Apply and save silently per monitor
nitrogen --head=0 --set-scaled --save "$DIR/$FILENAME"
nitrogen --head=1 --set-scaled --save "$DIR/$FILENAME"
```

Make it executable:

    chmod +x ~/scripts/bing-wallpaper.sh

------------------------------------------------------------------------

## ▶️ Manual Test

Run the script once to verify everything works:

    ~/scripts/bing-wallpaper.sh

Expected result: - Both monitors update - No Nitrogen window opens -
Image is saved for restore

------------------------------------------------------------------------

## ⏱️ Automatic Daily Run (Cron)

Edit your crontab:

    crontab -e

Add:

    0 6 * * * DISPLAY=:0 /home/thinus/scripts/bing-wallpaper.sh

This downloads and applies the new Bing wallpaper every morning at
06:00.

------------------------------------------------------------------------

## 🪟 i3 Startup Restore

Make sure this line exists in your i3 config:

    exec_always --no-startup-id nitrogen --restore

This ensures wallpapers restore properly on login and reboot.

------------------------------------------------------------------------

## 🧯 Troubleshooting

### Nitrogen GUI opens

This means Nitrogen was called without proper flags. Ensure your script
matches the version above and **does not** call `nitrogen --save` on its
own.

### One monitor stretches across both

Your script must use:

    --head=0
    --head=1

If you have more monitors, increment accordingly.

### Cron runs but wallpaper doesn't change

Cron needs display access. Make sure your crontab entry includes:

    DISPLAY=:0

------------------------------------------------------------------------

## 📜 Philosophy

This setup avoids: - Vendor lock-in - Telemetry-heavy apps - Desktop
environment bloat

It relies only on: - Standard Unix tools - A plain shell script - Your
window manager

Simple. Durable. Yours.

