#!/bin/bash

# Destination folder
DEST="/mnt/media/selected"
mkdir -p "$DEST"

while true; do
  echo -e "\n🔍 Enter search term (or type 'exit' to quit):"
  read -r query

  # Exit condition
  if [[ "$query" == "exit" ]]; then
    echo "👋 Done. Exiting."
    break
  fi

  # Search and select file
  match=$(find /mnt/media/music/ -type f -iname "*.mp3" | fzf --query="$query" --prompt="🎵 $query > " --header="Select a file to copy")

  if [ -n "$match" ]; then
    cp -v "$match" "$DEST/"
    echo "✅ Copied: $(basename "$match")"
  else
    echo "⏭️ No match selected for: $query"
  fi
done

