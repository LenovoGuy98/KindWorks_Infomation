package main

import (
	"fmt"
	"net/url"
	"os"
	"path/filepath"
	"runtime"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/canvas"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/dialog"
	"fyne.io/fyne/v2/widget"
	"github.com/jaypipes/ghw"
)

func main() {
	a := app.New()
	w := a.NewWindow("Kindworks Info")

	// Ensure you have a file named 'tux.png' in the same directory
	logo := canvas.NewImageFromFile("tux.png")
	logo.FillMode = canvas.ImageFillContain

	welcomeButton := widget.NewButton("Welcome", func() {
		cwd, err := os.Getwd()
		if err != nil {
			fmt.Println("Error getting current working directory:", err)
			return
		}
		path := filepath.Join(cwd, "welcome.odt")
		u := &url.URL{Scheme: "file", Path: path}
		err = a.OpenURL(u)
		if err != nil {
			fmt.Println("Error opening file:", err)
		}
	})

	firefoxButton := widget.NewButton("kindworks website", func() {
		u, err := url.Parse("https://dokindworks.org")
		if err != nil {
			fmt.Println("Error parsing URL:", err)
			return
		}
		err = a.OpenURL(u)
		if err != nil {
			fmt.Println("Error opening URL:", err)
		}
	})

	infoButton := widget.NewButton("System Info", func() {
		product := "Unknown Product"
		serial := "Unknown Serial"
		cpuInfo := "Unknown CPU"
		ramInfo := "Unknown RAM"

		// Get Product and Serial info (requires root on Linux usually, or specific permissions)
		// Using ghw for better hardware info
		productInfo, err := ghw.Product()
		if err == nil {
			product = productInfo.Name
			serial = productInfo.SerialNumber
		}

		// Get CPU info
		cpu, err := ghw.CPU()
		if err == nil {
			if len(cpu.Processors) > 0 {
				cpuInfo = cpu.Processors[0].Model
			}
		} else {
			// Fallback to runtime
			cpuInfo = fmt.Sprintf("%s/%s", runtime.GOOS, runtime.GOARCH)
		}

		// Get RAM info
		memory, err := ghw.Memory()
		if err == nil {
			ramInfo = fmt.Sprintf("%d MB", memory.TotalPhysicalBytes/1024/1024)
		}

		infoText := fmt.Sprintf("Product: %s\nSerial: %s\nCPU: %s\nRAM: %s", product, serial, cpuInfo, ramInfo)
		dialog.ShowInformation("System Information", infoText, w)
	})

	closeButton := widget.NewButton("Close", func() {
		a.Quit()
	})

	w.SetContent(container.NewVBox(
		container.NewGridWrap(fyne.NewSize(400, 300), logo),
		welcomeButton,
		firefoxButton,
		infoButton,
		closeButton,
	))

	w.ShowAndRun()
}
