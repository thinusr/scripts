# 🔐 System Backup Script (`backup.sh`)

This script performs a versioned backup of your Linux system using `rsync`. It utilizes hard links to create incremental snapshots and maintains a rotating set of the latest three backups. Ideal for local, reliable, system-wide backups.

## 🧰 Features

- Full filesystem backup using `rsync`
- Incremental backups using `--link-dest` for space efficiency
- Automatic log generation to `/var/log/backup.log`
- Rotates old backups, keeping only the latest three
- Tracks backup duration and disk space before/after
- Uses a `latest` symlink for `--link-dest` reference

## 📦 Backup Structure

Backups are saved in:
```
/media/thinus/backup/backups/
```

Each backup is stored in a timestamped directory:
```
YYYY-MM-DD_HH-MM-SS/
```

The `latest` symlink always points to the most recent backup, used for differential comparisons.

## 🚫 Excluded Directories

To prevent issues and wasted space, the following are excluded:
- `/proc`
- `/sys`
- `/dev`
- `/run`
- `/tmp`
- `/media`
- `/mnt`
- `/lost+found`

## 📄 Logging

All backup activity is logged to:
```
/var/log/backup.log
```

Includes:
- Start and end time
- Disk usage before and after
- `rsync` summary (bytes sent/received, file count, etc.)
- Execution duration
- Exit status

## 🧪 How It Works

1. Checks for existing `latest` backup.
2. Sets appropriate `rsync` flags for full/incremental mode.
3. Performs the backup with `rsync`, excluding sensitive paths.
4. Rotates older backups — keeps only the most recent three.
5. Updates the `latest` symlink to the current snapshot.

## 🛠️ Requirements

- `bash`
- `rsync`
- Root privileges (for access to system directories)
- Mount point: `/media/thinus/backup/`

## 🚀 Usage

Run the script as root or with `sudo`:

```bash
sudo ./backup.sh
```

Ensure the backup drive is mounted at:
```
/media/thinus/backup/
```

## 🔐 Notes

- Make sure you have enough disk space on the backup drive.
- This is meant for local backups. For remote backups, consider using `rsync` with SSH.
- It is strongly advised to test restoring from backup to ensure reliability.

## 📂 Backup Example Layout

```
/media/thinus/backup/backups/
├── 2025-07-18_12-03-34/
├── 2025-07-17_12-01-00/
├── 2025-07-16_12-00-00/
└── latest -> 2025-07-18_12-03-34/
```

---

**Created and maintained by:** Thinus  
**License:** MIT (if you plan to share it publicly)
