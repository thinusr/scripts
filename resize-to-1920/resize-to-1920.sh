#!/bin/bash

# Check if at least one argument
if [ "$#" -eq 0 ]; then
  echo "No files supplied."
  exit 1
fi

for img in "$@"; do
  /usr/bin/magick convert "$img" -resize 1920x "${img%.*}_1920.${img##*.}"
done

