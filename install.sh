#!/bin/bash

# Figure out the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define paths relative to the script location
SOURCE_CONFIG="$SCRIPT_DIR/alacritty.toml"
DEST_DIR="$HOME/.config/alacritty"
DEST_CONFIG="$DEST_DIR/alacritty.toml"

echo "--- Alacritty Configuration Installer ---"

# 1. Check if the source file actually exists in this folder
if [ ! -f "$SOURCE_CONFIG" ]; then
    echo "Error: Cannot find $SOURCE_CONFIG"
    exit 1
fi

# 2. Create the destination directory if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
    echo "Creating directory: $DEST_DIR"
    mkdir -p "$DEST_DIR"
fi

# 3. Check if the config file already exists at the destination
if [ -L "$DEST_CONFIG" ] || [ -f "$DEST_CONFIG" ]; then
    # Prompt user; the "N" in (y/N) indicates it's the default
    read -p "Alacritty config already exists at $DEST_CONFIG. Overwrite? (y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        echo "Aborted. No changes made."
        exit 0
    fi
    # Remove existing file/link to make room for the new link
    rm "$DEST_CONFIG"
fi

# 4. Create the symbolic link
ln -s "$SOURCE_CONFIG" "$DEST_CONFIG"

echo "Success! Config linked from: $SOURCE_CONFIG"
echo "To: $DEST_CONFIG"
