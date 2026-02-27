# Makefile for kw-info

BIN_NAME=kw-info
APP_DIR=$(HOME)/.local/share/kw-info
AUTOSTART_DIR=$(HOME)/.config/autostart
DESKTOP_FILE=$(AUTOSTART_DIR)/kw-info.desktop

.PHONY: all build install uninstall clean

all: build

build:
	@echo "Building $(BIN_NAME)..."
	go build -o $(BIN_NAME) main.go

install: build
	@echo "Installing $(BIN_NAME) to $(APP_DIR)..."
	mkdir -p $(APP_DIR)
	cp $(BIN_NAME) $(APP_DIR)/
	cp tux.png $(APP_DIR)/
	cp welcome.odt $(APP_DIR)/
	chmod +x $(APP_DIR)/$(BIN_NAME)
	
	@echo "Creating autostart entry at $(DESKTOP_FILE)..."
	mkdir -p $(AUTOSTART_DIR)
	@echo "[Desktop Entry]" > $(DESKTOP_FILE)
	@echo "Type=Application" >> $(DESKTOP_FILE)
	@echo "Exec=$(APP_DIR)/$(BIN_NAME)" >> $(DESKTOP_FILE)
	@echo "Path=$(APP_DIR)" >> $(DESKTOP_FILE)
	@echo "Hidden=false" >> $(DESKTOP_FILE)
	@echo "NoDisplay=false" >> $(DESKTOP_FILE)
	@echo "X-GNOME-Autostart-enabled=true" >> $(DESKTOP_FILE)
	@echo "Name=KindWorks Info" >> $(DESKTOP_FILE)
	@echo "Comment=Displays KindWorks information and system stats on login" >> $(DESKTOP_FILE)
	@echo "Icon=$(APP_DIR)/tux.png" >> $(DESKTOP_FILE)
	@echo "Installation complete."

uninstall:
	@echo "Uninstalling $(BIN_NAME)..."
	rm -rf $(APP_DIR)
	rm -f $(DESKTOP_FILE)
	@echo "Uninstallation complete."

clean:
	@echo "Cleaning up..."
	rm -f $(BIN_NAME)
