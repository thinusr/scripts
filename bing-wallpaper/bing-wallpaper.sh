#!/bin/bash

DIR="$HOME/Pictures/Bing"
mkdir -p "$DIR"

DATA=$(curl -s "https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US")
URL=$(echo "$DATA" | grep -oP '"url":"\K[^"]+')
FILENAME=$(basename "$URL")
FULL_URL="https://www.bing.com$URL"

wget -q -O "$DIR/$FILENAME" "$FULL_URL"

# Apply and save silently per monitor (NO GUI)
nitrogen --head=0 --set-scaled --save "$DIR/$FILENAME"
nitrogen --head=1 --set-scaled --save "$DIR/$FILENAME"

