# Open Thunar as Root

## ✅ Script Purpose
This script opens the **Thunar file manager** as root, using `gksudo`, at the location provided as an argument.

It's useful for quickly navigating to and managing files in directories that require superuser privileges.

---

## 📄 Script Name
`open-thunar-root.sh`

---

## ⚙️ Dependencies
- `thunar` – Lightweight file manager.
- `gksudo` – Graphical frontend for `sudo`.
- `realpath` – To resolve absolute file paths.

Make sure `gksudo` is installed. On Arch-based systems, you can use:
```bash
yay -S gksu
```

---

## 📝 Usage
```bash
./open-thunar-root.sh /path/to/folder
```

Example:
```bash
./open-thunar-root.sh /etc
```

This opens `/etc` in Thunar with root privileges.

---

## ⚠️ Notes
- You must provide exactly **one argument**: the path to the folder you want to open.
- The script resolves the **absolute path** to avoid confusion or errors when run from different directories.
- The use of `gksudo` provides a graphical password prompt rather than prompting in the terminal.

---

## 🔐 Security Tip
Use root file managers sparingly and carefully to avoid accidental system changes or deletions.

---

## 💡 Tip
Make the script executable:
```bash
chmod +x open-thunar-root.sh
```

---

## 🧼 Traditional and Functional
Simple, clean, and effective. It does exactly what it's meant to do without fluff.
