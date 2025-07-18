#!/bin/bash

LOGFILE=/tmp/video-to-mp3.log
echo "Starting video-to-mp3 at $(date)" >> "$LOGFILE"

for video in "$@"; do
  output="${video%.*}.mp3"
  echo "Converting $video to $output" >> "$LOGFILE"
  ffmpeg -i "$video" -vn -ab 192k -ar 44100 -y "$output" 2>> "$LOGFILE"
done

echo "Finished video-to-mp3 at $(date)" >> "$LOGFILE"

