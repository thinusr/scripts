
# 🕸️ WebApp Management Scripts

This project includes two simple Bash scripts for managing standalone web applications using Chromium:

- `create-webapp.sh` – create a webapp from any URL
- `delete-webapp.sh` – remove a previously created webapp

They work together to make adding and removing Chromium-based apps clean and user-friendly.

---

## 📦 What `create-webapp.sh` Does

- Prompts for a **name** and **URL**
- Creates a separate folder in `~/.local/share/webapps/<NAME>/`
- Downloads the site’s favicon to use as the icon
- Creates a `.desktop` launcher in your application menu
- Launches the site in a standalone Chromium window with a separate user profile

---

## 🗑️ What `delete-webapp.sh` Does

- Prompts for the **name** of the webapp
- Removes:
  - The `.desktop` launcher
  - The profile and app folder
  - The favicon icon

Use this when you're done with a webapp and want to fully clean it up.

---

## 📂 File Locations

| Purpose       | Path                                                 |
|---------------|------------------------------------------------------|
| App folder    | `~/.local/share/webapps/<NAME>/`                     |
| Icon file     | `~/.local/share/webapps/icons/<NAME>.png`            |
| Launcher file | `~/.local/share/applications/<NAME>.desktop`         |
| User profile  | `~/.local/share/webapps/<NAME>/profile/`             |

---

## 🧰 Requirements

- **Bash**
- **Chromium**
- **wget**

Ensure Chromium is installed and available in your `$PATH`.

---

## 🛠️ Usage

### To create a webapp:

```bash
./create-webapp.sh
```

Follow the prompts to enter:
- The **name** of your app (no spaces)
- The **URL** of the website

Once done, your app appears in your launcher (`dmenu`, `rofi`, or menu systems).

---

### To delete a webapp:

```bash
./delete-webapp.sh
```

You’ll be asked for the app name. It will then remove all associated files.

---

## 🔒 Notes

- Each app uses a separate Chromium profile for isolation.
- Icons are pulled from Google's favicon service — results may vary.
- You can manually replace icons in the `icons/` folder.

---

## ✅ Example (Create)

```text
Webapp name (no spaces): protonmail
URL: https://mail.proton.me/
✅ Webapp 'protonmail' created. You’ll find it in your app launcher or with dmenu.
```

## 🗑️ Example (Delete)

```text
Enter the WebApp name (no spaces, exact name used during creation): protonmail
✅ 'protonmail' has been removed from your system.
```

---

## 📌 To Do / Possible Enhancements

- Add browser selection (e.g., Firefox, Brave)
- Icon selection from file
- List available apps
- Warning before deletion
- Automatic duplicate checking

---

## 📄 License

MIT License — Do what you want, just don't blame me if it breaks something.

