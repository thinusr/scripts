#!/bin/bash

# Variables
BACKUP_DIR="/media/backup/backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
LATEST="$BACKUP_DIR/latest"
SNAPSHOT="$BACKUP_DIR/$DATE"
LOG_FILE="/var/log/backup.log"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Log start time and disk usage before backup
DISK_BEFORE=$(df -h "$BACKUP_DIR" | awk 'NR==2 {print $4}')
echo "Backup started at $(date)" >> "$LOG_FILE"
echo "Available space before backup: $DISK_BEFORE" >> "$LOG_FILE"

# Ensure latest symlink exists
if [ ! -L "$LATEST" ]; then
    echo "No previous backup found. Performing full backup." >> "$LOG_FILE"
    RSYNC_FLAGS="-a --delete --stats"
else
    RSYNC_FLAGS="-a --delete --link-dest=$LATEST --stats"
fi

# Run rsync and measure execution time
START_TIME=$(date +%s)
/usr/bin/rsync -a --delete --link-dest="$LATEST" \
    --exclude={"/proc","/sys","/dev","/run","/tmp","/media","/lost+found","/mnt"} \
    --info=progress2 / "$SNAPSHOT" | tee -a "$LOG_FILE"
EXIT_CODE=$?
END_TIME=$(date +%s)

# Log errors if rsync fails
if [ $EXIT_CODE -ne 0 ]; then
    echo "Rsync encountered an error!" >> "$LOG_FILE"
    cat /tmp/rsync_summary.log >> "$LOG_FILE"
    exit 1
fi

# Log rsync stats (data moved & file count)
grep -E 'Total transferred file size|Total bytes sent|Total bytes received|Number of files' /tmp/rsync_summary.log >> "$LOG_FILE"

# Update latest symlink
rm -rf "$LATEST"
ln -s "$SNAPSHOT" "$LATEST"

# Keep only the last 3 backups
find "$BACKUP_DIR" -maxdepth 1 -type d -name '20*' | sort | head -n -3 | xargs rm -rf 2>/dev/null

# Disk usage after backup
DISK_AFTER=$(df -h "$BACKUP_DIR" | awk 'NR==2 {print $4}')

# Log completion, execution time, and disk usage
DURATION=$((END_TIME - START_TIME))
echo "Backup completed at $(date) | Duration: $DURATION seconds" >> "$LOG_FILE"
echo "Available space after backup: $DISK_AFTER" >> "$LOG_FILE"
echo "Exit status: $EXIT_CODE (0 = Success)" >> "$LOG_FILE"
echo "---------------------------------" >> "$LOG_FILE"
