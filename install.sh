#!/bin/bash

# Define paths
APP_DIR="$HOME/.local/share/kw-info"
BIN_NAME="kw-info"
AUTOSTART_DIR="$HOME/.config/autostart"
DESKTOP_FILE="$AUTOSTART_DIR/kw-info.desktop"

# Create application directory
echo "Creating application directory at $APP_DIR..."
mkdir -p "$APP_DIR"

# Copy binary and assets
echo "Copying application files..."
cp "$BIN_NAME" "$APP_DIR/"
cp "tux.png" "$APP_DIR/"
cp "welcome.odt" "$APP_DIR/"

# Make binary executable
chmod +x "$APP_DIR/$BIN_NAME"

# Create autostart directory if it doesn't exist
mkdir -p "$AUTOSTART_DIR"

# Create the .desktop file
echo "Creating autostart entry..."
cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Type=Application
Exec=$APP_DIR/$BIN_NAME
Path=$APP_DIR
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=KindWorks Info
Comment=Displays KindWorks information and system stats on login
Icon=$APP_DIR/tux.png
EOF

echo "Installation complete. kw-info will now start automatically on login."
