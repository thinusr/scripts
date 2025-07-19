# video-to-mp3.sh

## ✅ Script Purpose
This script converts one or more video files to high-quality MP3 audio using `ffmpeg`.  
It also logs the conversion process to `/tmp/video-to-mp3.log`.

---

## 📄 Script Name
`video-to-mp3.sh`

---

## ⚙️ Dependencies
- [FFmpeg](https://ffmpeg.org/)
  - Must be installed and available in your system's `PATH`.

---

## 📝 Usage
```bash
./video-to-mp3.sh video1.mp4 video2.mkv video3.avi
```

This will:
- Extract audio from each file.
- Save it as an `.mp3` with the same name as the original video (but with `.mp3` extension).
- Overwrite any existing MP3 with the same name without prompting.

---

## 🔊 Audio Settings
- **Bitrate:** 192 kbps
- **Sample rate:** 44.1 kHz
- **No video** (`-vn` flag)

---

## 🗒️ Logging
- Logs are written to:
  ```
  /tmp/video-to-mp3.log
  ```
- Includes timestamps and file names being processed.
- FFmpeg errors (if any) are appended to the same log.

---

## ⚠️ Notes
- Script requires at least one video file as input.
- Make sure input files are accessible and valid media formats.
- The script **overwrites** existing `.mp3` files with the same name without asking.

---

## 💡 Tip
Make the script executable:
```bash
chmod +x video-to-mp3.sh
```

Then run:
```bash
./video-to-mp3.sh *.mp4
```

---

## 🧼 Practical and Direct
No GUI. No prompt. Just audio extraction — fast and to the point.
