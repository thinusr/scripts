# resize-to-1920.sh

## ✅ Script Purpose
This script resizes one or more image files to a width of **1920 pixels**, maintaining the original aspect ratio. It uses **ImageMagick's `convert` tool** via the full path (`/usr/bin/magick`) to ensure compatibility and avoid PATH issues.

---

## 📄 Script Name
`resize-to-1920.sh`

---

## ⚙️ Dependencies
- [ImageMagick](https://imagemagick.org/)
  - Must be installed and accessible at `/usr/bin/magick`.

---

## 📝 Usage
```bash
./resize-to-1920.sh image1.jpg image2.png image3.jpeg
```

---

## 📦 What It Does
- Checks if at least one file is passed as an argument.
- For each image file:
  - Resizes it to **1920 pixels wide** (height is automatically adjusted to maintain aspect ratio).
  - Saves the result as a **new file** with `_1920` appended before the file extension.

Example:
```bash
photo.jpg  →  photo_1920.jpg
```

---

## ⚠️ Error Handling
- If no arguments are supplied, the script prints:
  ```
  No files supplied.
  ```
  ...and exits with status code `1`.

---

## 💡 Tip
Make the script executable:
```bash
chmod +x resize-to-1920.sh
```

Then you can run it directly:
```bash
./resize-to-1920.sh *.jpg
```

---

## 🧼 Clean and Traditional
No frills. Just a practical, focused tool for batch resizing images to a modern screen width.
