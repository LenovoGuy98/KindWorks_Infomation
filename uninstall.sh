#!/bin/bash

# Define paths
APP_DIR="$HOME/.local/share/kw-info"
AUTOSTART_DIR="$HOME/.config/autostart"
DESKTOP_FILE="$AUTOSTART_DIR/kw-info.desktop"

# Remove application directory
if [ -d "$APP_DIR" ]; then
    echo "Removing application directory at $APP_DIR..."
    rm -rf "$APP_DIR"
fi

# Remove autostart entry
if [ -f "$DESKTOP_FILE" ]; then
    echo "Removing autostart entry at $DESKTOP_FILE..."
    rm "$DESKTOP_FILE"
fi

echo "Uninstallation complete."
