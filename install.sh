#!/bin/bash

# Figure out the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "--- Dotfiles Installer ---"

# Function to link files safely
link_file() {
    local src=$1
    local dest=$2
    local name=$3

    echo "Checking $name..."

    # Ensure the destination directory exists
    mkdir -p "$(dirname "$dest")"

    if [ -L "$dest" ] || [ -f "$dest" ]; then
        read -p "$name already exists at $dest. Overwrite? (y/N): " confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo "Skipping $name."
            return
        fi
        rm "$dest"
    fi

    ln -s "$src" "$dest"
    echo "Success: Linked $name"
}

# 1. Install Alacritty Config
if [ -f "$SCRIPT_DIR/alacritty.toml" ]; then
    link_file "$SCRIPT_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml" "Alacritty"
else
    echo "Warning: alacritty.toml not found in $SCRIPT_DIR"
fi

# 2. Install Vim Config
if [ -f "$SCRIPT_DIR/.vimrc" ]; then
    link_file "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc" "Vim"
else
    echo "Warning: .vimrc not found in $SCRIPT_DIR"
fi

echo "--- Installation Complete ---"

