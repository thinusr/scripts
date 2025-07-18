#!/bin/bash

LOGFILE=/tmp/pdf-to-text.log
echo "Starting pdf-to-text at $(date)" >> "$LOGFILE"

for pdf in "$@"; do
  pdftotext "$pdf" 2>> "$LOGFILE"
done

echo "Finished pdf-to-text at $(date)" >> "$LOGFILE"

