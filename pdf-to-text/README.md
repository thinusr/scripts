# 📄 PDF to Text Script (`pdf-to-text.sh`)

This script converts one or more PDF files into plain text using the `pdftotext` utility. It logs the start and finish times, as well as any errors, to `/tmp/pdf-to-text.log`.

## 🧰 Features

- Batch converts multiple PDF files to `.txt`
- Uses `pdftotext` (part of the `poppler` package)
- Logs all activity and errors to `/tmp/pdf-to-text.log`
- Simple and effective

## 📦 Output

For each input PDF, the script creates a corresponding `.txt` file in the same directory. For example:

```
input.pdf ➝ input.txt
```

## 🛠️ Requirements

- `bash`
- `pdftotext` (install via `poppler` package on most Linux distros)

## 🚀 Usage

```bash
./pdf-to-text.sh file1.pdf file2.pdf ...
```

You can pass one or more PDF files as arguments. Example:

```bash
./pdf-to-text.sh ~/Documents/*.pdf
```

## 📄 Logging

All output (timestamps, errors, status) is logged to:

```
/tmp/pdf-to-text.log
```

This makes it easy to debug failed conversions or verify when the operation ran.

## 🔐 Notes

- The script does not overwrite existing `.txt` files unless the PDFs are reprocessed.
- Make sure `pdftotext` is installed (`sudo pacman -S poppler` on Arch-based distros).
- Log file is temporary and will be cleared on reboot unless moved or saved elsewhere.

---

**Created and maintained by:** Thinus  
**License:** MIT (if you wish to share it)
