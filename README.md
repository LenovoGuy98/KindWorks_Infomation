# KindWorks Information (kw-info)

A simple GUI application to display KindWorks information and system statistics.

## Features
-   Display logo (`tux.png`).
-   Quick access to `welcome.odt`.
-   Link to the KindWorks website.
-   System information display (Product Name, Serial Number, CPU, RAM).

## Installation

### For Current User (Local Autostart)

To install and set `kw-info` to start automatically when you log in:

Using the provided script:
```bash
chmod +x install.sh
./install.sh
```

Using the Makefile:
```bash
make install
```

This will:
1.  Build the binary (if needed).
2.  Create a folder at `~/.local/share/kw-info/`.
3.  Copy the binary and assets there.
4.  Create a `.desktop` file in `~/.config/autostart/`.

## Uninstallation

To remove `kw-info` and its autostart entry:

Using the provided script:
```bash
chmod +x uninstall.sh
./uninstall.sh
```

Using the Makefile:
```bash
make uninstall
```

## Manual Build
To just build the binary without installing:
```bash
make build
```

## Requirements
-   Go 1.16+
-   Fyne dependencies (e.g., `libgl1-mesa-dev`, `xorg-dev` on Debian/Ubuntu/Mint)
-   `ghw` library for system information.
