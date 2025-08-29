#!/bin/bash
# Auto-detect terminal emulator and launch Neovim with Telescope
# First installed terminal in the list will be used.

# List of terminals in order of preference
TERMINALS=(
    "alacritty -e"
    "kitty bash -c"
    "gnome-terminal --"
    "konsole -e"
    "terminator -e"
    "xterm -e"
    "urxvt -e"
    "tilix -e"
)

# The Neovim command to run
NVIM_CMD="nvim +Telescope\\ find_files"

# Find first available terminal
for term in "${TERMINALS[@]}"; do
    # Extract the actual command (first word)
    term_cmd=$(echo "$term" | awk '{print $1}')
    if command -v "$term_cmd" &> /dev/null; then
        echo "Using terminal: $term_cmd"
        # Launch Neovim
        eval "$term $NVIM_CMD"
        exit 0
    fi
done

echo "No supported terminal emulator found!"
exit 1

