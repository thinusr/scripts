This script launches WezTerm running Neovim and automatically opens the Telescope fuzzy file finder (find_files()).

## Requirements:

- WezTerm terminal emulator installed
    
- Neovim installed with the telescope.nvim plugin configured
    
- Bash shell
    

## Installation:

1. Save the script as nvim-fuzzy.sh (for example, in ~/scripts/).
    
2. Make it executable with: chmod +x ~/scripts/nvim-fuzzy.sh
    
3. (Optional) Add ~/scripts to your PATH by adding this line to your ~/.bashrc or ~/.zshrc:
    
    export PATH="$HOME/scripts:$PATH"
    

## What it does:

When run, this script opens a new WezTerm window, launches Neovim inside it, and immediately triggers Telescope's find_files picker so you can start fuzzy searching files right away.

Example i3 keybinding:

Add the following line to your i3 config (~/.config/i3/config) to bind Mod+Shift+N to run the script:

bindsym Mod4+Shift+n exec --no-startup-id ~/scripts/nvim-fuzzy.sh

Then reload i3 with Mod+Shift+R.

## Customization:

If you want to use a different Telescope picker, edit the command inside the script from

nvim -c 'lua require("telescope.builtin").find_files()'

to another picker like live_grep(), buffers(), or git_files().

Example script content (nvim-fuzzy.sh):

#!/bin/bash  
wezterm start -- bash -c "nvim -c 'lua require("telescope.builtin").find_files()'"

## License:

MIT License
