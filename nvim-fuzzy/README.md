# Neovim Fuzzy Finder Script (Kitty + Telescope)

This script launches a new Kitty terminal, runs Neovim inside it, and automatically opens the Telescope fuzzy file finder (`find_files()`).

## Requirements

- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator
- [Neovim](https://neovim.io/) with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) installed and configured
- Bash shell

## Installation

1. Save the script as `nvim-fuzzy.sh` (e.g., in `~/scripts/`):
2. Make it executable:

   ```bash
   chmod +x ~/scripts/nvim-fuzzy.sh
   ```

3. *(Optional)* Add `~/scripts` to your `PATH` by adding this line to your `~/.bashrc` or `~/.zshrc`:

   ```bash
   export PATH="$HOME/scripts:$PATH"
   ```

## What It Does

When executed, the script:

- Opens a new Kitty terminal window.
- Launches Neovim inside that window.
- Immediately runs Telescope's `find_files()` picker so you can start fuzzy searching your files.

## Example i3 Keybinding

To bind `Mod+Shift+N` to this script in i3, add the following to your i3 config (`~/.config/i3/config`):

```bash
bindsym Mod4+Shift+n exec --no-startup-id ~/scripts/nvim-fuzzy.sh
```

Then reload i3 with `Mod+Shift+R`.

## Customization

To use a different Telescope picker, edit the script and change:

```bash
nvim -c 'lua require("telescope.builtin").find_files()'
```

to:

```bash
nvim -c 'lua require("telescope.builtin").live_grep()'
```

Or choose from other pickers like `buffers()`, `git_files()`, etc.

## Example Script: `nvim-fuzzy.sh`

```bash
#!/bin/bash
kitty bash -c "nvim -c 'lua require(\"telescope.builtin\").find_files()'"
```

## License

MIT License

